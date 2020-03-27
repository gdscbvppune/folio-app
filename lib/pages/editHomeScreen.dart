import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditHomeScreen extends StatefulWidget {

  final String name, tagline, aboutMe, facebookLink, instaLink, githubLink, twitterLink, email, pageTitle, greeting, medium, spotify, fiveHundredPx, profileImg, resume, linkedin;
  EditHomeScreen({this.name, this.email, this.tagline, this.aboutMe, this.facebookLink, this.instaLink, this.githubLink, this.twitterLink, this.pageTitle, this.greeting, this.medium, this.spotify, this.fiveHundredPx, this.profileImg, this.resume, this.linkedin});

  @override
  _EditHomeScreenState createState() => _EditHomeScreenState();
}

class _EditHomeScreenState extends State<EditHomeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController facebookLinkController = TextEditingController();
  TextEditingController instaLinkController = TextEditingController();
  TextEditingController githubLinkController = TextEditingController();
  TextEditingController twitterLinkController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController spotifyLinkController = TextEditingController();
  TextEditingController greetingController = TextEditingController();
  TextEditingController mediumController = TextEditingController();
  TextEditingController fiveHundredPxController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode taglineFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode aboutMeFocusNode = FocusNode();
  FocusNode facebookFocusNode = FocusNode();
  FocusNode instaFocusNode = FocusNode();
  FocusNode githubFocusNode = FocusNode();
  FocusNode twitterFocusNode = FocusNode();
  FocusNode spotifyFocusNode = FocusNode();
  FocusNode greetingFocusNode = FocusNode();
  FocusNode mediumFocusNode = FocusNode();
  FocusNode fiveHundredPxFocusNode = FocusNode();
  FocusNode linkedinFocusNode = FocusNode();

  File resumeFile;
  File imageFile;

  @override
  void initState() {
    nameController.text = widget.name;
    taglineController.text = widget.tagline;
    emailController.text = widget.email;
    aboutMeController.text = widget.aboutMe;
    facebookLinkController.text = widget.facebookLink;
    instaLinkController.text = widget.instaLink;
    githubLinkController.text = widget.githubLink;
    twitterLinkController.text = widget.twitterLink;
    spotifyLinkController.text = widget.spotify;
    greetingController.text = widget.greeting;
    mediumController.text = widget.medium;
    fiveHundredPxController.text = widget.fiveHundredPx;
    linkedinController.text = widget.linkedin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 42,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: nameFocusNode,
                  autocorrect: false,
                  autofocus: true,
                  controller: nameController,
                  onFieldSubmitted: (val){
                    nameController.text = val;
                  },
                  onEditingComplete: (){
                    nameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(taglineFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. Maximus Proximus",
                    labelText: "Name"
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: taglineFocusNode,
                  autocorrect: false,
                  controller: taglineController,
                  onFieldSubmitted: (val){
                    taglineController.text = val;
                  },
                  onEditingComplete: (){
                    taglineFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(greetingFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. Hello World",
                    labelText: "Tagline"
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: greetingFocusNode,
                  autocorrect: false,
                  controller: greetingController,
                  textCapitalization: TextCapitalization.words,
                  onFieldSubmitted: (val){
                    greetingController.text = val;
                  },
                  onEditingComplete: (){
                    greetingFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(aboutMeFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Hiya There",
                    labelText: "Greeting"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: aboutMeFocusNode,
                  autocorrect: false,
                  controller: aboutMeController,
                  onFieldSubmitted: (val){
                    aboutMeController.text = val;
                  },
                  onEditingComplete: (){
                    aboutMeFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "For eg. a few words about you",
                    labelText: "About Me"
                  ),
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: emailFocusNode,
                  autocorrect: false,
                  controller: emailController,
                  onFieldSubmitted: (val){
                    emailController.text = val;
                  },
                  onEditingComplete: (){
                    emailFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(facebookFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "info@gmail.com",
                    labelText: "Email Address"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: facebookFocusNode,
                  autocorrect: false,
                  controller: facebookLinkController,
                  onFieldSubmitted: (val){
                    facebookLinkController.text = val;
                  },
                  onEditingComplete: (){
                    facebookFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(linkedinFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://facebook.com/dewanshrawat15",
                    labelText: "Facebook Profile Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: linkedinFocusNode,
                  autocorrect: false,
                  controller: linkedinController,
                  onFieldSubmitted: (val){
                    linkedinController.text = val;
                  },
                  onEditingComplete: (){
                    linkedinFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(instaFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://linkedin.com/in/dewanshrawat15",
                    labelText: "Linkedin Profile Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: instaFocusNode,
                  autocorrect: false,
                  controller: instaLinkController,
                  onFieldSubmitted: (val){
                    instaLinkController.text = val;
                  },
                  onEditingComplete: (){
                    instaFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(twitterFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://instagram.com/dewanshrawat15",
                    labelText: "Instagram Profile Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: twitterFocusNode,
                  autocorrect: false,
                  controller: twitterLinkController,
                  onFieldSubmitted: (val){
                    twitterLinkController.text = val;
                  },
                  onEditingComplete: (){
                    twitterFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(githubFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://twitter.com/dewanshrawat15",
                    labelText: "Twitter Profile Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: githubFocusNode,
                  autocorrect: false,
                  controller: githubLinkController,
                  onFieldSubmitted: (val){
                    githubLinkController.text = val;
                  },
                  onEditingComplete: (){
                    githubFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(mediumFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://github.com/dewanshrawat15",
                    labelText: "Github Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: mediumFocusNode,
                  autocorrect: false,
                  controller: mediumController,
                  onFieldSubmitted: (val){
                    mediumController.text = val;
                  },
                  onEditingComplete: (){
                    mediumFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(spotifyFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://medium.com/@dewanshrawat15",
                    labelText: "Medium Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: spotifyFocusNode,
                  autocorrect: false,
                  controller: spotifyLinkController,
                  onFieldSubmitted: (val){
                    spotifyLinkController.text = val;
                  },
                  onEditingComplete: (){
                    spotifyFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(fiveHundredPxFocusNode);
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://open.spotify.com/in/dewanshrawat15",
                    labelText: "Spotify Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12
                ),
                child: TextFormField(
                  focusNode: fiveHundredPxFocusNode,
                  autocorrect: false,
                  controller: fiveHundredPxController,
                  onFieldSubmitted: (val){
                    fiveHundredPxController.text = val;
                  },
                  onEditingComplete: (){
                    fiveHundredPxFocusNode.unfocus();
                  },
                  decoration: InputDecoration(
                    suffix: Text(
                      "*"
                    ),
                    suffixStyle: TextStyle(
                      color: Colors.red
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "https://500px.com/dewanshrawat15",
                    labelText: "500px Link"
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12
                ),
                child: RaisedButton.icon(
                  onPressed: () async{
                    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imageFile = image;
                    });
                  },
                  icon: Icon(
                    Icons.photo_album
                  ),
                  label: Text(
                    "Select Image"
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 24
                ),
                child: RaisedButton.icon(
                  onPressed: () async{
                    File file = await FilePicker.getFile();
                    setState(() {
                      resumeFile = file;
                    });
                  },
                  icon: Icon(Icons.folder_open),
                  label: Text(
                    "Select resume file"
                  )
                ),
              ),
              SizedBox(
                height: 42,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Map<String, dynamic> updatedData = {
            "name": nameController.text,
            "tagline": taglineController.text,
            "greeting": greetingController.text,
            "aboutMe": aboutMeController.text,
            "email": emailController.text,
            "facebook": facebookLinkController.text,
            "fiveHundredPx": fiveHundredPxController.text,
            "github": githubLinkController.text,
            "instagram": instaLinkController.text,
            "linkedin": linkedinController.text,
            "medium": mediumController.text,
            "profileImage": widget.profileImg,
            "resumeLink": widget.resume,
            "spotify": spotifyLinkController.text,
            "tagline": taglineController.text,
            "twitter": twitterLinkController.text
          };
          if(imageFile != null){
            var storageRef = FirebaseStorage.instance.ref();
            await storageRef.child("profileImage").delete();
            StorageUploadTask uploadTask = storageRef.child("profileImage").putFile(imageFile);
            StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
            var imgURL = await taskSnapshot.ref.getDownloadURL();
            updatedData["profileImage"] = imgURL;
          }
          if(resumeFile != null){
            var storageRef = FirebaseStorage.instance.ref();
            await storageRef.child("resume").delete();
            StorageUploadTask uploadTask = storageRef.child("resume").putFile(resumeFile);
            StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
            var resumeURL = await taskSnapshot.ref.getDownloadURL();
            updatedData["resumeLink"] = resumeURL;
          }
          var ref = Firestore.instance;
          await ref.collection("details").document("details").setData(updatedData);
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}