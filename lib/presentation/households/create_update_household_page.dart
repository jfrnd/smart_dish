import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_dish/application/household_editor/household_editor_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/household/household.dart';
import 'package:smart_dish/presentation/core/loading_in_progress_overlay.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/presentation/widgets/cropable_image.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/utils/my_list_tile.dart';
import 'package:smart_dish/utils/platform.dart';

// class CreateUpdateHouseholdDialog extends StatelessWidget {
//   final Household? household;

//   const CreateUpdateHouseholdDialog({Key? key, this.household})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: SizedBox(
//         width: 400,
//         child: CreateUpdateHouseholdPage(household: household),
//       ),
//     );
//   }
// }

class CreateUpdateHouseholdPage extends StatelessWidget {
  final Household? household;

  const CreateUpdateHouseholdPage({Key? key, this.household}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HouseholdEditorCubit>()..initialized(household),
      child: BlocConsumer<HouseholdEditorCubit, HouseholdEditorState>(
        listenWhen: (p, c) => p.failureOrSuccess != c.failureOrSuccess,
        listener: (context, state) {
          state.failureOrSuccess?.fold(
            (failure) => failure.showError(context, deviceIsMobile),
            (success) => AutoRouter.of(context).pop(),
          );
        },
        buildWhen: (p, c) => p.isLoading != c.isLoading,
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: AppBarTitle(household),
                  automaticallyImplyLeading: deviceIsDesktop ? false : true,
                  actions: const [
                    EditModeSwitch(),
                    CancelButton(),
                  ],
                ),
                floatingActionButton: const SaveButton(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const WebProgressIndicator(),
                        const HouseholdImage(),
                        HouseholdNameTextField(household),
                        HouseholdCreatorListTile(household),
                        MemberList(household),
                        const DeleteButton()
                      ],
                    ),
                  ),
                ),
              ),
              LoadingInProgressOverlay(
                  isLoading: state.isLoading && deviceIsMobile)
            ],
          );
        },
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isInEditMode,
          child: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () =>
                context.read<HouseholdEditorCubit>().onSavedClicked(),
          ),
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.household, {
    Key? key,
  }) : super(key: key);

  final Household? household;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      builder: (context, state) {
        return state.isCreatingNewHousehold
            ? const Text("Create Household")
            : state.isInEditMode
                ? const Text("Update Household")
                : Text(household?.name ?? "");
      },
    );
  }
}

class EditModeSwitch extends StatelessWidget {
  const EditModeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (p, c) =>
          p.isInEditMode != c.isInEditMode ||
          p.hasPermissionToUpdate != c.hasPermissionToUpdate ||
          c.isCreatingNewHousehold != p.isCreatingNewHousehold,
      builder: (context, state) {
        return Visibility(
          visible: !state.isInEditMode &&
              state.hasPermissionToUpdate &&
              !state.isCreatingNewHousehold,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () =>
                context.read<HouseholdEditorCubit>().editModeSwitched(),
          ),
        );
      },
    );
  }
}

class HouseholdCreatorListTile extends StatelessWidget {
  const HouseholdCreatorListTile(
    this.household, {
    Key? key,
  }) : super(key: key);

