class ChatRoom {
  String id, userToId, userFromId;

  ChatRoom(
      {required this.id, required this.userToId, required this.userFromId});

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
        id          : map['id'] as String,
        userToId    : map['user_to_id'] as String,
        userFromId  : map['user_from_id'] as String);
  }
}
