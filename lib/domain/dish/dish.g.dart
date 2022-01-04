// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dish _$$_DishFromJson(Map<String, dynamic> json) => _$_Dish(
      createdAt: DateTimeConverter.dateTimeFromTimestamp(
          json['createdAt'] as Timestamp),
      updatedAt: DateTimeConverter.dateTimeFromTimestamp(
          json['updatedAt'] as Timestamp),
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      createdBy: json['createdBy'] as String,
      ingredients: json['ingredients'] == null
          ? []
          : Ingredient.ingredientsFromJson(json['ingredients'] as List),
    );

Map<String, dynamic> _$$_DishToJson(_$_Dish instance) => <String, dynamic>{
      'createdAt': DateTimeConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': DateTimeConverter.dateTimeToTimestamp(instance.updatedAt),
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'ingredients': Ingredient.ingredientsToJson(instance.ingredients),
    };
