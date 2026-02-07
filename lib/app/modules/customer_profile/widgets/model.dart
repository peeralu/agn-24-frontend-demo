import 'package:frontend/app/lib_controller.dart';
import 'package:frontend/app/lib_view.dart';

import '../customer_profile_controller.dart';

import 'vehicle_insurance.dart';

class ModelWidget extends GetView<CustomerProfileController> {
  const ModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSize.md),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.vehicles.map(
              (vehicle) => Padding(
                padding: const EdgeInsets.only(bottom: AppSize.md),
                child: VehicleInsuranceCard(
                  carName: vehicle["carName"] as String,
                  licensePlate: vehicle["licensePlate"] as String,
                  insuranceType: vehicle["insuranceType"] as String,
                  company: vehicle["company"] as String,
                  expireDate: vehicle["expireDate"] as String,
                  status: vehicle["status"] as String,
                  ownerName: vehicle["ownerName"] as String,
                  carColor: vehicle["carColor"] as String,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
