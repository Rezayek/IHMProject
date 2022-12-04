import 'package:coffeeihmproject/widgets/drawer/drawer_item.dart';
import 'package:coffeeihmproject/widgets/drawer/user_data_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';

class DrwerView extends StatefulWidget {
  const DrwerView({Key? key}) : super(key: key);

  @override
  State<DrwerView> createState() => _DrwerViewState();
}

class _DrwerViewState extends State<DrwerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: arabicCoffeeColor.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserDataContainer(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 500,
              width: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  DrawerItem(icon: Icons.delivery_dining, text: "Follow your purchase"),
                  DrawerItem(icon: Icons.history_rounded, text: "Purchases History"),
                  DrawerItem(icon: Icons.settings, text: "Settings"),
                  DrawerItem(icon: Icons.coffee, text: "About us"),
                  DrawerItem(icon: Icons.logout_outlined, text: "Logout"),
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }
}