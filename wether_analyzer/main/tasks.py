from celery.task.schedules import crontab
from celery.decorators import periodic_task
from django.conf import settings
import requests
import datetime
from main.models import WeatherForecast, CurrentWeather, City


@periodic_task(run_every=(crontab(hour=8, minute=0)),
               name="get_wether_info",
               ignore_result=True)
def get_wether_info():
    cities = City.objects.filter(city_true=True)
    for city in cities:
        url = 'http://api.openweathermap.org/data/2.5/forecast/daily'
        url += '?APPID=%s&q=%s&units=metric' % (settings.OPENWEATHERMAP_APPID, city.title)
        r = requests.get(url)
        if city.title.lower() == r.json()['city']['name'].lower():
            today = r.json()['list'][0]
            date = datetime.datetime.fromtimestamp(int(today['dt']))
            c = CurrentWeather.objects.filter(city=city,
                                              date=date).first()
            if c:
                pass
            else:
                c = CurrentWeather.objects.create(city=city,
                                                  date=date,
                                                  temperature=today['temp']['day'])
                c.check_delta_and_save()
            for info in r.json()['list'][1:]:
                date = datetime.datetime.fromtimestamp(int(info['dt']))
                w = WeatherForecast.objects.filter(city=city,
                                                   date=date).first()
                if w:
                    pass
                else:
                    WeatherForecast.objects.create(city=city,
                                                   date=date,
                                                   temperature=info['temp']['day'])
        else:
            city.title_true = False
            city.save()
