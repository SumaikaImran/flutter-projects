import 'dart:io';

void main() {
  final env = File('.env');
  final output = File('android/key.properties');

  if (!env.existsSync()) {
    print("❌ .env file not found.");
    return;
  }

  final lines = env.readAsLinesSync();
  final keyLine = lines.firstWhere(
    (line) => line.startsWith('Google_Api_Key ='),
    orElse: () => '',
  );

  if (keyLine.isEmpty) {
    print("❌ GOOGLE_MAPS_API_KEY not found in .env.");
    return;
  }

  output.writeAsStringSync(keyLine);
  print("✅ Key copied to android/key.properties");
}
