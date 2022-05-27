import 'package:kabadonline/core/constants.dart';

class GenerateTokenRequest {
  String posClientId;
  String postSecretKey;
  String postReturnType;

  GenerateTokenRequest({
    this.posClientId = Constants.clientId,
    this.postSecretKey = Constants.secretKey,
    this.postReturnType = Constants.postReturnType,
  });
}
