from django.shortcuts import render
from rest_framework import viewsets, filters
from models import CurrentWeather
from serializers import CurrentWeatherSerializer
import django_filters
# Create your views here.


class CurrentWeatherFilter(filters.FilterSet):
    from_date = django_filters.DateFilter(name="date", lookup_expr='gte')
    to_date = django_filters.DateFilter(name="date", lookup_expr='lte')

    class Meta:
        model = CurrentWeather
        fields = ['city__title', 'to_date', 'from_date', ]


class CurrentWeatherViewSet(viewsets.ModelViewSet):
    queryset = CurrentWeather.objects.all()
    serializer_class = CurrentWeatherSerializer
    filter_class = CurrentWeatherFilter
