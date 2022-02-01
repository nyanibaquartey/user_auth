import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final String title;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.blue,
        elevation: 3.0,
        child: MaterialButton(
          onPressed: onPressed,
          height: 45.0,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
