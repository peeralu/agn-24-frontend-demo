import 'package:jiffy/jiffy.dart';

import 'package:frontend/app/lib_view.dart';

class AdminTableBody extends StatelessWidget {
  final List<String> columns;
  final List<List<dynamic>> rows;
  final List<AdminTableWidth>? columnFlex;
  final List<AdminTableAlign>? columnAlign;
  final List<Type>? columnType;
  final double rowHeight;

  final Widget? Function(dynamic, int, int)? cellBuilder;

  final Function(int col) onSort;
  final int? sortColumn;
  final bool asc;

  final Function(int index)? onEdit;
  final Function(int index)? onDelete;
  final int startIndex;
  final bool isLoading;
  final bool isAdmin;

  const AdminTableBody({
    super.key,
    required this.columns,
    required this.rows,
    required this.columnFlex,
    required this.columnAlign,
    required this.columnType,
    required this.rowHeight,
    required this.cellBuilder,
    required this.onSort,
    required this.sortColumn,
    required this.asc,
    required this.onEdit,
    required this.onDelete,
    required this.startIndex,
    required this.isLoading,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        if (isLoading) _buildLoading(),
        if (!isLoading && rows.isEmpty) _buildEmpty(),
        ...rows.asMap().entries.map((e) {
          final index = e.key + startIndex;
          return _buildRow(e.value, index, e.key.isEven);
        }),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey.border, width: 0.5)),
      ),
      child: Row(
        children:
            List.generate(columns.length, (i) {
              var mainAxisAlignment = MainAxisAlignment.start;
              if (columnAlign != null && columnAlign!.length == columns.length) {
                switch (columnAlign![i]) {
                  case AdminTableAlign.left:
                    break;
                  case AdminTableAlign.center:
                    mainAxisAlignment = MainAxisAlignment.center;
                    break;
                  case AdminTableAlign.right:
                    mainAxisAlignment = MainAxisAlignment.end;
                    break;
                }
              }
              final cell = InkWell(
                onTap: () => onSort(i),
                child: Container(
                  height: rowHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: i != 0 ? Border(left: BorderSide(color: AppColors.grey.border, width: 0.5)) : null,
                  ),
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      columns[i].titleMedium.bold.color(AppColors.dark.text),
                      if (sortColumn == i)
                        Icon(asc ? Icons.arrow_upward : Icons.arrow_downward, color: AppColors.primary.text, size: 16),
                    ],
                  ),
                ),
              );

              return columnFlex != null && columnFlex!.length == columns.length
                  ? columnFlex![i].wrap(cell)
                  : Expanded(child: cell);
            })..add(
              isAdmin
                  ? Container(
                      width: 100,
                      height: rowHeight,
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: AppColors.grey.border, width: 0.5)),
                      ),
                      child: Center(child: "จัดการ.".titleMedium.bold.color(AppColors.dark.text)),
                    )
                  : const SizedBox.shrink(),
            ),
      ),
    );
  }

  Widget _buildRow(List<dynamic> row, int index, bool even) {
    return Container(
      decoration: BoxDecoration(
        color: even ? Colors.grey.shade50 : Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey.border, width: 0.5)),
      ),
      child: Row(
        children: [
          ...List.generate(row.length, (c) {
            var mainAxisAlignment = MainAxisAlignment.start;
            final t = columnType != null && c < columnType!.length ? columnType![c] : String;
            if (columnAlign != null && columnAlign!.length == columns.length) {
              switch (columnAlign![c]) {
                case AdminTableAlign.left:
                  break;
                case AdminTableAlign.center:
                  mainAxisAlignment = MainAxisAlignment.center;
                  break;
                case AdminTableAlign.right:
                  mainAxisAlignment = MainAxisAlignment.end;
                  break;
              }
            }
            final content = Container(
              height: rowHeight,
              decoration: BoxDecoration(
                border: c != 0 ? Border(left: BorderSide(color: AppColors.grey.border, width: 0.5)) : null,
              ),
              child: _buildCell(row, c, t, index, mainAxisAlignment),
            );
            return columnFlex != null && columnFlex!.length == row.length
                ? columnFlex![c].wrap(content)
                : Expanded(child: content);
          }),
          if (isAdmin)
            AdminTableActions(
              onEdit: onEdit == null ? null : () => onEdit!(index),
              onDelete: onDelete == null ? null : () => onDelete!(index),
              rowHeight: rowHeight,
            ),
        ],
      ),
    );
  }

  Widget _buildCell(List<dynamic> row, int col, Type t, int rowIndex, MainAxisAlignment mainAxisAlignment) {
    if (cellBuilder != null) {
      final child = cellBuilder!(row[col], col, rowIndex);
      if (child != null) {
        return child;
      }
    }

    var value = row[col]?.toString() ?? '-';
    if (t == bool && row[col] is bool) {
      final isOn = row[col] as bool;
      return Center(child: AppBadgesOnOff(isOn: isOn));
    } else if ((t == DateTime || t == Jiffy) && row[col] != null) {
      if (row[col] is DateTime) {
        value = Jiffy.parseFromDateTime((row[col]! as DateTime)).format(pattern: 'dd MMM yyyy  HH:mm น.');
      } else if (row[col] is Jiffy) {
        value = (row[col]! as Jiffy).format(pattern: 'dd MMM yyyy  HH:mm น.');
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [value.titleMedium.color(AppColors.dark.text).overflowEllipsis.maxLines(2)],
      ),
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary)),
          AppSpace.vertical.m,
          'กำลังโหลดข้อมูล...'.titleMedium.color(AppColors.primary.color.withAlpha(150)),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return SizedBox(
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: AppSize.xxxxl, color: AppColors.grey.color.withAlpha(100)),
          AppSpace.vertical.s,
          'ไม่พบข้อมูล'.bodyMedium.color(AppColors.grey.color.withAlpha(150)),
        ],
      ),
    );
  }
}
