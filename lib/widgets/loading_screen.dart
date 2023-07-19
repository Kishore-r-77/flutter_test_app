import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 100.0),
        child: Center(
            child: Column(
          children: <Widget>[
            const CircularProgressIndicator(strokeWidth: 4.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please Wait',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
              ),
            )
          ],
        )));
  }
}
