import 'package:flutter/material.dart';
import 'package:voice_study_web_app/constant.dart';
import 'package:voice_study_web_app/components/desctop_mobile_builder.dart';
import 'package:voice_study_web_app/main.dart';
import 'package:provider/provider.dart';


class NavigationBarView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return DesctopMobileViewBuilder(
      mobileView: NavigationMobileView(), 
      desctopView: NavigationDesctopView());
  }
}


class NavigationDesctopView extends StatelessWidget
{
  NavigationDesctopView({super.key});

  @override
  Widget build (BuildContext context)
  {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
        height: 100,
        width: kInitWidth,
        color: Colors.brown[600],
        padding: kScreenPadding,
        child: Row(
          children: [
            Spacer(),
            for (var item in navigationItems)
             NavigationBarItem(
                  onPressed: (){
                  scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  );
                  }, text: item.text,
             )
          ],
        ),
    );
}
}

class NavigationMobileView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container();
  }
}



class NavigationBarItem extends StatelessWidget{

  NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.text,
    
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
   return Padding(
     padding: const EdgeInsets.only(right: 10),
     child: TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        
      ),
      onPressed:() {onPressed();}, 
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: isSmall ? 17 : 24),),
      ),
   );
  }

}