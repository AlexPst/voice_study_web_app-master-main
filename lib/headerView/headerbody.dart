import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_study_web_app/constant.dart';


class HeaderBody extends StatefulWidget {
  const HeaderBody({super.key, required this.isMobile});

  final bool isMobile;

  @override
  State<HeaderBody> createState() => _HeaderBodyState();
}

class _HeaderBodyState extends State<HeaderBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      height: 500,
      width: 659,
      child: Column(children: [
        SizedBox(height: 50,),
          Padding(
            padding: widget.isMobile ? EdgeInsets.only(left: 80) : EdgeInsets.all(0),
            child: AutoSizeText('Анастасия Новицкая',
                  style: GoogleFonts.inter(textStyle: widget.isMobile ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.displayLarge),
                  ),
          ),
         AutoSizeText('Какой-то текст Какой-то текст Какой-то текст' ,
        style: GoogleFonts.inter(textStyle: widget.isMobile ? Theme.of(context).textTheme.displayLarge : Theme.of(context).textTheme.displayMedium),
        ),
         SizedBox(height: widget.isMobile ? 20:40,),
      
      ],
       ),
       );
      
      
      
    
  }
}