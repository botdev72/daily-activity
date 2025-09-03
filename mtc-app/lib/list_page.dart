import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'solar_usage.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Laporan Penggunaan Solar")),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<SolarUsage>('solar_data').listenable(),
        builder: (context, Box<SolarUsage> box, widget) {
          if (box.isEmpty) {
            return Center(child: Text("Belum ada data"));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, i) {
              var item = box.getAt(i)!;
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ListTile(
                  title: Text("${item.unit} | ${item.tanggal.toString().split(' ')[0]}"),
                  subtitle: Text("${item.jamOperasi} jam operasi"),
                  trailing: Text("${item.konsumsiPerJam.toStringAsFixed(2)} L/jam"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}