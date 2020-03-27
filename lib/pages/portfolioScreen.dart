import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:folio/pages/addEditProjects.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {

  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Projects"
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("projects").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data.documents.length != 0){
              id = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  return Dismissible(
                    key: Key(
                      snapshot.data.documents[index].documentID
                    ),
                    onDismissed: (direction) async{
                      Scaffold.of(context).removeCurrentSnackBar();
                      var docID = snapshot.data.documents[index]["id"];
                      Map<String, dynamic> projectDetails = {
                        "github": snapshot.data.documents[index]["github"],
                        "id": docID,
                        "title": snapshot.data.documents[index]["title"],
                        "shortDescription": snapshot.data.documents[index]["shortDescription"]
                      };
                      await Firestore.instance.collection("projects").document(docID).delete();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Project deleted"
                          ),
                          action: SnackBarAction(
                            onPressed: () async{
                              await Firestore.instance.collection("projects").document(docID).setData(projectDetails);
                            },
                            label: 'Undo',
                          ),
                        )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 24
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => AddEditProjects(
                                pageTitle: "Edit Project",
                                title: snapshot.data.documents[index]["title"],
                                github: snapshot.data.documents[index]["github"],
                                shortDesc: snapshot.data.documents[index]["shortDescription"],
                                id: snapshot.data.documents[index].documentID,
                              )
                            )
                          );
                        },
                        trailing: InkWell(
                          onTap: () async{
                            if(await canLaunch(snapshot.data.documents[index]["github"])){
                              launch(snapshot.data.documents[index]["github"]);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Icon(
                              FontAwesomeIcons.github
                            ),
                          ),
                        ),
                        title: Text(
                          snapshot.data.documents[index]["title"],
                          style: GoogleFonts.raleway(
                            fontSize: 24
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.documents[index]["shortDescription"],
                          style: GoogleFonts.montserrat(
                            fontSize: 16
                          ),
                        )
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Center(
                child: Text(
                  "No records found.",
                  style: GoogleFonts.montserrat(
                    fontSize: 20
                  ),
                ),
              );
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator()
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEditProjects(
                pageTitle: "Add Project",
                id: id.toString()
              )
            )
          );
        },
        child: Icon(
          Icons.add
        ),
      )
    );
  }
}