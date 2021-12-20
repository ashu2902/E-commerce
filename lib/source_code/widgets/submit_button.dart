import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final sidePadding;
  final text;
  final onPressed;
  const SubmitButton(
      {required this.onPressed, required this.text, required this.sidePadding});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(widget.sidePadding, 15, widget.sidePadding, 15),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ))),
    );
  }
}
