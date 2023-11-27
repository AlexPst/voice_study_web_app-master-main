import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_study_web_app/components/mobile_view_builder.dart';
import 'package:voice_study_web_app/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:voice_study_web_app/components/desctop_mobile_builder.dart';
import 'package:voice_study_web_app/headerView/headerbody.dart';




class HeaderView extends StatelessWidget {
 HeaderView({super.key});

  @override
  Widget  build (BuildContext context) {
    return DesctopMobileViewBuilder(
      mobileView: HeaderMobileView(), 
      desctopView: const HeaderDesctopView());
  }
}


class HeaderDesctopView extends StatelessWidget {
   const HeaderDesctopView({super.key});
 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imageWidth = width * 0.47;
    final isSmall = width < 950;
    Size size = MediaQuery.of(context).size;
    return 
        Container(
          height: 850,
          width: kInitWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/backgr_photo.jpg"),
              fit: BoxFit.cover,
              
            ),
          ),
          child: Stack(
          children: [
            const SizedBox(height: 100,),   
            Align(alignment: Alignment.center,
            child: GlassBlurContetnDesctop(size: size),),       
            Align(alignment: Alignment(0.6, 0.0),
            child: PersonPic(),
            ),
           
            ]     
          ),
        );  
  }

}


class HeaderMobileView extends StatelessWidget {
   HeaderMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
      Align(alignment: Alignment(0.0, 0.0),
        child: Container(
          padding: kScreenPadding,
          height: 450,
          width: 300,
      
     child: Image.asset("lib/images/header_mobile_photo.png", 
      fit: BoxFit.fitWidth,),
    ),),
      
    const SizedBox(height: 0),
    const Align(alignment: Alignment.bottomCenter,
    child: Expanded(
      child: HeaderBody(isMobile: true),
    )
    )
      ],
    );
    
  }
}


class GlassBlurContetnDesctop extends StatelessWidget {
   const GlassBlurContetnDesctop({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: kScreenPadding * 2,
          constraints: BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.topLeft,
                  child: Expanded(
                    child: HeaderBody(isMobile: false)
                  )
                  ),
                  Spacer()
                ]
              ),
          
            
              )
            
          ),
        );
  }
}


class PersonPic extends StatelessWidget {
  const PersonPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
      child: Image.asset("lib/images/header_photo_main.png"),
    );
  }
}




