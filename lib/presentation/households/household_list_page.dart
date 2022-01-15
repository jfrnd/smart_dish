import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/watcher/household_watcher_cubit.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/household/household.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/hybrid_scaffold.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';

class HouseholdListPage extends StatelessWidget {
  const HouseholdListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HybridScaffold(
      appBar: AppBar(
        title: const Text("Households"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            AutoRouter.of(context).push(CreateUpdateHouseholdRoute()),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HouseholdWatcherCubit, WatcherState<List<Household>>>(
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
              final households = state.data;
              return ListView.builder(
                itemCount: households.length,
                itemBuilder: (context, index) {
                  final household = households[index];

                  return HouseHoldTile(household: household);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class HouseHoldTile extends StatelessWidget {
  const HouseHoldTile({
    Key? key,
    required this.household,
  }) : super(key: key);

  final Household household;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => AutoRouter.of(context)
              .push(HouseholdRoute(householdId: household.id!)),
          leading: OvalImage(household.imageUrl),
          title: Text(household.name),
          subtitle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(household.members.length, (index) {
                  final user = household.members[index];
                  return Row(
                    children: [
                      OvalImage(user.imageUrl, size: 15),
                      const SizedBox(width: 4),
                      Text(user.userName),
                      const SizedBox(width: 4),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
        const Divider(height: 0)
      ],
    );
  }
}
