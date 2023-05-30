import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
import 'screens/new_transaction_screen.dart';

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

//! searchbar widget:
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5.0, right: 15.0, top: 15.0, bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SearchBarAnimation(
              buttonBorderColour: Colors.black26,
              buttonShadowColour: Colors.black26,
              hintText: '... جستجو کنید',
              textEditingController: searchController,
              isOriginalAnimation: false,
              trailingWidget: const Icon(
                Icons.search,
                size: 20,
                color: Colors.black,
              ),
              secondaryButtonWidget: const Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
              buttonWidget: const Icon(
                Icons.search,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const Text(
            'تراکنش ها',
            style: TextStyle(fontSize: 20.0, fontFamily: 'koodak'),
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
          OutlinedButton(
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
