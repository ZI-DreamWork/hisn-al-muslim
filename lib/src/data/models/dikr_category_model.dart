import 'package:zi_dikr/src/data/models/dikr_model.dart';

class DikrCategoryModel {
  final int id;
  final String category;
  final String audio;
  final String filename;
  final List<DikrModel> adkar;

  const DikrCategoryModel(
      {required this.id,
      required this.category,
      required this.audio,
      required this.filename,
      required this.adkar});

  factory DikrCategoryModel.fromJson(Map<String, dynamic> json) {
    // final adkarjson =
    return DikrCategoryModel(
        id: json['id'],
        category: json['category'],
        audio: json['audio'],
        filename: json['filename'],
        adkar:
            (json['array'] as List).map((e) => DikrModel.fromJson(e)).toList());
  }
}
