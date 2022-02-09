import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool isDesktop = !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);

const kPrimaryColor = Color(0xFF172D4F);
const kPrimaryLightColor = Color(0xFF224377);
const kIndicatorTrackColor = Color(0xFF244975);
const kIndicatorLineColor = Color(0xFF5383CE);
const kGrey = Color(0xFFF2F2F6);

const kImgAssetWinDash = 'assets/img/win_dash.png';

const appTextTheme = GoogleFonts.spaceGroteskTextTheme;
const appTextStyle = GoogleFonts.spaceGrotesk;

final kWinTitle = appTextStyle(
  fontSize: 64,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);

final kWinSubTitle = appTextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: kPrimaryLightColor,
);
