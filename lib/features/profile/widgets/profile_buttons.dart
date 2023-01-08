import 'package:flutter/material.dart';
import 'package:my_app/features/profile/services/profile_services.dart';
import 'package:my_app/features/profile/widgets/profile_custom_button.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileServices profileServices = ProfileServices();
    final user = context.watch<UserProvider>().user;
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ProfileCustomButton(
                  buttonText: "Account Settings",
                  onPressed: () {},
                  color: Colors.black12,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: ProfileCustomButton(
                  buttonText: "Orders",
                  onPressed: () {},
                  color: Colors.black12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: ProfileCustomButton(
                  buttonText: user.type == "user" ? "Turn Seller" : "Turn User",
                  onPressed: () {
                    profileServices.turn(
                      context: context,
                    );
                  },
                  color: Colors.black12,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: ProfileCustomButton(
                  buttonText: "Log out",
                  onPressed: () {
                    profileServices.logOut(context: context);
                  },
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
