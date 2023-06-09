import 'dart:math';
import 'package:financial_management/main.dart';
import 'package:financial_management/models/money.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../utilities/widgets.dart';
import 'package:financial_management/utilities/extensions.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);
  static int groupId = 0;
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController priceController = TextEditingController();
  static bool isEditing = false;
  static int index = 0;
  static String date = 'تاریخ';

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  Box<Money> hiveBox = Hive.box('moneyBox');
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
                Text(
                  NewTransactionScreen.isEditing
                      ? 'ویرایش تراکنش'
                      : 'تراکنش جدید',
                  style: TextStyle(
                    fontSize: ScreenSize(context).screenWidth * kTitleRatio,
                  ),
                ),
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
                    if (NewTransactionScreen.date == 'تاریخ' ||
                        NewTransactionScreen.date == 'null/0null/0null') {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Center(
                                    child: Text(
                                      '! ابتدا تاریخ را وارد کنید',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize(context).screenWidth *
                                                  0.040,
                                          color: Colors.red),
                                    ),
                                  ),
                                ));
                      });
                    }
                    if (NewTransactionScreen.priceController.text == '') {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Center(
                                    child: Text(
                                      '! هزینه ای وارد نشده است',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize(context).screenWidth *
                                                  0.040,
                                          color: Colors.red),
                                    ),
                                  ),
                                ));
                      });
                    } else {
                      Money sample = Money(
                          id: Random().nextInt(999999),
                          title:
                              NewTransactionScreen.descriptionController.text,
                          price: NewTransactionScreen.priceController.text,
                          date: NewTransactionScreen.date,
                          isReceived:
                              NewTransactionScreen.groupId == 1 ? false : true);
                      if (NewTransactionScreen.isEditing) {
                        int index = 0;
                        //casting the id we got into the correct index of each element:
                        MyApp.getData(); //refreshing the List at first:
                        for (int i = 0; i < hiveBox.values.length; i++) {
                          if (hiveBox.values.elementAt(i).id ==
                              NewTransactionScreen
                                  .index) //so this checks if they have the same id, and if so, they must have the same index too
                          {
                            index = i;
                            Navigator.pop(context);
                          }
                        }

                        // HomeScreen.moneys[NewTransactionScreen.index] = sample;
                        hiveBox.putAt(index, sample);
                      } else {
                        // HomeScreen.moneys.add(sample);
                        hiveBox.add(sample);
                        Navigator.pop(context);
                      }
                    }
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
