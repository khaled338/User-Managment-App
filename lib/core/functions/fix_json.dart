import 'dart:convert';

Map<String, dynamic> fixAndParseJson(String invalidJson) {
  // Ensure proper JSON formatting: wrap keys & string values in double quotes
  String fixedJson = invalidJson.replaceAllMapped(
    RegExp(r'(\w+):\s*([^"{},\[\]]+)'),
    (match) {
      String key = match[1]!;
      String value = match[2]!;

      // If the value is not a number (or already in quotes), wrap it in quotes
      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value) && !value.startsWith('"')) {
        value = '"$value"';
      }

      return '"$key": $value';
    },
  );

  // Parse and return the corrected JSON as a Dart map
  return jsonDecode(fixedJson);
}
