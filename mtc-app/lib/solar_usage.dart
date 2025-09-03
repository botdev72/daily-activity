import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class SolarUsage {
  @HiveField(0)
  final String unit;
  @HiveField(1)
  final double hmAwal;
  @HiveField(2)
  final double hmAkhir;
  @HiveField(3)
  final double solarIsi;
  @HiveField(4)
  final DateTime tanggal;

  SolarUsage({
    required this.unit,
    required this.hmAwal,
    required this.hmAkhir,
    required this.solarIsi,
    required this.tanggal,
  });

  double get jamOperasi => hmAkhir - hmAwal;
  double get konsumsiPerJam => jamOperasi > 0 ? solarIsi / jamOperasi : 0;
}