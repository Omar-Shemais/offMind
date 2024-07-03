import 'package:adhd/Features/note/presentaion/views/widgets/app_app_bar.dart';
import 'package:adhd/Features/profile/data/profile_auth.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/validator_utils/validator_utils.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
   final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _auth = ProfileAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        enableBackButton: true,
        title: 'Change password',
        fontSize: 22,
      ),
      backgroundColor: AppColors.offWhite,
      body: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.height,
            ),
            CustomTextField(
              hint: 'Email address',
              controller: _email,
              validator: ValidatorUtils.email,
              isObsecure: false,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 12.width),
                child: Icon(
                  Icons.email,
                  color: AppColors.gray,
                  size: 20.width,
                ),
              ),
            ),
            SizedBox(
              height: 30.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  btnText: 'Confirm',
                  onTap: () async {
                     if (!_formKey.currentState!.validate()) {
                  return;
                }
                    await _auth.sendPasswordLink(_email.text);
                    showSnackBar(
                        'A Email has been send to you in this email address',
                        succColor: AppColors.darkGray);
                  },
                ),
                SizedBox(
                  width: 30.width,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
