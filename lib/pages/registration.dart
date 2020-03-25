import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
   return Scaffold(
      
      body: Container(
         height: height,
         width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.cover
              ),

          ),
          child: SingleChildScrollView(
            child: Registration()
            ),
        ),
    );
  }
}

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  
  bool validate1=false;
  bool validate2=false;
  bool validate3=false;
  bool validate4=false;
  bool validate5=false;
  bool validate6=false;
  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:height/6),
        height: height,
        width: width*3/4,
        child: Column(
          children: <Widget>[
            TextField(
              controller: text1,
               maxLines: 1,
               autocorrect: true,
              decoration: InputDecoration(
                hintText:'Project Name', 
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0
                ),
                errorText: validate1 ?'Required Field':null,   
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
               controller: text2,
               maxLines: 1,
               autocorrect: true,
               decoration: InputDecoration(
                hintText:'Project Description', 
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0,
                   
                ),
                errorText: validate2 ?'Required Field':null,   

              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
               controller: text3,
               maxLines: 1,
               autocorrect: true,
               decoration: InputDecoration(
                hintText:'The Problem', 
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0
                ),
                errorText: validate3 ?'Required Field':null,   
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
               controller: text4,
               maxLines: 1,
               autocorrect: false,
               decoration: InputDecoration(
                hintText:'Technology Used', 
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0
                ),
                errorText: validate4 ?'Required Field':null,   

              ),
              
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
               controller: text5,
               maxLines: 1,
               autocorrect: true,
               decoration: InputDecoration(
                hintText:'Challenge Faced',
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0
                ), 
                errorText: validate5 ?'Required Field':null,   

              ),
              
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
               controller: text6,
               maxLines: 1,          
               decoration: InputDecoration(
                hintText:'Github link', 
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.7),
                   gapPadding: 4.0
                ),
                errorText: validate6 ?'Required Field':null,   
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              child: RaisedButton(
               // padding: EdgeInsets.only(left: width,bottom: 5),
                onPressed: (){
                  setState(() {
                      text1.text.isEmpty ? validate1=true:validate1=false;
                      text2.text.isEmpty ? validate2=true:validate2=false;
                      text3.text.isEmpty ? validate3=true:validate3=false;
                      text4.text.isEmpty ? validate4=true:validate4=false;
                      text5.text.isEmpty ? validate5=true:validate5=false;
                      text6.text.isEmpty ? validate6=true:validate6=false;


                  });
                },
                child: Text('Submit'),
                color: Colors.amber,
                ),
            )
          ],
        ),
      ),
    );
  }
}
