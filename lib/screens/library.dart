import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class LibraryScreen extends StatefulWidget {
  final String? myfooter;
  final int? online;

  const LibraryScreen({
    super.key,
    required this.online,
    required this.myfooter,
  });

  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';

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
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(myfooter: widget.myfooter, online: widget.online),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Library',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 16),
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildFilterDropdown(),
              SizedBox(height: 16),
              _buildBookCategory('Recent Reads', [
                _buildBookItem('assets/images/blog/blog6.jfif', 'Book Title 1',
                    'Author 1'),
                _buildBookItem('assets/images/blog/blog5.jfif', 'Book Title 2',
                    'Author 2'),
                _buildBookItem('assets/images/blog/blog4.jfif', 'Book Title 3',
                    'Author 3'),
              ]),
              SizedBox(height: 24),
              _buildBookCategory('Popular Books', [
                _buildBookItem('assets/images/blog/blog3.jfif', 'Book Title 4',
                    'Author 4'),
                _buildBookItem('assets/images/blog/blog1.jfif', 'Book Title 5',
                    'Author 5'),
                _buildBookItem('assets/images/blog/blog2.jfif', 'Book Title 6',
                    'Author 6'),
              ]),
              SizedBox(height: 24),
              _buildBookCategory('New Releases', [
                _buildBookItem('assets/images/blog/blog6.jfif', 'Book Title 7',
                    'Author 7'),
                _buildBookItem('assets/images/blog/blog4.jfif', 'Book Title 8',
                    'Author 8'),
                _buildBookItem('assets/images/blog/blog5.jfif', 'Book Title 9',
                    'Author 9'),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
      decoration: InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      value: _selectedCategory,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCategory = newValue!;
        });
      },
      items: <String>['All', 'Recent Reads', 'Popular Books', 'New Releases']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildBookCategory(String title, List<Widget> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: books,
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem(String imagePath, String title, String author) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath,
                height: 150, width: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            author,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
