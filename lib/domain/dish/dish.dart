// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_dish/domain/dish/ingredient.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';

part 'dish.g.dart';
part 'dish.freezed.dart';

const CREATED_AT = 'createdAt';
const UPDATED_AT = 'updatedAt';
const CREATED_BY = 'createdBy';
const INGREDIENTS = "ingredients";

@freezed
class Dish with _$Dish {
  const Dish._();

  const factory Dish({
    @JsonKey(ignore: true)
        String? id,
    @JsonKey(
      name: CREATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp,
    )
        required DateTime createdAt,
    @JsonKey(
      name: UPDATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp,
    )
        required DateTime updatedAt,
    required String imageUrl,
    required String name,
    required String createdBy,
    @JsonKey(
      name: INGREDIENTS,
      fromJson: Ingredient.ingredientsFromJson,
      toJson: Ingredient.ingredientsToJson,
      defaultValue: <Ingredient>[],
    )
        required List<Ingredient> ingredients,
    @JsonKey(ignore: true)
        User? creator,
  }) = _Dish;

  factory Dish.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return Dish.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
  }

  Map<String, dynamic> toFirestore({SetOptions? setOptions}) => toJson();

  factory Dish.empty() => Dish(
        createdBy: "",
        imageUrl: "",
        name: "",
        createdAt: DateTime.now(),
        id: "",
        updatedAt: DateTime.now(),
        ingredients: [],
      );

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}
