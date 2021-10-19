class ProductOption {
  String productId, quantity, weight, subName;

  ProductOption(
      {required this.productId,
      required this.quantity,
      required this.weight,
      required this.subName});

  factory ProductOption.fromMap(Map<String, dynamic> map) {
    return ProductOption(
      productId: map['product_id'] as String,
      quantity: map['quantity'] as String,
      weight: map['weight'] as String,
      subName: map['sub_name'] as String,
    );
  }

  ProductOption.fromJSON(Map<String, dynamic> json)
      : productId = json['sub_data']['product_id'],
        quantity  = json['sub_data']['quantity'],
        weight    = json['sub_data']['weight'],
        subName   = json['sub_data']['sub_name'];
}
