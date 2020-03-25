import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  var details, content;

  fetchDetails() async{
    var ref = Firestore.instance.collection("details");
    var tempDetails = await ref.document("details").get();
    var tempContent = await ref.document("content").get();
    setState(() {
      details = tempDetails;
      content = tempContent;
    });
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
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: details != null && content != null ? SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  "About Me",
                  style: GoogleFonts.raleway(
                    fontSize: 32
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  content["aboutText"],
                  style: GoogleFonts.openSans(
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              )
            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}