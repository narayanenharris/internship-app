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
          child: Column(
            children: [
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
                        Container(
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
                        Container(
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
                        Container(
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
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
