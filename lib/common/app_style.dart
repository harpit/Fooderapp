import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(Color color , double size ,FontWeight fw){
  return GoogleFonts.poppins(
    color: color,fontWeight: fw,fontSize: size.sp,
  );
}
