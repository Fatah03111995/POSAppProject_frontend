import 'dart:convert';

class PrinterModel {
  final String name;
  final String? macAddress;
  final int paperWidth;

  PrinterModel({
    required this.name,
    required this.macAddress,
    required this.paperWidth,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mac_address': macAddress,
      'paper_width': paperWidth,
    };
  }

  factory PrinterModel.fromMap(Map<String, dynamic> map) {
    return PrinterModel(
      name: map['name'],
      macAddress: map['mac_address'],
      paperWidth: map['paper_width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PrinterModel.fromJson(String source) =>
      PrinterModel.fromMap(json.decode(source));
}
