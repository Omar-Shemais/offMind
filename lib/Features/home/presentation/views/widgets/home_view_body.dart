import 'package:adhd/Features/home/manger/center_cubit/cubit/center_cubit.dart';
import 'package:adhd/Features/home/manger/doctor_cubit/cubit/doctor_cubit.dart';
import 'package:adhd/Features/home/manger/specs_cubit/specs_cubit.dart';
import 'package:adhd/Features/home/presentation/views/more_centers_view.dart';
import 'package:adhd/Features/home/presentation/views/more_doctors_view.dart';
import 'package:adhd/Features/home/presentation/views/more_specialists_view.dart';
import 'package:adhd/Features/home/presentation/views/widgets/doctor_cart.dart';
import 'package:adhd/Features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/Features/home/presentation/views/widgets/center_cart_home.dart';
import 'package:adhd/Features/home/presentation/views/widgets/note_home.dart';
import 'package:adhd/Features/home/presentation/views/widgets/specs_cart.dart';
import 'package:adhd/Features/home/presentation/views/widgets/see_more.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.height,
              ),
              const Row(
                children: [
                  AppText(
                    title: 'Note',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const NoteHome(),
              SeeMore(
                tittle: 'Doctors',
                onTap: () => RouteUtils.push(MoreDoctorsView()),
              ),
              // doctors//
              BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  if (state is DoctorLoading) {
                    return const Center(child: AppLoadingIndicator());
                  } else if (state is DoctorError) {
                    return Center(child: Text(state.message));
                  } else if (state is DoctorLoaded) {
                    final doctors = state.doctors;
                    return GridView.builder(
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 7 / 10,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return DoctorCart(
                          doctor: doctors[index],
                          doctorImg: doctorImages[index],
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),

              // spes//
              SeeMore(
                tittle: 'Specialists',
                onTap: () => RouteUtils.push(MoreSpecialistsView()),
              ),
              
              BlocBuilder<SpecsCubit, SpecsState>(
                builder: (context, state) {
                  if (state is SpecsLoading) {
                    return const Center(child: AppLoadingIndicator());
                  } else if (state is SpecsError) {
                    return Center(child: Text(state.message));
                  } else if (state is SpecsLoaded) {
                    final specs = state.specs;
                    return GridView.builder(
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 7 / 10,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return SpecsCart(
                          specs: specs[index],
                          specsImg: specsImages[index],
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),

              // centers //
              SeeMore(
                tittle: 'Centers',
                onTap: () => RouteUtils.push(MoreCentersView()),
              ),
              BlocBuilder<CenterCubit, CenterState>(
                builder: (context, state) {
                  if (state is CenterLoading) {
                    return const Center(child: AppLoadingIndicator());
                  } else if (state is CenterError) {
                    return Center(child: Text(state.message));
                  } else if (state is CenterLoaded) {
                    final centers = state.centers;
                    return GridView.builder(
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 7 / 10,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return CenterHommeCart(
                          medicalCenter: centers[index],
                          centerImg: centerImages[index],
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),

              SizedBox(
                height: 100.height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
