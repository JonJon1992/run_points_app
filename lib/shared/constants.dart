import 'package:flutter/material.dart';

class Spacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;
  static const double xxxl = 48;
}

class ColorApp {
  ColorApp._();

  static const primaryColor = Color.fromRGBO(199, 9, 9, 1);
  static const primaryColorDark = Color.fromRGBO(200, 200, 200, 1);
  static const backgroundColor = Color.fromRGBO(229, 229, 229, 1);
  static const disabledButtonColor = Color.fromRGBO(244, 245, 247, 1);

  // Lights
  static const light500 = Color.fromRGBO(193, 199, 208, 1);
  static const light400 = Color.fromRGBO(223, 225, 230, 1);
  static const light300 = Color.fromRGBO(235, 236, 240, 1);
  static const light250 = Color.fromRGBO(239, 242, 247, 1);
  static const light200 = Color.fromRGBO(244, 245, 247, 1);
  static const light150 = Color.fromRGBO(223, 223, 223, 1);
  static const light100 = Color.fromRGBO(250, 251, 252, 1);
  static const light0 = Color.fromRGBO(255, 255, 255, 1);
  static const buttonLight = Color.fromRGBO(249, 249, 249, 1);
  static const buttonLightPress = Color.fromRGBO(239, 239, 240, 1);

  // Darks
  static const dark1000 = Color.fromRGBO(6, 20, 45, 1);
  static const dark950 = Color.fromRGBO(9, 30, 66, 1);
  static const dark900 = Color.fromRGBO(23, 43, 77, 1);
  static const dark850 = Color.fromRGBO(13, 19, 76, 1);
  static const dark800 = Color.fromRGBO(37, 56, 88, 1);
  static const dark750 = Color.fromRGBO(10, 63, 65, 1);
  static const dark700 = Color.fromRGBO(52, 69, 99, 1);
  static const dark600 = Color.fromRGBO(66, 82, 110, 1);
  static const dark500 = Color.fromRGBO(158, 158, 158, 1);
  static const dark400 = Color.fromRGBO(45, 45, 45, 1);
  static const dark300 = Color.fromRGBO(109, 100, 100, 1);
  static const dark200 = Color.fromRGBO(73, 75, 76, 1);
  static const dark100 = Color.fromRGBO(55, 55, 55, 1);
  static const dark0 = Color.fromRGBO(0, 0, 0, 1);

  // Darks/Blacks
  static const black700 = Color.fromRGBO(36, 36, 36, 1);
  static const black600 = Color.fromRGBO(39, 39, 39, 1);
  static const black500 = Color.fromRGBO(44, 44, 44, 1);
  static const black400 = Color.fromRGBO(45, 45, 45, 1);
  static const black300 = Color.fromRGBO(50, 50, 50, 1.0);
  static const black200 = Color.fromRGBO(52, 52, 52, 1);
  static const black100 = Color.fromRGBO(55, 55, 55, 1);
  static const black0 = Color.fromRGBO(29, 29, 29, 1);
  static const blackTitle = Color.fromRGBO(9, 30, 66, 1);

  // Mids
  static const mid1000 = Color.fromRGBO(80, 95, 121, 1);
  static const mid950 = Color.fromRGBO(94, 108, 132, 1);
  static const mid900 = Color.fromRGBO(80, 95, 121, 1);
  static const mid850 = Color.fromRGBO(107, 119, 140, 1);
  static const mid800 = Color.fromRGBO(151, 160, 175, 1);
  static const mid700 = Color.fromRGBO(165, 173, 186, 1);
  static const mid600 = Color.fromRGBO(179, 186, 197, 1);

