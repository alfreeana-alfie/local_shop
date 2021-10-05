class Order {
  String id,
      userSId,
      userCId,
      pId,
      quan,
      trackingNum,
      deliPrice,
      totalAmt,
      status,
      createdAt;

  Order(
      {required this.id,
      required this.userSId,
      required this.userCId,
      required this.pId,
      required this.quan,
      required this.trackingNum,
      required this.deliPrice,
      required this.totalAmt,
      required this.status,
      required this.createdAt});

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        id          : map['id'] as String,
        userSId     : map['user_s_id'] as String,
        userCId     : map['user_c_id'] as String,
        pId         : map['p_id'] as String,
        quan        : map['quan'] as String,
        trackingNum : map['tracking_num'] as String,
        deliPrice   : map['deli_price'] as String,
        totalAmt    : map['total_amt'] as String,
        status      : map['status'] as String,
        createdAt   : map['created_at'] as String);
  }
}
