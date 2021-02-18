import 'package:click_to_eat/Helpers/Footer.dart';
import 'package:click_to_eat/Helpers/Headers.dart';
import 'package:click_to_eat/Helpers/MiddleBody.dart';
import 'package:click_to_eat/Services/Maps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<GenrateMaps>(context,listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(context),
              Divider(),
              MiddleHelpers().favText(),
              MiddleHelpers().favData(context, 'favourite'),
              MiddleHelpers().favTextExplore(),
              MiddleHelpers().dataBuisness(context, 'Buisness'),
            ],
          ),
        ),
      ),
    );
  }
}
