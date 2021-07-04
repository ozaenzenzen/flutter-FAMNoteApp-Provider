import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAlertDialog extends StatelessWidget {
  const HomeAlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Data is not saved yet!',
        style: TextStyle(
          fontSize: 20,
          fontFamily: "SF Compact",
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
              'You have to save the note first',
              style: TextStyle(
                fontSize: 15,
                fontFamily: "SF Compact",
              ),
            ),
            Text(
              'And then you can delete the note.',
              style: TextStyle(
                fontSize: 15,
                fontFamily: "SF Compact",
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Back'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
