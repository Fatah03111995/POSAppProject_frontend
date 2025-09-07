import 'package:flutter_pos_app/data/models/response/cashier_shift_response_model.dart';

class CloseCashierShiftResponseModel {
  final String? message;
  final Shift? shift;
  final int? difference;

  CloseCashierShiftResponseModel({
    this.message,
    this.shift,
    this.difference,
  });

  factory CloseCashierShiftResponseModel.fromJson(Map<String, dynamic> json) =>
      CloseCashierShiftResponseModel(
        message: json["message"],
        shift: json["shift"] == null ? null : Shift.fromJson(json["shift"]),
        difference: json["difference"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "shift": shift?.toJson(),
        "difference": difference,
      };
}

class Shift {
  final int? id;
  final int? cashierId;
  final int? openAmount;
  final int? closeAmount;
  final int? cashSales;
  final String? status;
  final DateTime? openedAt;
  final DateTime? closedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Shift({
    this.id,
    this.cashierId,
    this.openAmount,
    this.closeAmount,
    this.cashSales,
    this.status,
    this.openedAt,
    this.closedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        id: json["id"],
        cashierId: json["cashier_id"],
        openAmount: parseNullableInt(json["open_amount"]),
        closeAmount: parseNullableInt(json["close_amount"]),
        cashSales: parseNullableInt(json["cash_sales"]),
        status: json["status"] as String?,
        openedAt: parseNullableDateTime(json["opened_at"]),
        closedAt: parseNullableDateTime(json["closed_at"]),
        createdAt: parseNullableDateTime(json["created_at"]),
        updatedAt: parseNullableDateTime(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cashier_id": cashierId,
        "open_amount": openAmount,
        "close_amount": closeAmount,
        "cash_sales": cashSales,
        "status": status,
        "opened_at": openedAt?.toIso8601String(),
        "closed_at": closedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
