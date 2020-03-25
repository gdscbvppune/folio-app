import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:folio/pages/blogDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

  reframeDate(String text){
    var wordSplit = text.split('-');
    var temp = wordSplit[2] + "/" + wordSplit[1] + "/" + wordSplit[0];
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blogs"
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("blog").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data.documents.length != 0){
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  return Dismissible(
                    key: Key(snapshot.data.documents[index].documentID),
                    onDismissed: (direction) async{
                      Map<String, dynamic> postDetails = {
                        "workshop": snapshot.data.documents[index]["workshop"],
                        "imgURL": snapshot.data.documents[index]["imgURL"],
                        "title": snapshot.data.documents[index]["title"],
                        "description": snapshot.data.documents[index]["description"],
                        "date": snapshot.data.documents[index]["date"]
                      };
                      var docID = snapshot.data.documents[index].documentID;
                      await Firestore.instance.collection("blog").document(docID).delete();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Blog post deleted"
                          ),
                          duration: Duration(
                            seconds: 2
                          ),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () async{
                              await Firestore.instance.collection("blog").document(docID).setData(postDetails);
                            },
                          )
                        )
                      );
                    },
                    background: Container(
                      color: Colors.blue,
                    ),
                    child: ListTile(
                      leading: snapshot.data.documents[index]["imgURL"].length > 0 ? CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data.documents[index]["imgURL"]
                        ) 
                      ) : Icon(
                        FontAwesomeIcons.blog
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BlogDetails(
                              title: snapshot.data.documents[index]["title"],
                              description: snapshot.data.documents[index]["description"],
                              date: snapshot.data.documents[index]["date"],
                              imgURL: snapshot.data.documents[index]["imgURL"],
                              workshop: snapshot.data.documents[index]["workshop"],
                            )
                          )
                        );
                      },
                      title: Text(
                        snapshot.data.documents[index]["title"],
                        style: GoogleFonts.raleway(
                          fontSize: 20
                        ),
                      ),
                      subtitle: Text(
                        reframeDate(snapshot.data.documents[index]["date"]),
                        style: GoogleFonts.openSans(
                          fontSize: 14
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
                  "Add a few blogs first!",
                  style: GoogleFonts.montserrat(
                    fontSize: 20
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
    );
  }
}