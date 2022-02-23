import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get your random animal'),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: chose_animal(),
        ),
      ),
    );
  }
}

class chose_animal extends StatefulWidget {
  const chose_animal({Key? key}) : super(key: key);

  @override
  _chose_animalState createState() => _chose_animalState();
}

class _chose_animalState extends State<chose_animal> {
  @override
  Widget build(BuildContext context) {
    return buildAnimal();
  }

  void playSound(int track) {
    AudioCache player = AudioCache(prefix: 'assets/');
    player.play('animal$track.wav');
  }

  Center buildAnimal() {
    int animal = Random().nextInt(2) + 1;
    AssetImage panimal = AssetImage('images/sakura.png');
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          setState(
            () {
              animal = Random().nextInt(2) + 1;
            },
          );
          playSound(animal);
        },
        child: Image(
          image: AssetImage('images/animal$animal.png'),
        ),
      ),
    );
  }
}
