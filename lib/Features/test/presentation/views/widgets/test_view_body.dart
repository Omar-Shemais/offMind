import 'package:adhd/Features/test/data/test_api_service.dart';
import 'package:adhd/Features/test/presentation/views/text_prediction_view.dart';
import 'package:adhd/Features/test/presentation/views/widgets/file_test_decoy.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/loading_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TestViewBody extends StatefulWidget {
  const TestViewBody({super.key});

  @override
  State<TestViewBody> createState() => _TestViewBodyState();
}

class _TestViewBodyState extends State<TestViewBody> {
  var qrstr = "let's Scan it";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'Assets/Images/testBg.png',
            fit: BoxFit.fill,
          ),
          ListView(
            children: [
              SizedBox(
                height: 80.height,
              ),
              const Image(
                  image: AssetImage('Assets/Images/testBrain.png'),
                  height: 470),
              CustomButton(
                btnText: 'Written Diagnosis',
                width: 180.width,
                onTap: () => RouteUtils.push(const TextPredictionView()),
              ),
              SizedBox(
                height: 20.height,
              ),
              CustomButton(
                btnText: 'Full Diagnosis',
                width: 180.width,
                onTap: () => _showFilePickerDialog(context),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showFilePickerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
            child: Container(
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30.height),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(5),
                      dashPattern: const [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Column(
                        children: [
                          const Image(
                              image: AssetImage('Assets/Images/upload.png')),
                          SizedBox(
                            height: 10.height,
                          ),
                          const AppText(
                            title: 'Browse files',
                            textDecoration: TextDecoration.underline,
                            fontSize: 18,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            height: 10.height,
                          ),
                          const AppText(
                            title:
                                'Upload a region image in NIFTI format to get the prediction ',
                            textAlign: TextAlign.center,
                            color: AppColors.darkGray,
                          ),
                          SizedBox(
                            height: 30.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          btnText: 'Cancel',
                          btnColor: AppColors.white,
                          textColor: AppColors.blue,
                          height: 35.height,
                          width: 100.width,
                          onTap: () => RouteUtils.pop(),
                        ),
                        CustomButton(
                          btnText: 'Upload',
                          height: 35.height,
                          width: 100.width,
                          onTap: () async {
                            Navigator.of(dialogContext).pop();
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              String filePath = result.files.single.path!;
                              _showFileConfirmationDialog(context, filePath);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
    void _showFileConfirmationDialog(BuildContext context, String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          child: Container(
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.width,vertical: 10.height),
                    child: Column(
                          children: [
                            SizedBox(
                              height: 10.height,
                            ),
                             Image(
                                image:const AssetImage('Assets/Images/aac.png'),height: 100.height,width: 100.width,),
                            SizedBox(
                              height: 10.height,
                            ),
                            const AppText(
                              title: 'File name:',
                              fontSize: 25,
                              color: AppColors.blue,
                            ),
                            SizedBox(
                              height: 10.height,
                            ),
                             AppText(
                              title:
                                  filePath,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30.height,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(
                            btnText: 'Next',
                            height: 35.height,
                            width: 100.width,
                            onTap: () async {
                                    Navigator.of(dialogContext).pop();
                                    _showLoadingDialog(context);
                                    int result = await _uploadFile(filePath);
                                    Navigator.of(context).pop();
                                    _navigateToIntermediatePage(context, result);
                                  },
                          ),
                    
                              ],
                            )
                          ],
                    ),
                  ),

          ),
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingDialog();
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

   void _navigateToIntermediatePage(BuildContext context, int result) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => IntermediateResultPage(result: result.toString()),
    ));
  }
}
