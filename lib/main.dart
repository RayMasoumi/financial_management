import 'package:financial_management/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'koodak',
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.2,
              fontSizeDelta: 5.0,
              fontFamily: 'koodak',
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن مدیریت مالی',
      home: const MainScreen(),
    );
  }
}
