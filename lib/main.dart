import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Myhome());
  }
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
         
         body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                     
                ),
                
              ),
            ElevatedButton(onPressed: () {
              
            }, child: Text("data"))
            ],
          )
         ]),


        
        
          
        
        ),
          
      );
    
  }
}
