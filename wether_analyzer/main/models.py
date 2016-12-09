# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class City(models.Model):
    title = models.CharField(max_length=100, verbose_name='City', unique=True)
    avalible = models.BooleanField(default=True)

    def __unicode__(self):
        return self.title


class WeatherForecast(models.Model):
    city = models.ForeignKey('City', related_name='wether_forecasts')
    date = models.DateField()
    created = models.DateField(auto_now_add=True)
    temperature = models.SmallIntegerField(null=True)  # Temrerature in metric units

    def __unicode__(self):
        return '%s %s' % (self.city.title, self.date)

    class Meta:
        unique_together = (("city", "date", 'created'),)


class CurrentWeather(models.Model):
    city = models.ForeignKey('City', related_name='current_weather')
    date = models.DateField()
    created = models.DateField(auto_now_add=True)
    temperature = models.SmallIntegerField(null=True)

    def __unicode__(self):
        return '%s %s' % (self.city.title, self.date)

    class Meta:
        unique_together = (("city", "date"),)

    @property
    def forecasts_mistake(self):
        import math
        """
        Выбираю все прогнозы для города и даты этого обьекта
        """
        forecasts = WeatherForecast.objects.filter(city=self.city,
                                                   date=self.date)
        if forecasts:
            '''
            Если существует хоть один прогноз,
            рассчитываем его ошибку и добавляем в список прогнозов
            Таким образом если будет до 3 прогнозов и их ошибок.
            
            Если прогнозов нет, выдаем сообщение про их отсутствие
            '''
            forecasts_list = []
            for forecast in forecasts:
                mistake = float(forecast.temperature - self.temperature)
                mistake_percent = math.ceil(100*(mistake/float(self.temperature)))
                forecasts_list.append({"forecast_date": forecast.created,
                                       "mistake_percent": '{0}%'.format(mistake_percent)})
            return forecasts_list
        return {'message': 'No find forecasts for that date(s)'}

    @property
    def city_info(self):
        return self.city.title