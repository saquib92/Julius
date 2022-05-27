import 'package:flutter/material.dart';

class MyTestimonial extends StatelessWidget {
  const MyTestimonial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          // color: Colors.green[100],
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black12,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          child: const Text('Testimonials',
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            print("Saquib");
          },
          child: Card(
            // color: Colors.grey,
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/man.jpg'),
                ),
                title: const Text(
                  'Bill Gates',
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
                    'Amazing Service with ease of use and good people to deal with!',
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
        Card(
          // color: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/women.jpg'),
              ),
              title: const Text(
                'Françoise Bettencourt Meyers',
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
                  'I Appreciate the good job this guys are doing.Good job team kabadOnline!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
        Card(
          // color: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/women.jpg'),
              ),
              title: const Text(
                'Françoise Bettencourt Meyers',
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
                  'I Appreciate the good job this guys are doing.Good job team kabadOnline!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
