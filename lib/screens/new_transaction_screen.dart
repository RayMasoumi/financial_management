import 'dart:math';
import 'package:financial_management/models/money.dart';
import 'package:financial_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);
  static int groupId = 5;
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController priceController = TextEditingController();
  static bool isEditing = false;
  static int index = 0;

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(NewTransactionScreen.isEditing
                    ? 'ویرایش تراکنش'
                    : 'تراکنش جدید'),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextFieldWidget(
                    hintText: 'توضیحات',
                    controller: NewTransactionScreen.descriptionController),
                MyTextFieldWidget(
                  hintText: 'مبلغ',
                  keyBoardType: TextInputType.number,
                  controller: NewTransactionScreen.priceController,
                ),
                const DateAndType(),
                StretchedButton(
                  text: NewTransactionScreen.isEditing
                      ? 'ثبت ویرایش'
                      : 'اضافه کردن',
                  onPressed: () {
                    Money sample = Money(
                        id: Random().nextInt(999999),
                        title: NewTransactionScreen.descriptionController.text,
                        price: NewTransactionScreen.priceController.text,
                        date: '1401/5/8',
                        isReceived:
                            NewTransactionScreen.groupId == 1 ? false : true);
                    if (NewTransactionScreen.isEditing) {
                      HomeScreen.moneys[NewTransactionScreen.index] = sample;
                    } else {
                      HomeScreen.moneys.add(sample);
                    }

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
