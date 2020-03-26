import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(ExperiencePage());

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: CreatePage(),
    );
  }
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Experience',
           style: TextStyle(
             fontSize:50.0,
             fontFamily: 'Montserrat',
             fontWeight: FontWeight.bold,
             color: Colors.purple[600]
           ),
          ),
          SizedBox(height: 40.0),
          buildTextField("Position"),
          SizedBox(height: 20.0),
           buildTextField("Organisation"),
           SizedBox(height: 20.0),
            buildTextField("Dates"),
            SizedBox(height: 20.0),
             buildTextField("Description"),
        ],
        ),
      ),
    );
  }
    Widget buildTextField(String hintText){
      return TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
           ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            
          )
           
          
        ),
        
      );
     
    }
    
  }

    
