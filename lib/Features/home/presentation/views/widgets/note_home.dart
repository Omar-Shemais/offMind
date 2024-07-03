import 'package:adhd/Features/note/presentaion/views/note_main_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.width, vertical: 10.height),
      child: Container(
        height: 190.height,
        width: double.maxFinite,
        // color: AppColors.blue,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ], color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.height, bottom: 5.width),
              child: SizedBox(
                  height: 200.height,
                  child: const Image(
                      image: AssetImage("Assets/Images/HomeNote.png"))),
            ),
            SizedBox(
              width: 15.width,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.width),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(title: 'What are your'),
                  const AppText(title: 'new tasks'),
                  const AppText(title: 'today?'),
                  SizedBox(
                    height: 10.height,
                  ),
                  InkWell(
                    onTap: () =>RouteUtils.push(const NoteMainView()),
                    child: Container(
                      width: 35.width,
                      height: 35.height,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(50.width),
                      ),
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: AppColors.white,
                        size: 20.height,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
