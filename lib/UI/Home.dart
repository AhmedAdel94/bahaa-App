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
      bottomNavigationBar: BottomMenu(),
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
    return Column(
      children: <Widget>[
        Container(
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
        ),
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
          item(img: 'assets/images/boots.jpg',title: "Ankle Boots",price: "\$39.99"),
          item(img: 'assets/images/boots.jpg',title: "Ankle Boots",price: "\$39.99"),
          item(img: 'assets/images/boots.jpg',title: "Ankle Boots",price: "\$39.99"),
        ],
      ),
    );
  }
}
