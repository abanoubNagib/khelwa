import 'package:equatable/equatable.dart';

abstract class FailureApi extends Equatable {
  final String message;

  const FailureApi(this.message);

  @override
  List<Object> get props => [
    message,
  ];
}

class ServerFailure extends FailureApi {
  const ServerFailure(super.message);
}
