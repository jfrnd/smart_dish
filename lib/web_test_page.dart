import 'package:flutter/material.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/main.dart';
import 'package:smart_dish/presentation/navigation/navigation.dart';

class WebTest extends StatelessWidget {
  final ThemeData themeData;
  const WebTest(
    this.themeData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const WebTestPage(),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

const orientationThreshold = 1000;

class WebTestPage extends StatelessWidget {
  const WebTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: MediaQuery.of(context).size.width > orientationThreshold,
          child: const Drawer(child: MainNavigation()),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible:
                      MediaQuery.of(context).size.width <= orientationThreshold,
                  child: const MainNavigation(showOnTop: true),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final dishes = [
  Dish(
    imageUrl: "",
    name: "Spaghetti",
    createdBy: "JAN",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    id: "123",
    creator: User(
      imageUrl: "",
      userName: "Jan",
      createdAt: DateTime.now(),
    ),
  ),
  Dish(
    imageUrl: "",
    name: "Salad",
    createdBy: "JAN",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    id: "123",
    creator: User(
      imageUrl: "",
      userName: "Jan",
      createdAt: DateTime.now(),
    ),
  ),
  Dish(
    imageUrl: "",
    name: "Duck",
    createdBy: "JAN",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    id: "123",
    creator: User(
      imageUrl: "",
      userName: "Jan",
      createdAt: DateTime.now(),
    ),
  ),
  Dish(
    imageUrl: "",
    name: "Chicken",
    createdBy: "JAN",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    id: "123",
    creator: User(
      imageUrl: "",
      userName: "Jan11111111111111111111111111111111111111111111111",
      createdAt: DateTime.now(),
    ),
  ),
];
