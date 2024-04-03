import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationNotifier);
    final weatherState = ref.watch(weatherProvider);
    final textTheme = Theme.of(context).textTheme;

    // Escucha los cambios en el estado del clima y muestra un SnackBar en caso de error.
    _listenToWeatherStateChanges(ref, context);

    // Si el estado del clima aún no está disponible, muestra un indicador de progreso.
    if (weatherState.weather == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Si el estado del clima está disponible, muestra la temperatura o un mensaje predeterminado.
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.8],
            colors: weatherState.weather!.temperature! > 15
              ? [const Color(0xFF29B2DD), const Color(0xFF33AADD)] // Degradado para clima cálido
              : [const Color(0xFF001026), const Color(0xFF0B42AB)], // Degradado para clima frío
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(locationState.city ?? 'Ubicación desconocida', style: textTheme.titleLarge)
              ),
              const SizedBox(height: 10),
              if (weatherState.weather!.temperature! > 15)
                Image.asset('assets/images/sunday.png')
              else
                Image.asset('assets/images/rainday.png'),
              const SizedBox(height: 10),
              _DataComplementary(weatherState: weatherState, textTheme: textTheme),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _listenToWeatherStateChanges(WidgetRef ref, BuildContext context) {
    ref.listen(weatherProvider, (_, next) {
      if (next.errorMessage.isNotEmpty) {
        _showSnackBar(context, next.errorMessage);
      }
    });
    ref.listen<LocationState>(locationNotifier, (previous, next) {
      ref.read(weatherProvider.notifier).getWeather(null, next.latitude, next.longitude);
    });
  }

  void _showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 6),
      ));
  }
}

class _DataComplementary extends StatelessWidget {
  const _DataComplementary({
    required this.weatherState,
    required this.textTheme,
  });

  final WeatherState weatherState;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherState.weather!.temperature}°',
          style: textTheme.titleMedium,
        ),
        Text(
          "Sensacion termica ${weatherState.weather!.temperatureApparent}°",
          style: textTheme.titleSmall,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (weatherState.weather!.temperature! > 15) ? const Color.fromARGB(56, 16, 64, 132) : const Color.fromARGB(183, 0, 16, 38),
          ),
          child: _InfoBarWeather(
            icon: const [
              Icons.grain,
              Icons.thermostat,
              Icons.air,
            ],
            text: [
              '${weatherState.weather!.precipitationProbability}%',
              '${weatherState.weather!.humidity}%',
              '${weatherState.weather!.windSpeed} km/h'
            ],
            textTheme: textTheme,
          )
        )
      ]
    );
  }
}

class _InfoBarWeather extends StatelessWidget {
  final List<IconData> icon;
  final List<String> text;
  final TextTheme textTheme;

  const _InfoBarWeather({
    required this.icon,
    required this.text,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(icon.length * 2 - 1, (index) {
        if (index % 2 == 0) {
          return Row(
            children: [
              Icon(icon[index ~/ 2], color: Colors.white),
              const SizedBox(width: 2),
              Text(
                text[index ~/ 2],
                style: textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 10),
              ),
            ],
          );
        } else {
          return const Spacer();
        }
      }),
    );
  }
}


class _WeatherToday extends ConsumerStatefulWidget {

  @override
  _WeatherTodayState createState() => _WeatherTodayState();
}

class _WeatherTodayState extends ConsumerState<_WeatherToday> {
  @override
  void initState() {
    super.initState();
    final locationState = ref.read(locationNotifier);
    ref.read(weatherProvider.notifier).getWeatherForecast(null, locationState.latitude, locationState.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}