import 'package:flutter/material.dart';
import 'package:adhd/Features/home/data/models/medical_center_model.dart';
import 'package:adhd/Features/home/presentation/views/centers_details_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_text.dart';

class CenterHommeCart extends StatelessWidget {
  const CenterHommeCart(
      {super.key, required this.medicalCenter, required this.centerImg});

  final MedicalCenter medicalCenter;
  final String centerImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () =>
              RouteUtils.push(CentersDetailesView(id: medicalCenter.id)),
          child: Container(
            height: 150.height,
            width: 160.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              image: DecorationImage(
                  image: AssetImage(centerImg), fit: BoxFit.fill),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 30.height,
              width: 160.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                color: AppColors.white,
              ),
              child: Center(
                child: AppText(
                  title: medicalCenter.name,
                  cutoff: 15,
                  fontSize: 10.height,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
