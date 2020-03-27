import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEditPositionsPage extends StatefulWidget {

  final String title, period, instituteURL, institute, description, id, pageTitle;
  AddEditPositionsPage({this.title, this.period, this.institute, this.instituteURL, this.description, this.id, this.pageTitle});

  @override
  _AddEditPositionsPageState createState() => _AddEditPositionsPageState();
}

class _AddEditPositionsPageState extends State<AddEditPositionsPage>{

  TextEditingController titleController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController instituteUrlController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode descFocusNode = FocusNode();
  FocusNode periodFocusNode = FocusNode();
  FocusNode instituteFocusNode = FocusNode();
  FocusNode instituteUrlFocusNode = FocusNode();

  @override
  void initState() {
    titleController.text = widget.title;
    periodController.text = widget.period;
    instituteController.text = widget.institute;
    instituteUrlController.text = widget.instituteURL;
    descController.text = widget.description;
    super.initState();
  }

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
            child: TextFormField(
              controller: titleController,
              focusNode: titleFocusNode,
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
                hintText: "For eg. Web Designer",
                labelText: "Role"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (val){
                titleController.text = val;
              },
              onEditingComplete: (){
                titleFocusNode.unfocus();
                FocusScope.of(context).requestFocus(periodFocusNode);
              },
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 32
            ),
            child: TextFormField(
              controller: periodController,
              focusNode: periodFocusNode,
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
                hintText: "For eg. 10th March - 21st April 2020",
                labelText: "Period"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (val){
                periodController.text = val;
              },
              onEditingComplete: (){
                periodFocusNode.unfocus();
                FocusScope.of(context).requestFocus(instituteFocusNode);
              },
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 32
            ),
            child: TextFormField(
              controller: instituteController,
              focusNode: instituteFocusNode,
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
                hintText: "For eg. Nasa",
                labelText: "Institute"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (val){
                instituteController.text = val;
              },
              onEditingComplete: (){
                instituteFocusNode.unfocus();
                FocusScope.of(context).requestFocus(instituteUrlFocusNode);
              },
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 32
            ),
            child: TextFormField(
              controller: instituteUrlController,
              focusNode: instituteUrlFocusNode,
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
                hintText: "For eg. https://nasa.gov",
                labelText: "Institute URL"
              ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              onFieldSubmitted: (val){
                instituteUrlController.text = val;
              },
              onEditingComplete: (){
                instituteUrlFocusNode.unfocus();
                FocusScope.of(context).requestFocus(descFocusNode);
              },
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 32
              ),
              child: TextFormField(
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
                  hintText: "For eg. I was an intern at NASA",
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          setState(() {});
          Map<String, dynamic> positionDetails = {
            "title": titleController.text,
            "period": periodController.text,
            "institute": instituteController.text,
            "desc": descController.text,
            "instituteURL": instituteUrlController.text
          };
          var docID;
          if(widget.title == null && widget.period == null && widget.institute == null && widget.instituteURL == null && widget.description == null){
            docID = (int.parse(widget.id) + 1).toString();
            positionDetails["id"] = docID;
          }
          else{
            docID = widget.id;
            positionDetails["id"] = docID;
          }
          await Firestore.instance.collection("experience").document(docID).setData(positionDetails);
          Navigator.pop(context);
        }
      ),
    );
  }
}