// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class NoteEditor extends StatefulWidget {
  final String? id;
  final String? title;
  final String? date;
  final String? text;
  final String? url;

  const NoteEditor(
      {super.key, this.id, this.title, this.date, this.text, this.url});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  File? cover;
  final titleController = TextEditingController();
  final textController = TextEditingController();

  initState() {
    super.initState();

    if (widget.id != null) {
      titleController.text = widget.title!;
      textController.text = widget.text!;
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        deleteNote(context);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning!"),
      content: Text("Are you sure you want to delete this note?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  deleteNote(BuildContext context) async {
    final response = await http.delete(Uri.parse('http://10.0.2.2:8000/delNote/' + widget.id!));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Note deleted."),
      ));

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Note NOT deleted!"),
      ));
    }
  }

  saveNote(BuildContext context) async {
    Uri url;
    String method;
    if (widget.id == null || widget.id == "") {
      method = "POST";
      url = Uri.parse('http://10.0.2.2:8000/newNote');
    } else {
      method = "PUT";
      url = Uri.parse('http://10.0.2.2:8000/updNote/' + widget.id!);
    }

    var request = http.MultipartRequest(method, url);
    request.fields['title'] =
        titleController.text != '' ? titleController.text : '-';
    request.fields['text'] =
        textController.text != '' ? textController.text : '-';

    if (widget.date != null && widget.date != "")
      request.fields['date'] = widget.date!;

    if (cover == null && (widget.url == null || widget.url == "")) {
      request.fields['cover'] = "-";
    } else {
      if (widget.url == null || widget.url == "") {
        request.files
            .add(await http.MultipartFile.fromPath('cover', cover!.path));
      } else {
        request.fields['cover'] = widget.url!;
      }
    }

    request.send().then((response) {
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Note saved successfully!"),
        ));

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Saving failed!"),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          if (widget.id != null)
            GestureDetector(
              onTap: () {
                showAlertDialog(context);
              },
              child: Icon(
                Icons.delete,
                size: 33,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: GestureDetector(
              onTap: () {
                saveNote(context);
              },
              child: Icon(
                Icons.save,
                size: 33,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              // date
              widget.date == null || widget.date == ''
                  ? Text(
                      DateFormat('dd/MM/yyyy')
                          .format(DateTime.now())
                          .toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  : Text(widget.date!),

              // add cover
              SizedBox(height: 15),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    setState(() {
                      cover = file;
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                child: widget.url != null && widget.url != ''
                    ? Image.network(widget.url!)
                    : cover == null
                        ? Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: Colors.lightBlue[100]!),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.lightBlue[200]!,
                                ),
                                Text(
                                  "  Add a cover",
                                  style:
                                      TextStyle(color: Colors.lightBlue[200]!),
                                )
                              ],
                            ),
                          )
                        : Image.file(cover!),
              ),

              // text
              SizedBox(height: 15),
              TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 10000000000,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note...',
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
