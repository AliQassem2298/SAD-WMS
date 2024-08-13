import 'package:warehouse_manegment_system/staff/model/models/supplier_model.dart';

class ListShipmentModel {
  final int id;
  final SupplierModel supplierModel;
  final String arrivalDate;
  final String? receiveDate;
  final String status;

  ListShipmentModel({
    required this.id,
    required this.supplierModel,
    required this.arrivalDate,
    this.receiveDate,
    required this.status,
  });

  factory ListShipmentModel.fromJson(jsonData) {
    return ListShipmentModel(
      id: jsonData['id'],
      supplierModel: SupplierModel.fromJson(jsonData['supplier']),
      arrivalDate: jsonData['arrival_date'],
      receiveDate: jsonData['receive_date'] ?? null,
      status: jsonData['status'],
    );
  }
}
