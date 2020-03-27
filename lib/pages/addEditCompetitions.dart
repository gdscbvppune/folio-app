import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCompetition extends StatefulWidget {

  final pageTitle, eventTitle, eventDate, eventVenue, eventOrganisers, eventDescription, eventURL, docID;
  AddCompetition({this.pageTitle, this.eventDate, this.eventDescription, this.eventOrganisers, this.eventVenue, this.eventTitle, this.eventURL, this.docID});

  @override
  _AddCompetitionState createState() => _AddCompetitionState();
}

class _AddCompetitionState extends State<AddCompetition> {

  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventVenueController = TextEditingController();
  TextEditingController eventOrganisersController = TextEditingController();
  TextEditingController eventDescController = TextEditingController();
  TextEditingController eventLinkController = TextEditingController();

  FocusNode eventTitleFocusNode = FocusNode();
  FocusNode eventDateFocusNode = FocusNode();
  FocusNode eventVenueFocusNode = FocusNode();
  FocusNode eventOrganisersFocusNode = FocusNode();
  FocusNode eventDescFocusNode = FocusNode();
  FocusNode eventLinkFocusNode = FocusNode();

  String getInitials(String text){
    var words = text.split(' ');
    String icon = "";
    for(var item in words){
      if(icon.length < 2){
        icon = icon + item.substring(0,1).toUpperCase();
      }
    }
    return icon;
  }

  @override
  void initState() {
    eventTitleController.text = widget.eventTitle;
    eventDescController.text = widget.eventDescription;
    eventDateController.text = widget.eventDate;
    eventVenueController.text = widget.eventVenue;
    eventOrganisersController.text = widget.eventOrganisers;
    eventLinkController.text = widget.eventURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventTitleFocusNode,
                  autocorrect: false,
                  autofocus: true,
                  controller: eventTitleController,
                  onFieldSubmitted: (val){
                    eventTitleController.text = val;
                  },
                  onEditingComplete: (){
                    eventTitleFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventDescFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Frontend 101",
                    labelText: "Competition Name"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventDescFocusNode,
                  autocorrect: false,
                  controller: eventDescController,
                  textCapitalization: TextCapitalization.sentences,
                  onFieldSubmitted: (val){
                    eventDescController.text = val;
                  },
                  onEditingComplete: (){
                    eventDescFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventDateFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "What is the competition all about?",
                    labelText: "Description"
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventDateFocusNode,
                  autocorrect: false,
                  controller: eventDateController,
                  onFieldSubmitted: (val){
                    eventDateController.text = val;
                  },
                  onEditingComplete: (){
                    eventDateFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventVenueFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "For eg. 19th - 20th October 2019",
                    labelText: "Competition Date"
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventVenueFocusNode,
                  autocorrect: false,
                  controller: eventVenueController,
                  onFieldSubmitted: (val){
                    eventVenueController.text = val;
                  },
                  onEditingComplete: (){
                    eventVenueFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventOrganisersFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "Where this competition will held",
                    labelText: "Competition Venue"
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventOrganisersFocusNode,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.words,
                  controller: eventOrganisersController,
                  onFieldSubmitted: (val){
                    eventOrganisersController.text = val;
                  },
                  onEditingComplete: (){
                    eventOrganisersFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventLinkFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "For eg. EDCBVUCOEP",
                    labelText: "Organisers"
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  focusNode: eventLinkFocusNode,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  controller: eventLinkController,
                  onFieldSubmitted: (val){
                    eventLinkController.text = val;
                  },
                  onEditingComplete: (){
                    eventLinkFocusNode.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "For eg. https://google.com",
                    labelText: "Event Link"
                  ),
                  keyboardType: TextInputType.url,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          setState(() {});
          Map<String, dynamic> competitionDetails = {
            "title": eventTitleController.text,
            "venue": eventVenueController.text,
            "date": eventDateController.text,
            "link": eventLinkController.text,
            "organisers": eventOrganisersController.text,
            "description": eventDescController.text
          };
          if(widget.docID == null){
            await Firestore.instance.collection("competitions").add(competitionDetails);
          }
          else{
            await Firestore.instance.collection("competitions").document(widget.docID).setData(competitionDetails);
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}