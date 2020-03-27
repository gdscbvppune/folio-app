import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var docID = createDocID(titleController.text);
          print(docID);
          if(formKey.currentState.validate()){
            formKey.currentState.save();
          }
        },
        child: Icon(Icons.done),
      ),
    );    
  }
}