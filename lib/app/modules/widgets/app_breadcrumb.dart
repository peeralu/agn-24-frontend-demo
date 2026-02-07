import 'package:frontend/app/lib_view.dart';

class BreadcrumbItem {
  final String label;
  final VoidCallback? onTap;

  BreadcrumbItem({required this.label, this.onTap});
}

class Breadcrumb extends StatelessWidget {
  final String title;
  final List<BreadcrumbItem> items;

  const Breadcrumb({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withAlpha(51), width: 1),
            bottom: BorderSide(color: Colors.grey.withAlpha(51), width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isLast = index == items.length - 1;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: isLast ? null : item.onTap,
                    child: MouseRegion(
                      cursor: isLast ? SystemMouseCursors.basic : SystemMouseCursors.click,
                      child: isLast
                          ? item.label.bodyLarge.regular.color(Colors.grey.shade700)
                          : item.label.bodyLarge.bold.color(AppColor.primary),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
