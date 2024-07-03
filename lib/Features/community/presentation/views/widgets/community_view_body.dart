import 'package:adhd/Features/community/presentation/views/chat_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const AppText(
          title: 'Community',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: AppColors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CustomButton(
            btnText: 'chat with Dectors',
            onTap: () => RouteUtils.push(const ChatsView()),
            height: 60,
            width: 300,
          ),
          SizedBox(
            height: 40.height,
          ),
          const CustomButton(
            btnText: 'Chat with others',
            height: 60,
            width: 300,
          )
        ],
      ),
    );
  }
}
