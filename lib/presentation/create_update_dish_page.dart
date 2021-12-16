import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_dish/application/dish_editor/dish_editor_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/presentation/core/loading_in_progress_overlay.dart';
import 'package:smart_dish/presentation/widgets/cropable_image.dart';

class CreateUpdateDishDialog extends StatelessWidget {
  final Dish? dish;

  const CreateUpdateDishDialog({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: CreateUpdateDishPage(dish: dish),
      ),
    );
  }
}

class CreateUpdateDishPage extends StatelessWidget {
  final Dish? dish;

  const CreateUpdateDishPage({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<DishEditorCubit>()..initialized(dish),
      child: BlocConsumer<DishEditorCubit, DishEditorState>(
        listener: (context, state) {
          state.failureOrSuccess?.fold(
            (failure) => failure.showError(
                context,
                kIsWeb &&
                    defaultTargetPlatform != TargetPlatform.iOS &&
                    defaultTargetPlatform != TargetPlatform.android),
            (success) => AutoRouter.of(context).pop(),
          );
        },
        builder: (context, state) {
          controller.text = state.dish.name;
          controller.selection = TextSelection(
            baseOffset: controller.text.length,
            extentOffset: controller.text.length,
          );

          final hasPermssionToUpdate =
              !state.isUpdating || dish!.creator!.extendedData!.isSignedInUser;

          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: const Text("Create Dish"),
                  automaticallyImplyLeading: kIsWeb &&
                          defaultTargetPlatform != TargetPlatform.iOS &&
                          defaultTargetPlatform != TargetPlatform.android
                      ? false
                      : true,
                  actions: [
                    Visibility(
                      visible: state.isUpdating &&
                          !kIsWeb &&
                          defaultTargetPlatform != TargetPlatform.iOS &&
                          defaultTargetPlatform != TargetPlatform.android &&
                          hasPermssionToUpdate,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(mainContext: context),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: kIsWeb &&
                          defaultTargetPlatform != TargetPlatform.iOS &&
                          defaultTargetPlatform != TargetPlatform.android &&
                          defaultTargetPlatform != TargetPlatform.iOS &&
                          defaultTargetPlatform != TargetPlatform.android,
                      child: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  ],
                ),
                floatingActionButton: Visibility(
                  visible: hasPermssionToUpdate,
                  child: FloatingActionButton(
                    child: const Icon(Icons.save),
                    onPressed: () =>
                        context.read<DishEditorCubit>().onSavedClicked(),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Visibility(
                          visible: kIsWeb &&
                              defaultTargetPlatform != TargetPlatform.iOS &&
                              defaultTargetPlatform != TargetPlatform.android &&
                              state.isLoading,
                          child: const LinearProgressIndicator(minHeight: 5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CropableImage(
                            isEnabled: hasPermssionToUpdate,
                            initialImageUrl: state.dish.imageUrl,
                            onNewImageLoaded: (image) => context
                                .read<DishEditorCubit>()
                                .onNewImageLoaded(image),
                          ),
                        ),
                        TextFormField(
                          enabled: hasPermssionToUpdate,
                          autofocus: true,
                          controller: controller,
                          autovalidateMode: state.showErrorMessages
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          maxLength: 40,
                          decoration: const InputDecoration(
                            labelText: "Dish name",
                            prefixIcon: Icon(Icons.description),
                            counterText: "",
                          ),
                          autocorrect: false,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) => context
                              .read<DishEditorCubit>()
                              .dishNameChanged(value),
                          onFieldSubmitted: (_) =>
                              context.read<DishEditorCubit>().onSavedClicked(),
                          validator: (value) => value == null || value.isEmpty
                              ? "Cannot be empty"
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Visibility(
                            visible: state.isUpdating &&
                                kIsWeb &&
                                defaultTargetPlatform != TargetPlatform.iOS &&
                                defaultTargetPlatform !=
                                    TargetPlatform.android &&
                                hasPermssionToUpdate,
                            child: TextButton.icon(
                              label: const Text(
                                "delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) =>
                                      DeleteDialog(mainContext: context)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              LoadingInProgressOverlay(
                  isLoading: state.isLoading &&
                      !(kIsWeb &&
                          defaultTargetPlatform != TargetPlatform.iOS &&
                          defaultTargetPlatform != TargetPlatform.android))
            ],
          );
        },
      ),
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
      title: const Text('Delete Dish'),
      content: const Text('Are you sure you want to delete this dish?'),
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
            Navigator.of(context).pop();
            mainContext.read<DishEditorCubit>().ondeletedDishClicked();
          },
        )
      ],
    );
  }
}
