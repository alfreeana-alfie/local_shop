class User {
  String id, name, username, email, image;

  User(this.id, this.name, this.username, this.email, this.image);

  User.fromJSON(Map<String, dynamic> json)
      : id        = json['data']['uid'],
        name      = json['data']['name'],
        username  = json['data']['username'],
        email     = json['data']['email'],
        image     = json['data']['image'];
}
