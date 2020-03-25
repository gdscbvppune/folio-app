import 'dart:async';

import 'package:flutter/material.dart';

class App extends StatefulWidget
{
  @override
   createState() {
    return AppState();
    
  }
}

class AppState extends State<App> 
{
  final formKey = GlobalKey<FormState>(); 
  String title= '';
  String description = '';
  String date = '';
  String time = '';
  
  
  
  Widget build(context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar: AppBar(
      title: Text('Blogs',
      textAlign: TextAlign.center,
      //style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.orange[800],

      
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
          if(formKey.currentState.validate())
          {
            formKey.currentState.save();
            print('Time to post $title $date $description $time to my API');
          }



      },
      child: Icon(Icons.done),
      backgroundColor: Colors.orange[800],
    ),

    
     body: SingleChildScrollView(
            child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.only(bottom: 10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              
              
              titleField(),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              ),
              descriptionField(),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              ),
              dateField(),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              ),
              timeField(),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              ),
              


            ],


          ),
        ),




    ),
     ),
    
  
  

  ),

    
    );
    
  }
Widget titleField()
{
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Title',
      hintText: 'For eg: Poverty',

    ),
    onSaved: (String value)
    {
      title = value;
    },
      
  ) ; 
}
Widget descriptionField()
{
  return TextFormField(

    decoration: InputDecoration(
      labelText: 'Description',
      hintText: 'What your blog is based upon',
    ),
        onSaved: (String value)
    {
    description = value;
    },
  );
}
Widget dateField()
{
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Date',
      hintText: 'For eg : 2020-03-22',
    ),
    
    onSaved: (String value)
    {
      date = value;
    },
  );
}
Widget timeField()
{
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Time',
      hintText: 'For eg : 03:00 - 06:00',
    ),
    
    onSaved: (String value) {
      time = value;
    },

  );
}
}  

