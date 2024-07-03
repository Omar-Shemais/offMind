import 'package:adhd/Features/home/manger/doctor_cubit/cubit/doctor_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/doctor_cart.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:adhd/core/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDoctorsViewBody extends StatelessWidget {
  const MoreDoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (query) {
          context.read<DoctorCubit>().searchDoctors(query);
        },
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.width, vertical: 10.height),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.width),
                child: const Row(
                  children: [
                    AppText(
                      title: 'Doctors',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  if (state is DoctorLoading) {
                    return const Center(child: AppLoadingIndicator());
                  } else if (state is DoctorError) {
                    return Center(child: Text(state.message));
                  } else if (state is DoctorLoaded) {
                    final doctors = state.doctors;
                    return GridView.builder(
                      itemCount: doctors.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 7 / 10,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
