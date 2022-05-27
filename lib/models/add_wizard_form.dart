import 'dart:io';

class AddWizardFormRequest {
  String post_user_name;
  String post_user_email;
  String post_user_alt_email;
  String post_user_mobile;
  String post_user_house_street;
  String post_user_pincode;
  String post_user_locality;
  String post_user_landmark;
  String post_user_city;
  String post_user_state;
  String post_kabad_weight;
  String post_kabad_expect_datetime;
  File? post_image_file;
  String post_return_type;
  String post_return_language;
  String post_user_message;

  AddWizardFormRequest({
    this.post_user_name = "",
    this.post_user_email = "",
    this.post_user_alt_email = "",
    this.post_user_mobile = "",
    this.post_user_house_street = "",
    this.post_user_pincode = "",
    this.post_user_locality = "",
    this.post_user_landmark = "",
    this.post_user_city = "",
    this.post_user_state = "",
    this.post_kabad_weight = "",
    this.post_kabad_expect_datetime = "",
    this.post_image_file,
    this.post_return_type = "",
    this.post_return_language = "",
    this.post_user_message = "",
  });
}
