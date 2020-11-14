import 'package:flutter/material.dart';

import 'package:openeew_provisioner/templates/step.dart';

import 'package:openeew_provisioner/widgets/space.dart';
import 'package:openeew_provisioner/widgets/next_button.dart';

class ContactForm extends StatefulWidget {
  final Function callback;

  ContactForm({ Key key, this.callback }) : super(key: key);

  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  String _email = '';

  void submit(BuildContext context) {
    // TODO: create / verify user account

    if (_formKey.currentState.validate()) {
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(flex: 8, child: TextFormField(
              decoration: InputDecoration(labelText: 'First name'),
              validator: (value) => (value == null || value.isEmpty) ? 'First name is required' : null,
              onChanged: (value) => setState(() { _firstName = value; }),
            )),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 8, child: TextFormField(
              decoration: InputDecoration(labelText: 'Last name'),
              validator: (value) => (value == null || value.isEmpty) ? 'Last name is required' : null,
              onChanged: (value) => setState(() { _lastName = value; }),
            )),
          ]),
          Space(20),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contact email'),
            validator: (value) => (value == null || value.isEmpty) ? 'Contact email is required' : null,
            onChanged: (value) => setState(() { _email = value; }),
          ),
          Space(20),
          NextButton(onClick: submit, text: 'Submit')
        ],
      ),
    );
  }
}
