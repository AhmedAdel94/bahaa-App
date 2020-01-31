import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              "CLEAR",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff0dbea8),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "Brand",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff515C6F),
                  ),
                ),
                Row(
                  children: <Widget>[],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
