import 'package:bahaa2/UI/Filters.dart';
import 'package:flutter/material.dart';

class Laptops extends StatefulWidget {
  @override
  _LaptopsState createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops> {
  TextEditingController searchController = TextEditingController();
  var searchItem;
  List filters = [
    "BEST MATCH",
    "TOP RATED",
    "PRICE LOW-HIGH",
    "PRICE HIGH-LOW"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                searchBar(),
                filtersList(),
                items(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0dbea8),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFE8E7E7),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.all(12.0),
                  border: InputBorder.none,
                  hintText: "Category",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          drawFilterButton()
        ],
      ),
    );
  }

  Widget drawFilterButton() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            child: new AlertDialog(
              //title: new Text("My Super title"),
              content: Filters(),
            ));
      },
      child: Container(
        // width: 50,
        // height: 50,
        child: Image.asset(
          "assets/images/filters.png",
        ),
      ),
    );
  }

  Widget filtersList() {
    return Container(
      width: double.infinity,
      height: 40.0,
      margin: EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (BuildContext context, int position) =>
            filtersListItem(position),
      ),
    );
  }

  Widget filtersListItem(int position) {
    return InkWell(
      onTap: () {
        setState(() {
          if (searchItem == filters[position]) {
            searchItem = null;
          } else {
            searchItem = filters[position];
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Text(
                filters[position],
                style: TextStyle(
                    color: searchItem == filters[position]
                        ? Color(0xff0dbea8)
                        : Color(0XFF515C6F),
                    fontSize: 13.0),
              ),
              SizedBox(
                width: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productItem(String image, String title, String price, String rate) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/details');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffe7e7e7),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(image),
                SizedBox(
                  height: 30,
                ),
                Text(
                  title,
                  style: TextStyle(color: Color(0XFF515C6F), fontSize: 15),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      price,
                      style: TextStyle(
                          color: Color(0XFF515C6F),
                          fontWeight: FontWeight.w800,
                          fontSize: 12),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    rating(rate),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rating(String rate) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0dbea8),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Icon(Icons.star, size: 12, color: Colors.white),
            Text(
              rate,
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget items() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            productItem(
                "assets/images/lap1.png", "Xiaomi Laptop", "\$900.00", "4.9"),
            productItem(
                "assets/images/lap2.png", "Lenovo Laptop", "\$269.99", "4.8"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            productItem(
                "assets/images/lap3.png", "MacBook air", "\$400.00", "4.5"),
            productItem(
                "assets/images/lap4.png", "Dell Laptop", "\$249.99", "4.1"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            productItem(
                "assets/images/lap5.png", "Xiaomi Laptop", "\$900.00", "4.9"),
            productItem(
                "assets/images/lap6.png", "Lenovo Laptop", "\$269.99", "4.8"),
          ],
        ),
      ],
    );
  }
}
