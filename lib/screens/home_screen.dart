import 'package:financial_management/screens/new_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:financial_management/constants.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:financial_management/models/money.dart';

class HomeScreen extends StatefulWidget {
  static List<Money> moneys = [
    Money(
        id: 0,
        title: 'درس',
        price: '500000',
        date: '1401/2/8',
        isReceived: false),
    Money(
        id: 1,
        title: 'آرایشگاه',
        price: '450000',
        date: '1401/2/8',
        isReceived: true),
    Money(
        id: 2,
        title: 'اسنپ',
        price: '760000',
        date: '1401/2/8',
        isReceived: false),
    Money(
        id: 3,
        title: 'بنزین',
        price: '1570000',
        date: '1401/2/8',
        isReceived: true),
  ];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: const AddFAB(),
        body: SizedBox(
          width: double.infinity,
          child: SizedBox(
            child: Column(
              children: [
                SearchBarWidget(searchController: searchController),
                // const Expanded(
                //   child:
                // EmptyWidget(),
                // ),
                Expanded(
                  child: ListView.builder(
                      itemCount: HomeScreen.moneys.length,
                      itemBuilder: (context, index) {
                        print(HomeScreen.moneys[index].isReceived);
                        return ExpenseTileWidget(
                          index: index,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//tile list widget:
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
          )
        ],
      ),
    );
  }
}

//! floating action add button
class AddFAB extends StatelessWidget {
  const AddFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewTransactionScreen(),
          ),
        );
      },
      backgroundColor: kPurple,
      child: const Icon(Icons.add),
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
      padding: const EdgeInsets.only(
          left: 5.0, right: 15.0, top: 15.0, bottom: 25.0),
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
