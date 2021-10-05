class District {
  String upiCode, name;

  District({required this.upiCode, required this.name});

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
        upiCode: map['upi_code'] as String, name: map['name'] as String);
  }
}
