// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hero _$HeroFromJson(Map<String, dynamic> json) {
  return Hero(
    nombre: json['nombre'] as String,
    poder: json['poder'] as String,
    icon: json['icon'] as String,
    color: json['color'] as String,
  );
}

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'poder': instance.poder,
      'icon': instance.icon,
      'color': instance.color,
    };
