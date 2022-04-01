import 'dart:convert';

/// userId : 1
/// id : 1
/// title : "quidem molestiae enim"

Postmodel postmodelFromJson(String str) => Postmodel.fromJson(json.decode(str));

String postmodelToJson(Postmodel data) => json.encode(data.toJson());

class Postmodel {
  Postmodel({
    int? userId,
    int? id,
    String? title,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
  }

  Postmodel.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
  }

  int? _userId;
  int? _id;
  String? _title;

  Postmodel copyWith({
    int? userId,
    int? id,
    String? title,
  }) =>
      Postmodel(
        userId: userId ?? _userId,
        id: id ?? _id,
        title: title ?? _title,
      );

  int? get userId => _userId;

  int? get id => _id;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }
}
