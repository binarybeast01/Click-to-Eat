import 'package:click_to_eat/Views/HomePage.dart';
import 'package:click_to_eat/Views/MyCart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class DetailsScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  DetailsScreen({this.queryDocumentSnapshot});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int cheeseValue = 0;
  int onionValue = 0;
  int sauceValue = 0;
  int totalItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(context),
          foodImage(),
          middleData(),
          footerDetails(),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100,
        ),
        IconButton(
            icon: Icon(FontAwesomeIcons.times),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: HomePage(),
                      type: PageTransitionType.rightToLeftWithFade));
            }),
        Padding(
          padding: const EdgeInsets.only(left: 310),
          child:
              IconButton(icon: Icon(FontAwesomeIcons.trash), onPressed: () {}),
        ),
      ],
    );
  }

  Widget foodImage() {
    return Center(
      child: SizedBox(
        height: 280.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.queryDocumentSnapshot['image'],
            fit: BoxFit.cover,
            height: 90.0,
            width: 380,
          ),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15.0),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30.0,
              ),
              Text(
                widget.queryDocumentSnapshot['ratings'],
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: Text(
                  widget.queryDocumentSnapshot['name'] + "  ",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.rupeeSign,
                  size: 20.0,
                  color: Colors.cyan,
                ),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.cyan,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 300.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              width: 400.0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customize your food",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Cheese 🧀",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 25.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {}),
                            Text(
                              '$cheeseValue',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Onion 🧅  ",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 25.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {}),
                            Text(
                              '$onionValue',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sauce 🌶️ ",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 25.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {}),
                            Text(
                              '$sauceValue',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.red.shade500,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Center(
              child: Text(
                "Add to cart",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(context, PageTransition(child: MyCart(), type: PageTransitionType.bottomToTop),);
              },
              child: Icon(EvaIcons.shoppingCart),
            ),
            Positioned(
                left: 35.0,
                child: CircleAvatar(
                  radius: 10.0,
                  child: Text('$totalItems'),
                )),
          ],
        ),
      ],
    );
  }
}
