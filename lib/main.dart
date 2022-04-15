
import 'dart:async';
import 'package:android_assignment/content_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'content_display_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserDetailsBloc>(create: (BuildContext context)=> UserDetailsBloc()),
    ],
    child: MyApp(),

  ));

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
               DataFromAPI(title: 'User Details')
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Center(child: Text('Physics Wallah',
            style: TextStyle(color: Colors.blue,fontSize:  MediaQuery.of(context).size.width *0.08)));

  }
}
