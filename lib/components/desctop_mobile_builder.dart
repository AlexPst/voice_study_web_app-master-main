import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class DesctopMobileViewBuilder extends StatelessWidget{
  
  final bool? showMobile;
  final Widget mobileView;
  final Widget desctopView;

  const DesctopMobileViewBuilder({
    super.key, 
    required this.mobileView, 
    required this.desctopView, 
    this.showMobile});

  @override
  Widget build(BuildContext context) {
   
   return ResponsiveBuilder(builder: (_, size){
    if(showMobile ?? size.isMobile) return mobileView;
    return desctopView;
   });
   
  }
  
}