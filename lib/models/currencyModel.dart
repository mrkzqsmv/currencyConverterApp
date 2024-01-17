// ignore: file_names
class CurrencyModel {
  Meta? meta;
  Data? data;

  CurrencyModel({this.meta, this.data});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  String? lastUpdatedAt;

  Meta({this.lastUpdatedAt});

  Meta.fromJson(Map<String, dynamic> json) {
    lastUpdatedAt = json['last_updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_at'] = lastUpdatedAt;
    return data;
  }
}

class Data {
  AZN? aZN;

  Data({this.aZN});

  Data.fromJson(Map<String, dynamic> json) {
    aZN = json['AZN'] != null ?  AZN.fromJson(json['AZN']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (aZN != null) {
      data['AZN'] = aZN!.toJson();
    }
    return data;
  }
}

class AZN {
  String? code;
  double? value;

  AZN({this.code, this.value});

  AZN.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['value'] = value;
    return data;
  }
}