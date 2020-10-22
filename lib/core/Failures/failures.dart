import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  String toString() => "Unexpected Error";
}

///[ServerFailure] is called when a device is online but there is a Server Error

class ServerFailure extends Failure {
  @override
  String toString() =>
      "Verification  failed!!\n Try again with the valid credentials!";

  @override
  List<Object> get props => null;
}
