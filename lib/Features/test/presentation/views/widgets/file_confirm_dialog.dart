// import 'package:adhd/Features/test/data/test_api_service.dart';
// import 'package:adhd/Features/test/presentation/views/test_result_view.dart';
// import 'package:adhd/core/utils/route_utils/route_utils.dart';
// import 'package:adhd/core/widgets/loading_dialog.dart';
// import 'package:flutter/material.dart';

// void showFileConfirmationDialog(BuildContext context, String filePath) {
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) {
//       return AlertDialog(
//         title: Text('File Selected'),
//         content: Text('File Name: $filePath'),
//         actions: [
//           TextButton(
//             onPressed: () async {
//               Navigator.of(dialogContext).pop();
//                showLoadingDialog(context);
//               int result = await uploadFile(filePath);
//               Navigator.of(context).pop();
//               RouteUtils.push(TestResultView(result: result.toString()));
//             },
//             child: Text('Upload'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop();
//             },
//             child: Text('Cancel'),
//           ),
//         ],
//       );
//     },
//   );
// }

// final TestApiService _testApiService = TestApiService();

// Future<int> uploadFile(String filePath) async {
//   try {
//     int result = await _testApiService.filePredict(filePath);
//     return result;
//   } catch (e) {
//     print('File upload failed: $e');
//     return 0; // Return 0 if there is an error
//   }
// }
