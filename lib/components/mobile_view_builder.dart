import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_study_web_app/constant.dart';


class DesctopViewBuilder extends StatelessWidget {
  const DesctopViewBuilder({
    super.key, 
    required this.titleText, 
    required this.children
    });

  final String titleText;
  final List <Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kInitWidth,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(titleText,
          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.displayLarge),),
          SizedBox(height: 40,),
          ...children,
        ],
      ),
    );
  }
}