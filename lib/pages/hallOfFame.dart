import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'competitionDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addEditCompetitions.dart';

class HallOfFame extends StatefulWidget {
  @override
  _HallOfFameState createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
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
        title: Text(
          "Hall of Fame"
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("competitions").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data.documents.length != 0){
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: Key(snapshot.data.documents[index].documentID),
                    onDismissed: (direction){
                      var docID = snapshot.data.documents[index].documentID;
                      var ref = Firestore.instance.collection("competitions");
                      Map<String, dynamic> doc = {
                        "title": snapshot.data.documents[index]["title"],
                        "venue": snapshot.data.documents[index]["venue"],
                        "link": snapshot.data.documents[index]["link"],
                        "organisers": snapshot.data.documents[index]["organisers"],
                        "date": snapshot.data.documents[index]["date"],
                        "description": snapshot.data.documents[index]["description"]
                      };
                      ref.document(docID).delete();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Deleting record"
                          ),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () async{
                              await ref.add(doc);
                            }
                          ),
                        )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 12
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.medal
                                  ),
                                  title: Text(
                                    snapshot.data.documents[index]["title"]
                                  ),
                                  subtitle: Text(
                                    snapshot.data.documents[index]["date"]
                                  ),
                                ),
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  snapshot.data.documents[index]["link"].length > 0 ? FlatButton(
                                    child: Text(
                                      "Event Link"
                                    ),
                                    onPressed: () async{
                                      if(await canLaunch(snapshot.data.documents[index]["link"])){
                                        launch(snapshot.data.documents[index]["link"]);
                                      }
                                    },
                                  ) : Text(""),
                                  FlatButton(
                                    child: Text(
                                      "See more"
                                    ),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => CompetitionDetails(
                                            title: snapshot.data.documents[index]["title"],
                                            link: snapshot.data.documents[index]["link"],
                                            venue: snapshot.data.documents[index]["venue"],
                                            date: snapshot.data.documents[index]["date"],
                                            organisers: snapshot.data.documents[index]["organisers"],
                                            docID: snapshot.data.documents[index].documentID,
                                            desc: snapshot.data.documents[index]["description"]
                                          )
                                        )
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              );
            }
            else{
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20
                  ),
                  child: Text(
                    "No records found! Please add some",
                    style: GoogleFonts.montserrat(
                      fontSize: 16
                    ),
                  ),
                ),
              );
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddCompetition(
                pageTitle: "Add Competiton Details",
              )
            )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}