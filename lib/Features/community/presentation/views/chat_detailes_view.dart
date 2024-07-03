import 'package:adhd/Features/community/manger/cubit/ChatDetailesCubit/cubit.dart';
import 'package:adhd/Features/siginup/presentation/views/widgets/custom_text_field.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/constants/constants.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: library_prefixes
import '../../models/user.dart' as User;

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User.User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatDetailsCubit(user: user)..getMessages(),
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: BlocBuilder<ChatDetailsCubit, ChatDetailsStates>(
          builder: (context, state) {
            if (state is ChatDetailsLoading) {
              return const Center(
                child: AppLoadingIndicator(),
              );
            }
            final cubit = BlocProvider.of<ChatDetailsCubit>(context);
            final messages = cubit.messages;
            return Column(
              children: [
                SizedBox(
                  height: 50.height,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => RouteUtils.pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                        )),
                    const CircleAvatar(
                      radius: 38.0,
                      backgroundImage:  AssetImage(
                                      Constants.defultProfileImage),
                      child: Align(
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                    SizedBox(
                      width: 10.width,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: user.name,
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        const AppText(
                          title: 'Online',
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.height,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const AppText(title: 'Today'),
                          Expanded(
                            child: ListView.builder(
                              reverse: true,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                final message = messages[index];
                                final isMe = message.uid ==
                                    FirebaseAuth.instance.currentUser?.uid;
                                return Row(
                                  mainAxisAlignment: isMe
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    UnconstrainedBox(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 10,
                                          maxWidth: 300,
                                        ),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 12),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            borderRadius:isMe
                                                 ?const BorderRadius.only(
                                              bottomLeft: Radius.circular(18),
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18),
                                                 )
                                                :const BorderRadius.only(
                                              bottomRight: Radius.circular(18),
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18),
                                            ),

                                            color: isMe
                                                ? AppColors.blue
                                                : AppColors.gray,
                                          ),
                                          child: AppText(
                                            title: message.message,
                                            color: isMe
                                                ? AppColors.white
                                                : AppColors.darkGray,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hint: 'Type something...',
                                  controller: cubit.textEditingController,
                                  isObsecure: false,
                                  textInputAction: TextInputAction.send,
                                  suffixIcon: InkWell(
                                    onTap: cubit.sendMessage,
                                    child: const Icon(
                                      Icons.send_outlined,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40.height,
                                width: 40.width,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.mic,
                                  color: AppColors.blue,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
