import 'package:get/get.dart';

class CommissionModel {
  final String month;
  final double sales;
  final double commission;
  final String status;

  CommissionModel({required this.month, required this.sales, required this.commission, required this.status});
}

class AgentCommissionController extends GetxController {
  final RxDouble totalCommission = 124500.0.obs;
  final RxDouble currentMonth = 18400.0.obs;

  final selectedYear = "2025".obs;
  final typeFilter = "".obs;

  final commissionData = [
    CommissionModel(month: "ม.ค.", sales: 240000, commission: 15000, status: "จ่ายแล้ว"),
    CommissionModel(month: "ก.พ.", sales: 180000, commission: 12000, status: "จ่ายแล้ว"),
    CommissionModel(month: "มี.ค.", sales: 220000, commission: 13500, status: "รอดำเนินการ"),
    CommissionModel(month: "เม.ย.", sales: 190000, commission: 11800, status: "จ่ายแล้ว"),
    CommissionModel(month: "พ.ค.", sales: 260000, commission: 16500, status: "รอดำเนินการ"),
    CommissionModel(month: "มิ.ย.", sales: 275000, commission: 17200, status: "รอดำเนินการ"),
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
