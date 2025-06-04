import 'package:flutter/material.dart';

import '/shared/_shared.dart' show CustomPadding;

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      showVerticalPadding: false,
      child: AppBar(title: const Text("News Details")),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
