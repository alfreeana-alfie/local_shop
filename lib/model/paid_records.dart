class PaidRecords {
  String id, orderId, remarks, createdAt;

  PaidRecords(
      {required this.id,
      required this.orderId,
      required this.remarks,
      required this.createdAt});

  factory PaidRecords.fromMap(Map<String, dynamic> map) {
    return PaidRecords(
        id        : map['id'] as String,
        orderId   : map['order_id'] as String,
        remarks   : map['remarks'] as String,
        createdAt :  map['created_at'] as String);
  }
}
