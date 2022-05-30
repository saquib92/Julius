import 'package:flutter/material.dart';
import 'package:kabadonline/models/generate_token.dart';
import 'package:kabadonline/provider/api_provider.dart';
import 'package:kabadonline/view/filter.dart';

import '../app_utils/app_utils.dart';
import '../models/get_scrap_price_list.dart';

class RateCard extends StatefulWidget {
  const RateCard({Key? key}) : super(key: key);

  @override
  State<RateCard> createState() => _RateCardState();
}

//*Api
class _RateCardState extends State<RateCard> {
  List<Rate> ratecardList = [];
  List<Rate> fullRatecardList = [];

  void scrapPriceList() async {
    var token = await ApiProvider.getTokenapiCall(GenerateTokenRequest());
    var response = await ApiProvider.getRateCard(token);
    setState(() {
      fullRatecardList = response.rateData;
      ratecardList = response.rateData;
    });
  }

  void applyFilter({
    required String itemId,
    bool resetFilters = false,
  }) {
    ratecardList = fullRatecardList;
    if (resetFilters) {
      setState(() {
        ratecardList = fullRatecardList;
      });
    } else {
      setState(() {
        ratecardList =
            ratecardList.where((element) => element.catid == itemId).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      scrapPriceList();
    });
  }

//Api*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => FilterItem(
                applyFilter: applyFilter,
              ),
            );
            // AppUtils().urlLaunch(
            //     "https://wa.me/+919028374731?text=Hello%20Javed%20Sir");
          },
          child: Icon(Icons.filter_alt),
        ),
        // child: FloatingActionButton(
        //   backgroundColor: Colors.green,
        //   // onPressed:  ,
        //   onPressed: () {
        //     AppUtils().urlLaunch(
        //         "https://wa.me/+919028374731?text=Hello%20Javed%20Sir");
        //   },
        //   child: const CircleAvatar(
        //     backgroundImage: AssetImage('assets/images/img6.jpg'),
        //   ),
        // ),
      ),
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              AppUtils().urlLaunch("tel:+91 9545505148");
            },
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            label: const Text(
              '+91-9545505148',
              style: TextStyle(color: Colors.white),
            ),
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
      // body: ListView.builder(
      //   itemBuilder: (ctx, i) => Text(ratecardList[i].catname),
      //   itemCount: ratecardList.length,
      // )
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: ratecardList.length,
          itemBuilder: (BuildContext ctx, i) {
            return Container(
              alignment: Alignment.center,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://www.kabadonline.com/uploads/${ratecardList[i].itemimagefile}",
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(ratecardList[i].catname),
                      Text(ratecardList[i].itemprice),
                      Text(
                        ratecardList[i].itemdescription,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              // decoration: BoxDecoration(
              //   color: Colors.amber,
              //   borderRadius: BorderRadius.circular(15),
              // ),
            );
          }),
    );
  }
}
