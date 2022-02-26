import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'pages/favourite-page.dart';
import 'pages/home-page.dart';
import 'pages/profile-page.dart';
import 'pages/searchpage.dart';
import 'pages/settings-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey =GlobalKey<CurvedNavigationBarState>();
  int index =2;

  final screens = [
   HomePage(),
   SearchPage(),
   FavouritePage(),
   SettingsPage(),
   ProfilePage(),
  ];
   

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
   
   
    final  items = <Widget>[
      Icon(Icons.home,size: 30,),
      Icon(Icons.search,size: 30,),
      Icon(Icons.favorite,size: 30,),
      Icon(Icons.settings,size: 30,),
      Icon(Icons.person,size: 30,),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: SafeArea( 
        top: false,
        child: Scaffold(
            extendBody: true,  
            appBar: AppBar(
                    
              title: Text('Curved Navigation bar')),
             
              bottomNavigationBar :
              Theme(
                data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
                child: CurvedNavigationBar(
                  key: navigationKey,
                  color: Colors.blue,
                  buttonBackgroundColor: Colors.green,
                  items: items,
                  height: 60,
                  backgroundColor: Colors.transparent,
                  index: index,
                  onTap: (index) => setState( ()=> this.index = index),
                  ),
              ),
                body:screens[index],
                // Stack(
                //   children: [
                //     Image.asset('assets/aa.png'),
                //     MaterialButton(
                //       child: Text('Go to 0'),
                //       onPressed: (){
                      
                //       final navigationState =navigationKey.currentState!;
                //       navigationState.setPage(0);
                //     },)
                //   ],
                // )
                //  Center(
                //   child: Text('$index',style: 
                //   TextStyle(
                //     fontSize: 130,
                //   fontWeight: FontWeight.bold),),
                // ),
              ),
      ),
    ) ;
   
  }
}


