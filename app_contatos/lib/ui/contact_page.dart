import 'dart:io';
import 'package:async/async.dart';

import 'package:app_contatos/helpers/contact_helper.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocus = FocusNode();

  bool _userEdited = false;
  Contact _editedContact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
              Navigator.pop(context, _editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              _contactImg(context, _editedContact),
              TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedContact.name = text;
                  });
                },
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.email = text;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Phone"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.phone = text;
                },
                keyboardType: TextInputType.phone,
              )
            ],
          ),
        ),
      ),
      onWillPop: _requestPop,
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações"),
              content: Text("Se sair as alterações serão perdidas"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget _contactImg(BuildContext context, Contact contact) {
    return GestureDetector(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: contact.img != null
                    ? FileImage(File(contact.img))
                    : AssetImage("images/person.png"),
                fit: BoxFit.cover
            )
        ),
      ),
      onTap: () {
        //print("OnTapContato");
        //setState(() {
        _selectedImg(context, contact);
        //});
      },
    );
  }

  void _selectedImg(BuildContext context, Contact contact) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: IconButton(
                              iconSize: 60.0,
                              icon: Icon(Icons.image),
                              onPressed: () {
                                ImagePicker.pickImage(
                                        source: ImageSource.gallery)
                                    .then((file) {
                                  if (file == null) return;
                                  setState(() {
                                    //_editedContact.img = file.path;
                                    contact.img = file.path;
                                  });
                                });
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      //Padding(padding: EdgeInsets.only(left: 10.0)),
                      Expanded(
                        child: Center(
                          child: IconButton(
                              iconSize: 60.0,
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {
                                ImagePicker.pickImage(
                                        source: ImageSource.camera)
                                    .then((file) {
                                  if (file == null) return;
                                  setState(() {
                                    contact.img = file.path;
                                  });
                                });
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
