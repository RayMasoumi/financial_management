import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
import 'screens/new_transaction_screen.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

//!tile list widget:
class ExpenseTileWidget extends StatelessWidget {
  final int index;

  const ExpenseTileWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: HomeScreen.moneys[index].isReceived ? kGreen : kRed,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Icon(
              HomeScreen.moneys[index].isReceived ? Icons.add : Icons.remove,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              HomeScreen.moneys[index].title,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Row(
                  children: [
                    Text(
                      'تومان  ',
                      style: TextStyle(
                          color: HomeScreen.moneys[index].isReceived
                              ? kGreen
                              : kRed),
                    ),
                    Text(
                      HomeScreen.moneys[index].price,
                      style: TextStyle(
                          color: HomeScreen.moneys[index].isReceived
                              ? kGreen
                              : kRed),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(HomeScreen.moneys[index].date),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//! empty widget:
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          'assets/images/empty.jpg',
          height: 280,
          width: 280,
        ),
        const Text(
          '! تراکنشی موجود نیست ',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

//!stretched button widget:
class StretchedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const StretchedButton(
      {required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: kPurple,
        ),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}

//!radio button widget:
class RadioButton extends StatelessWidget {
  final int value;

  const RadioButton(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.title,
      super.key});

  final int groupValue;
  final Function(int?) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio(
          activeColor: kPurple,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}

//! a widget for date and transaction type:
class DateAndType extends StatefulWidget {
  const DateAndType({
    super.key,
  });

  @override
  State<DateAndType> createState() => _DateAndTypeState();
}

class _DateAndTypeState extends State<DateAndType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RadioButton(
                title: 'پرداختی',
                value: 1,
                groupValue: NewTransactionScreen.groupId,
                onChanged: (value) {
                  setState(() {
                    NewTransactionScreen.groupId = value!;
                  });
                }),
            RadioButton(
                title: 'دریافتی',
                value: 2,
                groupValue: NewTransactionScreen.groupId,
                onChanged: (value) {
                  setState(() {
                    NewTransactionScreen.groupId = value!;
                  });
                }),
            Expanded(
              child: OutlinedButton(
                onPressed: () async {
                  var pickedDate = await showPersianDatePicker(
                    context: context,
                    initialDate: Jalali.now(),
                    firstDate: Jalali(1402),
                    lastDate: Jalali(1420),
                  );
                  setState(() {
                    //to set 0 before 1 digit dates:
                    // .length == 2
                    // ? pickedDate?.day.toString()
                    //     : '0${pickedDate?.day.toString()}'

                    //day
                    String? day = pickedDate?.day.toString();

                    //month
                    String? month = pickedDate?.month.toString();

                    //year
                    String? year = pickedDate?.year.toString();

                    //date
                    NewTransactionScreen.date = '$year/$month/$day';
                  });
                },
                child: Text(
                  NewTransactionScreen.date,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! text field widget:
class MyTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyBoardType;
  final TextEditingController controller;

  const MyTextFieldWidget(
      {super.key,
      required this.hintText,
      this.keyBoardType = TextInputType.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black54,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
