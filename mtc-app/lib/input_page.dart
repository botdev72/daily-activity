import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'solar_usage.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final unitCtrl = TextEditingController();
  final hmAwalCtrl = TextEditingController();
  final hmAkhirCtrl = TextEditingController();
  final solarCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Data")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Unit"),
                controller: unitCtrl,
                validator: (v) => v!.isEmpty ? "Isi unit" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "HM Awal"),
                controller: hmAwalCtrl,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Isi HM awal" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "HM Akhir"),
                controller: hmAkhirCtrl,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Isi HM akhir" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Solar Diisi (L)"),
                controller: solarCtrl,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Isi jumlah solar" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final data = SolarUsage(
                      unit: unitCtrl.text,
                      hmAwal: double.parse(hmAwalCtrl.text),
                      hmAkhir: double.parse(hmAkhirCtrl.text),
                      solarIsi: double.parse(solarCtrl.text),
                      tanggal: DateTime.now(),
                    );
                    await Hive.box<SolarUsage>('solar_data').add(data);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data tersimpan!")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}