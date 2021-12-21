import 'dart:math';

// ignore_for_file: avoid_print

class Game {
  static const _maxRandom = 100;
  int? _answer;
  int _guessCount = 0;

  Game() {
    var r = Random();
    _answer = r.nextInt(_maxRandom) + 1;
  }

  int doGuess(int num) {
    _doCount();
    if (_answer! == num) {
      return 0;
    } else if (_answer! < num) {
      return 1;
    } else {
      return -1;
    }
  }

  int getMaxRandom() {
    return _maxRandom;
  }

  _doCount() {
    _guessCount++;
  }

  int getCount() {
    return _guessCount;
  }
}
