import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, right: 20.0, bottom: 10.0),
                child: Text('مدیریت تراکنش ها به تومان'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ExpenseBoxWidget(': دریافتی امروز', '0.0 '),
                    Spacer(),
                    ExpenseBoxWidget(': پرداختی امروز', '0.0 '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ExpenseBoxWidget(': دریافتی این ماه', '0.0 '),
                    Spacer(),
                    ExpenseBoxWidget(': پرداختی این ماه', '0.0 '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ExpenseBoxWidget(': دریافتی امسال', '0.0 '),
                    Spacer(),
                    ExpenseBoxWidget(': پرداختی امسال', '0.0 '),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//expense box info:
class ExpenseBoxWidget extends StatelessWidget {
  final String text;
  final String cost;
  const ExpenseBoxWidget(this.text, this.cost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(cost),
          Text(text),
        ],
      ),
    );
  }
}
