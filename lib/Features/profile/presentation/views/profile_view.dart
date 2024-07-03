import 'package:adhd/Features/profile/manger/cubit/user_profile_cubit.dart';
import 'package:adhd/Features/profile/manger/profile_cubit.dart';
import 'package:adhd/Features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
       [
      BlocProvider(
        create: (context) => ProfileCubit(),
      ),
       BlocProvider(
        create: (context) => UserProfileCubit()..getAllUsers(),
      ),
    ], 
    
    child: ProfileViewBody());
  }
}