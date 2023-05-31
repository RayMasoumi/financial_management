import 'package:financial_management/utilities/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:financial_management/utilities/extensions.dart';
import '../utilities/calculate.dart';

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
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, right: 20.0, bottom: 10.0),
                child: Text('مدیریت تراکنش ها به تومان',
                    style: TextStyle(
                        fontSize: ScreenSize(context).screenWidth * 0.039)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ExpenseBoxWidget(': دریافتی امروز',
                        '${Calculate.receivedToday().toString()} '),
                    const Spacer(),
                    ExpenseBoxWidget(': پرداختی امروز',
                        '${Calculate.paidToday().toString()} '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ExpenseBoxWidget(': دریافتی این ماه',
                        '${Calculate.receivedThisMonth().toString()} '),
                    const Spacer(),
                    ExpenseBoxWidget(': پرداختی این ماه',
                        '${Calculate.paidThisMonth().toString()} '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ExpenseBoxWidget(': دریافتی امسال',
                        '${Calculate.receivedThisYear().toString()} '),
                    const Spacer(),
                    ExpenseBoxWidget(': پرداختی امسال',
                        '${Calculate.paidThisYear().toString()} '),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Calculate.paidThisYear() == 0 && Calculate.receivedThisYear() == 0
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 200.0,
                      child: const BarChartWidget(),
                    )
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
          Text(
            cost,
            style: TextStyle(fontSize: ScreenSize(context).screenWidth * 0.035),
          ),
          Text(
            text,
            style: TextStyle(fontSize: ScreenSize(context).screenWidth * 0.035),
          ),
        ],
      ),
    );
  }
}
