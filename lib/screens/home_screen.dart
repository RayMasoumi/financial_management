import 'package:financial_management/main.dart';
import 'package:financial_management/screens/new_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:financial_management/constants.dart';
import 'package:financial_management/models/money.dart';
import 'package:financial_management/utilities/widgets.dart';
import 'package:hive/hive.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:financial_management/utilities/extensions.dart';

class HomeScreen extends StatefulWidget {
  static List<Money> moneys = [];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  Box<Money> hiveBox = Hive.box('moneyBox');

  @override
  void initState() {
    MyApp.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: fabWidget(),
        body: SizedBox(
          width: double.infinity,
          child: SizedBox(
            child: Column(
              children: [
                searchbarWidget(),
                Expanded(
                  child: HomeScreen.moneys.isEmpty
                      ? const EmptyWidget()
                      : ListView.builder(
                          itemCount: HomeScreen.moneys.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              //edit:
                              onTap: () {
                                NewTransactionScreen.date =
                                    HomeScreen.moneys[index].date;
                                NewTransactionScreen.isEditing = true;
                                //fill fields with data:
                                //title:
                                NewTransactionScreen.descriptionController
                                    .text = HomeScreen.moneys[index].title;
                                //price:
                                NewTransactionScreen.priceController.text =
                                    HomeScreen.moneys[index].price;
                                //radio button:
                                NewTransactionScreen.groupId =
                                    HomeScreen.moneys[index].isReceived ? 2 : 1;
                                //index:
                                //now instead of passing the index, we pass the ID so it wouldn't be a problem to edit when the indexes change
                                NewTransactionScreen.index =
                                    HomeScreen.moneys[index].id;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewTransactionScreen(),
                                  ),
                                ).then((value) {
                                  MyApp.getData();
                                  setState(() {});
                                });
                              },
                              //delete:
                              onLongPress: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        'آیا از حذف این آیتم مطمئن هستید؟',
                                        style: TextStyle(
                                            fontSize: ScreenSize(context)
                                                    .screenWidth *
                                                0.030),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'خیر',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: ScreenSize(context)
                                                        .screenWidth *
                                                    0.0365),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              // HomeScreen.moneys.removeAt(
                                              //     (HomeScreen.moneys.length -
                                              //             1) -
                                              //         index); /*used this instead of index to show the listView in reverse*/

                                              //*******if you needed to reverse index***********
                                              // int rIndex =
                                              //     (hiveBox.length - 1) - index;
                                              //************************************************
                                              hiveBox.deleteAt(index);
                                              MyApp.getData();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'بله',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: ScreenSize(context)
                                                        .screenWidth *
                                                    0.0365),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                              child: ExpenseTileWidget(
                                index: index,
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
  Widget fabWidget() {
    return FloatingActionButton(
      onPressed: () {
        NewTransactionScreen.date = 'تاریخ';
        NewTransactionScreen.isEditing = false;
        NewTransactionScreen.descriptionController.text = '';
        NewTransactionScreen.priceController.text = '';
        NewTransactionScreen.groupId = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewTransactionScreen(),
          ),
        ).then((value) {
          MyApp.getData();
          setState(() {});
        });
      },
      backgroundColor: kPurple,
      child: const Icon(Icons.add),
    );
  }

//! searchbar widget:
  Widget searchbarWidget() {
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
              //search function:
              onFieldSubmitted: (String text) {
                List<Money> searchResult = hiveBox.values
                    .where(
                      (value) =>
                          value.title.contains(text) ||
                          value.date.contains(text),
                    )
                    .toList();
                HomeScreen.moneys.clear();
                setState(() {
                  for (var value in searchResult) {
                    HomeScreen.moneys.add(value);
                  }
                });
              },
              onCollapseComplete: () {
                MyApp.getData();
                searchController.text = '';
                setState(() {});
              },
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