  // Greys
  static const grey900 = Color.fromRGBO(66, 82, 110, 1);
  static const grey850 = Color.fromRGBO(49, 50, 51, 1);
  static const grey800 = Color.fromRGBO(66, 66, 66, 1);
  static const grey750 = Color.fromRGBO(122, 124, 127, 1);
  static const grey700 = Color.fromRGBO(97, 97, 97, 1);
  static const grey600 = Color.fromRGBO(117, 117, 117, 1);
  static const grey500 = Color.fromRGBO(158, 158, 158, 1);
  static const grey450 = Color.fromRGBO(183, 186, 186, 1);
  static const grey400 = Color.fromRGBO(198, 198, 198, 1);
  static const grey300 = Color.fromRGBO(224, 224, 224, 1);
  static const grey350 = Color.fromRGBO(244, 245, 247, 0.5);
  static const grey200 = Color.fromRGBO(238, 238, 238, 1);
  static const greyTitle = Color.fromRGBO(107, 119, 140, 1);
  static const grey50 = Color.fromRGBO(250, 250, 250, 1);

  // Blues
  static const blue1000 = Color.fromRGBO(0, 28, 82, 1);
  static const blue950 = Color.fromRGBO(0, 41, 102, 1);
  static const blue900 = Color.fromRGBO(0, 62, 153, 1);
  static const blue850 = Color.fromRGBO(0, 95, 245, 1);
  static const blue800 = Color.fromRGBO(0, 82, 204, 1);
  static const blue750 = Color.fromRGBO(0, 74, 219, 1);
  static const blue700 = Color.fromRGBO(0, 93, 230, 1);
  static const blue600 = Color.fromRGBO(0, 98, 242, 1);
  static const blue500 = Color.fromRGBO(0, 103, 255, 1);
  static const blue450 = Color.fromRGBO(23, 32, 110, 1);
  static const blue400 = Color.fromRGBO(51, 133, 255, 1);
  static const blue300 = Color.fromRGBO(102, 164, 255, 1);
  static const blue200 = Color.fromRGBO(153, 194, 255, 1);
  static const blue150 = Color.fromRGBO(204, 225, 255, 1);
  static const blue100 = Color.fromRGBO(229, 240, 255, 1);
  static const blue75 = Color.fromRGBO(197, 217, 255, 1);
  static const blue70 = Color.fromRGBO(0, 87, 255, 1);
  static const blue50 = Color.fromRGBO(242, 247, 255, 1);
  static const blue15 = Color.fromRGBO(247, 246, 252, 1);
  static const blue10 = Color.fromRGBO(235, 241, 255, 1);

  // Reds
  static const red1000 = Color.fromRGBO(99, 16, 23, 1);
  static const red950 = Color.fromRGBO(102, 0, 4, 1);
  static const red900 = Color.fromRGBO(153, 0, 6, 1);
  static const red850 = Color.fromRGBO(165, 27, 38, 1);
  static const red800 = Color.fromRGBO(198, 33, 46, 1);
  static const red750 = Color.fromRGBO(247, 208, 211, 1);
  static const red700 = Color.fromRGBO(230, 0, 9, 1);
  static const red600 = Color.fromRGBO(242, 0, 9, 1);
  static const red550 = Color.fromRGBO(243, 90, 96, 1);
  static const red500 = Color.fromRGBO(255, 0, 10, 1);
  static const red480 = Color.fromRGBO(225, 77, 90, 1);
  static const red450 = Color.fromRGBO(231, 107, 117, 1);
  static const red400 = Color.fromRGBO(255, 51, 59, 1);
  static const red350 = Color.fromRGBO(236, 137, 145, 1);
  static const red300 = Color.fromRGBO(255, 102, 108, 1);
  static const red150 = Color.fromRGBO(255, 204, 206, 1);
  static const red100 = Color.fromRGBO(255, 229, 230, 1);
  static const red50 = Color.fromRGBO(252, 238, 239, 1);

