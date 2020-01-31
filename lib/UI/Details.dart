import 'package:bahaa2/UI/bottomMenu.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(0),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Xiaomi Mi Game Notebook ",
          style: TextStyle(color: Color(0xff515C6F)),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff0dbea8),
        ),
        actions: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Color(0xff515C6F),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/laptop.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                choices(),
                SizedBox(
                  height: 10,
                ),
                data(),
                SizedBox(
                  height: 10,
                ),
                loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget choices() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Color(0xffE8E7E7),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Text(
            "Details",
            style: TextStyle(
              color: Color(0xff0dbea8),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          //color: Color(0xffE8E7E7),
          child: Text(
            "Reviewes",
            style: TextStyle(color: Color(0xff515C6F)),
          ),
        ),
      ],
    );
  }

  Widget data() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Price",
            style: TextStyle(fontSize: 20.0, color: Color(0xff515C6F)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "  \$900.0",
            style: TextStyle(fontSize: 15.0, color: Color(0xff515C6F)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Brand",
            style: TextStyle(fontSize: 20.0, color: Color(0xff515C6F)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "  Xiaomi",
            style: TextStyle(fontSize: 15.0, color: Color(0xff515C6F)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Description",
            style: TextStyle(fontSize: 20.0, color: Color(0xff515C6F)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "  15.6 I7 16G+256G Grey 1050Ti 4GB",
            style: TextStyle(fontSize: 15.0, color: Color(0xff515C6F)),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.only(left:20,right: 20,bottom: 20),
      child: InkWell(
        onTap: () {
          //Navigator.pushNamed(context, '/home');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff0dbea8),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          //width: double.infinity,
          //height: 40,
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "ADD TO CART",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ),
                Container(
                  //width: 25,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Color(0xff0dbea8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
