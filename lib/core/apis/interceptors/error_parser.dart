import 'dart:convert';

final class ErrorParser {
  ErrorParser({
    this.code,
    this.status,
    this.message,
    this.timeStamp,
    this.description,
  });

  factory ErrorParser.fromRawJson(String str) =>
      ErrorParser.fromJson(json.decode(str));

  factory ErrorParser.fromJson(Map<String, dynamic> json) => ErrorParser(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      description: json["description"],
      timeStamp: DateTime.tryParse(json["timestamp"]));

  final String? code;
  final String? status;
  final String? message;
  final String? description;
  final DateTime? timeStamp;
}
