import 'package:frontend/app/lib_view.dart' hide AppColors;
import 'package:frontend/app/modules/widgets/widgets.dart';

class AdminTableFooter extends StatelessWidget {
  final int start;
  final int end;
  final int total;

  final int page;
  final int totalPages;
  final int pageSize;
  final List<int> pageSizeOptions;

  final ValueChanged<int> onPageChange;
  final ValueChanged<int> onPageSizeChange;

  const AdminTableFooter({
    super.key,
    required this.start,
    required this.end,
    required this.total,
    required this.page,
    required this.totalPages,
    required this.pageSize,
    required this.pageSizeOptions,
    required this.onPageChange,
    required this.onPageSizeChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          AppSpace.horizontal.sm,
          [
            if (total > 0) ...[
              'แสดง '.titleMedium,
              '${start + 1}–$end'.titleMedium.bold.color(AppColor.primary),
              ' จาก'.titleMedium,
            ],
            ' $total'.titleMedium.bold.color(AppColor.primary),
            ' รายการ'.titleMedium,
          ].rich(),
          Spacer(),
          AdminPagination(page: page, totalPages: totalPages, onChange: onPageChange),
          AppSpace.horizontal.sm,
        ],
      ),
    );
  }
}
