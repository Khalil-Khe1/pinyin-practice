import 'dart:math';
import 'package:pinyin_quiz/features/data/pinyin_dictionary.dart';
import 'package:pinyin_quiz/features/services/session.dart';
//import 'package:pinyin_quiz/features/services/json_doc_services.dart';

class PinyinHandler {
  late Map<String, Map<String, List<int>>> dictionary = pinyin_dictionary;
  int score = 0;

  String? pinyin;
  String? leftCandidate;
  String? rightCandidate;
  List<int>? leftAnswers;
  List<int>? rightAnswers;

  void setLeftCandidate(String candidate, List<int> answers) {
    leftCandidate = candidate;
    leftAnswers = answers;
  }

  void setRightCandidate(String candidate, List<int> answers) {
    rightCandidate = candidate;
    rightAnswers = answers;
  }

  String pickPinyin() {
    final mapKeys = dictionary.keys;
    final random = Random(DateTime
        .now()
        .millisecondsSinceEpoch);
    final index = random.nextInt(mapKeys.length);
    print(index);
    pinyin = mapKeys.elementAt(index);
    return pinyin!;
  }

  Future<List<String>> pickCandidates(String pinyin) async {
    final random = Random(DateTime
        .now()
        .millisecondsSinceEpoch);
    List<String> selected = [];
    Map<String, List<int>> candidates = dictionary[pinyin]!;
    List<String> keys = candidates.keys.toList();
    keys.shuffle(random);
    for (String key in keys) {
      String? blacklisted = await AppPreferences.getString(pinyin);
      if (blacklisted == null) {
        selected.add(key);
      } else {
        if (!blacklisted.contains(key)){
          selected.add(key);
        }
      }
      if (selected.length >= 2) break;
    }
    return selected;
  }

  Future<void> setup() async {
    List<String> candidates = [];
    while (candidates.length != 2){
      candidates = await pickCandidates(pickPinyin());
    }

    setLeftCandidate(candidates[0], dictionary[pinyin]![candidates[0]]!);
    setRightCandidate(candidates[1], dictionary[pinyin]![candidates[1]]!);
  }

  bool checkLeftAnswer(int tone, int slot) {
    List<int> answer = dictionary[pinyin]![leftCandidate]!;
    return (answer[slot] == tone);
  }

  bool checkRightAnswer(int tone, int slot) {
    List<int> answer = dictionary[pinyin]![rightCandidate]!;
    return (answer[slot] == tone);
  }

  Future<void> blacklistWord(String word) async {
    String? previous_entry = await AppPreferences.getString(pinyin!);
    print(previous_entry);
    if (previous_entry == null) {
      AppPreferences.saveString(pinyin!, word);
    } else {
      AppPreferences.saveString(pinyin!, '$previous_entry*$word');
    }

  }
}
