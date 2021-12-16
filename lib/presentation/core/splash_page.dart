import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/context_extensions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthWatcherCubit, AuthWatcherState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (_) {
              context.triggerWatcherCubits();
              AutoRouter.of(context).replace(const HomeRoute());
            },
            unauthenticated: (_) {
              AutoRouter.of(context).replace(const SignInRoute());
            });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SmartCash"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Text("checking authentication..."),
            ],
          ),
        ),
      ),
    );
  }
}
