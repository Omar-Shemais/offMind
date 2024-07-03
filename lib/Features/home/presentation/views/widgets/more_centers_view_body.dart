import 'package:adhd/Features/home/manger/center_cubit/cubit/center_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/center_cart_home.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:adhd/core/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreCentersViewBody extends StatelessWidget {
  const MoreCentersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (query) {
          context.read<CenterCubit>().searchCenters(query);
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
                      title: 'Centers',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
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
                      itemCount: centers.length,
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
                        return CenterHommeCart(
                          medicalCenter: centers[index], centerImg: centerImages[index],
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
