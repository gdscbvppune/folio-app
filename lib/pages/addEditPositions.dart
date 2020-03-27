import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddEditPositionsPage extends StatefulWidget {
  @override
  _AddEditPositionsPageState createState() => _AddEditPositionsPageState();
}

class _AddEditPositionsPageState extends State<AddEditPositionsPage>{
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