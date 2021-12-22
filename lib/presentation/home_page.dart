import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/watcher/dish_watcher_cubit.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/create_update_dish_page.dart';
import 'package:smart_dish/presentation/hybrid_scaffold.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/utils/platform.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HybridScaffold(
      body: const Dishes(),
      appBar: AppBar(title: const Text("Home")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create),
        onPressed: () => AutoRouter.of(context).push(CreateUpdateDishRoute()),
      ),
    );
  }
}

class Dishes extends StatelessWidget {
  const Dishes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishWatcherCubit, WatcherState<List<Dish>>>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          isLoading: (_) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loadingFailed: (state) => Center(
            child: Text(state.failure.toMessage()),
          ),
          loadingSuccessful: (state) {
            final dishes = state.data;
            return deviceIsDesktop
                ? WebDishList(dishes: dishes)
                : MobileDishList(dishes: dishes);
          },
        );
      },
    );
  }
}

class WebDishList extends StatelessWidget {
  const WebDishList({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<Dish> dishes;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(dishes.length, (index) {
      final dish = dishes[index];
      return Card(
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (_) => CreateUpdateDishDialog(dish: dish),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: OvalImage(
                  dish.imageUrl,
                  size: null,
                  emptyIconData: Icons.dining_sharp,
                ),
              ),
              ListTile(
                leading: OvalImage(dish.creator?.imageUrl ?? ""),
                title: Text(
                  dish.name,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "updated ${dish.updatedAt!.toDisplayedString()} by ${dish.creator?.userName ?? ""}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    });

    final addButton = Card(
      color: Colors.grey[100],
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (_) => const CreateUpdateDishDialog(),
        ),
        child: const FittedBox(child: Icon(Icons.add)),
      ),
    );

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: items + [addButton],
    );
  }
}

class MobileDishList extends StatelessWidget {
  const MobileDishList({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<Dish> dishes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];
        return ListTile(
          leading: OvalImage(
            dish.imageUrl,
            emptyIconData: Icons.dining_sharp,
          ),
          trailing: OvalImage(dish.creator?.imageUrl ?? ""),
          onTap: () =>
              AutoRouter.of(context).push(CreateUpdateDishRoute(dish: dish)),
          title: Text(dish.name),
          subtitle: Text(
              "updated ${dish.updatedAt!.toDisplayedString()} by ${dish.creator?.userName ?? ""}"),
        );
      },
    );
  }
}
