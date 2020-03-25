import 'dart:io';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {

  final pageTitle, eventTitle, eventDate, eventTime, eventSpeaker, eventDescription, eventURL;
  AddEvent({this.pageTitle, this.eventDate, this.eventDescription, this.eventSpeaker, this.eventTime, this.eventTitle, this.eventURL});

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  TextEditingController eventSpeakerController = TextEditingController();
  TextEditingController eventDescController = TextEditingController();
  TextEditingController eventRegistrationLinkController = TextEditingController();

  FocusNode eventTitleFocusNode = FocusNode();
  FocusNode eventDateFocusNode = FocusNode();
  FocusNode eventTimeFocusNode = FocusNode();
  FocusNode eventSpeakerFocusNode = FocusNode();
  FocusNode eventDescFocusNode = FocusNode();
  FocusNode eventRegistrationLinkFocusNode = FocusNode();

  File posterImage;

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
    eventTimeController.text = widget.eventTime;
    eventSpeakerController.text = widget.eventSpeaker;
    eventRegistrationLinkController.text = widget.eventURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          
          "Edit Event"
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
                    FocusScope.of(context).requestFocus(eventTimeFocusNode);
                  },
                  decoration: InputDecoration(
                    hintText: "For eg. 2019-01-15",
                    labelText: "Competition Date"
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
                  focusNode: eventTimeFocusNode,
                  autocorrect: false,
                  controller: eventTimeController,
                  onFieldSubmitted: (val){
                    eventTimeController.text = val;
                  },
                  onEditingComplete: (){
                    eventTimeFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventSpeakerFocusNode);
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
                  focusNode: eventSpeakerFocusNode,
                  autocorrect: false,
                  controller: eventSpeakerController,
                  onFieldSubmitted: (val){
                    eventSpeakerController.text = val;
                  },
                  onEditingComplete: (){
                    eventSpeakerFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(eventRegistrationLinkFocusNode);
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
             
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          
        },
        child: Icon(Icons.done),
      ),
    );
  }
}