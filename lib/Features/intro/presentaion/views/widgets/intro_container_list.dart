import 'package:adhd/Features/intro/presentaion/views/widgets/iintro_button.dart';
import 'package:adhd/Features/intro/presentaion/views/widgets/intro_container.dart';

import 'package:adhd/core/utils/dimensions/dimensions.dart';

import 'package:flutter/material.dart';

List<Widget> pages = [
  // ADHD
  const IntroContainer(
    image: 'Assets/Images/what.png',
    title: 'What is ADHA ?',
    description: ' ADHD is a common brain difference that can impact focus,organization, and staying still. But with the right tools you can thrive with ADHD! Our app is your personalized ADHD sidekick',
  ),
// Comunity
  const IntroContainer(
    image: 'Assets/Images/community.png',
    title: 'Community',
description: 'Chat privately with medical Specialists. providing personalized medical advice and support from healthcare professionals.',
  ),
  // games
  const IntroContainer(
    image: 'Assets/Images/games intro.png',
    title: 'Games',
description: 'Boost focus and memorizing for ADHD minds! These games combine captivating stories with interactive quizzes, making learning fun and engaging for kids with ADHD.',
  ),
    // Diagnosis
  const IntroContainer(
    image: 'Assets/Images/dignoses intro.png',
    title: 'Diagnosis',
description: 'Advanced diagnostics are available! If you have access to a functional magnetic resonance imaging (fMRI) scan. Don\'t worry if an fMRI isn\'t available. We can still explore alternative diagnostic option, By analyzing your phenotype data .',
  ),
// Note
  Column(
    children: [
      const IntroContainer(
        image: 'Assets/Images/note.png',
        title: 'Note', 
        description: 'Boost focus and memorizing for ADHD minds! These games combine captivating stories with interactive quizzes, making learning fun and engaging for kids with ADHD.',

      ),
      SizedBox(
        height: 50.height,
      ),
      const IntroButton(),
    ],
  ),
];
