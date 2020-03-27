import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddEditBlog extends StatefulWidget{

  final String title, desc, date, img, pageTitle, workshop;
  AddEditBlog({this.title, this.desc, this.date, this.img, this.pageTitle, this.workshop});

  @override
  AddEditBlogState createState() => AddEditBlogState();
}

class AddEditBlogState extends State<AddEditBlog>{

  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode descFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();

  File postImage;
  String dropDownChoice;

  String reframeDate(String text){
    var words = text.split('-');
    return words[2] + "-" + words[1] + "-" + words[0];
  }

  String createDocID(String text){
    var words = text.split(' ');
    String docID = '';
    int counter = 0;
    for (var item in words){
      docID = docID + item.toLowerCase().toString();
      counter = counter + 1;
      if(counter < words.length){
        docID = docID + "-";
      }
    }
    return docID;
  }

  @override
  void initState() {
    dropDownChoice = widget.workshop;
    var dt = DateTime.now();
    var date = DateFormat.yMd().format(dt).toString().split('/');
    var newDate = date[1] + "-" + date[0] + "-" + date[2];
    titleController.text = widget.title;
    descController.text = widget.desc;
    if(widget.date != null){
      dateController.text = reframeDate(widget.date);
    }
    else{
      dateController.text = newDate;
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.only(bottom: 10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.blue
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. Poverty",
                    labelText: "Title"
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  focusNode: titleFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (val){
                    titleController.text = val;
                  },
                  onEditingComplete: (){
                    titleFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(dateFocusNode);
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                ListTile(
                  title: Text(
                    "Is it a workshop you spoke on?"
                  ),
                  subtitle: DropdownButton<String>(
                    value: dropDownChoice,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 18,
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownChoice = newValue;
                      });
                    },
                    items: <String>['true', 'false']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: dateController,
                  focusNode: dateFocusNode,
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.blue
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. Date/Month/Year",
                    labelText: "Date"
                  ),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (val){
                    dateController.text = val;
                  },
                  onEditingComplete: (){
                    dateFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(descFocusNode);
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: descController,
                  focusNode: descFocusNode,
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.blue
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. Your content",
                    labelText: "Description"
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    descController.text = val;
                  },
                  onEditingComplete: (){
                    descFocusNode.unfocus();
                  },
                ),
                RaisedButton.icon(
                  onPressed: () async{
                    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      postImage = image;
                    });
                  },
                  icon: Icon(Icons.photo_album),
                  label: Text(
                    "Select post image"
                  )
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var docID = createDocID(titleController.text);
          Map<String, dynamic> blogPostDetails = {
            "date": dateController.text,
            "description": descController.text,
            "imgURL": widget.img,
            "title": titleController.text,
            "workshop": dropDownChoice
          };
          if(postImage != null){
            if(widget.img.length == 0){
              var storageRef = FirebaseStorage.instance.ref();
              var locRef = storageRef.child("blogs");
              StorageUploadTask uploadTask = locRef.child(titleController.text).putFile(postImage);
              StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
              var imgURL = await taskSnapshot.ref.getDownloadURL();
              blogPostDetails["imgURL"] = imgURL;
            }
            else{
              var storageRef = FirebaseStorage.instance.ref();
              var locRef = storageRef.child("blogs");
              await locRef.child(titleController.text).delete();
              StorageUploadTask uploadTask = locRef.child(titleController.text).putFile(postImage);
              StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
              var imgURL = await taskSnapshot.ref.getDownloadURL();
              blogPostDetails["imgURL"] = imgURL;
            }
          }
          await Firestore.instance.collection("blogs").document(docID).setData(blogPostDetails);
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );    
  }
}