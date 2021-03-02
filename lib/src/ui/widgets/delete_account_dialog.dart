import 'package:flutter/material.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Desactive account'),
      content: Text('Do you really want to desactive your account?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('CANCEL', style: TextStyle(color: Colors.black))),
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('DESACTIVATE', style: TextStyle(color: Colors.red))),
      ],
    );
  }
}
