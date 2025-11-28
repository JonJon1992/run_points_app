import 'package:flutter/material.dart';

class CSPullRefresh extends StatefulWidget {
  final Widget child;
  final bool enablePullDown;
  final Future<void> Function() onRefresh;

  const CSPullRefresh({
    super.key,
    required this.child,
    this.enablePullDown = true,
    required this.onRefresh,
  });

  @override
  State<CSPullRefresh> createState() => _CSPullRefreshState();
}

class _CSPullRefreshState extends State<CSPullRefresh> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _onRefresh() async {
    await widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        primary: true,
        shrinkWrap: widget.enablePullDown,
        slivers: [
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: true,
            child: SizedBox(child: widget.child),
          ),
        ],
        physics: widget.enablePullDown
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
