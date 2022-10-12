import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import '../../presentation/views/home_view.dart';
import '../../presentation/views/login_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kRouteLogin:
        return _materialRoute(const LoginView());
      case kRouteHome:
        return _materialRoute(const HomeView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/background.jpg'),
                alignment: FractionalOffset.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: view,
          ),
        ],
      ),
    );
  }
}
