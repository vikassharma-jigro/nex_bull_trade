import 'dart:convert';

class ErrorModel {
  final bool? isSuccess;
  final String? message;
  final dynamic resultData;
  final int? statusCode;
  final List<String>? errors;
  final dynamic meta;

  ErrorModel({
    this.isSuccess,
    this.message,
    this.resultData,
    this.statusCode,
    this.errors,
    this.meta,
  });

  ErrorModel copyWith({
    bool? isSuccess,
    String? message,
    dynamic resultData,
    int? statusCode,
    List<String>? errors,
    dynamic meta,
  }) => ErrorModel(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
    resultData: resultData ?? this.resultData,
    statusCode: statusCode ?? this.statusCode,
    errors: errors ?? this.errors,
    meta: meta ?? this.meta,
  );

  factory ErrorModel.fromRawJson(String str) =>
      ErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    isSuccess: json["isSuccess"],
    message: json["message"],
    resultData: json["resultData"],
    statusCode: json["statusCode"],
    errors: json["errors"] == null
        ? []
        : List<String>.from(json["errors"]!.map((x) => x)),
    meta: json["meta"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "resultData": resultData,
    "statusCode": statusCode,
    "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
    "meta": meta,
  };
}
