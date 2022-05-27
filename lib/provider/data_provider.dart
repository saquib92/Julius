import 'dart:io';

import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  File? pickedImage;
  String name = "";
  String mobileNo = "";
  String email = "";
  String houseno = "";
  String landmark = "";
  String locality = "";
  String city = "";
  String state = "";
  String pincode = "";
  String weight = "";
  DateTime? date;

  setImage(File img) {
    pickedImage = img;
    notifyListeners();
  }

  deleteImage() {
    pickedImage = null;
    notifyListeners();
  }

  setName(String text) {
    name = text;
    notifyListeners();
  }

  setMobileNo(String text) {
    mobileNo = text;
    notifyListeners();
  }

  setEmail(String text) {
    email = text;
    notifyListeners();
  }

  sethouseno(String text) {
    houseno = text;
    notifyListeners();
  }

  setlandmark(String text) {
    landmark = text;
    notifyListeners();
  }

  setpincode(String text) {
    pincode = text;
    notifyListeners();
  }

  setweight(String text) {
    weight = text;
    notifyListeners();
  }

  setlocality(String text) {
    locality = text;
    notifyListeners();
  }

  setcity(String text) {
    city = text;
    notifyListeners();
  }

  setstate(String text) {
    state = text;
    notifyListeners();
  }
}
