import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SearchScreen extends StatefulWidget {
  final String? myfooter;
  final int? online;

  const SearchScreen({
    super.key,
    required this.online,
    required this.myfooter,
  });
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Container(
          child: Image.asset(
            'assets/images/logo_small.png',
            height: 30,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(myfooter: widget.myfooter, online: widget.online),
      body: Center(
        child: Text('heelllo'),
      ),
    );
  }
}
