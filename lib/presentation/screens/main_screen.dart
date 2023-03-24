import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';

import '../../utils/appConst.dart';
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
    Container(),
    const HelpScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            SharedPrefController().clear();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Container();
            }));
          },
          icon: const Icon(
            Icons.logout_sharp,
            color: Colors.black,
          ),
        ),
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
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          StringManger.home,
          style: TextStyle(
            fontSize: 20,
            color: AppColor.primaryFontColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTapBottom,
        currentIndex: currentIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.unSelectedIconColor,
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
