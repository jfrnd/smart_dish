import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';

class EmailVerifyWaitingPage extends StatefulWidget {
  final String email;

  const EmailVerifyWaitingPage({Key? key, required this.email})
      : super(key: key);

  @override
  State<EmailVerifyWaitingPage> createState() => _EmailVerifyWaitingPageState();
}

class _EmailVerifyWaitingPageState extends State<EmailVerifyWaitingPage> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) => context.read<AuthWatcherCubit>().manuallyReloadUser(),
    );

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    context.read<AuthWatcherCubit>().signedOut();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (mounted &&
              defaultTargetPlatform != TargetPlatform.iOS &&
              defaultTargetPlatform != TargetPlatform.android)
          ? null
          : AppBar(
              title: const Text("Email verification"),
              automaticallyImplyLeading: false,
            ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
                size: 128,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(
                  'Email verification required',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              SelectableText(
                'An email has been sent to:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(
                  ' ${widget.email}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SelectableText(
                'Please follow the instructions in the verification email to finish creating your account.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
