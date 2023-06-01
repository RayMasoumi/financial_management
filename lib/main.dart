import 'package:financial_management/screens/home_screen.dart';
import 'package:financial_management/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/money.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MoneyAdapter());
  await Hive.openBox<Money>('moneyBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //read data from the database(box):
  static void getData() {
    HomeScreen.moneys.clear();
    Box<Money> hiveBox = Hive.box<Money>('moneyBox');
    for (var value in hiveBox.values) {
      HomeScreen.moneys.add(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'koodak',
        textTheme: Theme.of(context).textTheme.apply(
              // fontSizeFactor: 1.2,
              // fontSizeDelta: 5.0,
              fontFamily: 'koodak',
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن مدیریت مالی',
      home: const MainScreen(),
    );
  }
}
