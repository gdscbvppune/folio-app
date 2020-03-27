import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddEditPositionsPage extends StatefulWidget {

  final String title, period, instituteURL, institute, description, id, pageTitle;
  AddEditPositionsPage({this.title, this.period, this.institute, this.instituteURL, this.description, this.id, this.pageTitle});

  @override
  _AddEditPositionsPageState createState() => _AddEditPositionsPageState();
}

class _AddEditPositionsPageState extends State<AddEditPositionsPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 32
              ),
              child: buildTextField("Position"),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 32
              ),
              child: buildTextField("Organisation"),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 32
              ),
              child: buildTextField("Dates"),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 32
              ),
              child: buildTextField("Institute URL"),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 32
              ),
              child: buildTextField("Description"),
            ),
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