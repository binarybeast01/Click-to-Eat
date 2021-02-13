import 'package:click_to_eat/Services/ManageData.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MiddleHelpers extends ChangeNotifier {
  Widget favText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
          text: TextSpan(
        text: "Favourite",
        style: TextStyle(shadows: [
          BoxShadow(color: Colors.black, blurRadius: 1.0),
        ], fontWeight: FontWeight.w600, color: Colors.black, fontSize: 29.0),
        children: <TextSpan>[
          TextSpan(
            text: " dishes",
            style: TextStyle(shadows: [
              BoxShadow(color: Colors.grey, blurRadius: 0),
            ], fontSize: 22.0, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ],
      )),
    );
  }

  Widget favData(BuildContext context, String collection) {
    return Container(
      height: 300,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network(
                  "https://assets3.lottiefiles.com/packages/lf20_vf2Men.json"),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 180.0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    snapshot.data[index].data()['image'],
                                    fit: BoxFit.cover,
                                    height: 90.0,
                                    width: 280.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 240,
                                child: IconButton(
                                    icon: Icon(
                                      EvaIcons.heart,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {})),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                          child: Text(
                            snapshot.data[index].data()['name'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 15.0),
                          child: Text(
                            snapshot.data[index].data()['category'],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                              ),
                              Text(
                                snapshot.data[index].data()['ratings'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 170),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.rupeeSign,
                                      size: 16.0,
                                    ),
                                    Text(
                                      snapshot.data[index]
                                          .data()['price']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget dataBuisness(BuildContext context) {
    return Container(
      height: 400.0,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_vf2Men.json"),
          );
        }
      ),
    );
  }
}
