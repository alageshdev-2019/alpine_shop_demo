
import 'response_code.dart';
import 'response_message.dart';

class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.defaulT, ResponseMessage.defaulT);
}