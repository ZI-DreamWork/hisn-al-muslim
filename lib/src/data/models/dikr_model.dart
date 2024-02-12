class DikrModel {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  const DikrModel(
      {required this.id,
      required this.text,
      required this.count,
      required this.audio,
      required this.filename});

  factory DikrModel.fromJson(Map<String, dynamic> json) {
    return DikrModel(
        id: json['id'],
        text: json['text'],
        count: json['count'],
        audio: json['audio'],
        filename: json['filename']);
  }
}

class DikrArguments {
  final List<DikrModel> adkar;
  final String category;

  DikrArguments({required this.adkar, required this.category});
}
