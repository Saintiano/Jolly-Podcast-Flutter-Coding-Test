import 'package:equatable/equatable.dart';

class DefaultResModel<T> extends Equatable {
  const DefaultResModel({
    required this.code,
    required this.success,
    required this.message,
    this.data,
  });
  final String code;
  final bool success;
  final String message;
  final T? data;


  factory DefaultResModel.fromJson(Map<String, dynamic> json,
      [T Function(dynamic)? parser]) =>
      DefaultResModel(
        code: json['code'],
        success: json['success'],
        message: json['message'],
        data: () {
          if (parser != null) {
            return parser(json['data']);
          }
          return json['data'];
        }(),
      );

  @override
  List<Object?> get props => [code, success, message, data.toString()];
}