  final Household? household;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (p, c) => p.isCreatingNewHousehold != c.isCreatingNewHousehold,
      builder: (context, state) {
        return Visibility(
          visible: !state.isCreatingNewHousehold,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InvertedListTile(
                leading: OvalImage(household?.creator?.imageUrl ?? ""),
                overline: "Created by",
                body: household?.creator?.userName ?? "",
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class MemberList extends StatelessWidget {
  const MemberList(
    this.household, {
    Key? key,
  }) : super(key: key);

  final Household? household;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
              builder: (context, state) {
            return Row(
              children: [
                const Expanded(flex: 3, child: Text("Members")),
                Expanded(
                  flex: 1,
                  child: Visibility(
                    visible: state.isInEditMode,
                    child: const Text("is part"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Visibility(
                    visible: state.isInEditMode,
                    child: const Text("is admin"),
                  ),
                ),
              ],
            );
          }),
        ),
        const Divider(),
        BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
          builder: (context, state) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.membersPool.length,
              itemBuilder: (context, index) {
                final user = state.membersPool[index];
                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        leading: OvalImage(user.imageUrl),
                        title: Text(user.userName),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: state.isInEditMode,
                        child: Checkbox(
                          value: state.household.memberIds.contains(user.id),
                          onChanged: (selected) {
                            if (selected == true) {
                              context
                                  .read<HouseholdEditorCubit>()
                                  .memberSelected(user.id!);
                            }
                            if (selected == false) {
                              context
                                  .read<HouseholdEditorCubit>()
                                  .memberUnselected(user.id!);
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: state.isInEditMode,
                        child: Checkbox(
                          value: state.household.adminIds.contains(user.id),
                          onChanged: state.isCreator
                              ? (selected) {
                                  if (selected == true) {
                                    context
                                        .read<HouseholdEditorCubit>()
                                        .adminSelected(user.id!);
                                  }
                                  if (selected == false) {
                                    context
                                        .read<HouseholdEditorCubit>()
                                        .adminUnselected(user.id!);
                                  }
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class HouseholdImage extends StatelessWidget {
  const HouseholdImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (p, c) =>
          p.household.imageUrl != c.household.imageUrl ||
          p.isInEditMode != c.isInEditMode,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CropableImage(
                isEnabled: state.isInEditMode,
                initialImageUrl: state.household.imageUrl,
                onNewImageLoaded: (image) => context
                    .read<HouseholdEditorCubit>()
                    .onNewImageLoaded(image),
              ),
            ),
            const Divider(height: 0),
          ],
        );
      },
    );
  }
}

class HouseholdNameTextField extends StatelessWidget {
  final Household? household;
  const HouseholdNameTextField(
    this.household, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (p, c) =>
          p.isInEditMode != c.isInEditMode ||
          p.showErrorMessages != c.showErrorMessages,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                enabled: state.isInEditMode,
                initialValue: household?.name ?? "",
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                maxLength: 40,
                decoration: const InputDecoration(
                  labelText: "Household name",
                  border: UnderlineInputBorder(),
                  disabledBorder: InputBorder.none,
                  counterText: "",
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                onChanged: (value) => context
                    .read<HouseholdEditorCubit>()
                    .householdNameChanged(value),
                validator: (value) =>
                    value == null || value.isEmpty ? "Cannot be empty" : null,
              ),
            ),
            Visibility(
              visible: !state.isInEditMode,
              child: const Divider(height: 0),
            ),
          ],
        );
      },
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (p, c) =>
          p.isCreatingNewHousehold != c.isCreatingNewHousehold ||
          p.isInEditMode != c.isInEditMode ||
          p.isCreator != c.isCreator,
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
              visible: state.isInEditMode && state.isCreator,
              child: const Divider(height: 32),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Visibility(
                visible: !state.isCreatingNewHousehold &&
                    state.isInEditMode &&
                    state.isCreator,
                child: MaterialButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      Text("DELETE HOUSEHOLD",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (_) => DeleteDialog(mainContext: context)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DeleteDialog extends StatelessWidget {
  final BuildContext mainContext;
  const DeleteDialog({
    Key? key,
    required this.mainContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Household'),
      content: const Text('Are you sure you want to delete this household?'),
      actions: [
        MaterialButton(
          color: Colors.grey,
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        MaterialButton(
          child: const Text('Delete'),
          color: Colors.red,
          onPressed: () {
            AutoRouter.of(context).popUntilRouteWithName(
                HouseholdListRoute.name); // ! skip household page
            mainContext
                .read<HouseholdEditorCubit>()
                .onDeletedHouseholdClicked();
          },
        )
      ],
    );
  }
}

class WebProgressIndicator extends StatelessWidget {
  const WebProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseholdEditorCubit, HouseholdEditorState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Visibility(
          visible: deviceIsDesktop && state.isLoading,
          child: const LinearProgressIndicator(minHeight: 5),
        );
      },
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: deviceIsDesktop,
      child: IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
