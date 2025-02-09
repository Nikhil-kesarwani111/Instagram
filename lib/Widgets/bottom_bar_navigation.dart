import 'package:flutter/material.dart';
import 'package:instagram/Provider/BottomNavProvider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarNavigation extends StatelessWidget {
  const BottomBarNavigation({super.key, required this.iconSize});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.surface, // Dynamic theme handling
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      currentIndex: bottomNavProvider.selectedIndex,
      onTap: (index) => bottomNavProvider.changeIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, size: iconSize),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: iconSize),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.squarePlus, size: iconSize),
          label: "Reels",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.clapperboard, size: iconSize),
          label: "Shop",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: iconSize),
          label: "Profile",
        ),
      ],
    );
  }
}
