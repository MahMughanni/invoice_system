import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../utils/ImageManger.dart';
import '../controller/invoice_bloc/invoice_bloc.dart';
import 'help_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List screens = [
    const HomeScreen(),
    Container(),
    const HomeScreen(),
    const HelpScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              IconsManger.notificationIcon,
              width: 25,
              height: 25,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: ColorManger.backgroundColor,
        title: const Text(
          StringManger.home,
          style: TextStyle(
            fontSize: 20,
            color: ColorManger.primaryFontColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTapBottom,
        currentIndex: currentIndex,
        selectedItemColor: ColorManger.primaryColor,
        unselectedItemColor: ColorManger.unSelectedIconColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_sharp,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
            ),
            label: '',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }

  onTapBottom(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
