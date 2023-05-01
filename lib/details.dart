import 'package:first_app/bloc/app_bloc.dart';
import 'package:first_app/bloc/app_states.dart';
import 'package:first_app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './user_class.dart';
import 'bloc/app_events.dart';
import 'package:first_app/new_transaction.dart';

class MyWidget2 extends StatefulWidget {
  //final user user_;
  final int id;
  MyWidget2(this.id);

  @override
  State<MyWidget2> createState() => MyWidget2State(this.id);
}

class MyWidget2State extends State<MyWidget2> {
  //final user user_;
  final int id;
  MyWidget2State(this.id);

  void _modifyContact(
      String enteredname,
      String enteredemail,
      String enteredaddress,
      String enteredphone,
      String enteredwebsite,
      String enteredcompany) {
    user new_user = user(
        id: id,
        name: enteredname,
        email: enteredemail,
        address: enteredaddress,
        phone: enteredphone,
        website: enteredwebsite,
        company: enteredcompany);

    BlocProvider.of<UserBloc>(context).modifyUser(id, new_user);
  }

  void _startmodifyContact(BuildContext ctx, String name, String email,
      String phone, String address, String website, String company) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
              addTx: _modifyContact,
              name: name,
              email: email,
              phone: phone,
              address: address,
              website: website,
              company: company),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Color.fromARGB(255, 48, 48, 48),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          List<user> userValues = state.users;

          int _index = -1;
          int index = 0;

          for (user x in state.users) {
            if (x.id == id) {
              _index = index;
              break;
            }
            index++;
          }

          user user_ = userValues[index];
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 41, 41, 41),
                Color.fromARGB(255, 31, 31, 31)
              ],
            )),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff2d2d2d),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    new BoxShadow(
                      color: const Color.fromARGB(255, 69, 69, 69),
                      blurRadius: 25,
                    )
                  ]),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _startmodifyContact(
                              context,
                              user_.name,
                              user_.email,
                              user_.phone,
                              user_.address,
                              user_.website,
                              user_.company);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            primary: Colors.transparent),
                        child: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 10, 181, 161),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 180,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Image.network(
                          "https://i.pinimg.com/originals/3b/ed/41/3bed41ea8eeaab4fbdc572d2a0ba9cb6.png"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 2),
                      child: Text(
                        user_.name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 10),
                      child: Text(
                        user_.company,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 10, 181, 161),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 10, 0),
                      child: Text(
                        user_.phone,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: const Text(
                        "E-mail",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                      child: Text(
                        user_.email,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: const Text(
                        "Website",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                      child: Text(
                        user_.website,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 157, 255),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: const Text(
                        "Address",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                        child: Text(
                          user_.address,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 216, 216, 216),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
