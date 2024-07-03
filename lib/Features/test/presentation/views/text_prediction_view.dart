import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/Features/test/data/model/test_model.dart';
import 'package:adhd/Features/test/data/test_api_service.dart';
import 'package:adhd/Features/test/presentation/views/test_result_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_drop_item.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';

class TextPredictionView extends StatefulWidget {
  const TextPredictionView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextPredictionViewState createState() => _TextPredictionViewState();
}

class _TextPredictionViewState extends State<TextPredictionView> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _handednessController = TextEditingController();
  final TextEditingController _iqController = TextEditingController();

  void _getPrediction() async {
    if (_formKey.currentState!.validate()) {
      PredictionRequest request = PredictionRequest(
        gender: _selectedGender!,
        age: _ageController.text,
        handedness: _handednessController.text,
        iq: _iqController.text,
      );

      TestApiService apiService = TestApiService();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog();
        },
      );

      try {
        PredictionResponse response = await apiService.getPrediction(request);
        Navigator.pop(context); // Close the loading dialog
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TestResultView(result: response.prediction.toString()),
          ),
        );
      } catch (e) {
        Navigator.pop(context); // Close the loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error getting prediction')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: const AppAppBar(
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
                onTap: _getPrediction,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
