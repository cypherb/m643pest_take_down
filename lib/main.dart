import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(24.0),
      child: Text(
        '\nThe 643Pest mobile app is no longer supported.'
        'To submit new pest reports, please visit 643pest.org or call 643-PEST.\n\n'
        'Contact us at helpdesk@643pest.org\n with any questions.',
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );

    final Uri _url = Uri.parse('https://www.643pest.org');

    void _launch643() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    Widget textButton = ElevatedButton(
      child: Text('643pest.org'),
      onPressed: _launch643,
      style: ElevatedButton.styleFrom(primary: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold)),

    );

    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Container(
          decoration: BoxDecoration(
              // color: Colors.amber[600],
              image: DecorationImage(
                  image: AssetImage('images/greenleafbg.png'),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 25,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(children: [
              Image.asset(
                'images/643pestmobile_header2.jpg',
                height: 110,
                fit: BoxFit.cover,
              ),
              textSection,
              textButton,
              Image.asset(
                'images/miconia_snake_ant.png',
                fit: BoxFit.cover,
              ),
            ]),
          ),
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
