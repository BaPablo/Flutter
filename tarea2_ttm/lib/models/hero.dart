import 'package:json_annotation/json_annotation.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero {
  final String nombre;
  final String poder;
  final String icon;
  final String color;

  Hero({this.nombre, this.poder, this.icon, this.color});

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);

  Map<String, dynamic> toJson() => _$HeroToJson(this);
}
