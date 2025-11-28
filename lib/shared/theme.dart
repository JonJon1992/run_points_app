import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  static const height = 1.25;

  // Fontes
  static const String fontMargem = 'Margem';
  static const String fontSourceSansPro = 'Source Sans Pro';

  static const headlineXXXLarge = 42.0;
  static const headlineXXMLarge = 30.0;
  static const headlineXXLarge = 32.0;
  static const headlineXLarge = 28.0;
  static const headlineLarge = 24.0;
  static const headlineDefault = 20.0;
  static const headlineMedium = 18.0; //ALTERAR PARA 20
  static const headlineSmall = 16.0; //ALTERAR PARA 18
  static const headlineXSmall = 16.0;
  static const headlineXXSmall = 14.0;
  static const headlineXXXSmall = 12.0;

  static const titleLarge = 19.0;
  static const titleMedium = 16.0;
  static const titleSmall = 13.0;
  static const titleXSmall = 11.0;

  static const bodyXLarge = 18.0;
  static const bodyLarge = 16.0;
  static const bodyMedium = 14.0;
  static const bodySmall = 12.0;

  static const labelLarge = 16.0;
  static const labelMedium = 14.0;
  static const labelSmall = 10.0;

  static const headlineWeight = FontWeight.w500;
  static const titleWeight = FontWeight.w600;
  static const bodyWeight = FontWeight.w600;
  static const labelWeight = FontWeight.w400;

  static const videoTextShadow = Shadow(
    color: ColorApp.black0,
    offset: Offset(0, 0),
    blurRadius: 10,
  );

  static final ThemeData themeLight = ThemeData(
    colorScheme: ColorScheme.light(
      primary: ColorApp.blue500,
      onPrimary: ColorApp.blue500,
    ),
    disabledColor: ColorApp.mid1000,
    fontFamily: 'Source Sans Pro',
    brightness: Brightness.light,
    primaryColorDark: ColorApp.primaryColorDark,
    primaryColor: ColorApp.primaryColor,
    scaffoldBackgroundColor: ColorApp.light0,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(ColorApp.light300),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorApp.light0,
      selectedIconTheme: IconThemeData(color: ColorApp.blue400),
      unselectedIconTheme: IconThemeData(color: ColorApp.mid800),
      selectedLabelStyle: TextStyle(
        fontSize: 11,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w500,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 10,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.light0,
      ),
      overlayColor: WidgetStateColor.resolveWith((states) => ColorApp.light400),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(ColorApp.light0),
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.light0,
      ),
      side: BorderSide(color: ColorApp.light400),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ColorApp.blue500,
      headerForegroundColor: ColorApp.light0,
      backgroundColor: ColorApp.light0,
      dividerColor: ColorApp.blue500,
      surfaceTintColor: ColorApp.light0,
      todayBorder: BorderSide(color: ColorApp.blue500),
      dayOverlayColor: WidgetStateProperty.all(ColorApp.blue150),
      dayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue500
            : ColorApp.light0,
      ),
      dayForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.black700,
      ),
      todayForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.blue500,
      ),
      todayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue500
            : ColorApp.light0,
      ),
      yearBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue500
            : ColorApp.light0,
      ),
      yearForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.black700,
      ),
    ),
    chipTheme: ChipThemeData(
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(34)),
      ),
      backgroundColor: ColorApp.light0,
      selectedColor: ColorApp.blue100,
      side: BorderSide(width: 1, color: ColorApp.light300),
      labelStyle: TextStyle(
        color: ColorApp.blue500,
        fontSize: 14,
        height: height,
      ),
      color: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue100
            : ColorApp.light0,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Margem',
        fontSize: headlineLarge,
        fontWeight: headlineWeight,
        color: ColorApp.dark1000,
        height: height,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Margem',
        fontSize: headlineMedium,
        fontWeight: headlineWeight,
        color: ColorApp.dark1000,
        height: height,
      ),
      headlineSmall: TextStyle(
        fontSize: headlineSmall,
        height: height,
        fontFamily: 'Margem',
        fontWeight: headlineWeight,
        color: ColorApp.dark950,
      ),
      titleLarge: TextStyle(
        fontSize: titleLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: titleWeight,
        color: ColorApp.dark1000,
      ),
      titleMedium: TextStyle(
        fontSize: titleMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: titleWeight,
        color: ColorApp.dark950,
      ),
      titleSmall: TextStyle(
        fontSize: titleSmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: titleWeight,
        color: ColorApp.dark950,
      ),
      bodyLarge: TextStyle(
        fontSize: bodyLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid900,
      ),
      bodyMedium: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid1000,
        fontWeight: bodyWeight,
      ),
      bodySmall: TextStyle(
        fontSize: bodySmall,
        height: height,
        letterSpacing: .2,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid700,
      ),
      labelLarge: TextStyle(
        fontSize: labelLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid800,
        fontWeight: labelWeight,
      ),
      labelMedium: TextStyle(
        fontSize: labelMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid950,
      ),
      labelSmall: TextStyle(
        fontSize: labelSmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid950,
      ),
    ),
    iconTheme: IconThemeData(color: ColorApp.dark1000),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
      labelStyle: TextStyle(
        fontSize: labelMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid900,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.dark950,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.blue500),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.light400),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.light200),
      ),
      helperStyle: TextStyle(
        fontSize: bodySmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.mid950,
        fontStyle: FontStyle.italic,
      ),
    ),
    appBarTheme: AppBarTheme(surfaceTintColor: Colors.transparent),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: height,
          ),
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorApp.blue600, width: 1),
      ),
      dividerColor: Colors.transparent,
      labelColor: ColorApp.dark950,
      labelStyle: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: bodyWeight,
      ),
      unselectedLabelColor: ColorApp.mid850,
      unselectedLabelStyle: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: bodyWeight,
      ),
    ),
    dividerTheme: DividerThemeData(color: ColorApp.light200),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorApp.blue500),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: height,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      valueIndicatorTextStyle: TextStyle(color: ColorApp.light100),
      inactiveTrackColor: ColorApp.blue100,
      inactiveTickMarkColor: ColorApp.blue100,
      activeTrackColor: ColorApp.blue500,
      activeTickMarkColor: ColorApp.blue500,
      valueIndicatorColor: ColorApp.blue500,
      thumbColor: ColorApp.blue500,
    ),
    bottomSheetTheme: BottomSheetThemeData(elevation: 0),
    expansionTileTheme: ExpansionTileThemeData(
      tilePadding: EdgeInsets.zero,
      shape: Border.all(color: Colors.transparent, width: 0),
      collapsedShape: Border.all(color: Colors.transparent, width: 0),
    ),
  );

  static final ThemeData themeGranDark = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: ColorApp.primaryColorDark,
      onPrimary: ColorApp.primaryColorDark,
    ),
    disabledColor: ColorApp.mid1000,
    brightness: Brightness.dark,
    primaryColorDark: ColorApp.primaryColorDark,
    primaryColor: ColorApp.primaryColor,
    scaffoldBackgroundColor: ColorApp.black0,
    fontFamily: 'Source Sans Pro',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(ColorApp.mid800),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorApp.black0,
      selectedIconTheme: IconThemeData(color: ColorApp.blue400),
      unselectedIconTheme: IconThemeData(color: ColorApp.light400),
      selectedLabelStyle: TextStyle(
        fontSize: 11,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w500,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 10,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.light0,
      ),
      overlayColor: WidgetStateColor.resolveWith((states) => ColorApp.light400),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(ColorApp.light0),
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.light0,
      ),
      side: BorderSide(color: ColorApp.light400),
    ),
    datePickerTheme: DatePickerThemeData(
      dayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.black700,
      ),
      dayForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.light0,
      ),
      todayForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.light0,
      ),
      todayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.black700,
      ),
      yearBackgroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.blue400
            : ColorApp.black700,
      ),
      yearForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? ColorApp.light0
            : ColorApp.light0,
      ),
    ),
    chipTheme: ChipThemeData(
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(34)),
      ),
      backgroundColor: ColorApp.black0,
      selectedColor: ColorApp.grey800,
      side: BorderSide(width: 1, color: ColorApp.black300),
      labelStyle: TextStyle(
        color: ColorApp.light0,
        fontSize: 14,
        height: height,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Margem',
        fontSize: headlineLarge,
        fontWeight: headlineWeight,
        color: ColorApp.light0,
        height: height,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Margem',
        fontSize: headlineMedium,
        fontWeight: headlineWeight,
        color: ColorApp.light0,
        height: height,
      ),
      headlineSmall: TextStyle(
        fontSize: headlineSmall,
        height: height,
        fontFamily: 'Margem',
        fontWeight: headlineWeight,
        color: ColorApp.light0,
      ),
      titleLarge: TextStyle(
        fontSize: titleLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
        fontWeight: titleWeight,
      ),
      titleMedium: TextStyle(
        fontSize: titleMedium,
        height: height,
        fontWeight: titleWeight,
        color: ColorApp.light0,
        fontFamily: 'Source Sans Pro',
      ),
      titleSmall: TextStyle(
        fontSize: titleSmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: titleWeight,
        color: ColorApp.light0,
      ),
      bodyLarge: TextStyle(
        fontSize: bodyLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
      ),
      bodyMedium: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
        fontWeight: bodyWeight,
      ),
      bodySmall: TextStyle(
        fontSize: bodySmall,
        height: height,
        letterSpacing: .2,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
      ),
      labelLarge: TextStyle(
        fontSize: labelLarge,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
        fontWeight: labelWeight,
      ),
      labelMedium: TextStyle(
        fontSize: labelMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
      ),
      labelSmall: TextStyle(
        fontSize: labelSmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
      ),
    ),
    iconTheme: IconThemeData(color: ColorApp.light0),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
      labelStyle: TextStyle(
        fontSize: labelMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.grey500,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.grey200),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.grey600),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorApp.grey800),
      ),
      helperStyle: TextStyle(
        fontSize: bodySmall,
        height: height,
        fontFamily: 'Source Sans Pro',
        color: ColorApp.light0,
        fontStyle: FontStyle.italic,
      ),
    ),
    appBarTheme: AppBarTheme(surfaceTintColor: Colors.transparent),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: height,
          ),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(color: ColorApp.dark100),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorApp.blue400, width: 1),
      ),
      dividerColor: Colors.transparent,
      labelColor: ColorApp.light0,
      labelStyle: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: bodyWeight,
      ),
      unselectedLabelColor: ColorApp.grey300,
      unselectedLabelStyle: TextStyle(
        fontSize: bodyMedium,
        height: height,
        fontFamily: 'Source Sans Pro',
        fontWeight: bodyWeight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorApp.blue400),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            color: Colors.red,
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: height,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      valueIndicatorTextStyle: TextStyle(color: ColorApp.light100),
      inactiveTrackColor: ColorApp.black0,
      inactiveTickMarkColor: ColorApp.blue100,
      activeTrackColor: ColorApp.blue500,
      activeTickMarkColor: ColorApp.blue500,
      valueIndicatorColor: ColorApp.blue500,
      thumbColor: ColorApp.blue500,
    ),
    bottomSheetTheme: BottomSheetThemeData(elevation: 0),
    expansionTileTheme: ExpansionTileThemeData(
      tilePadding: EdgeInsets.zero,
      shape: Border.all(color: Colors.transparent, width: 0),
      collapsedShape: Border.all(color: Colors.transparent, width: 0),
    ),
  );
}
