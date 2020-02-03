import 'package:bahaa2/UI/bottomMenu.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomMenu(2),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Categories ",
          style: TextStyle(
              color: Color(0xff0dbea8),
              fontSize: 30,
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
          padding: EdgeInsets.only(left: 20, right: 20,top: 40),
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/subCats');
      },
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
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
          categoryItem("assets/images/Apparel.png", "Apparel"),
          categoryItem("assets/images/Beauty.png", "Beauty"),
          categoryItem("assets/images/Shoes.png", "Shoes"),
          categoryItem("assets/images/Furnitiure.png", "Furniture"),
          categoryItem("assets/images/Electronics.png", "Electronics"),
          //categoryItem("assets/images/seeAll.png", "Shoes"),
        ],
      ),
    );
  }
}
