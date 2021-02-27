// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) {
  return Cat(
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

CatBreed _$CatBreedFromJson(Map<String, dynamic> json) {
  return CatBreed(
    id: json['id'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    breeds: (json['breeds'] as List)
        ?.map((e) => e == null ? null : Cat.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    origin: json['origin'] as String,
    life_span: json['life_span'] as String,
  );
}

Map<String, dynamic> _$CatBreedToJson(CatBreed instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'origin': instance.origin,
      'life_span': instance.life_span,
      'breeds': instance.breeds,
    };

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return Breed(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    temperament: json['temperament'] as String,
  );
}

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'temperament': instance.temperament,
    };
