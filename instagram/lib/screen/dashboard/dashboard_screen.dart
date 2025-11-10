import 'package:flutter/material.dart';
import 'package:instagram/screen/bottom_navigation_screen/home_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/post_add_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/profile_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/reels_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/search_screen.dart';
import 'package:instagram/screen/tabs/post_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List screen = [HomeScreen(), SearchScreen(), PostAddScreen(), ReelsScreen(), ProfileScreen()];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.transparent,
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) async {
          if (value == 2) {
            final result = await Navigator.push(
              // Sử dụng await và nhận result
              context,
              MaterialPageRoute(builder: (context) => const PostAddScreen()),
            );
            // Nếu PostAddScreen trả về một giá trị, có thể sử dụng để cập nhật state
            if (result == true) {
              // Giả sử PostAddScreen trả về true khi muốn về Home
              setState(() {
                currentScreen = 0; 
              });
            }
          } else {
            setState(() {
              currentScreen = value;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              height: 20,
              width: 20,
              color: currentScreen == 0 ? Colors.black : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/basic-ui.png',
              height: 20,
              width: 20,
              color: currentScreen == 1 ? Colors.black : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/more.png',
              height: 20,
              width: 20,
              color: currentScreen == 2 ? Colors.black : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/video.png',
              height: 20,
              width: 20,
              color: currentScreen == 3 ? Colors.black : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/person.png',
              height: 20,
              width: 20,
              color: currentScreen == 4 ? Colors.black : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            label: "",
          ),
        ],
      ),
      body: screen[currentScreen],
    );
  }
}
