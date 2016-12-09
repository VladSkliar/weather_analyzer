from rest_framework import serializers
from models import CurrentWeather


class CurrentWeatherSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CurrentWeather
        fields = ('city_info', 'date', 'forecasts_mistake')