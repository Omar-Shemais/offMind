import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:adhd/Features/home/manger/doctor_cubit/cubit/doctor_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/more_doctors_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDoctorsView extends StatelessWidget {

   MoreDoctorsView({super.key});
   final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context) => DoctorCubit(repository)..fetchDoctors(),
      child: const MoreDoctorsViewBody());
  }
}