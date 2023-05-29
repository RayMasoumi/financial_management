import 'package:flutter/material.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);

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
              children: const [
                Text('تراکنش جدید'),
                SizedBox(
                  height: 20.0,
                ),
                MyTextFieldWidget(hintText: 'توضیحات'),
                MyTextFieldWidget(
                  hintText: 'مبلغ',
                  keyBoardType: TextInputType.number,
                ),
                DateAndType()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//radio button widget:
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
          value: value,
          groupValue: groupValue,
          onChanged: (value) {},
        ),
        Text(title),
      ],
    );
  }
}

//! a widget for date and transaction type:
class DateAndType extends StatelessWidget {
  const DateAndType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioButton(
              title: 'پرداختی',
              value: 0,
              groupValue: 1000,
              onChanged: (value) {}),
          RadioButton(
              title: 'دریافتی',
              value: 1,
              groupValue: 1000,
              onChanged: (value) {}),
          TextButton(
            onPressed: () {},
            child: const Text(
              'تاریخ',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

//! text field widget:
class MyTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyBoardType;

  const MyTextFieldWidget(
      {super.key,
      required this.hintText,
      this.keyBoardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
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
