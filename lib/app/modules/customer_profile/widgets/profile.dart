import 'package:frontend/app/lib_view.dart';

import '../customer_profile_controller.dart';

class ProfileWidget extends GetView<CustomerProfileController> {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: Card(
        color: AppColors.grey.color.withAlpha(10),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.primary.color.withAlpha(30), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(radius: 48, backgroundImage: AssetImage('assets/images/avatar.png')),
              const SizedBox(height: 16),
              Text(
                "นายสมชาย ใจดี",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),
              Text(
                "somchai@example.com",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),

              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "สถานะ: ใช้งานอยู่",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(height: 0.5),
              ListTile(
                leading: Icon(Icons.badge_outlined, color: AppColors.secondary.text.withAlpha(30)),
                title: const Text("รหัสลูกค้า: CUST-001234"),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined, color: AppColors.secondary.text.withAlpha(30)),
                title: const Text("วันที่สมัคร: 01/08/2023"),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined, color: AppColors.secondary.text.withAlpha(30)),
                title: const Text("เบอร์โทร: 081-234-5678"),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined, color: AppColors.secondary.text.withAlpha(30)),
                title: const Text("อีเมล: somchai@example.com"),
              ),
              ListTile(
                leading: Icon(Icons.date_range_outlined, color: AppColors.secondary.text.withAlpha(30)),
                title: const Text("Line: -"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
