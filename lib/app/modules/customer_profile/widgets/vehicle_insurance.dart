import 'package:frontend/app/lib_view.dart';

import '../customer_profile_controller.dart';

class VehicleInsuranceCard extends GetView<CustomerProfileController> {
  final String carName;
  final String licensePlate;
  final String insuranceType;
  final String company;
  final String expireDate;
  final String status;
  final String ownerName;
  final String carColor;

  const VehicleInsuranceCard({
    super.key,
    required this.carName,
    required this.licensePlate,
    required this.insuranceType,
    required this.company,
    required this.expireDate,
    required this.status,
    required this.ownerName,
    required this.carColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.success.soft,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== รถ + สถานะ =====
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.primary.soft, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.directions_car, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carName,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14),
                          const SizedBox(width: 4),
                          Text(ownerName, style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(width: 12),
                          const Icon(Icons.color_lens, size: 14),
                          const SizedBox(width: 4),
                          Text(carColor, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                _statusBadge(status),
              ],
            ),

            const SizedBox(height: 8),
            Text("ทะเบียน: $licensePlate", style: Theme.of(context).textTheme.bodySmall),

            const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider()),

            /// ===== ประกัน =====
            Row(
              children: [
                const Icon(Icons.shield, size: 18),
                const SizedBox(width: 6),
                Text(
                  insuranceType,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text("บริษัท: $company"),
            Text("หมดอายุ: $expireDate"),

            const SizedBox(height: 12),

            /// ===== Actions =====
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text("ดูรายละเอียด")),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () {}, child: const Text("ต่ออายุ")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(String status) {
    final color = statusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withAlpha(30), borderRadius: BorderRadius.circular(20)),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Color statusColor(String status) {
    switch (status) {
      case 'ACTIVE':
        return Colors.green;
      case 'EXPIRE_SOON':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
