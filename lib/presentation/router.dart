import 'package:flutter/material.dart';
import 'package:malika_bozor/main.dart';
import 'package:malika_bozor/presentation/admin/admin_page.dart';
import 'package:malika_bozor/presentation/hame_page.dart';
import 'package:malika_bozor/presentation/profile/profile_page.dart';
import 'package:malika_bozor/utils/constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(builder: (_) => MainPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case adminPage:
        return MaterialPageRoute(builder: (_) => AdminPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
