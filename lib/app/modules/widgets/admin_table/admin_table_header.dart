import 'package:frontend/app/lib_view.dart';

class AdminTableHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String> onSearch;
  final VoidCallback? onAdd;
  final TextEditingController searchController;

  const AdminTableHeader({
    super.key,
    required this.title,
    required this.onSearch,
    this.onAdd,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.titleLarge.bold.color(AppColor.primary),
        Row(
          children: [
            SizedBox(
              width: 360,
              child: TextField(
                controller: searchController,
                onChanged: onSearch,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87, // ✅ สำคัญมาก
                ),
                cursorColor: Colors.black87,

                decoration: InputDecoration(
                  hintText: 'ค้นหา...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      searchController.clear();
                      onSearch('');
                    },
                  ),
                  isDense: true,
                  filled: true, // ✅ ต้องใส่
                  fillColor: Colors.white, // ✅ พื้นหลัง
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary.soft),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            if (onAdd != null)
              AppButton(
                text: "เพิ่มข้อมูล",
                icon: Icons.add,
                onPressed: onAdd,
                status: AppColors.secondary,
                variant: AppButtonVariant.soft,
              ),
          ],
        ),
      ],
    );
  }
}
