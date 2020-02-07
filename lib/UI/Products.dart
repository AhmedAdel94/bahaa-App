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
              rowItem("assets/images/shop.png","Shops(Wholesale/Retail)"),
              rowItem("assets/images/supermarket.png","Supermarkets"),
              rowItem("assets/images/malls.png","Malls"),
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
              rowItem("assets/images/healthcare.png","Health care and centers"),
              rowItem("assets/images/ApparelIcon.png","Apparel designers"),
              rowItem("assets/images/craftsmen.png","Craftsmen"),
              rowItem("assets/images/repairers.png","Repairers"),
              rowItem("assets/images/BeautyIcon.png","Beauty Clinics"),
              rowItem("assets/images/haircut.png","Haircut Saloons"),
              rowItem("assets/images/bakers.png","Bakers"),
            ],
          ),
        ),
      ],
    );
  }

  Widget rowItem(String img,String text) {
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
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset(
                      img,
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
