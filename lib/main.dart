import 'package:flutter/material.dart';
import 'package:hive_example/model/example_data.dart';
import 'package:hive_example/screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<ExampleData>(ExampleDataAdapter());
  //   compactionStrategy 매개변수를 넣어주면 트래쉬 데이터가 쌓이는 문제 방지
  await Hive.openBox<ExampleData>(ExampleBox, compactionStrategy: (int total, int deleted) => total > 1,);

  // for (String key in keyList) {
    // await Hive.openBox<ExampleData>(key,compactionStrategy: (int total, int deleted) => total > 1,);
  // }

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
