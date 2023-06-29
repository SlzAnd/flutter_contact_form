import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

// Colors for contact_form widget
Color submittButtonColor = const Color(0xff986d8e);
Color iconAroundColor = const Color(0xfffff5e9);
Color lockIconColor = const Color(0xffe5be90);
Color hintTextColor = const Color(0xff848999);


// Icons for contact_form widget
Widget lockIcon = Container(
  width: 40,
  height: 40,
  decoration: BoxDecoration(
    color: iconAroundColor,
    shape: BoxShape.circle
 
  ),
  child:  CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 15,
    child: Image.asset(
      'assets/unlock.png',
      color: lockIconColor,
      width: 15,
      height: 15,
    )
  ),
);

// Text styles for contact form
TextStyle titleTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w700,
  fontSize: 24,
  textStyle: const TextStyle(
    color: Colors.black,
    letterSpacing: 1,
  ),
);

TextStyle hintTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w500,
  fontSize: 12,
  textStyle: TextStyle(
    color: hintTextColor,
  )
);

TextStyle sendButtonTextStyle = GoogleFonts.nunito(
  fontSize: 18,
  fontWeight: FontWeight.w600
);