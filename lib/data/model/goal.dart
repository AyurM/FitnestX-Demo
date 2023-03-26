import 'dart:convert';

class Goal {
  final int id;
  final String assetPath;
  final String title;
  final String subtitle;

  const Goal({
    required this.id,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      id: map['id']?.toInt() ?? 0,
      assetPath: map['asset_path'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  factory Goal.fromJson(String source) => Goal.fromMap(json.decode(source));
}
