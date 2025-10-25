import 'package:e_commerce/Views/pages/Drawer/DrawerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/color.dart';
import '../Cart/cart_Screen.dart';
import '../Home/home_Screen.dart';
import '../WishList/wish_list.dart';


final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();


class MainScreen extends StatefulWidget {
  MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  var selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[
    HomeScreen(),
    WishList(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      body: pages[selectedIndex],
      drawer: DrawerScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: selectedIndex == 0
                  ? CustomColors.primaryColor
                  : Color(0xff8F959E),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/WishList.svg',
              color: selectedIndex == 1
                  ? CustomColors.primaryColor
                  : Color(0xff8F959E),
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Cart2.svg',
              color: selectedIndex == 2
                  ? CustomColors.primaryColor
                  : Color(0xff8F959E),
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}