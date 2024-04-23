import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/settings/pages/edit_profile_screen.dart';
import 'package:graduation_project_fitting_app/features/settings/pages/help_support_sctreen.dart';
import 'package:graduation_project_fitting_app/features/settings/pages/rebport_problem_view.dart';
import 'package:iconsax/iconsax.dart';

import 'about_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    List<String> themeList = ["Light", "Dark"];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Settings', style: theme.textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Account",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditProfileScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey.shade800,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Edit profile",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontSize: 18, color: Colors.grey.shade800),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Support & About",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HelpSupportScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.support,
                          color: Colors.grey.shade800,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Help & Support",
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 18, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AboutView.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.info_circle,
                          color: Colors.grey.shade800,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "About",
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 18, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Theme",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
                width: mediaQuery.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomDropdown<String>(
                  items: themeList,
                  onChanged: (value) {

                  },
                  decoration: CustomDropdownDecoration(
                    closedFillColor: Colors.grey.shade200,
                    hintStyle: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18, color: Colors.grey.shade800),
                    listItemStyle: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18, color: Colors.grey.shade800),
                    headerStyle: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18, color: Colors.grey.shade800),
                  ),
                ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Support & About",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(

              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ReportProblemView.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.flag,
                          color: Colors.grey.shade800,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Report a problem",
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 18, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.logout,
                          color: Colors.red,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Log out",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 18, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
