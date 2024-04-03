import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/config/config.dart';
import 'package:weather_app/providers/providers.dart';

void main() async {

  await Environment.initEnvironment();

  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(locationNotifier);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Aplicación del clima',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
    );
  }
}