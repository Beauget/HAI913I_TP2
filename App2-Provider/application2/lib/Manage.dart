// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'question.dart';

import 'package:flutter/material.dart';

class Manage extends ChangeNotifier {
  int score = 0;
  void checkAnswer(bool userPickedAnswer, BuildContext context) {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();
    if (QuizzQuestion.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finit',
        desc: 'Votre score est de ' + score.toString(),
      ).show();
      QuizzQuestion.reset();
      score = 0;
    } else {
      if (userPickedAnswer == correctAnswer) {
        score = score + 1;
      }
      QuizzQuestion.nextQuestion();
    }
    notifyListeners();
  }

  void checkAnswerNext(BuildContext context) {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();

    if (QuizzQuestion.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finit',
        desc: 'Votre score est de ' + score.toString(),
      ).show();
      QuizzQuestion.reset();
      score = 0;
    } else {
      QuizzQuestion.nextQuestion();
    }
    notifyListeners();
  }
}
