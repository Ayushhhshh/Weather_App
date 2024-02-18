# Weather App

This is a simple weather application built with Flutter that allows users to check the current weather forecast for a specific city.

## Features

- Displays the current temperature, weather condition, and hourly forecast.
- Provides additional information such as maximum temperature, minimum temperature, humidity, and wind speed.
- Users can refresh the weather data by tapping the refresh button.

## Screenshots

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/120326710/305731869-eb26295e-35a4-4291-9f1c-cb33bcee14f7.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240218%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240218T164935Z&X-Amz-Expires=300&X-Amz-Signature=77a123e938b4d6ffdcaf53dfddd41c29a4c0014762565124d74bfe15685a4f16&X-Amz-SignedHeaders=host&actor_id=120326710&key_id=0&repo_id=753231075" alt="dark" width="250">

## Getting Started

To run this application locally, follow these steps:

1. Clone this repository:
```bash
git clone https://github.com/your_username/weather_app.git
```

2. Navigate to the project directory:
```bash
cd weather_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```

## Dependencies

This application uses the following dependencies:

- `flutter/material.dart`: The core Flutter framework for building UI.
- `intl`: Provides internationalization and localization support.
- `http`: A package for making HTTP requests.
- `weather`: A package for fetching weather data.
- `secret`: A package containing API keys (not included in this repository).

## API

This application uses the OpenWeatherMap API to fetch weather data. You need to obtain an API key from [OpenWeatherMap](https://openweathermap.org/api) and replace it in the `secret.dart` file.

## Contributing

Contributions are welcome! If you have any suggestions, bug fixes, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

