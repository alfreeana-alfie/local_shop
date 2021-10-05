class Review {
  String id,
      userSId,
      userCId,
      pId,
      rating,
      description,
      photo1,
      photo2,
      photo3,
      photo4,
      photo5,
      video,
      createdAt;

  Review(
      {required this.id,
      required this.userSId,
      required this.userCId,
      required this.pId,
      required this.rating,
      required this.description,
      required this.photo1,
      required this.photo2,
      required this.photo3,
      required this.photo4,
      required this.photo5,
      required this.video,
      required this.createdAt});

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
        id          : map['id'] as String,
        userSId     : map['user_s_id'] as String,
        userCId     : map['user_c_id'] as String,
        pId         : map['p_id'] as String,
        rating      : map['rating'] as String,
        description : map['description'] as String,
        photo1      : map['photo1'] as String,
        photo2      : map['photo2'] as String,
        photo3      : map['photo3'] as String,
        photo4      : map['photo4'] as String,
        photo5      : map['photo5'] as String,
        video       : map['video'] as String,
        createdAt   : map['created_at'] as String);
  }
}
