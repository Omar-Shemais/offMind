import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/main_page.dart';
import 'package:flutter/material.dart';


class SuccessfulyBooked extends StatelessWidget {
  const SuccessfulyBooked({super.key});

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
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'Assets/Images/background1.png',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(top: 150.height),
          child: Column(
            children: [
              Container(
                width: 200.width,
                height: 200.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                  radius: 25.width,
                  backgroundColor: AppColors.blue,
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 120,
                  ),
                ),
              ),
              SizedBox(
                height: 40.height,
              ),
              const AppText(
                title: 'Congratulations',
                fontSize: 37,
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
              const AppText(
                title: 'Your Book Is Successfuly',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 100.height,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                   RouteUtils.push(const MainPaage());
                  },
                  child: Container(
                    height: 60.height,
                    width: 230.width,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(35)),
                    child: const Center(
                        child: AppText(
                      title: 'Back',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    )),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
