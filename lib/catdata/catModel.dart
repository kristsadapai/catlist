import 'package:json_annotation/json_annotation.dart';
part 'catModel.g.dart';

@JsonSerializable()
class Cat {
  String name;
  String description;
  Cat({this.name, this.description});
  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

@JsonSerializable()
class CatBreed {
  String id;
  String url;
  int width;
  int height;
  String origin;
  String life_span;
  List<Cat> breeds;

  CatBreed(
      {this.id,
      this.url,
      this.width,
      this.height,
      this.breeds,
      this.origin,
      this.life_span});
  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);
}

class CatList {
  List<CatBreed> breeds;
  CatList({this.breeds});
  factory CatList.fromJson(List<dynamic> json) {
    return CatList(
        breeds: json
            .map((e) => CatBreed.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class BreedList {
  List<Breed> breeds;
  BreedList({this.breeds});
  factory BreedList.fromJson(List<dynamic> json) {
    return BreedList(
        breeds: json
            .map((e) => Breed.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Breed {
  String id;
  String name;
  String description;
  String temperament;
  Breed({this.id, this.name, this.description, this.temperament});
  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
