import 'package:flutter/material.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/register_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/settings_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/paket_screen.dart';

// import screen lainnya

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String settingsRoute = '/settings';
  static const String main = '/main';
  static const String paket = '/paket';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case paket:
        return MaterialPageRoute(builder: (_) => PaketScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Route not found: ${settings.name}')),
          ),
        );
    }
  }
}
