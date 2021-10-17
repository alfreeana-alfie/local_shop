class Category {
  String cName;
  String icon;
  String color;

  Category({
    required this.cName,
    required this.icon,
    required this.color,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      cName: map['c_name'] as String,
      icon: map['icon'] as String,
      color: map['color'] as String,
    );
  }

  Category.fromJSON(Map<String, dynamic> json)
      : cName = json['data']['c_name'],
        icon = json['data']['icon'],
        color = json['data']['color'];
}
