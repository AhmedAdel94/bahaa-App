import 'package:flutter/material.dart';

import 'bottomMenu.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomMenu(2),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Products & Services",
          style: TextStyle(
              color: Color(0xff0dbea8),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0dbea8),
          ),
        ),
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
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                productsList(),
                SizedBox(
                  height: 20,
                ),
                services(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Purchase Products from:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              rowItem("Shops(Wholesale/Retail)"),
              rowItem("Supermarkets"),
              rowItem("Malls"),
            ],
          ),
        ),
      ],
    );
  }

  Widget services() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Purchase Services from:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0, top: 5),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              rowItem("Health care and centers"),
              rowItem("Apparel designers"),
              rowItem("Craftsmen"),
              rowItem("Repairers"),
              rowItem("Beauty Clinics"),
              rowItem("Haircut Saloons"),
              rowItem("Bakers"),
            ],
          ),
        ),
      ],
    );
  }

  Widget rowItem(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/categories');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image.asset(
                      "assets/images/shop.png",
                      // width: 40,
                      // height: 40,
                    ),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: Color(0xff515C6F)),
                ),
              ],
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
}
