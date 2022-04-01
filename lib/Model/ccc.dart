import 'dart:convert';
/// data : {"id":2,"name":"fuchsia rose","year":2001,"color":"#C74375","pantone_value":"17-2031"}
/// support : {"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}

Ccc cccFromJson(String str) => Ccc.fromJson(json.decode(str));
String cccToJson(Ccc data) => json.encode(data.toJson());
class Ccc {
  Ccc({
      Data? data, 
      Support? support,}){
    _data = data;
    _support = support;
}

  Ccc.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  Data? _data;
  Support? _support;
Ccc copyWith({  Data? data,
  Support? support,
}) => Ccc(  data: data ?? _data,
  support: support ?? _support,
);
  Data? get data => _data;
  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }

}

/// url : "https://reqres.in/#support-heading"
/// text : "To keep ReqRes free, contributions towards server costs are appreciated!"

Support supportFromJson(String str) => Support.fromJson(json.decode(str));
String supportToJson(Support data) => json.encode(data.toJson());
class Support {
  Support({
      String? url, 
      String? text,}){
    _url = url;
    _text = text;
}

  Support.fromJson(dynamic json) {
    _url = json['url'];
    _text = json['text'];
  }
  String? _url;
  String? _text;
Support copyWith({  String? url,
  String? text,
}) => Support(  url: url ?? _url,
  text: text ?? _text,
);
  String? get url => _url;
  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }

}

/// id : 2
/// name : "fuchsia rose"
/// year : 2001
/// color : "#C74375"
/// pantone_value : "17-2031"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      int? year, 
      String? color, 
      String? pantoneValue,}){
    _id = id;
    _name = name;
    _year = year;
    _color = color;
    _pantoneValue = pantoneValue;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _color = json['color'];
    _pantoneValue = json['pantone_value'];
  }
  int? _id;
  String? _name;
  int? _year;
  String? _color;
  String? _pantoneValue;
Data copyWith({  int? id,
  String? name,
  int? year,
  String? color,
  String? pantoneValue,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  year: year ?? _year,
  color: color ?? _color,
  pantoneValue: pantoneValue ?? _pantoneValue,
);
  int? get id => _id;
  String? get name => _name;
  int? get year => _year;
  String? get color => _color;
  String? get pantoneValue => _pantoneValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['color'] = _color;
    map['pantone_value'] = _pantoneValue;
    return map;
  }

}