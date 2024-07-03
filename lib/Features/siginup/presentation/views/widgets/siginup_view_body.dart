import 'package:adhd/Features/siginup/manger/cubit/singup_cubit.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/validator_utils/validator_utils.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
// import 'package:adhd/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

bool isObsecure = true;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: Builder(builder: (context) {
            final cubit = BlocProvider.of<RegisterCubit>(context);
            return Form(
              key: cubit.formKey,
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 75.height,
                        ),
                        AppText(
                          title: 'We Say Hello!',
                          fontSize: 30.height,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.height,
                        ),
                        AppText(
                          title: 'Welcome. Use your email, name ',
                          fontSize: 12.height,
                          color: AppColors.darkGray,
                        ),
                        AppText(
                          title: 'and password to sigin up.',
                          fontSize: 12.height,
                          color: AppColors.darkGray,
                        ),
                        SizedBox(
                          height: 30.height,
                        ),
                        CustomTextField(
                          hint: 'Email Address',
                          onChange: (value) => cubit.email = value,
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
                          height: 42.height,
                        ),
                        CustomTextField(
                          hint: 'Full name',
                          validator: ValidatorUtils.name,
                          isObsecure: false,
                          onChange: (value) => cubit.name = value,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.width),
                            child: Icon(
                              Icons.person,
                              color: AppColors.gray,
                              size: 20.width,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 42.height,
                        ),
                        CustomTextField(
                          isObsecure: isObsecure,
                          onChange: (value) => cubit.password = value,
                          hint: 'Set password',
                          validator: ValidatorUtils.password,
                          onTap: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.width),
                            child: Icon(Icons.lock,
                                color: AppColors.gray, size: 20.width),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 5.width),
                            child: Icon(
                                isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.gray,
                                size: 20.width),
                          ),
                        ),
                        SizedBox(
                          height: 42.height,
                        ),
                        CustomTextField(
                          isObsecure: isObsecure,
                          hint: 'Confirm password',
                          validator: ValidatorUtils.password,
                          onTap: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.width),
                            child: Icon(Icons.lock,
                                color: AppColors.gray, size: 20.width),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 5.width),
                            child: Icon(
                                isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.gray,
                                size: 20.width),
                          ),
                        ),
                        SizedBox(
                          height: 50.height,
                        ),
                        BlocBuilder<RegisterCubit, RegisterStates>(
                          builder: (context, state) {
                            if (state is RegisterLoading) {
                              return const Center(
                                child: AppLoadingIndicator(
                                ),
                              );
                            }
                            return CustomButton(
                              btnText: 'Sign up',
                              onTap: cubit.register,
                            );
                          },
                        ),
                        SizedBox(
                          height: 40.height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppText(
                              title: 'Already have an account?',
                              fontWeight: FontWeight.w700,
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      RouteUtils.pop();
                                    },
                                    child: AppText(
                                      title: 'Sign in',
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.width,
                                    )),
                                SizedBox(
                                  height: 4.height,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
