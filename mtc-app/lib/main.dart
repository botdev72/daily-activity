import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'solar_usage.dart';
import 'input_page.dart';
import 'list_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SolarUsageAdapter());
  await Hive.openBox<SolarUsage>('solar_data');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Solar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Monitoring Solar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InputPage())),
              child: Text("Input Data"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ListPage())),
              child: Text("Lihat Laporan"),
            ),
          ],
        ),
      ),
    );
  }
}