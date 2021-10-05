class Promotion {
  String filename, path;

  Promotion({required this.filename, required this.path});

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
        filename: map['filename'] as String, path: map['path'] as String);
  }
}
