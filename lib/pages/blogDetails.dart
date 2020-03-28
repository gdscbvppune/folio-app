import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editBlog.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEditBlog(
                pageTitle: "Edit Post",
                title: widget.title,
                desc: widget.description,
                date: widget.date,
                workshop: widget.workshop,
                img: widget.imgURL,
              )
            )
          ).then((onValue){
            Navigator.pop(context);
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}