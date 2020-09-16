class Hero {
  final String nombre;
  final String poder;
  final String icon;
  final String color;

  Hero(this.nombre, this.poder, this.icon, this.color);

  //Decode
  Hero.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        poder = json['poder'],
        icon = json['icon'],
        color = json['color'];

  //Encode
  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'poder': poder,
        'icon': icon,
        'color': color,
      };
}
