import 'package:bahaa2/UI/bottomMenu.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatefulWidget {
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Electronics",
          style: TextStyle(
              color: Color(0xff0dbea8),
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff0dbea8),
        ),
        actions: <Widget>[
          Icon(
            Icons.chat_bubble,
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
      bottomNavigationBar: BottomMenu(0),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                items(),
                SizedBox(height: 10,),
                categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowItem(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
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
        ));
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

  Widget categoryItem(String img, String title) {
    return Column(
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              width: 40,
              height: 40,
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
          categoryItem("assets/images/Apparel.png", "Apparel"),
          categoryItem("assets/images/Beauty.png", "Beauty"),
          categoryItem("assets/images/Shoes.png", "Shoes"),
          categoryItem("assets/images/Furnitiure.png", "Furniture"),
        ],
      ),
    );
  }
}
