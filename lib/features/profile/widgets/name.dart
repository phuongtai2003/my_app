import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  String getTime() {
    String time = DateFormat.H().format(DateTime.now());
    int hour = int.parse(time);
    if (hour >= 5 && hour < 12) {
      return "morning";
    } else if (hour >= 12 && hour < 17) {
      return "afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "evening";
    }
    return "night";
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(
        10,
      ),
      child: RichText(
        text: TextSpan(
          text: "Good ${getTime()},\n",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: userProvider.user.name,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
