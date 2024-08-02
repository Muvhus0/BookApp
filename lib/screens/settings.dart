import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final String? myfooter;
  final int? online;
  final String? copyright;

  const SettingsScreen(
      {super.key,
      required this.myfooter,
      required this.online,
      required this.copyright});
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      drawer: AppDrawer(
        myfooter: widget.myfooter,
        online: widget.online,
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('${widget.copyright}'),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
