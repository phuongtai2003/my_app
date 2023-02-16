import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/common/custom_textfield.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/settings/services/settings_services.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/settings-screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final SettingsServices _settingsServices = SettingsServices();

  String addressToBeUsed = '';
  String emailToBeUsed = '';
  String nameToBeUsed = '';

  void updateUserInfo(String address, String email, String name) {
    if (_addressController.text.isNotEmpty) {
      addressToBeUsed = _addressController.text;
    } else if (address.isNotEmpty) {
      addressToBeUsed = address;
    }

    if (_emailController.text.isNotEmpty) {
      emailToBeUsed = _emailController.text;
    } else if (email.isNotEmpty) {
      emailToBeUsed = email;
    }

    if (_nameController.text.isNotEmpty) {
      nameToBeUsed = _nameController.text;
    } else if (name.isNotEmpty) {
      nameToBeUsed = name;
    }

    _settingsServices.changeAccountDetails(
      context: context,
      name: nameToBeUsed,
      email: emailToBeUsed,
      address: addressToBeUsed,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    String userName = user.name;
    String userMail = user.email;
    String userAddress = user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            "SETTINGS",
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "ACCOUNT INFORMATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textEditingController: _emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: "Name",
                    textEditingController: _nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textEditingController: _addressController,
                    hintText: "Address",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonText: "Confirm",
                    onTap: () {
                      updateUserInfo(
                        userAddress,
                        userMail,
                        userName,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
