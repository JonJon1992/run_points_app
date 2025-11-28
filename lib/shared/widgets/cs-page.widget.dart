import 'dart:async';

import 'cs-header.widget.dart';
import 'cs-pullrefresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:lazy_load_scrollview/lazy_load_scrollview.dart'; // TODO: Adicionar pacote ao pubspec.yaml se necessário

class CSPage extends GetView {
  final List<Widget> body;
  final List<Widget>? headerActions;
  final Widget title;
  final VoidCallback? onEndOfPage;
  final bool isLoading;
  final bool enablePullDown;
  final FutureOr<void> Function()? onRefresh;
  final Color? backgroundColor;
  final Widget? floatingButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final EdgeInsets? customPadding;

  const CSPage({
    required this.body,
    this.headerActions,
    required this.title,
    this.onEndOfPage,
    this.isLoading = false,
    this.enablePullDown = false,
    this.onRefresh,
    this.backgroundColor,
    this.floatingButton,
    this.floatingActionButtonLocation,
    this.customPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CSPullRefresh(
        enablePullDown: enablePullDown,
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              onEndOfPage?.call();
            }
            return false;
          },
          child: CSHeader(
            body: body,
            title: title,
            actions: headerActions,
            customPadding: customPadding,
          ),
        ),
        onRefresh: () async => onRefresh?.call(),
      ),
      floatingActionButton: floatingButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
