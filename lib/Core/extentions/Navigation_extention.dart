import 'package:flutter/material.dart';
extension NavigationExtention on BuildContext {
  void push(Widget routeName) {
    Navigator.of(this).push( MaterialPageRoute(builder: (context) => routeName));
  }
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  void pop() {
    Navigator.of(this).pop();
  }
}