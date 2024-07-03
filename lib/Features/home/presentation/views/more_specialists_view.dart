import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:adhd/Features/home/manger/specs_cubit/specs_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/more_specialists_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreSpecialistsView extends StatelessWidget {
   MoreSpecialistsView({super.key});
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecsCubit(repository)..fetchSpecs(),
      child: const MoreSpecialistsViewBody());
  }
}