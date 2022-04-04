import 'dart:convert';
/// token : "QpwL5tke4Pnpja7X4"
/// error : "Error 404"

PostData postDataFromJson(String str) => PostData.fromJson(json.decode(str));
String postDataToJson(PostData data) => json.encode(data.toJson());
class PostData {
  PostData({
      String? token, 
      String? error,}){
    _token = token;
    _error = error;
}

  PostData.fromJson(dynamic json) {
    _token = json['token'];
    _error = json['error'];
  }
  String? _token;
  String? _error;
PostData copyWith({  String? token,
  String? error,
}) => PostData(  token: token ?? _token,
  error: error ?? _error,
);
  String? get token => _token;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['error'] = _error;
    return map;
  }

}