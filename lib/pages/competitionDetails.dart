import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addEditCompetitions.dart';

class CompetitionDetails extends StatefulWidget {

  final String title, desc, date, venue, organisers, link, docID;
  CompetitionDetails({this.title, this.date, this.desc, this.venue, this.link, this.organisers, this.docID});

  @override
  _CompetitionDetailsState createState() => _CompetitionDetailsState();
}

class _CompetitionDetailsState extends State<CompetitionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Details"
        ),
        centerTitle: true
      ),
      body: SingleChildScrollView(
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
                  widget.title,
                  style: GoogleFonts.openSans(
                    fontSize: 34
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  widget.date,
                  style: GoogleFonts.openSans(
                    fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  "Organised by " + widget.organisers,
                  style: GoogleFonts.openSans(
                    fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  "At " + widget.venue,
                  style: GoogleFonts.openSans(
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  widget.desc,
                  style: GoogleFonts.openSans(
                    fontSize: 16
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 24
                  ),
                  child: RaisedButton.icon(
                    onPressed: () async{
                      if(await canLaunch(widget.link)){
                        launch(widget.link);
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.chrome
                    ),
                    label: Text(
                      "Event Website"
                    )
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddCompetition(
                eventTitle: widget.title,
                eventDescription: widget.desc,
                eventDate: widget.date,
                eventOrganisers: widget.organisers,
                eventURL: widget.link,
                eventVenue: widget.venue,
                docID: widget.docID,
                pageTitle: "Edit Event"
              )
            )
          );
        },
        child: Icon(
          Icons.edit
        ),
      ),
    );
  }
}