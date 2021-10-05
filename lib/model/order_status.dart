class OrderStatus {
  String code, description, color;

  OrderStatus(
      {required this.code, required this.description, required this.color});

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
        code        : map['code'] as String,
        description : map['description'] as String,
        color       : map['color'] as String);
  }
}