  // Greens
  static const green1000 = Color.fromRGBO(2, 37, 26, 1);
  static const green950 = Color.fromRGBO(4, 73, 52, 1);
  static const green850 = Color.fromRGBO(23, 76, 79, 1);
  static const green800 = Color.fromRGBO(12, 108, 67, 1);
  static const green750 = Color.fromRGBO(195, 233, 213, 1);
  static const green700 = Color.fromRGBO(24, 216, 135, 1);
  static const green500 = Color.fromRGBO(11, 183, 131, 1);
  static const green450 = Color.fromRGBO(197, 255, 57, 1);
  static const green400 = Color.fromRGBO(60, 197, 156, 1);
  static const green350 = Color.fromRGBO(112, 239, 186, 1);
  static const green300 = Color.fromRGBO(109, 212, 181, 1);
  static const green250 = Color.fromRGBO(114, 187, 160, 1);
  static const green200 = Color.fromRGBO(157, 226, 205, 1);
  static const green150 = Color.fromRGBO(145, 243, 201, 1);
  static const green100 = Color.fromRGBO(230, 248, 252, 1);
  static const green50 = Color.fromRGBO(237, 253, 246, 1);

  // Quiz Colors (from Figma design)
  static const quizGreen = Color.fromRGBO(4, 211, 97, 1); // #04D361
  static const quizGreenSelected = Color.fromRGBO(3, 171, 79, 1); // #03AB4F
  static const quizBackgroundSelected = Color.fromRGBO(
    225,
    245,
    236,
    1,
  ); // #E1F5EC
  static const quizBorderSelected = Color.fromRGBO(184, 219, 203, 1); // #B8DBCB
  static const quizTextBody = Color.fromRGBO(166, 161, 178, 1); // #A6A1B2
  static const quizTextHeading = Color.fromRGBO(81, 71, 102, 1); // #514766
  static const quizTextOption = Color.fromRGBO(110, 102, 128, 1); // #6E6680
  static const quizBackground = Color.fromRGBO(245, 245, 250, 1); // #F5F5FA
  static const quizBorder = Color.fromRGBO(225, 225, 229, 1); // #E1E1E5
  static const quizPurple = Color.fromRGBO(130, 87, 229, 1); // #8257E5
  static const quizError = Color.fromRGBO(232, 63, 91, 1); // #E83F5B

  // Yellow
  static const yellow1000 = Color.fromRGBO(51, 34, 0, 1);
  static const yellow950 = Color.fromRGBO(126, 106, 2, 1);
  static const yellow900 = Color.fromRGBO(153, 103, 0, 1);
  static const yellow500 = Color.fromRGBO(238, 201, 5, 1);
  static const yellow400 = Color.fromRGBO(255, 188, 51, 1);
  static const yellow300 = Color.fromRGBO(255, 205, 102, 1);
  static const yellow250 = Color.fromRGBO(238, 201, 5, 1);
  static const yellow225 = Color.fromRGBO(251, 215, 30, 1);
  static const yellow200 = Color.fromRGBO(252, 229, 105, 1);
  static const yellow150 = Color.fromRGBO(255, 238, 204, 1);
  static const yellow100 = Color.fromRGBO(255, 246, 229, 1);

  // Purples
  static const purple1000 = Color.fromRGBO(37, 39, 48, 1);
  static const purple900 = Color.fromRGBO(56, 21, 37, 1);
  static const purple800 = Color.fromRGBO(81, 67, 154, 1);
  static const purple700 = Color.fromRGBO(61, 50, 115, 1);
  static const purple500 = Color.fromRGBO(8, 16, 33, 1);

  // Dark/Grey
  static const darkGrey600 = Color.fromRGBO(117, 117, 117, 1);
  static const darkGrey400 = Color.fromRGBO(189, 189, 189, 1);

  // Neutrals
  static const neutrals100 = Color.fromRGBO(97, 99, 101, 1);
  static const neutrals300 = Color.fromRGBO(61, 63, 63, 1);

  // Tags
  static const tagBackgroundSuccess = Color.fromRGBO(237, 253, 246, 1);
  static const tagTextSecondary = Color.fromRGBO(73, 75, 76, 1);
  static const tagTextSuccess = Color.fromRGBO(12, 108, 67, 1);

  static const redSociaGooglelBorder = Color.fromRGBO(255, 61, 0, 1);
  static const blueSocialFbBorder = Color.fromRGBO(76, 111, 186, 1);
  static const darkSocialAppleBorder = Color.fromRGBO(55, 55, 55, 1);
}
