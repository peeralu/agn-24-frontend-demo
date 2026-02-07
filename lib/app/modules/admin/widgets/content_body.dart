import 'package:flutter/material.dart';

import 'header_bar.dart';
import 'side_nav.dart';

class ContentBodyWidget extends StatelessWidget {
  final String? title;
  final EdgeInsets? padding;
  final Widget? breadcrumb;
  final Widget? child;

  const ContentBodyWidget({super.key, this.title, this.padding, this.breadcrumb, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Row(
          children: [
            const SideNav(),
            Expanded(
              child: Column(
                children: [
                  HeaderBar(title: title, breadcrumb: breadcrumb),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
