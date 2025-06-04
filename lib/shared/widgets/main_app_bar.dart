import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding;
import '/features/_features.dart' show CustomSearchBar;
import '/shared/_shared.dart' show CustomPadding;

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      showVerticalPadding: false,
      child: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: TPadding.p08),
          child: CustomSearchBar(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
