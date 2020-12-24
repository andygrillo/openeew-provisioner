import 'package:flutter/material.dart';

import 'package:openeew_provisioner/forms/register.dart';

import 'package:openeew_provisioner/templates/step.dart';

class Register extends StatelessWidget {
  final Function setStep;
  final Map state;

  Register(this.setStep, this.state);

  @override
  Widget build(BuildContext context) {
    return StepTemplate(<Widget>[
      RegisterForm(state: this.state, callback: () => setStep(StepMarker.complete, {}))
    ]);
  }
}
