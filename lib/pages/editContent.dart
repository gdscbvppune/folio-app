import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditContentPage extends StatefulWidget {

  final String aboutText, contactContent, footerText, hallOfFameContent, projectsContent, responsibilityContent, workshopContent;
  EditContentPage({this.aboutText, this.contactContent, this.footerText, this.hallOfFameContent, this.projectsContent, this.responsibilityContent, this.workshopContent});

  @override
  _EditContentPageState createState() => _EditContentPageState();
}

class _EditContentPageState extends State<EditContentPage> {

  TextEditingController aboutController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController footerController = TextEditingController();
  TextEditingController hallOfFameController = TextEditingController();
  TextEditingController projectsController = TextEditingController();
  TextEditingController responsibilityContentController = TextEditingController();
  TextEditingController workshopContentController = TextEditingController();

  FocusNode aboutFocusNode = FocusNode();
  FocusNode contactFocusNode = FocusNode();
  FocusNode footerFocusNode = FocusNode();
  FocusNode hallOfFameFocusNode = FocusNode();
  FocusNode projectsFocusNode = FocusNode();
  FocusNode responsibilityFocusNode = FocusNode();
  FocusNode workshopFocusNode = FocusNode();

  @override
  void initState() {
    aboutController.text = widget.aboutText;
    contactController.text = widget.contactContent;
    footerController.text = widget.footerText;
    hallOfFameController.text = widget.hallOfFameContent;
    projectsController.text = widget.projectsContent;
    responsibilityContentController.text = widget.responsibilityContent;
    workshopContentController.text = widget.workshopContent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit content"
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 54,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: aboutController,
                  focusNode: aboutFocusNode,
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
                    labelText: "About Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  onFieldSubmitted: (val){
                    aboutController.text = val;
                  },
                  onEditingComplete: (){
                    aboutFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(hallOfFameFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: hallOfFameController,
                  focusNode: hallOfFameFocusNode,
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
                    labelText: "Hall of Fame Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  onFieldSubmitted: (val){
                    hallOfFameController.text = val;
                  },
                  onEditingComplete: (){
                    hallOfFameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(projectsFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: projectsController,
                  focusNode: projectsFocusNode,
                  maxLines: null,
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
                    labelText: "Projects Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    projectsController.text = val;
                  },
                  onEditingComplete: (){
                    projectsFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(responsibilityFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: responsibilityContentController,
                  focusNode: responsibilityFocusNode,
                  maxLines: null,
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
                    labelText: "Positions of Responsibility Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    responsibilityContentController.text = val;
                  },
                  onEditingComplete: (){
                    responsibilityFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(workshopFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: workshopContentController,
                  focusNode: workshopFocusNode,
                  maxLines: null,
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
                    labelText: "Workshops Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    workshopContentController.text = val;
                  },
                  onEditingComplete: (){
                    workshopFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(contactFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: contactController,
                  focusNode: contactFocusNode,
                  maxLines: null,
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
                    labelText: "Contact Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    contactController.text = val;
                  },
                  onEditingComplete: (){
                    contactFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(footerFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: TextFormField(
                  controller: footerController,
                  maxLines: null,
                  focusNode: footerFocusNode,
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
                    labelText: "Footer Content"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    footerController.text = val;
                  },
                  onEditingComplete: (){
                    footerFocusNode.unfocus();
                  },
                ),
              ),
              SizedBox(
                height: 54,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ref = Firestore.instance.collection("details");
          setState((){});
          Map<String, dynamic> tempDetails = {
            "aboutText": aboutController.text,
            "contactContent": contactController.text,
            "footerText": footerController.text,
            "hallOfFameContent": hallOfFameController.text,
            "projectsContent": projectsController.text,
            "responsibilityContent": responsibilityContentController.text,
            "workshopContent": workshopContentController.text
          };
          await ref.document("content").setData(tempDetails);
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}