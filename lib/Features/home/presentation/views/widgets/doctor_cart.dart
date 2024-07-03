import 'package:adhd/Features/home/data/models/doctor_model.dart';
import 'package:adhd/Features/home/presentation/views/doctors_details_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorCart extends StatelessWidget {
  const DoctorCart({
    super.key,
    required this.doctor,
    required this.doctorImg,
  });
  final Doctor doctor;
  final String doctorImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => RouteUtils.push(DoctorsDetailesView(
            id: doctor.id,
            doctorImage: doctorImg,
          )),
          child: Container(
            height: 160.height,
            width: 150.width,
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
                  image: AssetImage(doctorImg), fit: BoxFit.fill),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50.height,
              width: 150.width,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: doctor.name,
                    cutoff: 15,
                    fontSize: 13.height,
                    fontWeight: FontWeight.bold,
                  ),
                  RatingBarIndicator(
                    rating: doctor.rate.toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: AppColors.yellow,
                    ),
                    itemCount: 5,
                    itemSize: 13.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
