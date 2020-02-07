import 'package:flutter/material.dart';

import 'bottomMenu.dart';

class Shops extends StatefulWidget {
  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomMenu(2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0dbea8),
          ),
        ),
        title: searchBar(),
        elevation: 0.0,
        iconTheme: new IconThemeData(
          color: Color(0xff0dbea8),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Color(0xff515C6F),
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.notifications,
            color: Color(0xff515C6F),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[categories()],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(String img, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/subCats');
        },
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  img,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          categoryItem("assets/images/zara.jpg", "Zara"),
          categoryItem("assets/images/apple.png", "Apple"),
          categoryItem("assets/images/gucci.png", "GUCCI"),
          // categoryItem("assets/images/Furnitiure.png", "Furniture"),
          // categoryItem("assets/images/Electronics.png", "Electronics"),
          //categoryItem("assets/images/seeAll.png", "Shoes"),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
        ],
      ),
    );
  }

  Widget rowItem(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/lapTops');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 15, color: Color(0xff515C6F)),
            ),
            Container(
              //width: 25,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Color(0xff0dbea8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget items() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe7e7e7),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          rowItem("Laptops"),
          rowItem("Screens"),
          rowItem("Mobiles"),
          rowItem("Camera"),
          rowItem("Printers"),
          rowItem("Desktop Computers"),
          rowItem("Game Consoles"),
          rowItem("iPads"),
        ],
      ),
    );
  }
}
