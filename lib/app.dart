import 'package:flutter/material.dart';
import 'routes.dart';

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookApp',
      //theme: Provider.of<ThemeProvider>(context).themeDataStyle,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
