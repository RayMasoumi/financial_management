import 'package:flutter/material.dart';
import 'package:financial_management/constants.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              SearchBarWidget(searchController: searchController),
              const EmptyWidget()
            ],
          ),
        ),
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
      onPressed: () {},
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
      padding: const EdgeInsets.only(left: 5.0, right: 15.0, top: 15.0),
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
