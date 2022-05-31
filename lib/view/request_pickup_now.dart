import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kabadonline/app_utils/app_utils.dart';
import 'package:kabadonline/core/constants.dart';
import 'package:kabadonline/models/add_wizard_form.dart';
import 'package:kabadonline/models/generate_token.dart';
import 'package:kabadonline/models/get_locality_city_state_request.dart';
import 'package:kabadonline/provider/api_provider.dart';
import 'package:kabadonline/provider/data_provider.dart';
import 'package:provider/provider.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final basicDetailskey = GlobalKey<FormState>();
  final addressKey = GlobalKey<FormState>();
  final slotKey = GlobalKey<FormState>();
  final key2 = GlobalKey<FormState>();
  final key3 = GlobalKey<FormState>();
  var apiProvider = ApiProvider();

  int _index = 0;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCt2 = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController housenoController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  final ImagePicker _picker = ImagePicker();
  DataProvider? provider;
  var _pincodeEntered = false;
  // File? pickedImage;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: const [
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              Text(
                '+91-9545505148',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.green[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9.9),
              child: Image.asset(
                'assets/logo/brandLogo.png',
                fit: BoxFit.contain,
                height: 40,
                width: 80,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Pick up now',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.left,
            ),
            const Text(
              'Please complete below steps to request pick up now',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Stepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails controlsDetails) {
                  return Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: controlsDetails.onStepContinue,
                        child: const Text('Continue'),
                      ),
                      const SizedBox(width: 10),
                      _index != 0
                          ? TextButton(
                              onPressed: controlsDetails.onStepCancel,
                              child: const Text(
                                'Previous',
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          : Container()
                    ],
                  );
                },
                steps: [
                  Step(
                      isActive: _index >= 0 ? true : false,
                      title: const Text('Basic Details'),
                      content: Form(
                        key: basicDetailskey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a valid value";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: nameController,
                              decoration: const InputDecoration(
                                  label: Text("Full Name"),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    // width: 1.5==,
                                    color: Colors.green,
                                  ))),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              maxLength: 10,
                              validator: (value) {
                                if (value!.length != 10) {
                                  return "Please enter a valid value";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              controller: mobController,
                              decoration: const InputDecoration(
                                  label: Text('Mobile No'),
                                  counterText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.5, color: Colors.green))),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  label: Text('Email Id (Optional)'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.5, color: Colors.green))),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )),
                  Step(
                    isActive: _index >= 1 ? true : false,
                    title: const Text('Address'),
                    content: Form(
                      key: addressKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a valid value";
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: housenoController,
                            decoration: const InputDecoration(
                              label: Text('House No/Floor/Street'),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.green),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 40,
                            child: TextFormField(
                              controller: landmarkController,
                              decoration: const InputDecoration(
                                label: Text('Landmark (Optional)'),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: pincodeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please enter a valid value");
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              label: Text("Pincode"),
                              counterText: "",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.green),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 6) {
                                setState(() {
                                  _pincodeEntered = true;
                                });
                                _getlocalitycitystateapiCall();
                              } else {
                                setState(() {
                                  _pincodeEntered = false;
                                });
                              }
                            },
                            maxLength: 6,
                          ),
                          const SizedBox(height: 10),
                          if (_pincodeEntered) ...[
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: TextFormField(
                                controller: localityController,
                                onChanged: (value) {
                                  if (value.length == 6) {}
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  label: Text('Locality'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: TextFormField(
                                controller: cityController,
                                onChanged: (value) {
                                  if (value.length == 6) {
                                    _getlocalitycitystateapiCall();
                                  }
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  label: Text('City'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: TextFormField(
                                controller: stateController,
                                // controller: stateController.text =
                                //     res["apiResponseData"]["pin_state"],
                                onChanged: (value) {
                                  if (value.length == 6) {
                                    _getlocalitycitystateapiCall();
                                  }
                                },
                                decoration: const InputDecoration(
                                    counterText: "",
                                    label: Text('State'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.5, color: Colors.green))),
                              ),
                            ),
                          ],
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Step(
                      isActive: _index >= 2 ? true : false,
                      title: const Text('Slot'),
                      content: Form(
                        key: slotKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter weight of scrap";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: weightController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                label: Text('Enter Weight (in Kg)'),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.green),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: TextFormField(
                                controller: dateCtl,
                                decoration: const InputDecoration(
                                  label: Text('Select Date'),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.green),
                                  ),
                                ),
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  provider!.date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 15),
                                    ),
                                  );
                                  setState(() {
                                    dateCtl.text = DateFormat.yMMMd()
                                        .format(provider!.date!);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: TextFormField(
                                  controller: dateCt2,
                                  decoration: const InputDecoration(
                                      hintText: 'Select Time Slot',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.5,
                                              color: Colors.green))),
                                  onTap: () async {
                                    // DateTime? date = DateTime(1990);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    TimeOfDay? newTime = await showTimePicker(
                                      context: context,
                                      initialTime: time,
                                    );
                                    if (newTime == null) return;

                                    var dt = DateTime(
                                        provider!.date!.year,
                                        provider!.date!.month,
                                        provider!.date!.day,
                                        newTime.hour,
                                        newTime.minute);

                                    provider!.date = dt;

                                    setState(() {
                                      dateCt2.text =
                                          "${DateFormat.jm().format(dt)} - ${DateFormat.jm().format(dt.add(const Duration(hours: 2)))}";
                                    });
                                  }),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )),
                  Step(
                      isActive: _index >= 3 ? true : false,
                      title: const Text('Uplode Image (Optional)'),
                      content: provider!.pickedImage == null
                          ? ElevatedButton.icon(
                              onPressed: imagePickerOption,
                              icon: const Icon(Icons.add_a_photo_sharp),
                              label: const Text('UPLOAD IMAGE'))
                          : Row(
                              children: [
                                Image.file(
                                  provider!.pickedImage!,
                                  width: 80,
                                  height: 80,
                                ),
                                IconButton(
                                  onPressed: () {
                                    provider!.deleteImage();
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            )),
                  Step(
                    isActive: _index >= 4 ? true : false,
                    title: const Text('Review'),
                    content: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    width: double.infinity,
                                    child: const Text('Your details:',
                                        textAlign: TextAlign.left),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: const Icon(Icons.account_box),
                                    title: Text(provider!.name),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: const Icon(Icons.call),
                                    title: Text(provider!.mobileNo),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          // color: Colors.grey,
                          elevation: 5,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    width: double.infinity,
                                    child: const Text(
                                        'Pick up address and time:',
                                        textAlign: TextAlign.left),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: const Icon(Icons.location_on),
                                    title: Text(
                                      '${provider!.houseno} ${provider!.landmark} ${provider!.locality} ${provider!.city} ${provider!.state}',
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: const Icon(Icons.access_time),
                                    title: provider!.date == null
                                        ? const Text("")
                                        : Text(
                                            '${DateFormat.yMMMMd().format(provider!.date!)} ${"${DateFormat.jm().format(provider!.date!)} - ${DateFormat.jm().format(provider!.date!.add(const Duration(hours: 2)))}"}',
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          // color: Colors.grey,
                          elevation: 5,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    width: double.infinity,
                                    child: const Text('Estimated Weight',
                                        textAlign: TextAlign.left),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: const Icon(Icons.line_weight),
                                    title: Text(provider!.weight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          // color: Colors.grey,
                          elevation: 5,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    width: double.infinity,
                                    child: const Text('Message (if any):',
                                        textAlign: TextAlign.left),
                                  ),
                                  const SizedBox(height: 5),
                                  ListTile(
                                    leading: const Icon(Icons.message),
                                    title: TextField(
                                      controller: msgController,
                                      decoration: InputDecoration(
                                        hintText: "I want to sell old items..",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ],
                          ),
                        ),
                        provider!.pickedImage != null
                            ? Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Selected Image'),
                                    Image.file(
                                      provider!.pickedImage!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        provider!.deleteImage();
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  )
                ],
                onStepTapped: (int index) {
                  // setState(() {
                  //   _index = index;
                  // });
                },
                currentStep: _index,
                onStepContinue: () {
                  if (_index == 0) {
                    if (basicDetailskey.currentState!.validate()) {
                      setState(() {
                        _index++;
                      });
                    }
                    provider!.setName(nameController.text);
                    provider!.setMobileNo(mobController.text);
                    provider!.setEmail(emailController.text);
                  } else if (_index == 1) {
                    if (addressKey.currentState!.validate()) {
                      setState(() {
                        _index++;
                      });
                    }
                    provider!.sethouseno(housenoController.text);
                    provider!.setlandmark(landmarkController.text);
                    provider!.setpincode(pincodeController.text);
                    provider!.setlocality(localityController.text);
                    provider!.setcity(cityController.text);
                    provider!.setstate(stateController.text);
                    // provider!.date
                    // provider!.setdate(dateCtl.text);
                    // provider!.settime(dateCt2.text);
                  } else if (_index == 2) {
                    if (slotKey.currentState!.validate()) {
                      setState(() {
                        _index++;
                      });
                    }
                    provider!.setweight(weightController.text);
                  } else if (_index == 3) {
                    setState(() {
                      _index++;
                    });
                  } else {
                    addWidzardForm();
                  }
                },
                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void imagePickerOption() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: openCamera,
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) return;
    final tempImage = File(photo.path);
    Navigator.of(context).pop();
    provider!.setImage(tempImage);
    // setState(() {
    //   provider!.pickedImage = tempImage;
    // });
  }

  openCamera() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo == null) return;
    final tempImage = File(photo.path);
    Navigator.of(context).pop();
    provider!.setImage(tempImage);
    // setState(() {
    //   provider!.pickedImage = tempImage;
    // });
  }

  Future<void> getFaqs() async {
    AppUtils().showProgressDialog(context);
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());

    Navigator.of(context).pop();
  }

  Future<void> _getlocalitycitystateapiCall() async {
    AppUtils().showProgressDialog(context);
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());
    var res = await ApiProvider.getlocalitycitystateapiCall(
        GetLocalityCityStateRequest(
          postPincode: pincodeController.text,
        ),
        token);
    localityController.text = res["apiResponseData"]["pin_locality"];
    cityController.text = res["apiResponseData"]["pin_city"];
    stateController.text = res["apiResponseData"]["pin_state"];
    Navigator.of(context).pop();
  }

  Future<void> addWidzardForm() async {
    AppUtils().showProgressDialog(context);
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());
    var res = await ApiProvider.requestPickUp(
        token,
        AddWizardFormRequest(
          post_user_name: provider!.name,
          post_user_mobile: provider!.mobileNo,
          post_user_house_street: provider!.houseno,
          post_user_landmark: provider!.landmark,
          post_user_locality: provider!.locality,
          post_user_city: provider!.city,
          post_user_state: provider!.state,
          post_kabad_weight: provider!.weight,
          post_user_email: provider!.email,
          post_user_message: msgController.text,
          post_user_pincode: provider!.pincode,
          post_kabad_expect_datetime: provider!.date!.toIso8601String(),
          post_image_file: provider!.pickedImage,
          post_return_type: Constants.postReturnType,
          post_return_language: Constants.postReturnLanguage,
        ));
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        content: Text(res),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(ctx).pop();
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
