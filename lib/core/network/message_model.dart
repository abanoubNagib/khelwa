
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String number;
  final String message;
  final bool status;

  const MessageModel({
    required this.number,
    required this.message,
    required this.status,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        number: json['number'].toString(),
        message: json['message'].toString(),
        status: json['status'],
      );

  @override
  List<Object> get props => [
        number,
        message,
        status,
      ];

  @override
  bool? get stringify => true;
}
