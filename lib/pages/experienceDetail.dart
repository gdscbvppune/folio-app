import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addEditPositions.dart';

class ExperienceDetail extends StatefulWidget {

  final String title, period, details, institute, instituteURL, id;
  ExperienceDetail({this.title, this.details, this.period, this.institute, this.instituteURL, this.id});

  @override
  _ExperienceDetailState createState() => _ExperienceDetailState();
}

class _ExperienceDetailState extends State<ExperienceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: GoogleFonts.montserrat(
            fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  widget.title,
                  style: GoogleFonts.raleway(
                    fontSize: 24
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: RaisedButton.icon(
                  label: Text(
                    widget.institute,
                    style: GoogleFonts.montserrat(
                      fontSize: 18
                    ),
                  ),
                  onPressed: () async{
                    if(await canLaunch(widget.instituteURL)){
                      launch(widget.instituteURL);
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.chrome
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Text(
                  widget.period,
                  style: GoogleFonts.montserrat(
                    fontSize: 17
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32
                ),
                child: Text(
                  widget.details,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    fontSize: 15
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
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
              builder: (BuildContext context) => AddEditPositionsPage(
                pageTitle: "Edit Details",
                title: widget.title,
                institute: widget.institute,
                instituteURL: widget.instituteURL,
                description: widget.details,
                id: widget.id,
                period: widget.period
              )
            )
          ).then((onValue){
            Navigator.pop(context);
          });
        },
        child: Icon(
          Icons.edit
        ),
      ),
    );
  }
}