import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

class BlogDetails extends StatefulWidget {

  final String title, description, date, imgURL, workshop;
  BlogDetails({this.title, this.description, this.date, this.imgURL, this.workshop});

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {

  reframeDate(String text){
    var wordSplit = text.split('-');
    var temp = wordSplit[2] + "/" + wordSplit[1] + "/" + wordSplit[0];
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              widget.imgURL.length > 0 ? Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 32,
                          height: MediaQuery.of(context).size.height / 4,
                          color: Colors.black38,
                        ),
                        Image.network(
                          widget.imgURL,
                          width: MediaQuery.of(context).size.width - 32,
                          height: MediaQuery.of(context).size.height / 4,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ),
              ) : Text(""),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24
                ),
                child: Center(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 28
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                reframeDate(widget.date),
                style: GoogleFonts.openSans(
                  fontSize: 18
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20
                ),
                child: Text(
                  widget.description,
                  style: GoogleFonts.openSans(
                    fontSize: 15
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}