class Category {
  String name;
  String icon;
  String color;

  Category({
    required this.name,
    required this.icon,
    required this.color,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      icon: map['icon'] as String,
      color: map['color'] as String,
    );
  }

  Category.fromJSON(Map<String, dynamic> json)
      : name = json['data']['name'],
        icon = json['data']['icon'],
        color = json['data']['color'];
}
