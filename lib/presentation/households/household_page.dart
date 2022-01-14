import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/watcher/household_watcher_cubit.dart';
import 'package:smart_dish/domain/household/household.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/logger.dart';
import 'package:smart_dish/utils/platform.dart';

class HouseholdPage extends StatelessWidget {
  final String householdId;
  const HouseholdPage({
    Key? key,
    required this.householdId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdWatcherCubit, WatcherState<List<Household>>>(
      builder: (context, state) {
        final household = state.maybeMap(
          loadingSuccessful: (state) =>
              state.data.firstWhere((h) => h.id == householdId),
          orElse: () => Household.empty(),
        );
        return Scaffold(
            appBar: AppBar(
              title: Text(household.name),
              automaticallyImplyLeading: deviceIsDesktop ? false : true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => AutoRouter.of(context).push(
                    CreateUpdateHouseholdRoute(household: household),
                  ),
                )
              ],
            ),
            body: Text(''));
      },
    );
  }
}

          // Center(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Draggable(
          //         data: "123",
          //         feedback: Container(
          //           width: 50,
          //           height: 50,
          //           color: Colors.yellow,
          //         ),
          //         child: Container(
          //           width: 50,
          //           height: 50,
          //           color: Colors.red,
          //         ),
          //       ),
          //       DragTarget<String>(
          //         onAccept: (data) {
          //           if (data == "123") logger.d("workd");
          //         },
          //         builder: (context, candidateData, rejectedData) {
          //           return Container(
          //             width: 50,
          //             height: 50,
          //             color: Colors.blue,
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),