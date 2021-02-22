import 'package:click_to_eat/Services/ManageData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheeseVal = 0, onionVal = 0, sauceVal = 0, cartData = 0;
  String size;
  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      largeTapped = false,
      selected = false;
  int get getCheeseValue => cheeseVal;
  int get getOnionValue => onionVal;
  int get getSauceValue => sauceVal;
  int get getCartData => cartData;
  bool get getSelected => selected;
  String get getSize => size;

  addCheese() {
    cheeseVal++;
    notifyListeners();
  }

  addOnion() {
    onionVal++;
    notifyListeners();
  }

  addSauce() {
    sauceVal++;
    notifyListeners();
  }

  removeCheese() {
    cheeseVal--;
    notifyListeners();
  }

  removeOnions() {
    onionVal--;
    notifyListeners();
  }

  removeSauce() {
    sauceVal--;
    notifyListeners();
  }

  selectedSmallSize() {
    smallTapped = true;
    size = "S";
    notifyListeners();
  }

  selectedMediumSize() {
    mediumTapped = true;
    size = "S";
    notifyListeners();
  }

  selectedLageSize() {
    largeTapped = true;
    size = "S";
    notifyListeners();
  }

  clearAllData() {
    cheeseVal = 0;
    onionVal = 0;
    sauceVal = 0;
    mediumTapped = false;
    smallTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black45,
              height: 50.0,
              child: Center(
                child: Text(
                  "Select size!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    }
  }
}
