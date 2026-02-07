import 'package:frontend/app/lib_view.dart';

class AdminTableWidth {
  final int? flex;
  final double? fixed;

  AdminTableWidth({this.flex, this.fixed});

  Widget wrap(Widget child) {
    if (fixed != null) {
      return SizedBox(width: fixed, child: child);
    }
    return Expanded(flex: flex ?? 1, child: child);
  }
}

enum AdminTableAlign { left, right, center }

class AdminDataTable<T> extends StatefulWidget {
  final String title;
  final List<String> columns;
  final List<T> rows;
  final List<AdminTableWidth>? columnFlex;
  final List<AdminTableAlign>? columnAlign;
  final List<Type>? columnType;
  final double rowHeight;
  final Widget? Function(dynamic value, int col, int row)? cellBuilder;

  final VoidCallback? onAdd;
  final Future<void> Function(int index)? onEdit;
  final Future<void> Function(int index)? onDelete;

  final int initialPageSize;
  final bool isLoading;
  final bool isAdmin;

  final searchController = TextEditingController();

  AdminDataTable({
    super.key,
    required this.title,
    required this.columns,
    required this.rows,
    this.columnFlex,
    this.columnAlign,
    this.columnType,
    this.rowHeight = 50,
    this.cellBuilder,
    this.onAdd,
    this.onEdit,
    this.onDelete,
    this.initialPageSize = 10,
    this.isLoading = false,
    this.isAdmin = true,
  });

  @override
  State<AdminDataTable> createState() => _AdminDataTableState();
}

class _AdminDataTableState extends State<AdminDataTable> {
  late List<List<dynamic>> _rows;

  int currentPage = 0;
  int pageSize = 10;
  int totalPages = 1;

  String search = "";
  int? sortColumn;
  bool asc = true;

  final pageSizeOptions = [10, 25, 50, 100];

  @override
  void initState() {
    super.initState();
    _rows = List.from(widget.rows);
    pageSize = widget.initialPageSize;
    _recalc();
  }

  @override
  void didUpdateWidget(covariant AdminDataTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rows != widget.rows) {
      _rows = List.from(widget.rows);
      _recalc();
    }
  }

  void _recalc() {
    totalPages = (_filtered.length / pageSize).ceil();
    if (totalPages <= 0) totalPages = 1;
    if (currentPage >= totalPages) currentPage = totalPages - 1;
  }

  List<List<dynamic>> get _filtered {
    if (search.isEmpty) return _rows;
    final q = search.toLowerCase();
    return _rows.where((r) {
      return r.any((c) => c is String && c.toLowerCase().contains(q));
    }).toList();
  }

  void _sort(int col) {
    setState(() {
      if (sortColumn == col) {
        asc = !asc;
      } else {
        sortColumn = col;
        asc = true;
      }

      final type = widget.columnType != null && col < widget.columnType!.length ? widget.columnType![col] : String;

      if (type == int) {
        _rows.sort((a, b) {
          final av = int.parse(a[col].toString());
          final bv = int.parse(b[col].toString());
          return asc ? av.compareTo(bv) : bv.compareTo(av);
        });
        return;
      } else if (type == double) {
        _rows.sort((a, b) {
          final av = double.parse(a[col].toString());
          final bv = double.parse(b[col].toString());
          return asc ? av.compareTo(bv) : bv.compareTo(av);
        });
        return;
      }
      _rows.sort((a, b) {
        final av = a[col].toString().toLowerCase();
        final bv = b[col].toString().toLowerCase();
        return asc ? av.compareTo(bv) : bv.compareTo(av);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final start = currentPage * pageSize;
    final end = (start + pageSize > filtered.length) ? filtered.length : start + pageSize;

    final pageRows = filtered.sublist(start, end);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300.withAlpha(100),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.lg, vertical: AppSize.md),
            child: AdminTableHeader(
              title: widget.title,
              onSearch: (v) => setState(() {
                search = v;
                currentPage = 0;
                _recalc();
              }),
              onAdd: widget.onAdd,
              searchController: widget.searchController,
            ),
          ),
          AppSpace.vertical.s,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSize.lg),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300.withAlpha(230), width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AdminTableBody(
              columns: widget.columns,
              rows: pageRows,
              columnFlex: widget.columnFlex,
              columnAlign: widget.columnAlign,
              columnType: widget.columnType,
              rowHeight: widget.rowHeight,
              cellBuilder: widget.cellBuilder,
              onSort: _sort,
              sortColumn: sortColumn,
              asc: asc,
              onEdit: widget.onEdit,
              onDelete: widget.onDelete,
              startIndex: start,
              isLoading: widget.isLoading,
              isAdmin: widget.isAdmin,
            ),
          ),
          AdminTableFooter(
            start: start,
            end: end,
            total: filtered.length,
            page: currentPage,
            totalPages: totalPages,
            pageSize: pageSize,
            pageSizeOptions: pageSizeOptions,
            onPageChange: (p) => setState(() => currentPage = p),
            onPageSizeChange: (s) {
              setState(() {
                pageSize = s;
                currentPage = 0;
                _recalc();
              });
            },
          ),
        ],
      ),
    );
  }
}
