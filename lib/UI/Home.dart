import 'dart:async';

import 'package:bahaa2/UI/Drawer.dart';
import 'package:bahaa2/UI/bottomMenu.dart';
import 'package:bahaa2/bloc/auth/auth_bloc.dart';
import 'package:bahaa2/bloc/auth/auth_event.dart';
import 'package:bahaa2/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bloc = AuthBloc.instance();
  List<StreamSubscription> subs = List();
  TextEditingController searchController = TextEditingController();

  void initState() {
    super.initState();
    subs.add(
      bloc.authStateSubject.listen(
        (AuthState state) {
          if (state is UserIsLoggedOut) {
            //print(state.user.email);
            Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      bottomNavigationBar: BottomMenu(0),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                //searchBar(),
                SizedBox(
                  height: 15,
                ),
                title("Latest"),
                //latestItem(),
                slider(),
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

  Widget latestItem() {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/Base.png'),
        Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
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
      viewportFraction: 1.0,
      initialPage: 0,
      height: 201.0,
      enableInfiniteScroll: false,
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                // width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 0),
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
            height: 90.0,
            width: 90.0,
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
      child: Column(
        children: <Widget>[
          Row(
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
          SizedBox(
            height: 10,
          ),
          Row(
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
}
