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

  fetchDetails() async{
    var ref = Firestore.instance;
    var fetchDet = await ref.collection("details").document("details").get();
    setState(() {
      details = fetchDet;
    });
  }

  String formEmail(String text){
    return "mailto:" + text;
  }

  @override
  void initState() {
    fetchDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
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
                  ) : null,
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              )
            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
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
          ),
          SizedBox(
            height: 20,
          ),
          InitFloatingActionButton()
        ],
      ),
    );
  }
}

class InitFloatingActionButton extends StatelessWidget {
  const InitFloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async{
        var ref = Firestore.instance;
        var src = await DefaultAssetBundle.of(context).loadString("assets/data/init.json");
        var contentSrc = await DefaultAssetBundle.of(context).loadString("assets/data/content.json");
        var contentData = await json.decode(contentSrc);
        await ref.collection("details").document("content").setData(contentData);
        var experienceSrc = await DefaultAssetBundle.of(context).loadString("assets/data/experience.json");
        Map experienceData = await json.decode(experienceSrc.toString());
        for (var i = 0; i < experienceData["experience"].length; i++) {
          var docID = experienceData["experience"][i]["id"];
          Map data = experienceData["experience"][i];
          await ref.collection("experience").document(docID).setData(data);
        }
        var itemToUpload = await DefaultAssetBundle.of(context).load("assets/images/avatar.jpg");
        Uint8List data = itemToUpload.buffer.asUint8List();
        var storageRef = FirebaseStorage.instance.ref().child("profileImage");
        StorageUploadTask uploadTask = storageRef.putData(data);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
        var imgURL = await taskSnapshot.ref.getDownloadURL();
        Map temp = json.decode(src);
        temp["details"]["profileImage"] = imgURL;
        await ref.collection("details").document("details").setData(temp["details"]);
        var projectsData = await DefaultAssetBundle.of(context).loadString("assets/data/projects.json");
        Map projectsJson = await json.decode(projectsData.toString());
        for (var i = 0; i < projectsJson["projects"].length; i++) {
          var docID = projectsJson["projects"][i]["id"];
          Map data = projectsJson["projects"][i];
          await ref.collection("projects").document(docID).setData(data);
        }
        var snackbar = SnackBar(
          content: Text(
            "Website has been initialised"
          )
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      heroTag: "Initialize data",
      child: Icon(
        Icons.autorenew
      ),
    );
  }
}