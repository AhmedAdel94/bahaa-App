import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff0dbea8),
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(Color color, String title) {
    return Column(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/shoe.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
        Text(title)
      ],
    );
  }

  Widget categories() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          categoryItem(Color(0xff0dbea8), "Shoes"),
          categoryItem(Color(0xff0dbea8), "Shoes"),
          categoryItem(Color(0xff0dbea8), "Shoes"),
          seeAll()
        ],
      ),
    );
  }

  Widget seeAll() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff0dbea8),
        ),
      ),
    );
  }
}
