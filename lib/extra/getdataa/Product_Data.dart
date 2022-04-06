import '../../Model/user_data.dart';


class ProductData {
  ProductData({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDetail>? data,
    Support? support,
  }) {
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
    _support = support;
  }

  ProductData.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UserDetail.fromJson(v));
      });
    }
    _support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  int? _page;
  int? _perPage;
  int? _total;
  int? _totalPages;
  List<UserDetail>? _data;
  Support? _support;

  ProductData copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDetail>? data,
    Support? support,
  }) =>
      ProductData(
        page: page ?? _page,
        perPage: perPage ?? _perPage,
        total: total ?? _total,
        totalPages: totalPages ?? _totalPages,
        data: data ?? _data,
        support: support ?? _support,
      );

  int? get page => _page;

  int? get perPage => _perPage;

  int? get total => _total;

  int? get totalPages => _totalPages;

  List<UserDetail?>? get data => _data;

  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }
}
