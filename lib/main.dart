import 'package:integriteti_zgjedhor_app/config/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Integritet Zgjedhor 2023',
      routerConfig: goRouter,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
