import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'editHomeScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var details;
  bool loading = true;

  fetchDetails() async{
    var ref = Firestore.instance;
    var fetchDet = await ref.collection("details").document("details").get();
    setState(() {
      details = fetchDet.data == null ? null : fetchDet.data;
      loading = false;
    });
  }

  String formEmail(String text){
    return "mailto:" + text;
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
    fetchDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: details != null ? SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              CircleAvatar(
                radius: 72,
                backgroundImage: NetworkImage(
                  details["profileImage"]
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                details["name"],
                style: GoogleFonts.raleway(
                  fontSize: 42
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                details["tagline"],
                style: GoogleFonts.varelaRound(
                  fontSize: 24
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  details["email"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(formEmail(details["email"]))){
                        launch(formEmail(details["email"]));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.email),
                    ),
                  ) : Container(),
                  details["github"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["github"])){
                        launch(details["github"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.github),
                    ),
                  ) : Container(),
                  details["facebook"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["facebook"])){
                        launch(details["facebook"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.facebook),
                    ),
                  ) : Container(),
                  details["instagram"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["instagram"])){
                        launch(details["instagram"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.instagram),
                    ),
                  ) : Container(),
                  details["linkedin"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["linkedin"])){
                        launch(details["linkedin"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.linkedin),
                    ),
                  ) : Container(),
                  details["twitter"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["twitter"])){
                        launch(details["twitter"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.twitter),
                    ),
                  ) : Container(),
                  details["medium"].length > 0 ? InkWell(
                    onTap: () async{
                      if( await canLaunch(details["medium"]) ){
                        launch(details["medium"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.medium),
                    ),
                  ) : Container(),
                  details["spotify"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["spotify"])){
                        launch(details["spotify"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.spotify),
                    ),
                  ) : Container(),
                  details["fiveHundredPx"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["fiveHundredPx"])){
                        launch(details["fiveHundredPx"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.fiveHundredPx),
                    ),
                  ) : Container(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              )
            ],
          ),
        ),
      ) : loading ? Center(
        child: CircularProgressIndicator(),
      ) : Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 32
          ),
          child: Text(
            "Content not found. Press the sync button to initialise data!",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 18,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          loading == false ? FloatingActionButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => EditHomeScreen(
                    pageTitle: "Edit Details",
                    name: details["name"],
                    tagline: details["tagline"],
                    aboutMe: details["aboutMe"],
                    email: details["email"],
                    instaLink: details["instagram"],
                    twitterLink: details["twitter"],
                    facebookLink: details["facebook"],
                    linkedin: details["linkedin"],
                    githubLink: details["github"],
                    spotify: details["spotify"],
                    fiveHundredPx: details["fiveHundredPx"],
                    medium: details["medium"],
                    greeting: details["greeting"],
                    resume: details["resumeLink"],
                    profileImg: details["profileImage"]
                  )
                )
              ).then((onValue){
                setState(() {
                  fetchDetails();
                });
              });
            },
            child: Icon(
              Icons.edit
            ),
          ): Text(""),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () async{
              var ref = Firestore.instance;
              var src = await DefaultAssetBundle.of(context).loadString("assets/data/init.json");
              var contentSrc = await DefaultAssetBundle.of(context).loadString("assets/data/content.json");
              var experienceSrc = await DefaultAssetBundle.of(context).loadString("assets/data/experience.json");
              var competitionSrc = await DefaultAssetBundle.of(context).loadString("assets/data/competitions.json");
              var blogSrc = await DefaultAssetBundle.of(context).loadString("assets/data/blogs.json");
              var blogJson = await json.decode(blogSrc);
              var compJson = await json.decode(competitionSrc);
              for (var item in blogJson["posts"]){
                var id = createDocID(item["title"]);
                await ref.collection("blogs").document(id).setData(item);
              }
              for (var item in compJson["competitions"]){
                await ref.collection("competitions").add(item);
              }
              var contentData = await json.decode(contentSrc);
              await ref.collection("details").document("content").setData(contentData);
              Map experienceData = await json.decode(experienceSrc.toString());
              for (var i = 0; i < experienceData["experience"].length; i++) {
                var docID = experienceData["experience"][i]["id"];
                Map data = experienceData["experience"][i];
                await ref.collection("experience").document(docID).setData(data);
              }
              var itemToUpload = await DefaultAssetBundle.of(context).load("assets/images/avatar.jpg");
              Uint8List data = itemToUpload.buffer.asUint8List();
              var storageRef = FirebaseStorage.instance.ref();
              var imageRef = storageRef.child("profileImage");
              StorageUploadTask uploadTask = imageRef.putData(data);
              StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
              var imgURL = await taskSnapshot.ref.getDownloadURL();
              Map temp = json.decode(src);
              temp["details"]["profileImage"] = imgURL;
              var resumeToUpload = await DefaultAssetBundle.of(context).load("assets/resume.pdf");
              Uint8List resumeInBytes = resumeToUpload.buffer.asUint8List();
              var resumeRef = storageRef.child("resume");
              StorageUploadTask resumeUploadTask = resumeRef.putData(resumeInBytes);
              StorageTaskSnapshot resumeUploadSnapshot = await resumeUploadTask.onComplete;
              var resumeURL = await resumeUploadSnapshot.ref.getDownloadURL();
              temp["details"]["resumeLink"] = resumeURL;
              await ref.collection("details").document("details").setData(temp["details"]);
              var projectsData = await DefaultAssetBundle.of(context).loadString("assets/data/projects.json");
              Map projectsJson = await json.decode(projectsData.toString());
              for (var i = 0; i < projectsJson["projects"].length; i++) {
                var docID = projectsJson["projects"][i]["id"];
                Map data = projectsJson["projects"][i];
                await ref.collection("projects").document(docID).setData(data);
              }
              fetchDetails();
              loading = true;
              details = null;
              setState((){
              });
            },
            heroTag: "Initialize data",
            child: Icon(
              Icons.autorenew
            ),
          )
        ],
      ),
    );
  }
}