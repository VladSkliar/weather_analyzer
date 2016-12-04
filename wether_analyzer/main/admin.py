from django.contrib import admin
from models import City, WeatherForecast, CurrentWeather

admin.site.register(City)


class WeatherAdmin(admin.ModelAdmin):
    readonly_fields = ('created',)


class CurrentWeatherAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'delta')


admin.site.register(WeatherForecast, WeatherAdmin)
admin.site.register(CurrentWeather, CurrentWeatherAdmin)