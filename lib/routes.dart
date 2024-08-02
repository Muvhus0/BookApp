import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/library.dart';
import 'screens/blogs.dart';
import 'screens/courses.dart';
import 'screens/search.dart';
import 'screens/settings.dart';
import 'screens/authentication/login.dart';
import 'screens/authentication/signup.dart';
import 'screens/authentication/forgot_password.dart';

String myfooter = 'Demo by : Muvhuso';
int online = 658;
bool loggedIn = false;
String copyright = '© 2024 Copyright';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/homescreen':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            myfooter: myfooter,
            online: online,
          ),
        );
      case '/library':
        return MaterialPageRoute(
          builder: (_) => LibraryScreen(
            myfooter: myfooter,
            online: online,
          ),
        );
      case '/blogs':
        return MaterialPageRoute(
          builder: (_) => BlogsScreen(
            myfooter: myfooter,
            online: online,
          ),
        );
      case '/courses':
        return MaterialPageRoute(
          builder: (_) => CoursesScreen(
            myfooter: myfooter,
            online: online,
          ),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (_) => SearchScreen(
            online: online,
            myfooter: myfooter,
          ),
        );
      case '/login':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/resetpassword':
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(
            online: online,
            myfooter: myfooter,
            copyright: copyright,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
