import 'package:adhd/Features/intro/presentaion/views/widgets/intro_container_list.dart';
import 'package:adhd/Features/login/presentation/views/login_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class IntroViewBody extends StatefulWidget {
  const IntroViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroViewBodyState createState() => _IntroViewBodyState();
}

class _IntroViewBodyState extends State<IntroViewBody> {
  int _currentPage = 0;
  final CarouselController _carouselController = CarouselController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/Images/background3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 730.height,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  items: pages.map((Widget page) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: page,
                        );
                      },
                    );
                  }).toList(),
                  carouselController: _carouselController,
                ),
                DotsIndicator(
                  dotsCount: pages.length,
                  position: _currentPage.toDouble(),
                  decorator: const DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.black,
                  ),
                ),
              ],
            ),
            if (_currentPage < 4)
              Positioned(
                top: 50.height,
                right: 20.width,
                child: TextButton(
                  onPressed: ()=>RouteUtils.push(const LoginView()),
                  child: const AppText(title: 'skip',
                  fontSize: 16,
                  color: AppColors.darkGray,
                    
                  
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
