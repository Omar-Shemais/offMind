import 'package:adhd/Features/login/maneger/cubit/login_cubit.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/reset_password.dart';
import 'package:adhd/Features/siginup/presentation/views/siginup_view.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/validator_utils/validator_utils.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/Features/login/presentation/views/widgets/custom_icon_container.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/Features/login/presentation/views/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

bool isObsecure = false;

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Builder(builder: (context) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Form(
            key: cubit.formKey,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        title: 'Welcome back. Use your email ',
                        fontSize: 12.height,
                        color: AppColors.darkGray,
                      ),
                      AppText(
                        title: 'and password to login.',
                        fontSize: 12.height,
                        color: AppColors.darkGray,
                      ),
                      SizedBox(
                        height: 50.height,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            hint: 'Email address',
                            onChange: (value) => cubit.email = value,
                            controller: _emailController,
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
                            height: 40.height,
                          ),
                          CustomTextField(
                            onChange: (value) => cubit.password = value,
                            isObsecure: isObsecure,
                            hint: 'Set password',
                            controller: _passwordController,
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
                        ],
                      ),
                      SizedBox(
                        height: 20.height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           InkWell(
                            onTap: () => RouteUtils.push(ResetPasswordView()),
                            child:  const AppText(
                              title: 'forgot password?',
                              color: AppColors.darkGray,
                            ),
                          ),
                          SizedBox(
                            width: 30.width,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70.height,
                      ),

                      BlocBuilder<LoginCubit, LoginStates>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: AppLoadingIndicator(
      
                              ),
                            );
                          }
                          return CustomButton(
                            btnText: 'Sign in',
                            onTap: cubit.login,
                          );
                        },
                      ),

                      SizedBox(
                        height: 30.height,
                      ),
                      const CustomDivider(
                        text: 'or continue with',
                      ),
                      SizedBox(
                        height: 30.height,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomIconContainer(icon: 'Assets/Images/google.png'),
                          CustomIconContainer(
                              icon: 'Assets/Images/apple-logo 1.png'),
                          CustomIconContainer(
                              icon: 'Assets/Images/facebook.png'),
                        ],
                      ),
                      SizedBox(
                        height: 30.height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText(
                            title: 'Don\'t have an account?',
                            fontWeight: FontWeight.w700,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  RouteUtils.push(const SignUpView());
                                },
                                child: const AppText(
                                  title: 'Sign up',
                                  color: AppColors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
        }),
      ),
    );
  }
}





  // Container(
  //           height: double.infinity,
  //           decoration: const BoxDecoration(
  //             image: DecorationImage(
  //                 image: AssetImage('Assets/Images/background2.png'),
  //                 fit: BoxFit.fill),
  //           ),
  //           child: SingleChildScrollView(
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 20.height),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 75.height,
  //                   ),
  //                   Padding(
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 0, vertical: 20.height),
  //                     child: Row(
  //                       children: [
  //                         SizedBox(
  //                           width: 10.width,
  //                         ),
  //                         AppText(
  //                           title: 'Sign in',
  //                           fontSize: 35.height,
  //                           fontWeight: FontWeight.w600,
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 30.height,
  //                   ),
  //                   // const EmailAndPassworrdValidation(),
  //                   Column(
  //                     children: [
  //                       CustomTextField(
  //                         hint: 'Email address',
  //                         controller: _emailController,
  //                         isObsecure: false,
  //                         prefixIcon: Padding(
  //                           padding: EdgeInsets.only(left: 12.width),
  //                           child: Icon(
  //                             Icons.email,
  //                             color: AppColors.darkGray,
  //                             size: 20.width,
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 40.height,
  //                       ),
  //                       CustomTextField(
  //                         isObsecure: isObsecure,
  //                         hint: 'Set password',
  //                         controller: _passwordController,
  //                         onTap: () {
  //                           setState(() {
  //                             isObsecure = !isObsecure;
  //                           });
  //                         },
  //                         prefixIcon: Padding(
  //                           padding: EdgeInsets.only(left: 12.width),
  //                           child: Icon(Icons.lock,
  //                               color: AppColors.darkGray, size: 20.width),
  //                         ),
  //                         suffixIcon: Padding(
  //                           padding: EdgeInsets.only(right: 5.width),
  //                           child: Icon(
  //                               isObsecure
  //                                   ? Icons.visibility_off
  //                                   : Icons.visibility,
  //                               color: AppColors.darkGray,
  //                               size: 20.width),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 20.height,
  //                   ),
  //                   const CustomChekeBox(),
  //                   SizedBox(
  //                     height: 70.height,
  //                   ),
  //                   CustomButton(
  //                       btnText: 'Sign in',
  //                       onTap: () =>login(context),
  //                       ),
  //                   SizedBox(
  //                     height: 30.height,
  //                   ),
  //                   const CustomDivider(
  //                     text: 'or continue with',
  //                   ),
  //                   SizedBox(
  //                     height: 30.height,
  //                   ),
  //                   const Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       CustomIconContainer(icon: 'Assets/Images/google.png'),
  //                       CustomIconContainer(icon: 'Assets/Images/apple-logo 1.png'),
  //                       CustomIconContainer(icon: 'Assets/Images/facebook.png'),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 30.height,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       const AppText(
  //                         title: 'Don\'t have an account?',
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                       Column(
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               RouteUtils.push(const SignUpView());
  //                             },
  //                             child: const AppText(
  //                               title: 'Sign up',
  //                               color: AppColors.blue,
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 4.height,
  //                           )
  //                         ],
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),