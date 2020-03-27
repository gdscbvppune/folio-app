import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:folio/pages/experienceDetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addEditPositions.dart';

class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {

  int len = 0;

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
          "Positions of Responsibility",
          style: GoogleFonts.montserrat(
            fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("experience").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data.documents.length != 0){
              len = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  return Dismissible(
                    key: Key(snapshot.data.documents[index].documentID),
                    background: Container(
                      color: Colors.blue,
                    ),
                    onDismissed: (direction) async{
                      Scaffold.of(context).removeCurrentSnackBar();
                      var docID = snapshot.data.documents[index].documentID;
                      Map<String, dynamic> tempDetails = {
                        "period": snapshot.data.documents[index]["period"],
                        "title": snapshot.data.documents[index]["title"],
                        "desc": snapshot.data.documents[index]["desc"],
                        "id": snapshot.data.documents[index]["id"],
                        "institute": snapshot.data.documents[index]["institute"],
                        "instituteURL": snapshot.data.documents[index]["instituteURL"],
                      };
                      await Firestore.instance.collection("experience").document(docID).delete();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Experience record deleted"
                        ),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () async{
                            await Firestore.instance.collection("experience").document(docID).setData(tempDetails);
                          },
                        ),
                      ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          FontAwesomeIcons.briefcase,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      onTap: (){
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ExperienceDetail(
                              id: len.toString(),
                              details: snapshot.data.documents[index]["desc"],
                              title: snapshot.data.documents[index]["title"],
                              period: snapshot.data.documents[index]["period"],
                              institute: snapshot.data.documents[index]["institute"],
                              instituteURL: snapshot.data.documents[index]["instituteURL"]
                            )
                          )
                        ).then((onValue){
                          setState(() {
                            
                          });
                        });
                      },
                      title: Text(
                        snapshot.data.documents[index]["title"],
                        style: GoogleFonts.raleway(
                          fontSize: 22
                        ),
                      ),
                      subtitle: Text(
                        snapshot.data.documents[index]["period"],
                        style: GoogleFonts.openSans(
                          fontSize: 14
                        ),
                      ),
                    ),
                  );
                },
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {});
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEditPositionsPage(
                pageTitle: "Add Experience",
                id: len.toString(),
              )
            )
          );
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}