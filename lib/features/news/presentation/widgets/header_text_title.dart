import 'package:flutter/material.dart';

import '/config/_config.dart' show TRadius, TSize;
import '/core/_core.dart' show BuildContextExtensions;
import '/shared/_shared.dart' show TextWidget, CustomPadding;

class HeaderTextTitle extends StatelessWidget {
  const HeaderTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPadding(child: BuildTopNewsHeadlines());
  }
}

class BuildTopNewsHeadlines extends StatelessWidget {
  const BuildTopNewsHeadlines({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSize.s08,
      children: [
        const SizedBox(
          width: 6,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(TRadius.r04)),
            child: ColoredBox(color: Colors.red),
          ),
        ),

        Flexible(
          child: TextWidget(
            'Top Headlines',
            style: context.textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
