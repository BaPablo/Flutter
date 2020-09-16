// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Heroes _$HeroesFromJson(Map<String, dynamic> json) {
  return Heroes(
    nombre: json['nombre'] as String,
    heroes: (json['heroes'] as List)
        ?.map(
            (e) => e == null ? null : Hero.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HeroesToJson(Heroes instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'heroes': instance.heroes,
    };
