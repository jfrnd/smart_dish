import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    if (kIsWeb &&
        defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android) {
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
