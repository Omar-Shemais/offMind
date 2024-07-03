import 'package:adhd/Features/login/presentation/views/login_view.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  const IntroButton
({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(btnText: 'Let\'s go',onTap: () => RouteUtils.push( const LoginView()),);
  }
}