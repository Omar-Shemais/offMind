import 'package:adhd/Features/test/data/test_api_service.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'test_result_view.dart';

class UploadFilePage extends StatelessWidget {
  UploadFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File for Diagnosis'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showFilePickerDialog(context),
          child: const Text('Full Diagnosis'),
        ),
      ),
    );
  }

  void _showFilePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Select File'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  String filePath = result.files.single.path!;
                  _showFileConfirmationDialog(context, filePath);
                }
              },
              child: const Text('Select'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showFileConfirmationDialog(BuildContext context, String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('File Selected'),
          content: Text('File Path: $filePath'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                _showLoadingDialog(context);
                int result = await _uploadFile(filePath);
                Navigator.of(context).pop();
                _navigateToResultPage(context, result);
              },
              child: const Text('Upload'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpinKitThreeBounce(
                  color: AppColors.blue,
                  size: 50.0,
                ),
                SizedBox(height: 10.height,),
                const AppText(title: 'Wait...',color: AppColors.black,fontSize:23 ,fontWeight: FontWeight.bold,)
              ],
            ),
        );
      },
    );
  }

  final TestApiService _testApiService = TestApiService();

  Future<int> _uploadFile(String filePath) async {
    try {
      int result = await _testApiService.filePredict(filePath);
      return result;
    } catch (e) {
      // ignore: avoid_print
      print('File upload failed: $e');
      return 0; // Return 0 if there is an error
    }
  }

  void _navigateToResultPage(BuildContext context, int result) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TestResultView(result: result.toString()),
    ));
  }
}


