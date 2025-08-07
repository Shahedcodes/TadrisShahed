import 'package:flutter/material.dart';
import 'package:tadris/pages/Teachers/firstgrades.dart';
import 'package:tadris/widget/customAppbar.dart';
import 'package:tadris/widget/search_bar.dart';
import 'package:tadris/widget/cards.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  late List<Widget> _pages; // Declare _pages as late

  @override
  void initState() {
    super.initState();
    _pages = [
      // Initialize _pages in initState
      Column(
        children: [
          const SearchyCard(),
          const Searchy(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Two cards per row
              padding: const EdgeInsets.all(26.0),
              children: [
                buildCard(
                  context,
                  title: 'المرحلة الإعدادية',
                  imageUrl:
                      'assets/rb_60938.png', // Replace with your image URL
                  color: const Color.fromARGB(255, 233, 230, 230),
                  onTap: () {},
                ),
                buildCard(
                  context,
                  title: 'المرحلة الإبتدائية',
                  imageUrl:
                      'assets/rb_61140.png', // Replace with your image URL
                  color: const Color.fromARGB(255, 217, 229, 237),
                  onTap: () {},
                ),
                buildCard(
                  context,
                  title: 'ثانوية عامة علمي',
                  imageUrl:
                      'assets/tired-overworked-secretary-accountant-working-laptop-near-pile-folders-throwing-papers-vector-illustration-stress-work-workaholic-busy-office-employee-concept.png', // Replace with your image URL
                  color: const Color.fromARGB(255, 217, 229, 237),
                  onTap: () {},
                ),
                buildCard(
                  context,
                  title: 'ثانوية عامة أدبي',
                  imageUrl:
                      'assets/rb_10088.png', // Replace with your image URL
                  color: const Color.fromARGB(255, 244, 247, 242),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherListScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      const Center(child: Text('data')),
      const Center(child: Text('Profile Page')),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تدريسي',
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: _pages[_selectedIndex], // Display the selected page
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.favorite, 1),
          // Space for the floating action button
          _buildNavItem(Icons.person, 2), // Updated index to 2 for Profile
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color:
            isSelected ? const Color.fromARGB(255, 243, 135, 33) : Colors.grey,
      ),
      onPressed: () => onItemTapped(index),
    );
  }
}
