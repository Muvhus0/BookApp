import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../routes.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final String? myfooter;
  final int? online;

  const HomeScreen({
    super.key,
    required this.online,
    required this.myfooter,
  });

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search action
            },
          ),
          if (loggedIn)
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {
                // Profile action
              },
            ),
        ],
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(
        myfooter: widget.myfooter,
        online: widget.online,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Stories',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 16),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildStoryCard(
                        'assets/images/blog/blog1.jfif',
                        'The Adventure Begins',
                        'Follow the journey of a young explorer in an unknown land.'),
                    _buildStoryCard(
                        'assets/images/blog/blog2.jfif',
                        'Mystery of the Lost City',
                        'Unravel the secrets of an ancient, hidden city.'),
                    _buildStoryCard(
                        'assets/images/blog/blog3.jfif',
                        'Whispers in the Dark',
                        'A thrilling tale of courage and survival in the wilderness.'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Latest Stories',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 16),
              _buildLatestStoriesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoryCard(String imagePath, String title, String preview) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(imagePath,
                height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    preview,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestStoriesList() {
    final stories = [
      {
        'title': 'Echoes of the Past',
        'preview': 'A gripping saga of a family\'s struggle through time.',
        'image': 'assets/images/blog/blog4.jfif'
      },
      {
        'title': 'Journey to the Unknown',
        'preview': 'An exciting adventure beyond the known world.',
        'image': 'assets/images/blog/blog5.jfif'
      },
      {
        'title': 'The Hidden Treasure',
        'preview': 'A race against time to find a legendary treasure.',
        'image': 'assets/images/blog/blog6.jfif'
      },
    ];

    return Column(
      children: stories.map((story) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: Image.asset(story['image']!,
                fit: BoxFit.cover, width: 50, height: 50),
            title: Text(story['title']!),
            subtitle: Text(story['preview']!),
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }
}
