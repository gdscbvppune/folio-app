import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEditProjects extends StatefulWidget {

  final String title, shortDesc, github, id, pageTitle;
  AddEditProjects({this.title, this.shortDesc, this.github, this.id, this.pageTitle});

  @override
  _AddEditProjectsState createState() => _AddEditProjectsState();
}

class _AddEditProjectsState extends State<AddEditProjects> {

  TextEditingController titleController = TextEditingController();
  TextEditingController shortDescController = TextEditingController();
  TextEditingController githubController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode shortDescFocusNode = FocusNode();
  FocusNode githubFocusNode = FocusNode();

  @override
  void initState() {
    titleController.text = widget.title;
    githubController.text = widget.github;
    shortDescController.text = widget.shortDesc;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 32
                ),
                child: TextFormField(
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
                    hintText: "Project Title",
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
                    FocusScope.of(context).requestFocus(githubFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: githubController,
                  focusNode: githubFocusNode,
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
                    hintText: "For eg. https://github.com/dscbvppune/folio-app",
                    labelText: "Github Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (val){
                    githubController.text = val;
                  },
                  onEditingComplete: (){
                    githubFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(shortDescFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: shortDescController,
                  focusNode: shortDescFocusNode,
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
                    hintText: "For eg. A short one line description about the project",
                    labelText: "Description"
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    shortDescController.text = val;
                  },
                  onEditingComplete: (){
                    shortDescFocusNode.unfocus();
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          setState(() {
            
          });
          Map<String, dynamic> projectDetails = {
            "title": titleController.text,
            "github": githubController.text,
            "shortDescription": shortDescController.text
          };
          if(widget.title == null && widget.shortDesc == null && widget.github == null){
            int tempId = int.parse(widget.id) + 1;
            await Firestore.instance.collection("projects").document(tempId.toString()).setData(projectDetails);
          }
          else{
            await Firestore.instance.collection("projects").document(widget.id).setData(projectDetails);
          }
          Navigator.pop(context);
        },
        child: Icon(
          Icons.done
        ),
      ),
    );
  }
}