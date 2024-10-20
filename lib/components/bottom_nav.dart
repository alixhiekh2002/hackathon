import 'package:flutter/material.dart';
import 'package:foodiegala/src/account.dart';
import 'package:foodiegala/src/browser.dart';
import 'package:foodiegala/src/cart_screen.dart';
import 'package:foodiegala/src/home_screen.dart';
import 'package:foodiegala/src/orders.dart';

class BottomNavv extends StatefulWidget {
  const BottomNavv({super.key});

  @override
  State<BottomNavv> createState() => _BottomNavvState();
}

class _BottomNavvState extends State<BottomNavv> {
  int myCurrentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    BrowserPage(),
    CartPage(),
    OrderPage(),
    AccountPage(),
  ];

  // Define a list of custom icons as ImageProviders or SvgPicture
  final List<ImageProvider> customIcons = [
    AssetImage('assets/icons/search.png'), // Replace with your asset path
    AssetImage('assets/icons/search.png'), // Replace with your asset path
    AssetImage('assets/icons/cart.png'), // Replace with your asset path
    AssetImage('assets/icons/orders.png'), // Replace with your asset path
    AssetImage('assets/icons/person.png'), // Replace with your asset path
  ];

  // Define a list of colors for selected and unselected icons
  final List<Color> iconColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content, with the page corresponding to the selected bottom navigation item
          pages[myCurrentIndex],

          // Positioned widget to overlay BottomNavigationBar
          Positioned(
            left: 0,
            right: 0,
            bottom: 10, // Align to bottom of the screen
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.deepPurple.withOpacity(0.9),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 10), // Padding around the navbar
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                currentIndex: myCurrentIndex,
                onTap: (index) {
                  setState(() {
                    myCurrentIndex = index;
                    iconColors[myCurrentIndex] =
                        Colors.blue; // Change color on tap
                    for (int i = 0; i < iconColors.length; i++) {
                      if (i != myCurrentIndex) {
                        iconColors[i] = Colors.white; // Reset other colors
                      }
                    }
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: customIcons[1],
                      color: iconColors[1],
                    ),
                    label: "Browse",
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: customIcons[2],
                      color: iconColors[2],
                    ),
                    label: "Carts",
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: customIcons[3],
                      color: iconColors[3],
                    ),
                    label: "Orders",
                  ),
                  BottomNavigationBarItem(
                    icon: Image(
                      image: customIcons[4],
                      color: iconColors[4],
                    ),
                    label: "Account",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
