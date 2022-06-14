import 'package:flutter/material.dart';
import 'package:flutterweb_practice/routes/route.dart';
import 'package:flutterweb_practice/style/const_color.dart';

class MenuItemController extends ChangeNotifier {
  // MenuItemController._();
  // static final instance = MenuItemController._();

// default active page
  var activeItem = overViewPageRoute;
  var horverItem = '';

  void onChangeActiveItem(String name) {
    activeItem = name;
    notifyListeners();
  }

  void onHover(String name) {
    if (!isActive(name)) {
      horverItem = name;
      notifyListeners();
    }
  }

  isActive(name) {
    return activeItem == name;
  }

  isHovering(name) {
    return activeItem == name;
  }

  Widget returnIcon(String name) {
    switch (name) {
      case overViewPageRoute:
        return _customIcon(Icons.trending_up, name);
      case driversPageRoute:
        return _customIcon(Icons.drive_eta, name);
      case clientsPageRoute:
        return _customIcon(Icons.people_alt_rounded, name);
      case authenticationPageRoute:
        return _customIcon(Icons.exit_to_app, name);
      default:
        return _customIcon(Icons.exit_to_app, name);
    }
  }

  Widget _customIcon(IconData icon, String name) {
    if (isActive(name)) return Icon(icon, size: 22, color: activeColor);
    return Icon(icon, color: isHovering(name) ? darkColor : lightGreyColor);
  }
}
