import 'package:adhd/Features/home/presentation/views/set_appointment_view.dart';
import 'package:adhd/Features/home/presentation/views/widgets/icon_with_text.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/network_utils/network_utils.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:flutter/material.dart';
import 'package:adhd/Features/home/data/models/medical_center_model.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CentersDetailesView extends StatefulWidget {
  const CentersDetailesView({super.key, required this.id});
  final int id;

  @override
  State<CentersDetailesView> createState() => _CentersDetailesViewState();
}

class _CentersDetailesViewState extends State<CentersDetailesView> {
  // int _currentImage = 0;
  bool isLoading = true;
  MedicalCenter? medicalCenter;

  @override
  void initState() {
    super.initState();
    fetchCenterDetails();
  }

  void fetchCenterDetails() async {
    try {
      final response = await NetworkUtils.get('center/get/${widget.id}');
      setState(() {
        medicalCenter = MedicalCenter.fromJson(response.data);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              RouteUtils.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.darkGray,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'Assets/Images/background1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 90.height),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.width),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(35),
                        image: DecorationImage(
                            image: AssetImage(centerImages[widget.id - 1]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.height,
                  ),
                  AppText(
                    title: medicalCenter?.name ?? '',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 30.height,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.width, right: 35.width),
                    child: Column(
                      children: [
                        IconText(
                            text: medicalCenter?.mail ?? '',
                            icon: FontAwesomeIcons.facebook),
                        SizedBox(height: 20.height),
                        IconText(
                            text: medicalCenter?.tel.toString() ?? '',
                            icon: FontAwesomeIcons.phone),
                        SizedBox(height: 20.height),
                        IconText(
                            text: medicalCenter?.name ?? '',
                            icon: FontAwesomeIcons.globe),
                        SizedBox(height: 20.height),
                        IconText(
                            text: medicalCenter?.address ?? '',
                            icon: FontAwesomeIcons.mapLocationDot),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.height),
                  CustomButton(
                    btnText: 'Set Appointment',
                    onTap: () {
                      RouteUtils.push(const SetApointmentView());
                    },
                    // route:  AppRouter.kSetApointmentView,
                    width: 190.width,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}