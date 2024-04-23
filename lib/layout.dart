

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project_fitting_app/settings_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: vm.screens[vm.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            onTabChange: vm.changeIndex,
            tabs: [
              GButton(icon: Iconsax.home, text: "Home", textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.white),),
              GButton(icon: Iconsax.user, text: "Fitting Room",textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.white),),
              GButton(icon: Iconsax.heart, text: "Favourite",textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.white),),
              GButton(icon: Iconsax.setting, text: "Settings",textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
