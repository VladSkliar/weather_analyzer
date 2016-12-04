# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class City(models.Model):
    title = models.CharField(max_length=100, verbose_name='City', unique=True)
    city_true = models.BooleanField(default=True)

    def __unicode__(self):
        return self.title


class WeatherForecast(models.Model):
    city = models.ForeignKey('City', related_name='wether_forecasts')
    date = models.DateField()
    created = models.DateTimeField(auto_now_add=True)
    temperature = models.SmallIntegerField(null=True)  # Temrerature in metric units

    def __unicode__(self):
        return '%s %s' % (self.city.title, self.date)

    class Meta:
        unique_together = (("city", "date"),)


class CurrentWeather(models.Model):
    delta = models.CharField(max_length=20)
    city = models.ForeignKey('City', related_name='current_weather')
    date = models.DateField()
    created = models.DateTimeField(auto_now_add=True)
    temperature = models.SmallIntegerField(null=True)

    def check_delta_and_save(self):
        city, date = self.city, self.date
        forecast = WeatherForecast.objects.filter(city=city, date=date).first()

        if forecast:
            print forecast.temperature, self.temperature
            delta = float(forecast.temperature)-float(self.temperature)
            self.delta = delta
            '''
            Не знаю как правильно считать процент ошибки прогноза погоды
            нужен точный алгоритм который я могу использовать
            Но зная разнизу между реальной температурой и прогнозируемой могу
            использовать любой алгоритм
            '''
            # import math
            # self.delta = math.ceil((delta/float(self.temperature))*100)
            self.save()

    def __unicode__(self):
        return '%s %s' % (self.city.title, self.date)

    class Meta:
        unique_together = (("city", "date"),)

    @property
    def wrong_percent(self):
        if self.delta:
            return '{0}°C'.format(str(self.delta))
        return None

    @property
    def city_info(self):
        return self.city.title