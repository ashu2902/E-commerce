import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/source_code/Models/form_field.dart';
import 'package:task_app/source_code/widgets/submit_button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  var _name;
  var _mobile;
  var _email;
  var _address;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Wrap(
              spacing: 20, // to apply margin in the main axis of the wrap
              runSpacing: 15,
              children: <Widget>[
                FormFieldDesign(
                    onSaved: () {
                      setState(() {
                        _name = _nameController.text.toString();
                      });
                    },
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    label: "Name"),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: FormFieldDesign(
                      onSaved: () {
                        setState(() {
                          _mobile = _mobileController.text.toString();
                        });
                      },
                      controller: _mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      label: "Mobile no"),
                ),
                FormFieldDesign(
                    onSaved: () {
                      setState(() {
                        _email = _emailController.text.toString();
                      });
                    },
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    label: "Email"),
                FormFieldDesign(
                    onSaved: () {
                      setState(() {
                        _address = _addressController.text.toString();
                      });
                    },
                    controller: _addressController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    label: "Enter address"),
                //submit button
                Align(
                  alignment: Alignment.center,
                  child: SubmitButton(
                    onPressed: () {
                      validate();
                      if (validate() == true) {
                        print('wuhooo');
                        _name = _nameController.text;
                        _email = _emailController.text;
                        _mobile = _mobileController.text;
                        _address = _addressController.text;

                        print(_name + _email + _mobile + _address);
                        var uid =
                            FirebaseAuth.instance.currentUser!.uid.toString();
                        final CollectionReference user_info = FirebaseFirestore
                            .instance
                            .collection('users/$uid/info');
                        user_info.add({
                          "name": _name,
                          "mob": _mobile,
                          "email": _email,
                          "address": _address
                        }).then((_) => _formKey.currentState!.reset());

                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Center(
                                          child: Text('Order submitted'))),
                                ));
                        _nameController.clear();
                        _mobileController.clear();
                        _emailController.clear();
                        _addressController.clear();
                        Navigator.pop(context);
                      }
                    },
                    sidePadding: 60.0,
                    text: "Accept & Continue",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    if (_formKey.currentState!.validate()) {
      print('validated');
      return true;
    } else {
      print('not validated');
      return false;
    }
  }
}
