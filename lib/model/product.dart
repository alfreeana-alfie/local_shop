class Product {
  String id,
      sellerId,
      pName,
      categoryId,
      stock,
      content,
      price,
      weight,
      state,
      photo1,
      photo2,
      photo3,
      photo4,
      photo5,
      createdAt;

  Product(
      {required this.id,
      required this.sellerId,
      required this.pName,
      required this.categoryId,
      required this.stock,
      required this.content,
      required this.price,
      required this.weight,
      required this.state,
      required this.photo1,
      required this.photo2,
      required this.photo3,
      required this.photo4,
      required this.photo5,
      required this.createdAt});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id          : map['id'] as String,
        sellerId    : map['seller_id'] as String,
        pName       : map['name'] as String,
        categoryId  : map['category_id'] as String,
        stock       : map['quantity'] as String,
        content     : map['content'] as String,
        price       : map['price'] as String,
        weight      : map['weight'] as String,
        state       : map['s_name'] as String,
        photo1      : map['path01'] as String,
        photo2      : map['path02'] as String,
        photo3      : map['path03'] as String,
        photo4      : map['path04'] as String,
        photo5      : map['path05'] as String,
        createdAt   : map['created_at'] as String);
  }
}
