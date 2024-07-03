import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:adhd/Features/home/manger/center_cubit/cubit/center_cubit.dart';
import 'package:adhd/Features/home/manger/doctor_cubit/cubit/doctor_cubit.dart';
import 'package:adhd/Features/home/manger/specs_cubit/specs_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
       providers: [
         BlocProvider(
          create: (context) => CenterCubit(repository)..fetchCenters(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit(repository)..fetchDoctors(),
        ),
        BlocProvider(
          create: (context) => SpecsCubit(repository)..fetchSpecs(),
        ),

      ],
      
      
      
      child:   const HomeViewBody());
  }
}