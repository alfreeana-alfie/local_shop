class Division {
  String sName;

  Division({required this.sName});

  factory Division.fromMap(Map<String, dynamic> map) {
    return Division(
      sName    : map['s_name'] as String,
    );
  }
}
