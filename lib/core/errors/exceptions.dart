import 'package:khelwa/core/network/message_model.dart';

class ServerException  implements Exception {
  final MessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });

  @override
  String toString() {
    return 'ServerException(errorMessageModel: ${errorMessageModel.message})';
  }
}

class LocalDatabaseException implements Exception {
  final String errorMessage;

  const LocalDatabaseException({
    required this.errorMessage,
  });
}
