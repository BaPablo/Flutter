import 'package:json_annotation/json_annotation.dart';

import 'package:tarea2_ttm/models/hero.dart';

part 'heroes.g.dart';

@JsonSerializable()
class Heroes {
  final String nombre;
  final List<Hero> heroes;

  Heroes({this.nombre, this.heroes});

  factory Heroes.fromJson(Map<String, dynamic> json) => _$HeroesFromJson(json);

  Map<String, dynamic> toJson() => _$HeroesToJson(this);
}
