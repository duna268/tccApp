import 'package:flutter/material.dart';

import 'package:tccApp/ui/pages/login/login_page.dart';
import 'package:tccApp/ui/pages/principal/menu.dart';

import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
    return MaterialPageRoute(builder: (context) => LoginPage());
    case MenuViewRoute:
    return MaterialPageRoute(builder: (context) => MenuPage(username: 'daniel',items: [],));
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
