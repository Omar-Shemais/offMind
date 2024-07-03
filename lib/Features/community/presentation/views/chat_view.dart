import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:adhd/Features/community/manger/cubit/ChatCubit/cubit.dart';
import 'package:adhd/Features/community/presentation/views/chat_detailes_view.dart';
import 'package:adhd/Features/community/presentation/views/widgets/online_avater.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/constants/constants.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit()..getUsers(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: const AppText(
            title: 'Online Doctors',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ChatsCubit, ChatsStates>(
          builder: (context, state) {
            if (state is ChatsLoading) {
              return const Center(
                child: AppLoadingIndicator(),
              );
            }
            final users = BlocProvider.of<ChatsCubit>(context).users;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const OnlineAvater(),
                      SizedBox(
                        width: 15.width,
                      ),
                      const OnlineAvater(),
                      SizedBox(
                        width: 15.width,
                      ),
                      const OnlineAvater(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => RouteUtils.push(
                          ChatDetailsView(
                            user: users[index],
                          ),
                        ),
                        child: Container(
                          height: 100.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CircleAvatar(
                                  radius: 38.0,
                                  backgroundImage: AssetImage(
                                      Constants.defultProfileImage),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      title: users[index].name,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5.height,
                                    ),
                                    RatingBarIndicator(
                                      rating: 5,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      itemCount: 5,
                                      itemSize: 25.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40.height,
                                      width: 40.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.gray.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20.height),
                  ),
                ),
                SizedBox(height: 50.height,)
              ],
            );
          },
        ),
      ),
    );
  }
}
