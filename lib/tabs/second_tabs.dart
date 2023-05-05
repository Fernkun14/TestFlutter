import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  _SecondTabState createState() => _SecondTabState();
}

class PersonalInfo {
  String name = '';
  int age = 0;
  String phoneNumber = '';
}

class Address {
  String addressLine1 = '';
  String city = '';
  String province = '';
  String postalCode = '';
}

class _SecondTabState extends State<SecondTab> {
  PersonalInfo personalInfo = PersonalInfo();
  Address address = Address();

  int currentStep = 0;
  bool complete = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepContinue: next,
          onStepCancel: cancel,
          steps: [
            Step(
              title: Text('Personal Information'),
              isActive: currentStep >= 0,
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personalInfo.name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personalInfo.age = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personalInfo.phoneNumber = value!;
                    },
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Address'),
              isActive: currentStep >= 1,
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address Line 1'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address line 1.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address.addressLine1 = value!;
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your city.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address.city = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Province'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your province.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address.province = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Postal Code'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your postal code.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address.postalCode = value!;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void next() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      currentStep + 1 != 2
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }
  }

  void cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  void goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }
}




