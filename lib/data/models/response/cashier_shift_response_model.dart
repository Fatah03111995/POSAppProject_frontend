class CashierShiftResponseModel {
  final Shift? shift;

  CashierShiftResponseModel({this.shift});

  factory CashierShiftResponseModel.fromJson(Map<String, dynamic> json) =>
      CashierShiftResponseModel(
        shift: json["shift"] == null ? null : Shift.fromJson(json["shift"]),
      );

  Map<String, dynamic> toJson() => {
        "shift": shift?.toJson(),
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
        id: json["id"] as int?,
        cashierId: json["cashier_id"] as int?,
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

int? parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return double.tryParse(value)?.toInt();
  return null;
}

DateTime? parseNullableDateTime(dynamic value) {
  if (value == null) return null;
  return DateTime.tryParse(value);
}
