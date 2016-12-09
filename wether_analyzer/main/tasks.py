from celery.task.schedules import crontab
from celery.decorators import periodic_task
from django.conf import settings
import requests
import datetime
from main.models import WeatherForecast, CurrentWeather, City


@periodic_task(run_every=(crontab(hour=8, minute=0)),
               name="get_weather_info",
               ignore_result=True)
def get_weather_info():
    cities = City.objects.filter(avalible=True)
    for city in cities:
        params = {
                  'APPID': settings.OPENWEATHERMAP_APPID,
                  'q': city.title
                  }
        url = 'http://api.openweathermap.org/data/2.5/forecast/daily'
        r = requests.get(url, params=params)
        if city.title.lower() == r.json()['city']['name'].lower():
            today = r.json()['list'][0]
            date = datetime.datetime.fromtimestamp(int(today['dt']))
            temperature = today['temp']['day']
            try:
                CurrentWeather.objects.get_or_create(city=city,
                                                     date=date,
                                                     temperature=temperature)
            except IntegrityError:
                print "Current weather for that date and city is created"

            for info in r.json()['list'][1:4]:
                date = datetime.datetime.fromtimestamp(int(info['dt']))
                temperature = info['temp']['day']
                try:
                    WeatherForecast.objects.get_or_create(city=city,
                                                          date=date,
                                                          temperature=temperature)
                except IntegrityError, error:
                    print "Weather forecast for that date and city is created today"
        else:
            city.avalible = False
            city.save()
