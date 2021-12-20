// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'game.dart';

void main() {
  var playAgain = true;

  do {
    playGame();

    var ok = false;
    var input;
    do {
      stdout.write('Play again? (Y/N):');
      input = stdin.readLineSync().toString().toUpperCase();
      if (input == 'Y' || input == 'N') {
        ok = true;
      }
    } while (!ok);

    if (input == 'N') {
      playAgain = false;
    }
  } while (playAgain);
}

void playGame() {
  var game = Game();
  var isCorrect = false;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    int maxRandom = game.getMaxRandom();
    stdout.write('║ Guess the number between 1 and $maxRandom : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      var guessCount = game.getCount();
      print('║ ➜ $guess is CORRECT ❤, total guesses: $guessCount');
      print('╟────────────────────────────────────────');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
