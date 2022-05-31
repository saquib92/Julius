import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HowItWorks extends StatefulWidget {
  const HowItWorks({Key? key}) : super(key: key);

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  late YoutubePlayerController ytController;

  @override
  void initState() {
    ytController = YoutubePlayerController(
      initialVideoId: "u6O2XHgxWOA",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        startAt: 20,
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView (
          child: Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: double.infinity,
                    child: const Text(
                      "How does it work?",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const Text(
                    "KabadOnline provides the service which collect and provide good return from your old scrap.You only need to raise one pickup request and pickup vehicle will come at your doorstep at your own comfortable time slot! ",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  YoutubePlayer(
                    controller: ytController,
                    showVideoProgressIndicator: true,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Card(
                    // color: Colors.grey,
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                          margin: const EdgeInsets.only(top: 5),
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
                  Card(
                    // color: Colors.grey,
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  Card(
                    // color: Colors.grey,
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
