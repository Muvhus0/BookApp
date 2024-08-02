import 'package:flutter/material.dart';
import 'package:fundza/routes.dart';

class AppDrawer extends StatefulWidget {
  final String? myfooter;
  final int? online;

  const AppDrawer({
    Key? key,
    required this.myfooter,
    required this.online,
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void _logout() {
    setState(() {
      loggedIn = false;
    });
    Navigator.pop(context);
    Navigator.pushNamed(context, '/homescreen');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Stack(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 1),
                        Text(
                          '${widget.online}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (!loggedIn)
              ListTile(
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Marcellus',
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Text(' | '),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Marcellus',
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homescreen');
              },
            ),
            ListTile(
              title: Text(
                'Library',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/library');
              },
            ),
            ListTile(
              title: Text(
                'Blogs',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/blogs');
              },
            ),
            ListTile(
              title: Text(
                'Courses',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/courses');
              },
            ),
            ListTile(
              title: Text(
                'Search',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Marcellus',
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            if (loggedIn)
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Marcellus',
                    fontSize: 23,
                  ),
                ),
                onTap: _logout,
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    '${widget.myfooter}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Marcellus',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
