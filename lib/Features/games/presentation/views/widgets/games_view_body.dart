import 'package:adhd/Features/games/presentation/views/widgets/games_list.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';

class GamesViewBody extends StatelessWidget {
  const GamesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100.height),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10, // Spacing between columns
            mainAxisSpacing: 10, // Spacing between rows
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: games.length, // Total number of items
          itemBuilder: (BuildContext context, int index) {
            return games[index];
          },
        ),
      ),
    );
  }
}
