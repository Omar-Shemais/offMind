import 'package:adhd/Features/games/presentation/views/widgets/game_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
List<Widget> games = [
  // FOCUS
const GameContainer(gameName: 'FOCUS', gameImg: 'Assets/Images/gameFoucas.jpg',gameIcon: FontAwesomeIcons.bullseye,),
  // NAME RECALL
const GameContainer(gameName: 'NAME RECALL', gameImg: 'Assets/Images/gameRecal.jpg',gameIcon: Icons.person,),
  // RETENTION
const GameContainer(gameName: 'RETENTION', gameImg: 'Assets/Images/gameRetention.jpg',gameIcon: FontAwesomeIcons.earListen,),
  // SEQUENCING
const GameContainer(gameName: 'SEQUENCING', gameImg: 'Assets/Images/gameSequencing.jpg',gameIcon: FontAwesomeIcons.chartBar,),
  // SYNTHESIS
const GameContainer(gameName: 'SYNTHESIS', gameImg: 'Assets/Images/gameSynthesis.png',gameIcon: FontAwesomeIcons.shareNodes,),
  // PLAY A RANDOM GAME
const GameContainer(gameName: 'RANDOM GAME', gameImg: 'Assets/Images/gameRandom.jpg'),
];