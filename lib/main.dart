import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_study_web_app/headerView/headerview.dart';

void main() {
  runApp(MainApp());
}



class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Voice Study',
      theme: ThemeData(
        primaryColor: Colors.deepPurple.shade400,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, color: Colors.black,), 
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w300, fontStyle: FontStyle.normal, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind', color: Colors.black),
        )
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget
{
  const MainView({super.key});
  
  @override
  State<MainView> createState() => _MainView();


  
}

class _MainView extends State<MainView> with AfterLayoutMixin{
  
  final projectKey = GlobalKey();
  final skillKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  bool _showBackButton = true;
  List<NavigationItem>navigationItems = [];
  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0);
  
  
  @override
  void afterFirstLayout(BuildContext context){
      
      setState(() {
        navigationItems = [
          NavigationItem(text: 'Projects', key: projectKey),
          NavigationItem(text:'Навыки', key: skillKey),
          NavigationItem(text:'Опыт работы', key: experienceKey),
          NavigationItem(text: 'Блог', key: blogKey),
        ];
      });
    }
   
  
  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeaderView()
            ],
          ),
        ),
      )
    );
  }
}

class scrollController {
}

class NavigationItem{
  final String text;
  final GlobalKey key;

  NavigationItem(
    {
      required this.text, 
      required this.key
      });

      double get position => _getPosition(key);
}

double _getPosition(GlobalKey key)
{
  final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}