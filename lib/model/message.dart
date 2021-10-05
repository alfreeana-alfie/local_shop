class Message {
  String id, roomId, userToFrom, content, isRead;

  Message(
      {required this.id,
      required this.roomId,
      required this.userToFrom,
      required this.content,
      required this.isRead});

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        id          : map['id'] as String,
        roomId      : map['room_id'] as String,
        userToFrom  : map['user_to_from'] as String,
        content     : map['content'] as String,
        isRead      : map['is_read'] as String);
  }
}
