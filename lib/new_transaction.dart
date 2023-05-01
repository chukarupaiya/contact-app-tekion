import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  Function addTx;
  String name;
  String email;
  String address;
  String phone;
  String website;
  String company;

  NewContact(
      {required this.addTx,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.website,
      required this.company});

  @override
  _NewContactState createState() => _NewContactState(
      name: this.name,
      email: this.email,
      address: this.address,
      phone: this.phone,
      website: this.website,
      company: this.company);
}

class _NewContactState extends State<NewContact> {
  String name;
  String email;
  String address;
  String phone;
  String website;
  String company;

  _NewContactState(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.website,
      required this.company});

  late final _nameController = TextEditingController(text: name);
  late final _emailController = TextEditingController(text: email);
  late final _addressController = TextEditingController(text: address);
  late final _phoneController = TextEditingController(text: phone);
  late final _websiteController = TextEditingController(text: website);
  late final _companyController = TextEditingController(text: company);

  void _submitData() {
    final enteredname = _nameController.text;
    final enteredemail = _emailController.text;
    final enteredaddress = _addressController.text;
    final enteredphone = _phoneController.text;
    final enteredwebsite = _websiteController.text;
    final enteredcompany = _companyController.text;

    widget.addTx(enteredname, enteredemail, enteredaddress, enteredphone,
        enteredwebsite, enteredcompany);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff2d2d2d),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _nameController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
           TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _emailController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ), TextField(
            decoration: const InputDecoration(
              labelText: 'Phone number',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _phoneController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ), TextField(
            decoration: const InputDecoration(
              labelText: 'Address',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _addressController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ), TextField(
            decoration: const InputDecoration(
              labelText: 'Website',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _websiteController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ), TextField(
            decoration: const InputDecoration(
              labelText: 'Company',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _companyController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
