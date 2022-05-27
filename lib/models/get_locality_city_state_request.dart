import 'package:kabadonline/core/constants.dart';

class GetLocalityCityStateRequest {
  String postPincode;
  String postReturnType;
  String postReturnLanguage;

  GetLocalityCityStateRequest({
    this.postPincode = "",
    this.postReturnType = Constants.postReturnType,
    this.postReturnLanguage = Constants.postReturnLanguage,
  });
}
