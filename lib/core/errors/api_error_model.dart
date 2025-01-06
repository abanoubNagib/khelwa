class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      ApiErrorModel(
        message: json['message'] as String?,
        code: (json['code'] as num?)?.toInt(),
      );

  Map<String, dynamic> toMap(ApiErrorModel instance) =>
      <String, dynamic>{
        'message': instance.message,
        'code': instance.code,
      };
}