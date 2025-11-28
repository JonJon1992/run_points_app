import '../constants.dart';
import '../utils/sizing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSSliverAppBar extends StatefulWidget {
  final Widget header;
  final double maxHeight;
  final PreferredSizeWidget? bottom;
  final double? expandedHeight;

  const CSSliverAppBar({
    super.key,
    required this.header,
    required this.maxHeight,
    this.bottom,
    this.expandedHeight,
  });

  @override
  State<CSSliverAppBar> createState() => _CSSliverAppBarState();
}

class _CSSliverAppBarState extends State<CSSliverAppBar> {
  final GlobalKey _childKey = GlobalKey();
  double? height;

  get expandedHeight => widget.expandedHeight ?? height ?? widget.maxHeight;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (height == null) {
        setState(() {
          height =
              (_childKey.currentContext?.findRenderObject() as RenderBox)
                  .size
                  .height -
              context.mediaQueryPadding.top +
              36; // Sizing.custom não existe, usando valor direto
        });
      }
    });
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.isDarkMode
          ? ColorApp.black0
          : ColorApp.light0,
      automaticallyImplyLeading: false,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          children: [
            SizedBox(key: _childKey, child: widget.header),
            Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
      bottom: widget.bottom,
    );
  }
}
