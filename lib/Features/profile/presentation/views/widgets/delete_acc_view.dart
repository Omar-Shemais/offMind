import 'package:adhd/Features/login/presentation/views/login_view.dart';
import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/validator_utils/validator_utils.dart';
import 'package:adhd/core/widgets/app_dialog.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteAccountView extends StatelessWidget {
  DeleteAccountView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        enableBackButton: true,
        title: 'Delete Account',
        fontSize: 22,
      ),
      backgroundColor: AppColors.offWhite,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.height),
              child: const Row(
                children: [
                  AppText(
                    title: 'Email',
                    color: AppColors.darkGray,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.height,
            ),
            CustomTextField(
              hint: 'Enter your email',
              validator: ValidatorUtils.email,
              controller: _emailController,
            ),
            SizedBox(
              height: 30.height,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.height),
              child: const Row(
                children: [
                  AppText(
                    title: 'Password',
                    color: AppColors.darkGray,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.height,
            ),
            CustomTextField(
              hint: 'Enter your password',
              validator: ValidatorUtils.password,
              controller: _passwordController,
            ),
            SizedBox(
              height: 100.height,
            ),
            CustomButton(
              btnText: 'Delete Account',
              onTap: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                AppDialog.show(
                  context,
                  message: 'Are You Sure',
                  confirmTitle: 'Yes',
                  onConfirm: () {
                    FirebaseAuth.instance.signOut();
                    RouteUtils.pushAndPopAll(
                      const LoginView(),
                    );
                  },
                  onCancel: RouteUtils.pop,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
