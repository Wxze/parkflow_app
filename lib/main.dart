import 'package:flutter/material.dart';
import 'package:parkflow_app/view/login_view.dart';
import 'package:parkflow_app/view/parking_lots_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF583290),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/parking_lots': (context) => const ParkingLotsView()
      },
    );
  }
}
