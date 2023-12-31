import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Colorss {
  static const backgroundColor = Colors.white;
  static const forebackground = Color(0xff0D0C0C);
  static const themeNeon1 = Color(0xff61A8D0);
  static const themeNeon2 = Color(0xff005E95);
  static const textColor = Color(0xffafaeb6);
  static const borderColor = Color(0xff3E4055);
}

class Styles {
  static TextStyle get smallTextStyle => GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colorss.forebackground,
      );
  static TextStyle get mediumTextStyle => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colorss.forebackground,
      );
  static TextStyle get bigTextStyle => GoogleFonts.montserrat(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: Colorss.forebackground,
      );
  static TextStyle get smallTitleStyle => GoogleFonts.montserrat(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: Colorss.forebackground,
      );
  static TextStyle get bigTitleStyle => GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colorss.forebackground,
      );
}

class Errors {
  static final mapIn = <String, dynamic>{
    "email-already-in-use": "An account already exists for this email.",
    "invalid-email": "Wrong email. Please check your password.",
    "user-disabled": "This user cannot login to this account because it has been disabled.",
    "user-not-found": " No user found for this information.",
    "wrong-password": "Wrong password. Please check your password.",
    "account-exists-with-different-credential":
        " This account already exists with a different credential. Please sign in with the correct credential.",
    "invalid-credential ": "The credential is malformed or has expired.",
    "operation-not-allowed": "This operation is not allowed. Please contact support.",
    "invalid-verification-code": "The verification code is malformed or has expired.",
    "network-request-failed ": " Please check your internet connection.",
    "invalid-verification-id ": "The verification ID is malformed.",
  };
}
