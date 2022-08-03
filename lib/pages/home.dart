import 'package:app/pages/OurClubsandAssociation.dart';
import 'package:app/pages/SubscriptionPage.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer_widget.dart';
import 'package:app/widget/bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        ),
        drawer: const DrawerWidget(),
        bottomNavigationBar: const BottomBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  labelText: 'Search',
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 20),
                            height: categoryHeight,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Coupon",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 20),
                            height: categoryHeight,
                            decoration: BoxDecoration(
                              color: Colors.redAccent.shade400,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Coupon",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 20),
                            height: categoryHeight,
                            decoration: BoxDecoration(
                              color: Colors.red.shade800,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Coupon",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Club(),
                            ),
                          );
                        },
                      ),
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      'Our CLub and Association',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(213, 116, 28, 28),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SubscriptionPage()));
                        },
                      ),
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      'Membership packages',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(213, 116, 28, 28),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
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
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Color.fromARGB(255, 230, 229, 227),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('Buy a plan'),
                                      ElevatedButton(
                                        child: const Text('Subscribe'),
                                        onPressed: () => Navigator.of(context)
                                            .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SubscriptionPage(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      'Lucky Spin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(213, 116, 28, 28),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
