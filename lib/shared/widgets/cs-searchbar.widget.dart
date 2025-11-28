import 'dart:async';

import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final int debounceMilliseconds;
  final double? iconSize;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final bool small;
  final BorderSide? enabledBorder;
  final Color? backgroundColor;

  const CSSearchBar({
    super.key,
    required this.controller,
    required this.title,
    required this.onChanged,
    this.enabledBorder,
    this.debounceMilliseconds = 500,
    this.iconSize,
    this.autoFocus = false,
    this.small = false,
    this.backgroundColor,
  });

  @override
  State<CSSearchBar> createState() => _CSSearchBarState();
}

class _CSSearchBarState extends State<CSSearchBar> {
  String? lastValue;
  Timer? debounceSearch;

  void onChange(String value) {
    if (debounceSearch?.isActive ?? false) debounceSearch?.cancel();
    debounceSearch = Timer(
      widget.debounceMilliseconds.milliseconds,
      () => widget.onChanged?.call(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.small || context.isLandscape ? 32 : null,
      width: context.isLandscape ? 242 : null,
      child: TextFormField(
        controller: widget.controller,
        autofocus: widget.autoFocus,
        onChanged: (String value) {
          if (lastValue != value) {
            lastValue = value;
            onChange(value);
          }
        },
        textAlignVertical: context.isLandscape
            ? TextAlignVertical.bottom
            : null,
        style:
            (widget.small || context.isLandscape
                    ? context.textTheme.bodySmall
                    : context.textTheme.titleMedium)
                ?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode
                      ? ColorApp.light300
                      : ColorApp.mid1000,
                ),
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle:
              (widget.small || context.isLandscape
                      ? context.textTheme.bodySmall
                      : context.textTheme.bodyMedium)
                  ?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.isDarkMode
                        ? ColorApp.light300
                        : ColorApp.mid1000,
                  ),
          enabledBorder: OutlineInputBorder(
            borderSide: widget.enabledBorder ?? BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          filled: true,
          fillColor: context.isDarkMode
              ? ColorApp.black400
              : widget.backgroundColor ?? ColorApp.light200,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: context.isDarkMode
                ? ColorApp.grey300
                : ColorApp.blue800,
            size: widget.iconSize ?? 14,
          ),
        ),
      ),
    );
  }
}
