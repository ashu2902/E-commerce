import 'package:flutter/material.dart';
import 'package:task_app/source_code/widgets/form_widget.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FormWidget());
  }
}
