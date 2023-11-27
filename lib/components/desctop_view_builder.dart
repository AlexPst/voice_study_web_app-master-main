import 'package:flutter/material.dart';
import 'package:voice_study_web_app/constant.dart';
import 'package:google_fonts/google_fonts.dart';



class DesctopViewBuilder extends StatelessWidget {
  const DesctopViewBuilder({
    super.key, 
    required this.titleText, 
    required this.children
    });

  final String titleText;
  final List<Widget>children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kInitWidth,
      child: Container(
        width: kInitWidth,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleText, 
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.displayLarge),),
              ...children,
          ],
        ),

      ),
    );
  }
}