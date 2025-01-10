import 'package:flutter/material.dart';

// Enums
enum Direction {
  top,
  left,
  right,
  bottom,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

enum ScanMode {
  camera,
  gallery,
  none
}

// Color
const Color kCreamColor = Color(0xFFFFFDF9);
const Color kDarkCreamColor = Color(0xFFE8E6E1);
const Color kDarkBrownColor = Color(0xFF140D07);
const Color kPurpleColor = Color(0xFF56367A);
const Color kDeepPurpleColor = Color(0xFF321F47);
const Color kTealColor = Color(0xFF53C5CF);
const Color kOrangeColor = Color(0xFFFDC04F);
// const Color kYellowColor = Color(0xFFFAE741);
const Color kYellowColor = Color(0xFFedde5c);
const Color kRedColor = Color(0xFFDE6D78);

// Text Style
const TextStyle kXXLargeTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: kDeepPurpleColor,
  fontSize: 38,
);

const TextStyle kXLargeTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: kDeepPurpleColor,
  fontSize: 34,
);

const TextStyle kLargeTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: kDeepPurpleColor,
  fontSize: 28,
);

const TextStyle kMediumTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: kDeepPurpleColor,
  fontSize: 20,
);

const TextStyle kSmallTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: kDarkCreamColor,
  fontSize: 16,
);

const TextStyle kXSmallTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: Colors.black54,
  fontSize: 10,
);

const TextStyle kWhiteMediumTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: Colors.white,
  fontSize: 20,
);

const TextStyle kWhiteLargeTextStyle = TextStyle(
  fontFamily: 'Axis',
  color: Colors.white,
  fontSize: 28,
);