import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final int userId;
  final int id;
  final String title;
  final String body;

  News({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
