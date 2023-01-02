import 'package:flutter/material.dart';
import 'package:my_app/features/profile/services/profile_services.dart';
import 'package:my_app/features/profile/widgets/profile_custom_button.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileServices profileServices = ProfileServices();
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
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: ProfileCustomButton(
                  buttonText: "Orders",
                  onPressed: () {},
                  color: Colors.grey,
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
                  buttonText: "My Wishlist",
                  onPressed: () {},
                  color: Colors.grey,
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
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
