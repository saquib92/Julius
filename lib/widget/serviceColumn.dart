import 'package:flutter/material.dart';

class ServiceColumn extends StatelessWidget {
  const ServiceColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            // height: 110,
            child: Card(
              // color: Colors.grey,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img3.png'),
                  ),
                  title: const Text(
                    'Scrap Pickup',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: const Text(
                      'Request a pick up now! Our vendor will come to you on the sceduled time to pick up your scrap in exchange for money',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            // height: 110,
            child: Card(
              // color: Colors.grey,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img4.png'),
                  ),
                  title: const Text(
                    'Scrap Rate Card',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      'Want to know how much your waste is worthy.Use our rate card to find it now.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 110,
            child: Card(
              // color: Colors.grey,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img2.png'),
                  ),
                  title: const Text(
                    'Corporate Tie-up',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: const Text(
                      'We have arranged customized panel for corporates to systematically get rid of the scrap get certificates of recycling (If Required)',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
