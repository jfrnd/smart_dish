// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'dish.g.dart';
part 'dish.freezed.dart';

const CREATED_AT = 'createdAt';
const UPDATED_AT = 'updatedAt';
const CREATED_BY = 'createdBy';

@freezed
class Dish with _$Dish {
  const Dish._();

  const factory Dish({
    @JsonKey(ignore: true) String? id,
    @JsonKey(ignore: true) DateTime? createdAt,
    @JsonKey(ignore: true) DateTime? updatedAt,
    required String imageUrl,
    required String name,
    required String createdBy,
    @JsonKey(ignore: true) User? creator,
  }) = _Dish;

  factory Dish.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return Dish.fromJson(snapshot.data()!).copyWith(
      id: snapshot.id,
      createdAt: (snapshot.get(CREATED_AT) as Timestamp).toDate(),
      updatedAt: (snapshot.get(UPDATED_AT) as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore({SetOptions? setOptions}) {
    final asJson = toJson();
    asJson.addAll(
      {
        CREATED_AT: Timestamp.fromDate(createdAt!),
        UPDATED_AT: Timestamp.fromDate(updatedAt!),
      },
    );
    return asJson;
  }

  factory Dish.empty() => Dish(
        createdBy: "",
        imageUrl: "",
        name: "",
        createdAt: DateTime.now(),
        id: "",
        updatedAt: DateTime.now(),
      );

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}
