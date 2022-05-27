import 'package:flutter/material.dart';

import '../app_utils/app_utils.dart';
import '../models/generate_token.dart';
import '../models/get_faqs_response.dart';
import '../provider/api_provider.dart';

class MyFaqs extends StatefulWidget {
  const MyFaqs({Key? key}) : super(key: key);

  @override
  State<MyFaqs> createState() => _MyFaqsState();
}

class _MyFaqsState extends State<MyFaqs> {
  List<Faq> faqsList = [];

  Future<void> getFaqs() async {
    AppUtils().showProgressDialog(context);
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());
    var faqRes = await ApiProvider.getFaqsApiCall(token);
    print(faqRes.code);
    setState(() {
      faqsList = faqRes.faqsData;
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) => getFaqs());
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'FAQs',
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      faqsList[i].isItemSelected = !faqsList[i].isItemSelected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${i + 1}) ${faqsList[i].faqQuestion}",
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        if (faqsList[i].isItemSelected)
                          Text(
                            faqsList[i].faqAnswer,
                          ),
                      ],
                    ),
                  ),
                ),
                itemCount: faqsList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
