from django.test import TestCase
from models import City, WeatherForecast, CurrentWeather
from django.core.urlresolvers import reverse_lazy
from django.test import Client


class CityModel(TestCase):
    def setUp(self):
        self.title = 'Test'
        self.city = City.objects.create(title=self.title)

    def test_create(self):
        test_city = City.objects.last()
        self.assertEqual(self.city, test_city)
        self.assertEqual(self.city.city_true, True)
        self.assertEqual(self.city.title, self.title)


class WeatherForecastModel(TestCase):
    def setUp(self):
        import datetime
        self.title = 'Test'
        self.city = City.objects.create(title=self.title)
        self.date = datetime.datetime.now()
        self.temperature = 5
        self.weather = WeatherForecast.objects.create(city=self.city,
                                                      date=self.date,
                                                      temperature=self.temperature)

    def test_create(self):
        test_wether = WeatherForecast.objects.last()
        self.assertEqual(self.weather, test_wether)
        self.assertEqual(test_wether.city, self.city)
        self.assertEqual(test_wether.date, self.date.date())
        self.assertEqual(test_wether.temperature, self.temperature)


class CurrentWeatherModel(TestCase):
    def setUp(self):
        import datetime
        self.client = Client()
        self.title = 'Test'
        self.city = City.objects.create(title=self.title)
        self.date = datetime.datetime.now()
        self.temperature = 5
        self.weather = WeatherForecast.objects.create(city=self.city,
                                                      date=self.date,
                                                      temperature=self.temperature)
        self.current_temperature = 3
        self.current_weather = CurrentWeather.objects.create(city=self.city,
                                                     date=self.date,
                                                     temperature=self.current_temperature)

    def test_create(self):
        test_wether = CurrentWeather.objects.last()
        self.assertEqual(self.current_weather, test_wether)
        self.assertEqual(test_wether.city, self.city)
        self.assertEqual(test_wether.date, self.date.date())
        self.assertEqual(test_wether.temperature, self.current_temperature)
        self.assertEqual(test_wether.delta, '')

    def test_delta_creation(self):
        self.current_weather.check_delta_and_save()
        test_wether = CurrentWeather.objects.last()
        self.assertEqual(test_wether.delta, str(float(self.temperature-self.current_temperature)))

    def test_get_request(self):
        response = self.client.get('/api/weather/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')
        self.assertEqual(len(response.json()), 1)
    
    def test_get_request_filter_city(self):
        response = self.client.get('/api/weather/', {'city__title': self.title})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')
        self.assertEqual(len(response.json()), 1)
        # Wrong city title filter
        response = self.client.get('/api/weather/', {'city__title': 'Wrong_title'})
        self.assertEqual(len(response.json()), 0)

    def test_get_request_filter_to_date(self):
        import datetime
        response = self.client.get('/api/weather/', {'to_date': str(self.date.date())})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')
        self.assertEqual(len(response.json()), 1)
        # Wrong city title filter
        response = self.client.get('/api/weather/', {'city__title': str(self.date.date()+datetime.timedelta(days=1))})
        self.assertEqual(len(response.json()), 0)

    def test_get_request_filter_from_date(self):
        import datetime
        response = self.client.get('/api/weather/', {'to_date': str(self.date.date())})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')
        self.assertEqual(len(response.json()), 1)
        # Wrong city title filter
        response = self.client.get('/api/weather/', {'city__title': str(self.date.date()-datetime.timedelta(days=1))})
        self.assertEqual(len(response.json()), 0)
