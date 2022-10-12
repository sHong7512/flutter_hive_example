import 'package:hive_flutter/hive_flutter.dart';

part 'example_data.g.dart';

/// flutter pub run build_runner build
@HiveType(typeId: 0)
class ExampleData {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final double size;

  ExampleData({
    required this.name,
    required this.content,
    required this.size,
  });
}
const ExampleBox = 'Example';