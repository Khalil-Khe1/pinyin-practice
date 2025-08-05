import 'package:flutter/material.dart';

import 'package:pinyin_quiz/features/controllers/practice_controller.dart';

import 'package:pinyin_quiz/features/pages/button.dart';
import 'package:pinyin_quiz/features/pages/dialog_box.dart';

import 'package:pinyin_quiz/features/services/audio_player.dart';

const BACKGROUND_COLOR = Color(0xFF1E2124);

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  late final ObservablePracticeController
  _observablePracticeController; // = ObservablePracticeController(_practiceController);

  final Audioplayer _audioplayer = Audioplayer();

  @override
  void initState() {
    super.initState();
    _observablePracticeController = ObservablePracticeController(
      PracticeController(),
    );
    _observablePracticeController.enableHalf(false);
    _observablePracticeController.pinyinSetup();
    print(
      _observablePracticeController.notifier.value.pinyinHandler.leftCandidate,
    );
    print(
      _observablePracticeController.notifier.value.pinyinHandler.rightCandidate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _observablePracticeController.notifier,
      builder: (contest, profile, _) {
        return Scaffold(
          backgroundColor: BACKGROUND_COLOR,
          body: Padding(
            padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
            child: Column(
              spacing: 8,
              children: [
                SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Column(
                      spacing: 8,
                      children: [
                        DefaultButton(
                          label: 'Speak',
                          onPressed: () async => {
                            await _audioplayer.play(
                              '${profile.pinyinHandler.getPinyinIdentity(profile.pinyinHandler.leftCandidate!)}.mp3',
                            ),
                          },
                          isEnabled: profile.map['ls']!.isEnabled,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Column(
                              spacing: 8,
                              children: [
                                DefaultButton(
                                  label: 'ˉ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l01',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(1, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l01']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l01']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˊ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l02',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(2, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l02']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l02']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˇ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l03',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(3, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l03']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l03']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˋ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l04',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(4, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l04']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l04']!.isEnabled,
                                ),
                              ],
                            ),
                            Column(
                              spacing: 8,
                              children: [
                                DefaultButton(
                                  label: 'ˉ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l11',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(1, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l11']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l11']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˊ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l12',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(2, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l12']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l12']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˇ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l13',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(3, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l13']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l13']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˋ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l14',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(4, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l14']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l14']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: '.',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l15',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkLeftAnswer(5, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l15']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l15']!.isEnabled,
                                ),
                              ],
                            ),
                          ],
                        ),
                        DefaultButton(
                          label: 'Confirm',
                          onPressed: () {
                            _observablePracticeController.enableHalf(true);
                          },
                          isEnabled: profile.map['lc']!.isEnabled,
                        ),
                        DefaultButton(
                          label: 'Blacklist',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Blacklist',
                                  content:
                                      'Are you sure you want to blacklist this word?',
                                  onOkay: () async {
                                    _observablePracticeController
                                        .notifier
                                        .value
                                        .pinyinHandler
                                        .blacklistWord(
                                          _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .leftCandidate!,
                                        );
                                    Navigator.of(context).pop();
                                  },
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        DefaultButton(
                          label: 'Speak',
                          onPressed: () async => {
                            await _audioplayer.play(
                              '${profile.pinyinHandler.getPinyinIdentity(profile.pinyinHandler.rightCandidate!)}.mp3',
                            ),
                          },
                          isEnabled: profile.map['rs']!.isEnabled,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Column(
                              spacing: 8,
                              children: [
                                DefaultButton(
                                  label: 'ˉ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l21',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(1, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l21']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l21']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˊ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l22',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(2, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l22']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l22']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˇ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l23',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(3, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l23']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l23']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˋ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l24',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(4, 0)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l24']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l24']!.isEnabled,
                                ),
                              ],
                            ),
                            Column(
                              spacing: 8,
                              children: [
                                DefaultButton(
                                  label: 'ˉ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l31',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(1, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l31']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l31']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˊ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l32',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(2, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l32']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l32']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˇ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l33',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(3, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l33']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l33']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: 'ˋ',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l34',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(4, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l34']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l34']!.isEnabled,
                                ),
                                DefaultButton(
                                  label: '.',
                                  onPressed: () {
                                    _observablePracticeController.updateColor(
                                      'l35',
                                      _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .checkRightAnswer(5, 1)
                                          ? Colors.lightGreenAccent
                                          : Colors.red,
                                    );
                                  },
                                  bgColor: profile.map['l35']!.bgColor,
                                  ph: 10,
                                  pv: 10,
                                  isEnabled: profile.map['l35']!.isEnabled,
                                ),
                              ],
                            ),
                          ],
                        ),
                        DefaultButton(
                          label: 'Confirm',
                          onPressed: () {
                            _observablePracticeController.enableAll(false);
                          },
                          isEnabled: profile.map['rc']!.isEnabled,
                        ),
                        DefaultButton(
                          label: 'Blacklist',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Blacklist',
                                  content:
                                      'Are you sure you want to blacklist this word?',
                                  onOkay: () async {
                                    _observablePracticeController
                                        .notifier
                                        .value
                                        .pinyinHandler
                                        .blacklistWord(
                                          _observablePracticeController
                                              .notifier
                                              .value
                                              .pinyinHandler
                                              .rightCandidate!,
                                        );
                                    Navigator.of(context).pop();
                                  },
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    DefaultButton(
                      label: 'Submit',
                      onPressed: () {
                        _observablePracticeController.revealColors();
                      },
                      isEnabled: profile.map['sb']!.isEnabled,
                    ),
                    DefaultButton(
                      label: 'Next',
                      onPressed: () async {
                        await _observablePracticeController.pinyinSetup();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
