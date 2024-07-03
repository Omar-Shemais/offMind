// import 'package:adhd/Features/home/presentation/views/set_appointment_view.dart';
// import 'package:adhd/Features/home/presentation/views/widgets/circle_icon.dart';
// import 'package:adhd/core/utils/app_colors/app_colors.dart';
// import 'package:adhd/core/utils/route_utils/route_utils.dart';
// import 'package:adhd/core/utils/dimensions/dimensions.dart';
// import 'package:adhd/core/widgets/custom_button.dart';
// import 'package:adhd/core/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class DoctorsDetailesViewBody extends StatelessWidget {
//   const DoctorsDetailesViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//              RouteUtils.pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios_new)),
//         title: const AppText(
//           title: 'Doctor details',
//           fontSize: 23,
//           fontWeight: FontWeight.bold,
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             'Assets/Images/background1.png', // Replace 'background.jpg' with your image asset path
//             fit: BoxFit.cover,
//           ),
//           SingleChildScrollView(
//             physics: const NeverScrollableScrollPhysics(),
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: 100.height,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 250.height,
//                     width: 230.width,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           spreadRadius: 5,
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(25),
//                       image: const DecorationImage(
//                           image: AssetImage('Assets/Images/Doctor1.jpeg'),
//                           fit: BoxFit.fill),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.height,
//                   ),
//                   const AppText(
//                     title: 'Dr.Ehab ELsaidy',
//                     fontSize: 33,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(
//                     height: 5.height,
//                   ),
//                   Container(
//                     height: 30.height,
//                     width: 130.width,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('Assets/Images/5stars.png'),
//                           fit: BoxFit.fill),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.height,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CirclerIcon(
//                         backgroundColor: AppColors.blue,
//                         icon: Icons.phone,
//                         iconColor: AppColors.white,
//                         iconTitle1: '+2',
//                         iconTitle2: 'call',
//                         titleColor: AppColors.blue,
//                       ),
//                       SizedBox(
//                         width: 15.width,
//                       ),
//                       const CirclerIcon(
//                         backgroundColor: AppColors.gray,
//                         icon: FontAwesomeIcons.calendarCheck,
//                         iconColor: AppColors.blue,
//                         iconTitle1: '5+',
//                         iconTitle2: 'Years',
//                       ),
//                       SizedBox(
//                         width: 15.width,
//                       ),
//                       const CirclerIcon(
//                         backgroundColor: AppColors.gray,
//                         icon: Icons.star,
//                         iconColor: AppColors.blue,
//                         iconTitle1: '5.00',
//                         iconTitle2: 'Rating',
//                       ),
//                       SizedBox(
//                         width: 15.width,
//                       ),
//                       const CirclerIcon(
//                         backgroundColor: AppColors.gray,
//                         icon: Icons.chat,
//                         iconColor: AppColors.blue,
//                         iconTitle1: '120+',
//                         iconTitle2: 'Reviews',
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.height,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 60.width, right: 35.width),
//                     child: Column(
//                       children: [
//                         const Row(
//                           children: [
//                             AppText(
//                               title: 'About',
//                               fontSize: 19,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ],
//                         ),
//                         RichText(
//                           text: const TextSpan(
//                             text:
//                                 "Dr. Ehab is the top most cardiologist specialist in Crist Hospital in London, UK. he achieved several awards for her wonderful contribution",
//                             style: TextStyle(
//                                 color: AppColors.darkGray,
//                                 fontSize: 14,
//                                 fontFamily: 'Amiko'),
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: ' Read More. . . ',
//                                   style: TextStyle(color: AppColors.blue)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.height,
//                   ),
//                   CustomButton(
//                     btnText: 'Set Appointment',

//                     onTap: () {
//                       RouteUtils.push(
//                           const SetApointmentView());
//                     },
//                     // route: AppRouter.kSetApointmentView,
//                     width: 190.width,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
