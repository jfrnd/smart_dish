import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/navigation_cubit/navigation_cubit.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/presentation/widgets/brand_box.dart';
import 'package:smart_dish/utils/context_extensions.dart';

class MainNavigation extends StatelessWidget {
  final bool showOnTop;

  const MainNavigation({
    Key? key,
    this.showOnTop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthWatcherCubit, AuthWatcherState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.resetWatcherCubits();
          AutoRouter.of(context).replace(const SignInRoute());
        }
      },
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {
          state.map(
            initial: (_) => null,
            homeSelected: (_) {
              AutoRouter.of(context).replace(const HomeRoute());
            },
            accountSettingsSelected: (_) {
              AutoRouter.of(context).replace(const AccountSettingsRoute());
            },
            friendsSelected: (_) {
              AutoRouter.of(context).replace(const FriendsRoute());
            },
            householdsSelected: (_) {
              AutoRouter.of(context).replace(const HouseholdListRoute());
            },
          );
        },
        builder: (context, state) {
          final navigationItems = [
            NavigationTile(
              onPressed: () {
                AutoRouter.of(context).pop();
                context.read<NavigationCubit>().homeSelected();
              },
              iconData: Icons.home,
              label: 'Home',
              showOnTop: showOnTop,
              isSelected: state is HomeSelected,
            ),
            NavigationTile(
              onPressed: () {
                AutoRouter.of(context).pop();
                context.read<NavigationCubit>().accountSettingsSelected();
              },
              iconData: Icons.settings,
              label: 'Account settings',
              showOnTop: showOnTop,
              isSelected: state is AccountSettingsSelected,
            ),
            NavigationTile(
              onPressed: () {
                AutoRouter.of(context).pop();
                context.read<NavigationCubit>().friendsSelected();
              },
              iconData: Icons.people,
              label: 'Friends',
              showOnTop: showOnTop,
              isSelected: state is FriendsSelected,
            ),
            NavigationTile(
              onPressed: () {
                AutoRouter.of(context).pop();
                context.read<NavigationCubit>().householdsSelected();
              },
              iconData: Icons.other_houses,
              label: 'Households',
              showOnTop: showOnTop,
              isSelected: state is HouseholdsSelected,
            ),
            NavigationTile(
              onPressed: () {
                context.resetWatcherCubits();
                context.read<AuthWatcherCubit>().signedOut();
              },
              iconData: Icons.logout,
              label: 'Log out',
              showOnTop: showOnTop,
              isSelected: false,
            ),
          ];

          if (showOnTop) {
            return Column(
              children: [
                const BrandBox(),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: navigationItems,
                  ),
                )
              ],
            );
          } else {
            return Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[const BrandBox()] + navigationItems,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class NavigationTile extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData iconData;
  final bool showOnTop;
  final bool isSelected;

  const NavigationTile({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.label,
    required this.showOnTop,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    if (showOnTop) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: isSelected ? selectedColor : Colors.grey,
        ),
        label: Text(label,
            style: TextStyle(
              color: isSelected ? selectedColor : Colors.black,
            )),
      );
    } else {
      return Material(
        child: ListTile(
          selected: isSelected,
          selectedColor: selectedColor,
          onTap: onPressed,
          leading: Icon(iconData),
          title: Text(label),
        ),
      );
    }
  }
}
