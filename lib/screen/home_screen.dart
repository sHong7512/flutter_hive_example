import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_example/model/example_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  late Box box = Hive.box<ExampleData>(ExampleBox);

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<ExampleData>(ExampleBox);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              putField(context),
              putButton(),
              checkValuesButton(),
              deleteAllButton(),
              listenableWidget(),
            ],
          ),
        ),
      ),
    );
  }

  final keyController = TextEditingController();
  final nameController = TextEditingController();
  final contentController = TextEditingController();
  final sizeController = TextEditingController();

  Widget putField(BuildContext context) {
    final ts = TextStyle(fontSize: 12);
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: ts,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Key',
              ),
              controller: keyController,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: ts,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              controller: nameController,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: ts,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Content',
              ),
              controller: contentController,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: ts,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Size',
              ),
              controller: sizeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
        ),
      ],
    );
  }

  Widget putButton() {
    return ElevatedButton(
      onPressed: () async {
        box.put(
          keyController.text,
          ExampleData(
            name: nameController.text,
            content: contentController.text,
            size: double.parse(sizeController.text.toString()),
          ),
        );
      },
      child: Text('put data'),
    );
  }

  Widget checkValuesButton() {
    return ElevatedButton(
      onPressed: () async {
        for (String key in box.keys) {
          log('<< $key >> name :: ${box.get(key)!.name}');
        }
      },
      child: Text('check data log'),
    );
  }

  Widget deleteAllButton() {
    return ElevatedButton(
      onPressed: () async {
        box.deleteAll(box.keys);
      },
      child: Text('delete all data'),
    );
  }

  Widget listenableWidget() {
    return ValueListenableBuilder<Box>(
      valueListenable: box.listenable(),
      builder: (context, box, widget) {
        return Column(
          children: box.keys.map((e) {
            final exampleData = box.get(e) as ExampleData;
            return Text(
                '<key $e> :: ${exampleData.name}, ${exampleData.content}, ${exampleData.size}');
          }).toList(),
        );
      },
    );
  }
}
