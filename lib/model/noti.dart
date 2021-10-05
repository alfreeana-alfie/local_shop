class Noti {
  String id, playerId, name, userId;

  Noti(
      {required this.id,
      required this.playerId,
      required this.name,
      required this.userId});

  factory Noti.fromMap(Map<String, dynamic> map) {
    return Noti(
        id        : map['id'] as String,
        playerId  : map['player_id'] as String,
        name      : map['name'] as String,
        userId    : map['user_id'] as String);
  }
}
