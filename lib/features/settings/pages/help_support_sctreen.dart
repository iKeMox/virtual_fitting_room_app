import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/settings/pages/about_view.dart';
import 'package:graduation_project_fitting_app/features/settings/pages/rebport_problem_view.dart';
import 'package:iconsax/iconsax.dart';

class HelpSupportScreen extends StatelessWidget {
  static const String routeName = "help-support";
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
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

          ],
        ),
      ),
    );
  }
}
