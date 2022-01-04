// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  const Ingredient._();

  const factory Ingredient({
    required UniqueKey localId,
    required String name,
    required bool isChecked,
  }) = _Ingredient;

  factory Ingredient.empty() => Ingredient(
        localId: UniqueKey(),
        name: "",
        isChecked: false,
      );

  static String nameFromJson(String name) => "TEST";
  static String nameToJson(String name) => name;

  static List<Ingredient> ingredientsFromJson(List<dynamic> strings) => strings
      .map(
        (i) => Ingredient(
          name: i,
          localId: UniqueKey(),
          isChecked: false,
        ),
      )
      .toList();

  static List<String> ingredientsToJson(List<Ingredient> ingredients) =>
      ingredients.map((i) => i.name).toList();
}
