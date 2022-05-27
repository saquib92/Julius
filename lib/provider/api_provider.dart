import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kabadonline/models/generate_token.dart';
import 'package:kabadonline/models/get_faqs_response.dart';
import 'package:kabadonline/models/get_locality_city_state_request.dart';

import '../core/constants.dart';
import '../models/add_wizard_form.dart';

class ApiProvider {
  static Future<String> getTokenapiCall(
      GenerateTokenRequest generateTokenRequest) async {
    var headers = {'Content-Type': 'application/json'};
    var payload = json.encode({
      'post_client_id': generateTokenRequest.posClientId,
      'post_secret_key': generateTokenRequest.postSecretKey,
      'post_return_type': generateTokenRequest.postReturnType,
    });
    var response = await http.post(
      Uri.parse(
        '${Constants.baseUrl}generate-token',
      ),
      body: payload,
      headers: headers,
    );

    var res = jsonDecode(response.body);

    return res['token'] ?? "";
  }

  static Future<GetFaqsResponse> getFaqsApiCall(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var payload =
        json.encode({'post_return_type': 'Mob', 'post_return-language': '1'});
    var response = await http.post(
      Uri.parse(
        '${Constants.baseUrl}get-faqs',
      ),
      body: payload,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      if (res["code"] == 200) {
        List<Faq> faqsList = [];
        for (var i in res["data"]) {
          faqsList.add(
              Faq(faqQuestion: i["faq_question"], faqAnswer: i["faq_answer"]));
        }
        return GetFaqsResponse(code: res["code"], faqsData: faqsList);
      } else {
        return GetFaqsResponse(faqsData: []);
      }
    } else {
      return GetFaqsResponse(faqsData: []);
    }
  }

  static Future<void> getStaticInfoApiCall(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var payload = json.encode({
      "post_return_type": "Mob",
      "post_return_language": "1",
    });
    var response = await http.post(
      Uri.parse(
        '${Constants.baseUrl}get-static-info',
      ),
      body: payload,
      headers: headers,
    );

    var res = jsonDecode(response.body);

    print(response.body);
  }

  static Future<dynamic> getlocalitycitystateapiCall(
      GetLocalityCityStateRequest getLocalityCityStateRequest,
      String token) async {
    print("called");
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var payload = jsonEncode({
      "post_pincode": getLocalityCityStateRequest.postPincode,
      "post_return_type": getLocalityCityStateRequest.postReturnType,
      "post_return_language": getLocalityCityStateRequest.postReturnLanguage,
    });
    var response = await http.post(
        Uri.parse(
          '${Constants.baseUrl}get-locality',
        ),
        body: payload,
        headers: header);

    print(response.body);

    return jsonDecode(response.body);
  }

  static Future<String> requestPickUp(
      String token, AddWizardFormRequest addWizardFormRequest) async {
    var headers = {
      'Authorization': token,
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.baseUrl}add-registration'));

    request.fields.addAll({
      'post_user_name': addWizardFormRequest.post_user_name,
      'post_user_email': addWizardFormRequest.post_user_email,
      'post_user_alt_email': addWizardFormRequest.post_user_alt_email,
      'post_user_mobile': addWizardFormRequest.post_user_mobile,
      'post_user_house_street': addWizardFormRequest.post_user_house_street,
      'post_user_pincode': addWizardFormRequest.post_user_pincode,
      'post_user_locality': addWizardFormRequest.post_user_locality,
      'post_user_landmark': addWizardFormRequest.post_user_landmark,
      'post_user_city': addWizardFormRequest.post_user_city,
      'post_user_state': addWizardFormRequest.post_user_state,
      'post_kabad_weight': addWizardFormRequest.post_kabad_weight,
      'post_kabad_expect_datetime':
          addWizardFormRequest.post_kabad_expect_datetime,
      'post_return_type': addWizardFormRequest.post_return_type,
      'post_return_language': addWizardFormRequest.post_return_language,
      'post_user_message': addWizardFormRequest.post_user_message,
    });

    if (addWizardFormRequest.post_image_file != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'post_image_file',
          addWizardFormRequest.post_image_file!.readAsBytesSync(),
        ),
      );
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resData = await response.stream.bytesToString();

    print(resData);

    if (response.statusCode == 200) {
      var res = jsonDecode(resData);
      if (res["code"] == 200) {
        return res["message"];
      } else {
        return res["message"] ?? "Request Failed";
      }
    } else {
      return "Request Failed";
    }
  }
}
