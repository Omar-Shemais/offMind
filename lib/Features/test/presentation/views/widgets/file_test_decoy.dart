import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/Features/test/presentation/views/test_result_view.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_drop_item.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class IntermediateResultPage extends StatefulWidget {
  final String result;

  IntermediateResultPage({required this.result});

  @override
  State<IntermediateResultPage> createState() => _IntermediateResultPageState();
}

class _IntermediateResultPageState extends State<IntermediateResultPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _handednessController = TextEditingController();
  final TextEditingController _iqController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppAppBar(
        enableBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 50.width, vertical: 10.height),
                child: const Row(
                  children: [
                    AppText(
                      title: 'Gender',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              CustomDropItem(
                hintText: 'Select Gender',
                value: _selectedGender,
                value1: 'm',
                dropText1: 'Male',
                value2: 'f',
                dropText2: 'Female',
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select Your Gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.height),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 50.width, vertical: 10.height),
                child: const Row(
                  children: [
                    AppText(
                      title: 'Age',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              CustomTextField(
                hint: 'Enter Your Age',
                controller: _ageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.height),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 50.width, vertical: 10.height),
                child: const Row(
                  children: [
                    AppText(
                      title: 'Handedness',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              CustomTextField(
                hint: 'Handedness (0.0/1.0)',
                controller: _handednessController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Handedness';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.height),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 50.width, vertical: 10.height),
                child: const Row(
                  children: [
                    AppText(
                      title: 'IQ',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              CustomTextField(
                hint: 'Enter Your IQ',
                controller: _iqController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your IQ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.height),
              const SizedBox(height: 20),
              CustomButton(
                  btnText: 'Complete',
                  onTap: () {
                     if (!_formKey.currentState!.validate()) {
                  return;
                }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TestResultView(result: widget.result),
                    ));
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
