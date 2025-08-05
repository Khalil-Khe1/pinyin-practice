import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinyin_quiz/features/pages/dialog_box.dart';
import 'package:pinyin_quiz/features/services/pinyin.dart';

const BUTTON_COLOR = Color(0xFF424549);

class OptionController {
  Color bgColor = BUTTON_COLOR;
  Color confirmColor = Colors.white;
  bool isEnabled = true;

  void setColor(Color color) {
    bgColor = color;
    print('color changed');
  }

  void setConfirmColor(Color color) {
    confirmColor = color;
  }

  void setEnable(bool enable) {
    isEnabled = enable;
  }
}

class PracticeController {
  final OptionController tone01 = OptionController();
  final OptionController tone02 = OptionController();
  final OptionController tone03 = OptionController();
  final OptionController tone04 = OptionController();

  final OptionController tone11 = OptionController();
  final OptionController tone12 = OptionController();
  final OptionController tone13 = OptionController();
  final OptionController tone14 = OptionController();
  final OptionController tone15 = OptionController();

  final OptionController tone21 = OptionController();
  final OptionController tone22 = OptionController();
  final OptionController tone23 = OptionController();
  final OptionController tone24 = OptionController();

  final OptionController tone31 = OptionController();
  final OptionController tone32 = OptionController();
  final OptionController tone33 = OptionController();
  final OptionController tone34 = OptionController();
  final OptionController tone35 = OptionController();

  final OptionController confirmLeft = OptionController();
  final OptionController confirmRight = OptionController();

  final OptionController speakLeft = OptionController();
  final OptionController speakRight = OptionController();

  final OptionController submit = OptionController();

  late final Map<String, OptionController> map;
  late final Map<String, List<String>> columns;

  final PinyinHandler pinyinHandler = PinyinHandler();

  PracticeController() {
    map = {
      // First row tones
      'l01': tone01,
      'l02': tone02,
      'l03': tone03,
      'l04': tone04,

      // Second row tones
      'l11': tone11,
      'l12': tone12,
      'l13': tone13,
      'l14': tone14,
      'l15': tone15,

      // Third row tones
      'l21': tone21,
      'l22': tone22,
      'l23': tone23,
      'l24': tone24,

      // Fourth row tones
      'l31': tone31,
      'l32': tone32,
      'l33': tone33,
      'l34': tone34,
      'l35': tone35,

      // Confirm buttons
      'lc': confirmLeft,
      'rc': confirmRight,

      // Speak buttons
      'ls': speakLeft,
      'rs': speakRight,

      // Submit
      'sb': submit
    };

    columns = {
      'l1': ['l01', 'l02', 'l03', 'l04'],
      'l2': ['l11', 'l12', 'l13', 'l14', 'l15'],
      'r1': ['l21', 'l22', 'l23', 'l24'],
      'r2': ['l31', 'l32', 'l33', 'l34', 'l35'],
      'lc': ['lc'],
      'rc': ['rc'],
      'ls': ['ls'],
      'rs': ['rs'],
      'sb': ['sb']
    };
  }
}

class ObservablePracticeController {
  late ValueNotifier<PracticeController> _practiceController;

  ObservablePracticeController(PracticeController initialProfile)
    : _practiceController = ValueNotifier(initialProfile);

  ValueNotifier<PracticeController> get notifier => _practiceController;

  void updateColor(String key, Color color) {
    for (String col in notifier.value.columns.keys) {
      List<String> list = notifier.value.columns[col]!;
      if (list.contains(key)) {
        for (String tmp_key in list) {
          print(tmp_key);
          notifier.value.map[tmp_key]!.setColor(BACKGROUND_COLOR);
        }
        break;
      }
    }

    notifier.value.map[key]!.setColor(Colors.pink);
    notifier.value.map[key]!.setConfirmColor(color);
    notifier.notifyListeners();
  }

  void revealColors() {
    for (String col in notifier.value.columns.keys) {
      List<String> list = notifier.value.columns[col]!;
      if ((!list.contains('rc')) || (!list.contains('lc'))) {
        for (String key in list) {
          /*if (notifier.value.map[key]!.bgColor == Colors.pink) {
            notifier.value.map[key]!.setColor(notifier.value.map[key]!.confirmColor);
          }*/
          if (['l01', 'l02', 'l03', 'l04', 'l11', 'l12', 'l13', 'l14', 'l15'].contains(key)) {
            notifier.value.map[key]!.setColor(
              notifier.value.pinyinHandler.checkLeftAnswer(int.parse(key[2]), 0)
                  ? Colors.lightGreenAccent
                  : notifier.value.map[key]!.confirmColor,
            );
            continue;
          }
          if (['l11', 'l12', 'l13', 'l14', 'l15'].contains(key)) {
            notifier.value.map[key]!.setColor(
              notifier.value.pinyinHandler.checkLeftAnswer(int.parse(key[2]), 1)
                  ? Colors.lightGreenAccent
                  : notifier.value.map[key]!.confirmColor,
            );
            continue;
          }
          if (['l21', 'l22', 'l23', 'l24'].contains(key)) {
            notifier.value.map[key]!.setColor(
              notifier.value.pinyinHandler.checkRightAnswer(int.parse(key[2]), 0)
                  ? Colors.lightGreenAccent
                  : notifier.value.map[key]!.confirmColor,
            );
            continue;
          }
          if (['l31', 'l32', 'l33', 'l34', 'l35'].contains(key)) {
            notifier.value.map[key]!.setColor(
              notifier.value.pinyinHandler.checkRightAnswer(int.parse(key[2]), 1)
                  ? Colors.lightGreenAccent
                  : notifier.value.map[key]!.confirmColor,
            );
            continue;
          }
          /*notifier.value.map[key]!.setColor(
            notifier.value.map[key]!.confirmColor,
          );*/
        }
      }
    }
    notifier.notifyListeners();
  }

  void resetColors() {
    for (String col in notifier.value.columns.keys) {
      List<String> list = notifier.value.columns[col]!;
      for (String key in list) {
        notifier.value.map[key]!.setColor(BACKGROUND_COLOR);
        notifier.value.map[key]!.setConfirmColor(Colors.white);
      }
    }
    notifier.notifyListeners();
  }

  void enableHalf(bool right) {
    for (String col in notifier.value.columns.keys) {
      if (col.contains('r')) {
        for (String key in notifier.value.columns[col]!) {
          notifier.value.map[key]!.setEnable(right);
        }
      } else {
        for (String key in notifier.value.columns[col]!) {
          notifier.value.map[key]!.setEnable(!right);
        }
      }
    }
    notifier.notifyListeners();
  }

  void enableAll(bool enable) {
    for (String col in notifier.value.columns.keys) {
      for (String key in notifier.value.columns[col]!) {
        notifier.value.map[key]!.setEnable(enable);
      }
    }
    notifier.value.map['sb']!.isEnabled = !enable;
    notifier.notifyListeners();
  }

  Future<void> pinyinSetup() async {
    await notifier.value.pinyinHandler.setup();
    resetColors();
    enableHalf(false);
    notifier.value.map['sb']!.isEnabled = false;
    notifier.notifyListeners();
  }
}
