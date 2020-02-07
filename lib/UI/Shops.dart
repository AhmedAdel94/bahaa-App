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
              children: <Widget>[shops()],
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

  Widget productItem(String logo, String name) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/subCats');
        },
        child: Container(
          width: 135,
          decoration: BoxDecoration(
            //color: Color(0xffe7e7e7),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(logo,width: 80,height: 80,),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    name,
                    style: TextStyle(color: Color(0XFF515C6F), fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shops() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            productItem(
                "assets/images/apple.png", "Apple"),
            productItem(
                "assets/images/gucci.png", "GUCCI"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            productItem(
                "assets/images/zara.jpg", "ZARA"),
            productItem(
                "assets/images/adidas.png", "Adidas"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
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
}
