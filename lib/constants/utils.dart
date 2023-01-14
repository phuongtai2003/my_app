import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result != null && result.files.isNotEmpty) {
      for (int i = 0; i < result.files.length; i++) {
        images.add(
          File(result.files[i].path!),
        );
      }
    }
  } catch (e) {
    print(
      e.toString(),
    );
  }
  return images;
}

Future<void> showDialogBox({
  required BuildContext context,
  required String title,
  required String bodyContent,
  required VoidCallback onYesChoice,
}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            bodyContent,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
              ),
            ),
            TextButton(
              onPressed: onYesChoice,
              child: const Text(
                "Yes",
              ),
            ),
          ],
        );
      });
}
