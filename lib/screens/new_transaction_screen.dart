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
                SizedBox(
                  height: 10.0,
                ),
                MyTextFieldWidget(
                  hintText: 'مبلغ',
                  keyBoardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
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
    return TextField(
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
    );
  }
}
