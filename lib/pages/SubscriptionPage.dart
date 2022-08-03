import 'package:app/pages/home.dart';
import 'package:app/widget/bottom_bar_widget.dart';
import 'package:app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
        child: Column(children: [
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI BUSSINESS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI DIAMOND',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI PLATINUM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI ELITE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI SIGNATURE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.grey,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: new AssetImage('assets/images/logo.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Text(
                  'MCI AMBASSADOR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(213, 116, 28, 28),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    ));
  }
}
