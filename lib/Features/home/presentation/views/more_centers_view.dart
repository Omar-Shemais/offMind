import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:adhd/Features/home/manger/center_cubit/cubit/center_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/more_centers_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreCentersView extends StatelessWidget {
   MoreCentersView({super.key});
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CenterCubit(repository)..fetchCenters(),
      child: const MoreCentersViewBody());
  }
}
