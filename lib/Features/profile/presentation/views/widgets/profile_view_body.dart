import 'dart:io';
import 'package:adhd/Features/community/presentation/views/chat_view.dart';
import 'package:adhd/Features/login/presentation/views/login_view.dart';
import 'package:adhd/Features/profile/data/profile_auth.dart';
import 'package:adhd/Features/profile/manger/profile_cubit.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/delete_acc_view.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/logout_button.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/profile_image.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/profile_item.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/reset_password.dart';
import 'package:adhd/Features/test/presentation/views/test_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/constants/constants.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/app_dialog.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({
    super.key,
  });

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      context.read<ProfileCubit>().setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      primary: false,
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              // fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 65.height),
                  width: double.infinity,
                  height: 120.height,
                  decoration: const BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                ),
                BlocBuilder<ProfileCubit, File?>(
                  builder: (context, image) {
                    return image == null
                        ? ProfileImageContainer(
                            image: InkWell(
                              onTap: () => _pickImage(context),
                              child: CircleAvatar(
                                  radius: 60.height,
                                  backgroundColor: AppColors.white,
                                  backgroundImage: const AssetImage(
                                      Constants.defultProfileImage)),
                            ),
                          )
                        : ProfileImageContainer(
                            image: InkWell(
                              onTap: () => _pickImage(context),
                              child: CircleAvatar(
                                  radius: 60.height,
                                  backgroundColor: AppColors.white,
                                  backgroundImage:
                                      // ignore: unnecessary_null_comparison
                                      image != null ? FileImage(image) : null),
                            ),
                          );
                  },
                ),
              ],
            ),
            FutureBuilder<DocumentSnapshot>(
              future: ProfileAuth().getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: AppLoadingIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(child: Text('User data not found'));
                }
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.width),
                  child: Column(
                    children: [
                      AppText(
                        title: data['name'] ?? '',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        title: data['email'] ?? '',
                        fontSize: 17,
                        color: AppColors.darkGray,
                      ),
                      SizedBox(
                        height: 20.height,
                      ),
                      const Row(
                        children: [
                          AppText(
                            title: 'My Account',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.height,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
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
                              InkWell(
                                onTap: () => RouteUtils.push(const TestView()),
                                child: const ProfileItem(
                                  title: 'Previous Tests',
                                  icon: FontAwesomeIcons.fileCircleCheck,
                                ),
                              ),
                              const Divider(
                                endIndent: 0,
                                indent: 0,
                                thickness: 3,
                                color: AppColors.gray,
                              ),
                              InkWell(
                                onTap: () => RouteUtils.push(const ChatsView()),
                                child: const ProfileItem(
                                  title: 'Inbox',
                                  icon: Icons.archive,
                                ),
                              ),
                              const Divider(
                                endIndent: 0,
                                indent: 0,
                                thickness: 3,
                                color: AppColors.gray,
                              ),
                              const ProfileItem(
                                title: 'Wallet',
                                icon: FontAwesomeIcons.wallet,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.height),
                      const Row(
                        children: [
                          AppText(
                            title: 'Settings',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.height,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
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
                              // ProfileItem(
                              //   title: 'Details',
                              //   icon: Icons.content_paste_search,
                              // ),
                              // Divider(
                              //   endIndent: 0,
                              //   indent: 0,
                              //   thickness: 3,
                              //   color: AppColors.gray,
                              // ),

                              InkWell(
                                onTap: () =>
                                    RouteUtils.push(ResetPasswordView()),
                                child: const ProfileItem(
                                  title: 'Change password',
                                  icon: FontAwesomeIcons.lock,
                                ),
                              ),
                              const Divider(
                                endIndent: 0,
                                indent: 0,
                                thickness: 3,
                                color: AppColors.gray,
                              ),
                              InkWell(
                                onTap: () async {
                                  RouteUtils.push( DeleteAccountView());
                                },
                                child: const ProfileItem(
                                  title: 'Delete Account',
                                  icon: FontAwesomeIcons.userXmark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.height,
                      ),
                      LogoutButtton(
                        btnText: 'Logout',
                        width: 200.width,
                        onTap: () async {
                          // FirebaseAuth.instance.signOut();
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
                      ),
                      // SizedBox(
                      //   height: 100.height,
                      // ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
