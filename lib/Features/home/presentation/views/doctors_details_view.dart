import 'package:adhd/Features/home/data/models/doctor_model.dart';
import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:adhd/Features/home/presentation/views/set_appointment_view.dart';
import 'package:adhd/Features/home/presentation/views/widgets/circle_icon.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/network_utils/network_utils.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsDetailesView extends StatefulWidget {
  final int id;
  final String doctorImage;
  const DoctorsDetailesView({
    super.key,
    required this.id,
    required this.doctorImage,
  });

  @override
  State<DoctorsDetailesView> createState() => _DoctorsDetailesViewState();
}

class _DoctorsDetailesViewState extends State<DoctorsDetailesView> {
  final Repository repository = Repository();

  bool isLoading = true;
  Doctor? doctor;
  @override
  void initState() {
    super.initState();
    fetchSpecsDetails();
  }

  void fetchSpecsDetails() async {
    try {
      final response = await NetworkUtils.get('doc/get/${widget.id}');
      setState(() {
        doctor = Doctor.fromJson(response.data);
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
        title: const AppText(
          title: 'Doctor details',
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(child: AppLoadingIndicator())
          : doctor == null
              ? const Center(child: Text('Error loading data'))
              : Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                   Image.asset(
              'Assets/Images/background1.png', // Replace 'background.jpg' with your image asset path
              fit: BoxFit.cover,
            ),
                    Column(
                      children: [
                        SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 100.height,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 250.height,
                                  width: 230.width,
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
                                    borderRadius: BorderRadius.circular(25),
                                    image:  DecorationImage(
                                        image: AssetImage(
                                           doctorImages[widget.id-3] ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.height,
                                ),
                                AppText(
                                  title: doctor?.name ?? '',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5.height,
                                ),
                                RatingBarIndicator(
                                  rating: doctor?.rate.toDouble() ?? 5.00,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(
                                  height: 10.height,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CirclerIcon(
                                      backgroundColor: AppColors.blue,
                                      icon: Icons.phone,
                                      iconColor: AppColors.white,
                                      iconTitle1:
                                          doctor?.tel.toString() ?? '000000000',
                                      iconTitle2: 'call',
                                      titleColor: AppColors.blue,
                                    ),
                                    SizedBox(
                                      width: 15.width,
                                    ),
                                    const CirclerIcon(
                                      backgroundColor: AppColors.gray,
                                      icon: FontAwesomeIcons.calendarCheck,
                                      iconColor: AppColors.blue,
                                      iconTitle1: '5+',
                                      iconTitle2: 'Years',
                                    ),
                                    SizedBox(
                                      width: 15.width,
                                    ),
                                    CirclerIcon(
                                      backgroundColor: AppColors.gray,
                                      icon: Icons.star,
                                      iconColor: AppColors.blue,
                                      iconTitle1:
                                          doctor?.rate.toString() ?? '5',
                                      iconTitle2: 'Rating',
                                    ),
                                    SizedBox(
                                      width: 15.width,
                                    ),
                                    const CirclerIcon(
                                      backgroundColor: AppColors.gray,
                                      icon: Icons.chat,
                                      iconColor: AppColors.blue,
                                      iconTitle1: '120+',
                                      iconTitle2: 'Reviews',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 60.width, right: 35.width),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          AppText(
                                            title: 'About',
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text:
                                              "Dr. Ehab is the top most cardiologist specialist in Crist Hospital in London, UK. he achieved several awards for her wonderful contribution",
                                          style: TextStyle(
                                              color: AppColors.darkGray,
                                              fontSize: 14,
                                              fontFamily: 'Amiko'),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Read More. . . ',
                                                style: TextStyle(
                                                    color: AppColors.blue)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.height,
                                ),
                                CustomButton(
                                  btnText: 'Set Appointment',

                                  onTap: () {
                                    RouteUtils.push(const SetApointmentView());
                                  },
                                  // route: AppRouter.kSetApointmentView,
                                  width: 190.width,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
    );
  }
}
