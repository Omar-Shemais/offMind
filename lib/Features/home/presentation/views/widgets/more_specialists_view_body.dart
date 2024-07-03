import 'package:adhd/Features/home/manger/specs_cubit/specs_cubit.dart';
import 'package:adhd/Features/home/presentation/views/widgets/specs_cart.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:adhd/core/widgets/medical_img_list.dart';
import 'package:adhd/core/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreSpecialistsViewBody extends StatelessWidget {
  const MoreSpecialistsViewBody({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (query) {
          context.read<SpecsCubit>().searchSpecs(query);
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
                      title: 'Specialists',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
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
                      itemCount: specs.length,
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
                        return SpecsCart(
                          specs: specs[index], specsImg: specsImages[index],
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

