class Division {
  String upiCode, name;

  Division({required this.upiCode, required this.name});

  factory Division.fromMap(Map<String, dynamic> map) {
    return Division(
      upiCode : map['upi_code'] as String,
      name    : map['name'] as String,
    );
  }
}
