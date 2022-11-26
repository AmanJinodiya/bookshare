import 'package:book/add_book/add.dart';
import 'package:book/detail/preview.dart';
import 'package:flutter/material.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({super.key});

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(218, 170, 99, 1),
        currentIndex: _currentindex,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(size: 35),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            if (value == 3) {
              bottom_modal_sheet(context, size);
            }
            _currentindex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.headphones,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: 'Home',
          )
        ]);
  }

  Future<void> bottom_modal_sheet(BuildContext context, Size size) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: size.height * 0.8,
            child: add());
      },
    );
  }
}
