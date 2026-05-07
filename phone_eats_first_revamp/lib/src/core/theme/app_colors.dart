import 'package:flutter/material.dart';

class AppColors {
  static String colorToHexString(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  static Color hexStringToColor(String hexString) {
    hexString = hexString.replaceFirst('#', '');
    return Color(int.parse('FF$hexString', radix: 16));
  }

  static const Color backgroundPrimary = Color(0xFFDDDDDD);
  static const Color transparent = Colors.transparent; // Light beige background
  static const Color primaryPink = Color(0xFFFF003D);
  static const Color yello = Color(0xFFFCB040);
  static const Color lgreen = Color(0xFF91CA61);
  static const Color dgreen = Color(0xFF3AB54A);

  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF777777);

  static const Color lighterGrey = Color(0xFFEEEEEE);
  static const Color btnGrey = Color(0xFFCCCCCC);
  static const Color lightGrey = Color.fromARGB(155, 137, 136, 136);

  static const Color green = Color(0xFF03DA4C);

  // Text Colors
  static const Color primaryText = Color(0xFF000000); // Black/Dark text
  static const Color secondaryTextRed = Color(0xFFFF0000);
  static const Color secondaryTextGrey = Color(0xFFAAAAAA);
  static const Color secondaryTextWhite = Color(0xFFFFFFFF);
  static const Color secondaryTextDarkGrey = Color(0xFF999999);
  static const Color dividerColor = Color.fromRGBO(0, 0, 0, 0.1);
  //____________________________________________________________________
  // Highlighted or Alert Colors
  static const Color notificationBadge = Color(
    0xFFE65C00,
  ); // Orange badge color (Notification bubble)

  // Button or Active Element Colors
  static const Color buttonColor = Color(
    0xFFFEC041,
  ); // Orange button color ("Start Now")

  // Event Tag Colors
  static const Color eventBlue = Color(
    0xFF438AFD,
  ); // Blue (used for "Pakistan Cables - CCV Cables" and "Last chance to buy")
  static const Color eventOrange = Color(
    0xFFFF8250,
  ); // Orange (used for "SALE Accessories")
  static const Color eventGreen = Color(
    0xFF328047,
  ); // Green (used for "Sale under 150" and others)
  static const Color eventRed = Color(
    0xFFD74C47,
  ); // Red (used for "Last chance to buy")
  static const Color eventYellow = Color(
    0xFFFFC041,
  ); // Yellow (used for highlighted events)

  // Divider or Border Colors
  static const Color borderColor = Color(0xFFDEE5EB); // Light grey for borders
  static const Color borderGreen = Color(0xFF4FAC34); // Light green for borders

  // Misc Colors
  static const Color iconColor = Color(
    0xFF009639,
  ); // Green accent (used in logo)

  //Colors For Food Eat First
  static const primaryTextColor = Color(0xff101828);

  static const Color primaryWhite = Colors.white;
  static const Color primaryblack = Colors.black;
  static const Color blackpearl = Color(0xFF101828);
  static const Color red500 = Color(0xFFF95555);
  static const Color borderC = Color.fromARGB(232, 238, 238, 238);
  static const Color vibrantPinkishRed = Color(0xffF54975);
  static const Color darkGray = Color(0xff2B2B2B);
  static const Color gray600 = Color(0xFF475467);
  static const Color gray500 = Color(0xFF667085);
  static const Color gray400 = Color(0xFF393B41);
  static const Color gray50 = Color(0xFFEBECEE);
  static const Color charcoalgrey = Color(0xFF393B41);
  static const Color textBody = Color(0xFF344054);
  static const Color gray300 = Color(0xFFD0D5DD);
  static const Color gray200 = Color(0xFFEAECF0);
  static const Color gray100 = Color(0xFFF9FAFB);
  // static const Color lightGrey = Color(0xffE7E7E7);
  static const Color snowWhite = Color(0xffF9F9F9);
  static const Color green500 = Color(0xFF19B36E);
  static const Color green50 = Color(0xFFE8F7F1);
  static const Color iconGreen = Color(0xFF10B981);
  static const Color iconPurple = Color(0xFF8A66FB);
  static const Color purpleShade = Color(0xFFEBE9FE);
  static const Color purple25 = Color(0xFFFAFAFF);

  static const Color primarytext = Color(0xFF101828);
  static const Color chartgridColor = Color(0xFFE2E6F0);

  static const Color iconYellow = Color(0xFFF59E0B);
  static const Color coralOrange = Color(0xffFD824C);
  static const Color fieryRed = Color(0xffF95555);
  static const Color goldenrod = Color(0xffFFC02E);
  static const Color mintGreen = Color(0xff47C28B);
  static const Color blueLotus = Color(0xFF7A5AF8);
  static const Color ceramic = Color(0xFFFEFEFE);
  static const Color whitesmoke2 = Color(0xFFF4F5FF);
  static const Color catskillwhite = Color(0xffF1F3F8);
  static const Color mediumslateblue = Color(0xff6E62FF);
  static const Color purpleblue = Color(0xFF795FFC);
  static const Color purple500 = Color(0xFF7A5AF8);
  static const Color softpeach = Color(0xFFEDEAFF);
  static const Color whitesmoke = Color(0xFFF6F6F6);
  static const Color surfacePrimary = Color(0xFFFEFEFE);
  static const Color heavymetal = Color(0xFF2B2B2B);
  static const Color purplishBlue = Color(0xFF6938EF);
  static const Color davyGrey = Color(0x0fa75467);
  static const Color fog = Color(0xFFD9D6FE);
  static const Color titanWhite = Color(0xFFEBE9FE);
  static const Color aztecPurple = Color(0xFF7155FF);
  static const Color purple200 = Color(0xFFECE4FF);
  static const Color purple400 = Color(0xFF9B8AFB);
  static const Color dark = Color(0XFF161B23);
  static const Color santagrey = Color(0xFF98A2B3);
  static const Color purpleMimosa = Color(0xFF9B8AFB);
  static const Color vampireGrey = Color(0xFF475467);
  static const Color purple50 = Color(0xFFF4F3FF);
  static const Color purple100 = Color(0xFFEBE9FE);
  static const Color milkwhite = Color(0xFFFFFFFF);
  static const Color aquahaze = Color(0xFFF4F6F9);
  static const Color heavyMetal1 = Color(0xFF2D2D2D);
  static const Color night = Color(0xFF000000);
  static const Color casper = Color(0xFFB6C2D7);
  static const Color carnation = Color(0xFFF14E4E);
  static const Color purple300 = Color(0xFFBDB4FE);
  static const Color sprintColor = Color(0xFFA3ADC8);
  static const Color trout = Color(0xFF4F5464);
  static const Color zeus = Color(0xFF282828);

  static var mangoOrange;
}
