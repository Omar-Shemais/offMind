
//   import 'package:adhd/Features/test/presentation/views/widgets/file_confirm_dialog.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// void showFilePickerDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           title: Text('Select File'),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(dialogContext).pop();
//                 FilePickerResult? result = await FilePicker.platform.pickFiles();
//                 if (result != null) {
//                   String filePath = result.files.single.name;
//                   showFileConfirmationDialog(context, filePath);
//                 }
//               },
//               child: Text('Select'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(dialogContext).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
  
