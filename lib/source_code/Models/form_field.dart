import 'package:flutter/material.dart';

class FormFieldDesign extends StatefulWidget {
  final onSaved;
  final label;
  final validator;
  final maxlength;
  final prefix;
  final keyboardType;
  final controller;
  const FormFieldDesign(
      {required this.validator,
      required this.label,
      this.onSaved,
      this.maxlength,
      this.prefix,
      this.keyboardType,
      this.controller});

  @override
  _FormFieldDesignState createState() => _FormFieldDesignState();
}

class _FormFieldDesignState extends State<FormFieldDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              10.0,
              10.0,
            ),
            blurRadius: 50.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        // The validator receives the text that the user has entered.
        validator: widget.validator,
        maxLength: widget.maxlength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.label,
            prefix: widget.prefix,
            counterText: ''),
      ),
    );
  }
}
