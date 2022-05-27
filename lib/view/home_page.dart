import 'package:kabadonline/app_utils/app_utils.dart';
import 'package:kabadonline/view/faqs.dart';
import 'package:kabadonline/view/request_pickup_now.dart';
import 'package:kabadonline/widget/carousel.dart';
import 'package:kabadonline/widget/serviceColumn.dart';
import 'package:kabadonline/widget/testimonialColumn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
            backgroundColor: Colors.green,
            // onPressed:  ,
            onPressed: () {
              AppUtils().urlLaunch(
                  "https://wa.me/+919028374731?text=Hello%20Javed%20Sir");
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/img6.jpg'),
            )),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CaroselView(),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  // color: Colors.green[100],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.green[50],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  child: const Text('Service',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                const ServiceColumn(),
                const SizedBox(height: 10),
                const MyTestimonial()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondRoute(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              color: Colors.green[700],
              alignment: Alignment.center,
              height: 40,
              child: const Text(
                'Request Pick up now',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/logo/brandLogo.png',
                  fit: BoxFit.contain,
                  height: 120,
                ),
              ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).pop();
                AppUtils().urlLaunch("https://www.kabadonline.com/about-us");
              },
            ),
            const Divider(),
            const ListTile(
              title: Text('How It Works?'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Rate Card'),
            ),
            const Divider(),
            ListTile(
              title: const Text('FAQ\'s'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyFaqs(),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text('Contact Us'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Join As Vendor'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Corporate Tie Up'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Terms And Conditions'),
              onTap: () {
                Navigator.of(context).pop();
                AppUtils()
                    .urlLaunch("https://www.kabadonline.com/terms-conditions");
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.of(context).pop();
                AppUtils()
                    .urlLaunch("https://www.kabadonline.com/privacy-policy");
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
