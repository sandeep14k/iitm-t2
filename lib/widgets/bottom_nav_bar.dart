import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Funny',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud),
          label: 'Real-Time',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notify',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
