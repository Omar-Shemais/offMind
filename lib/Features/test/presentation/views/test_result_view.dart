import 'package:adhd/Features/home/presentation/views/more_centers_view.dart';
import 'package:adhd/Features/home/presentation/views/more_doctors_view.dart';
import 'package:adhd/Features/login/presentation/views/widgets/divider.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';

class TestResultView extends StatelessWidget {
  final String result;

  const TestResultView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    bool hasADHD = result != '0';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(
        enableBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.width, vertical: 10.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 130.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue, width: 5),
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 3),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppText(
                              title: "The Result :",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 5.height),
                            AppText(
                              title: result == '0'
                                  ? 'You Don\'t Have ADHD'
                                  : 'You Have ADHD',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (hasADHD) ...[
                SizedBox(height: 20.height),
                const CustomDivider(
                  text: 'Our Recommendation ',
                  textColor: AppColors.blue,
                ),
                SizedBox(height: 10.height),
                const AppText(
                  title: "Doctors",
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.height),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildRecommendationCard("Dr.Ehab ELsaidy", 5.0),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        _buildRecommendationCard("Dr.Bassem Fouda", 4.8),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        _buildRecommendationCard("Dr. Mai Mostafa", 4.9),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => RouteUtils.push(MoreDoctorsView()),
                              child: const AppText(
                                title: 'Discover More',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.height),
                const AppText(
                  title: "Centers",
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.height),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildRecommendationCard("WINSOME", 5.0),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        _buildRecommendationCard("HAKYAT ALM", 4.7),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        _buildRecommendationCard("EL-BORG CLINICS", 4.6),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 3,
                          color: AppColors.gray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => RouteUtils.push(MoreCentersView()),
                              child: const AppText(
                                title: 'Discover More',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.height),
                CustomButton(
                  btnText: 'Try test again',
                  onTap: () => Navigator.of(context).pop(),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(String name, double rating) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: name,
            color: AppColors.boldGray,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.blue, size: 18),
              const SizedBox(width: 5),
              AppText(title: '(${rating.toString()})'),
              const SizedBox(width: 15),
              const Icon(Icons.phone, color: AppColors.blue, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
