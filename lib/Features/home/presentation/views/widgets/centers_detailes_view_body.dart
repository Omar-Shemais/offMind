// import 'package:adhd/Features/home/data/models/center_model.dart';
// import 'package:adhd/Features/home/presentation/views/set_appointment_view.dart';
// import 'package:adhd/Features/home/presentation/views/widgets/icon_with_text.dart';
// import 'package:adhd/core/utils/route_utils/route_utils.dart';
// import 'package:adhd/core/utils/dimensions/dimensions.dart';
// import 'package:adhd/core/widgets/custom_button.dart';
// import 'package:adhd/core/widgets/custom_text.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CentersDetailesViewBody extends StatefulWidget {
//     final MedicalCenter centerId;
//   const CentersDetailesViewBody({super.key, required this.centerId});

//   @override
//   State<CentersDetailesViewBody> createState() =>
//       _CentersDetailesViewBodyState();
// }

// class _CentersDetailesViewBodyState extends State<CentersDetailesViewBody> {
//   int _currentImage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               RouteUtils.pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios_new)),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'Assets/Images/background1.png',
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 90.height),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   FractionallySizedBox(
//                     widthFactor: 0.65,
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 270.height,
//                         enableInfiniteScroll: false,
//                         autoPlay: false,
//                         viewportFraction: 1.0,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _currentImage = index;
//                           });
//                         },
//                       ),
//                       items: images.map((Widget page) {
//                         return Builder(
//                           builder: (BuildContext context) {
//                             return SizedBox(
//                               width: MediaQuery.of(context).size.width,
//                               child: page,
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.height,
//                   ),
//                   DotsIndicator(
//                     dotsCount: images.length,
//                     position: _currentImage.toDouble(),
//                     decorator: const DotsDecorator(
//                       color: Colors.grey,
//                       activeColor: Colors.black,
//                       size: Size(10, 10),
//                       activeSize: Size(10, 10),
//                       spacing: EdgeInsets.all(3),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.height,
//                   ),
//                   const AppText(
//                     title: 'WINSOME',
//                     fontSize: 37,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(
//                     height: 30.height,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 60.width, right: 35.width),
//                     child: Column(
//                       children: [
//                         const IconText(
//                             text:
//                                 'https://www.facebook.com/winsomecenter?mibextid=LQQJ4d',
//                             icon: FontAwesomeIcons.facebook),
//                         SizedBox(height: 20.height),
//                         const IconText(
//                             text: '1144472728', icon: FontAwesomeIcons.phone),
//                         SizedBox(height: 20.height),
//                         const IconText(
//                             text: 'winsomecenters.com',
//                             icon: FontAwesomeIcons.globe),
//                         SizedBox(height: 20.height),
//                         const IconText(
//                             text: 'Alexandria, Egypt',
//                             icon: FontAwesomeIcons.mapLocationDot),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.height),
//                   CustomButton(
//                     btnText: 'Set Appointment',
//                     onTap: () {
//                       RouteUtils.push(const SetApointmentView());
//                     },
//                     // route:  AppRouter.kSetApointmentView,
//                     width: 190.width,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// List<Widget> images = [
//   const CentarsImageContainer(),
//   const CentarsImageContainer(),
//   const CentarsImageContainer(),
//   const CentarsImageContainer(),
//   const CentarsImageContainer(),
// ];

// class CentarsImageContainer extends StatelessWidget {
//   const CentarsImageContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(35),
//         image: const DecorationImage(
//             image: AssetImage('Assets/Images/Doctor1.jpeg'), fit: BoxFit.fill),
//       ),
//     );
//   }
// }
