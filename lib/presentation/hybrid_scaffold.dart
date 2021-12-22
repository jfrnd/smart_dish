import 'package:flutter/material.dart';
import 'package:smart_dish/utils/platform.dart';

import 'navigation/navigation.dart';

const orientationThreshold = 700.0;

class HybridScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? floatingActionButton;
  final bool hideNavBarInMobile;

  const HybridScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.hideNavBarInMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (deviceIsDesktop) {
      return Material(
        child: Row(
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
                      visible: MediaQuery.of(context).size.width <=
                          orientationThreshold,
                      child: const MainNavigation(showOnTop: true),
                    ),
                    body,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text("SmartDish")),
        drawer: hideNavBarInMobile ? null : const MainNavigation(),
        floatingActionButton: floatingActionButton,
        body: body,
      );
    }
  }
}
