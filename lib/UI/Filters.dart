import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var range = RangeValues(100, 1000);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          clear(),
          SizedBox(
            height: 40,
          ),
          brandFilter(),
          SizedBox(
            height: 40,
          ),
          priceRange(),
          SizedBox(
            height: 30,
          ),
          applyFilters()
        ],
      ),
    );
  }

  Widget clear() {
    return Text(
      "CLEAR",
      style: TextStyle(
        fontSize: 12.0,
        color: Color(0xff0dbea8),
      ),
    );
  }

  Widget brandFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Brand",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff515C6F),
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              "DELL",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff515C6F),
              ),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFE8E7E7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFF515C6F),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget priceRange() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Price Range",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 15,
              color: Color(0xff515C6F),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),

        Container(
          width: 250,
          child: FittedBox(
            child: Row(
              children: <Widget>[
                Text("100", style: TextStyle(fontSize: 12)),
                RangeSlider(
                  activeColor: Color(0xff0dbea8),
                  values: range,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      range = newRange;
                    });
                  },
                  divisions: 100,
                  min: 0,
                  max: 1000,
                  labels: RangeLabels('${range.start}', '${range.end}'),
                ),
                Text("1000", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
        // RangeSliderSample(),
        // CustomSlider(),
      ],
    );
  }
}

Widget applyFilters() {
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
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
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  "APPLY FILTERS",
                  textAlign: TextAlign.center,
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
