import 'package:financial_management/screens/new_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:financial_management/constants.dart';
import 'package:financial_management/models/money.dart';
import 'package:financial_management/widgets.dart';

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
        floatingActionButton: FABWidget(),
        body: SizedBox(
          width: double.infinity,
          child: SizedBox(
            child: Column(
              children: [
                SearchBarWidget(searchController: searchController),
                Expanded(
                  child: HomeScreen.moneys.isEmpty
                      ? const EmptyWidget()
                      : ListView.builder(
                          itemCount: HomeScreen.moneys.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              //edit:
                              onTap: () {
                                NewTransactionScreen.isEditing = true;
                                //fill fields with data:
                                //title:
                                NewTransactionScreen
                                        .descriptionController.text =
                                    HomeScreen
                                        .moneys[(HomeScreen.moneys.length - 1) -
                                            index]
                                        .title;
                                //price:
                                NewTransactionScreen.priceController.text =
                                    HomeScreen
                                        .moneys[(HomeScreen.moneys.length - 1) -
                                            index]
                                        .price;
                                //radio button:
                                NewTransactionScreen.groupId = HomeScreen
                                        .moneys[(HomeScreen.moneys.length - 1) -
                                            index]
                                        .isReceived
                                    ? 2
                                    : 1;
                                //index:
                                NewTransactionScreen.index =
                                    (HomeScreen.moneys.length - 1) - index;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewTransactionScreen(),
                                  ),
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              //delete:
                              onLongPress: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        'آیا از حذف این آیتم مطمئن هستید؟',
                                        style: TextStyle(fontSize: 21.0),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'خیر',
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              HomeScreen.moneys.removeAt(
                                                  (HomeScreen.moneys.length -
                                                          1) -
                                                      index); /*used this instead of index to show the listView in reverse*/
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'بله',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                              child: ExpenseTileWidget(
                                index: (HomeScreen.moneys.length - 1) - index,
                              ),
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

//! floating action add button
  Widget FABWidget() {
    return FloatingActionButton(
      onPressed: () {
        NewTransactionScreen.descriptionController.text = '';
        NewTransactionScreen.priceController.text = '';
        NewTransactionScreen.groupId = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewTransactionScreen(),
          ),
        ).then((value) {
          setState(() {});
        });
      },
      backgroundColor: kPurple,
      child: const Icon(Icons.add),
    );
  }
}
