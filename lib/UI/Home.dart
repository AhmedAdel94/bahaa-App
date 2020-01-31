import 'package:bahaa2/UI/bottomMenu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   height: 100,
                // ),
                title("Categories"),
                SizedBox(
                  height: 10,
                ),
                categories(),
                SizedBox(
                  height: 15,
                ),
                title("Latest"),
                latestItem(),
                // slider(),
                items(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Color(0xff0dbea8), fontSize: 30, fontWeight: FontWeight.w800),
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
          categoryItem("assets/images/Electronics.png", "Electronics"),
          categoryItem("assets/images/Beauty.png", "Beauty"),
          categoryItem("assets/images/Shoes.png", "Shoes"),
          //categoryItem("assets/images/seeAll.png", "Shoes"),
          seeAll()
        ],
      ),
    );
  }

  Widget seeAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE7EAF0),
                blurRadius: 2.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff0dbea8),
            ),
          ),
        ),
         SizedBox(height: 10,),
        Text("See All")
      ],
    );
  }

  Widget latestItem() {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/Base.png'),
        Padding(
          padding: EdgeInsets.only(left: 50, top: 50),
          child: Container(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "For all your winter clothing needs",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                loginButton(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          //Navigator.pushNamed(context, '/home');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          width: 100,
          height: 30,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "SEE MORE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 10),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff0dbea8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.white,
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

  Widget slider() {
    return CarouselSlider(
      viewportFraction: 0.8,
      initialPage: 0,
      height: 201.0,
      enableInfiniteScroll: false,
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: latestItem());
          },
        );
      }).toList(),
    );
  }

  Widget item({String img, String title, String price}) {
    return Column(
      children: <Widget>[
        new ClipRRect(
          borderRadius: new BorderRadius.circular(20.0),
          child: Image.asset(
            img,
            height: 100.0,
            width: 100.0,
          ),
        ),
        Text(title),
        Text(price)
      ],
    );
  }

  Widget items() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          item(
              img: 'assets/images/boots.jpg',
              title: "Ankle Boots",
              price: "\$39.99"),
          item(
              img: 'assets/images/boots.jpg',
              title: "Ankle Boots",
              price: "\$39.99"),
          item(
              img: 'assets/images/boots.jpg',
              title: "Ankle Boots",
              price: "\$39.99"),
        ],
      ),
    );
  }
}
