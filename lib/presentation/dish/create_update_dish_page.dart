import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

import 'package:smart_dish/application/dish_editor/dish_editor_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/dish/ingredient.dart';
import 'package:smart_dish/presentation/core/loading_in_progress_overlay.dart';
import 'package:smart_dish/presentation/widgets/cropable_image.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/utils/my_list_tile.dart';
import 'package:smart_dish/utils/platform.dart';

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
    return BlocProvider(
      create: (context) => getIt<DishEditorCubit>()..initialized(dish),
      child: BlocConsumer<DishEditorCubit, DishEditorState>(
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
                  title: AppBarTitle(dish),
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
                        const DishImage(),
                        DishNameTextField(dish),
                        DishCretorListTile(dish),
                        const IngredientsList(),
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
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isInEditMode,
          child: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () => context.read<DishEditorCubit>().onSavedClicked(),
          ),
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.dish, {
    Key? key,
  }) : super(key: key);

  final Dish? dish;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      builder: (context, state) {
        return state.isCreatingNewDish
            ? const Text("Create Dish")
            : state.isInEditMode
                ? const Text("Update Dish")
                : Text(dish?.name ?? "");
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
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      buildWhen: (p, c) =>
          p.isInEditMode != c.isInEditMode ||
          p.hasPermissionToUpdate != c.hasPermissionToUpdate ||
          c.isCreatingNewDish != p.isCreatingNewDish,
      builder: (context, state) {
        return Visibility(
          visible: !state.isInEditMode &&
              state.hasPermissionToUpdate &&
              !state.isCreatingNewDish,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.read<DishEditorCubit>().editModeSwitched(),
          ),
        );
      },
    );
  }
}

class DishCretorListTile extends StatelessWidget {
  const DishCretorListTile(
    this.dish, {
    Key? key,
  }) : super(key: key);

  final Dish? dish;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      buildWhen: (p, c) => p.isCreatingNewDish != c.isCreatingNewDish,
      builder: (context, state) {
        return Visibility(
          visible: !state.isCreatingNewDish,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InvertedListTile(
                leading: OvalImage(dish?.creator?.imageUrl ?? ""),
                overline: "Created by",
                body: dish?.creator?.userName ?? "",
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      buildWhen: (p, c) =>
          !c.isInEditMode ||
          p.dish.ingredients.length != c.dish.ingredients.length ||
          p.isInEditMode != c.isInEditMode,
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
              visible: state.dish.ingredients.isNotEmpty || state.isInEditMode,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.shopping_basket),
                  title: Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            ImplicitlyAnimatedReorderableList<Ingredient>(
              items: state.dish.ingredients,
              shrinkWrap: true,
              areItemsTheSame: (oldItem, newItem) =>
                  oldItem.localId == newItem.localId,
              onReorderFinished: (item, from, to, ingredients) {
                context
                    .read<DishEditorCubit>()
                    .onOrderIngredientsChanged(ingredients);
              },
              itemBuilder: (context, animation, ingredient, index) {
                return Reorderable(
                  key: ValueKey(ingredient),
                  builder: (context, dragAnimation, inDrag) {
                    final t = dragAnimation.value;
                    final elevation = lerpDouble(0, 8, t);
                    final color = Color.lerp(
                        Colors.white, Colors.white.withOpacity(0.8), t);

                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.easeInOut,
                      animation: animation,
                      child: Material(
                        color: color,
                        elevation: elevation!,
                        type: MaterialType.transparency,
                        child: CenteredListTile(
                          trailing: state.isInEditMode
                              ? IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => context
                                      .read<DishEditorCubit>()
                                      .onDeleteIngredientClicked(index),
                                )
                              : Checkbox(
                                  value: ingredient.isChecked,
                                  onChanged: (value) {
                                    if (value != null) {
                                      context
                                          .read<DishEditorCubit>()
                                          .toggleIngredientCheck(
                                            value,
                                            ingredient,
                                          );
                                    }
                                  },
                                ),
                          title: TextFormField(
                            initialValue: ingredient.name,
                            enabled: state.isInEditMode,
                            style: TextStyle(
                              decoration: ingredient.isChecked
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              disabledBorder: InputBorder.none,
                              hintText: "type name of ingredient",
                            ),
                            onChanged: (value) => context
                                .read<DishEditorCubit>()
                                .onIngredientChanged(index, value),
                            onFieldSubmitted: (value) => context
                                .read<DishEditorCubit>()
                                .onAddNewIngredientClicked(),
                          ),
                          leading: state.isInEditMode
                              ? const Handle(
                                  delay: Duration(milliseconds: 100),
                                  child: Icon(
                                    Icons.list,
                                    color: Colors.grey,
                                  ),
                                )
                              : Text(
                                  "${index + 1}:",
                                  style: const TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Visibility(
              visible: state.isInEditMode,
              child: TextButton.icon(
                onPressed: () =>
                    context.read<DishEditorCubit>().onAddNewIngredientClicked(),
                icon: const Icon(Icons.add, color: Colors.grey, size: 40),
                label: const Text(
                  "add ingredient",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DishImage extends StatelessWidget {
  const DishImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      buildWhen: (p, c) =>
          p.dish.imageUrl != c.dish.imageUrl ||
          p.isInEditMode != c.isInEditMode,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CropableImage(
                isEnabled: state.isInEditMode,
                initialImageUrl: state.dish.imageUrl,
                onNewImageLoaded: (image) =>
                    context.read<DishEditorCubit>().onNewImageLoaded(image),
              ),
            ),
            const Divider(height: 0),
          ],
        );
      },
    );
  }
}

class DishNameTextField extends StatelessWidget {
  final Dish? dish;
  const DishNameTextField(
    this.dish, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishEditorCubit, DishEditorState>(
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
                initialValue: dish?.name ?? "",
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                maxLength: 40,
                decoration: const InputDecoration(
                  labelText: "Dish name",
                  border: UnderlineInputBorder(),
                  disabledBorder: InputBorder.none,
                  counterText: "",
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                onChanged: (value) =>
                    context.read<DishEditorCubit>().dishNameChanged(value),
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
    return BlocBuilder<DishEditorCubit, DishEditorState>(
      buildWhen: (p, c) =>
          p.isCreatingNewDish != c.isCreatingNewDish ||
          p.isInEditMode != c.isInEditMode,
      builder: (context, state) {
        return Visibility(
          visible: !state.isCreatingNewDish && state.isInEditMode,
          child: Column(
            children: [
              const Divider(height: 32),
              Padding(
                padding: const EdgeInsets.all(32),
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
                      Text("DELETE DISH",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (_) => DeleteDialog(mainContext: context)),
                ),
              ),
            ],
          ),
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
            mainContext.read<DishEditorCubit>().onDeletedDishClicked();
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
    return BlocBuilder<DishEditorCubit, DishEditorState>(
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
