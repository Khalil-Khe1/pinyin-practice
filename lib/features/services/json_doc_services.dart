import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class JsonAssetEditor {
  // Load JSON file from assets
  static Future<Map<String, dynamic>> loadJsonAsset(String assetPath) async {
    final jsonString = await rootBundle.loadString('docs/$assetPath');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  // Save modified JSON to app documents directory
  static Future<File> saveModifiedJson({
    required String assetPath,
    required Map<String, dynamic> jsonData,
  }) async {
    final file = File('docs/$assetPath');
    await file.writeAsString(jsonEncode(jsonData));
    return file;
  }

  // Update specific value in JSON
  static Future<void> updateJsonValue({
    required String assetPath,
    required String key,
    required dynamic value,
  }) async {
    // Load original JSON
    final jsonData = await loadJsonAsset(assetPath);

    // Update value
    jsonData[key] = value;

    // Save modified version
    await saveModifiedJson(
      assetPath: assetPath,
      jsonData: jsonData,
    );
  }

  // Remove entry from JSON
  static Future<void> removeJsonEntry({
    required String assetPath,
    required String key,
  }) async {
    final jsonData = await loadJsonAsset(assetPath);
    jsonData.remove(key);
    await saveModifiedJson(
      assetPath: assetPath,
      jsonData: jsonData,
    );
  }
}