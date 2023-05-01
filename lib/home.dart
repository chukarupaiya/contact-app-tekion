import 'package:first_app/bloc/app_bloc.dart';
import 'package:first_app/bloc/app_states.dart';
import 'package:first_app/new_transaction.dart';
import 'package:first_app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './mycard.dart';
import './user_class.dart';
import 'bloc/app_events.dart';

const List<String> list = <String>['id', 'name', 'company'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  String sort = 'id';
  String search_string = "";

  void update_search_string(String value) {
    setState(() {
      search_string = value;
    });
  }

  void update_sort(String value1) {
    setState(() {
      sort = value1;
    });
  }

  void _addNewContact(
      String enteredname,
      String enteredemail,
      String enteredaddress,
      String enteredphone,
      String enteredwebsite,
      String enteredcompany) {
    print(enteredaddress);
    user new_user = user(
        id: -1,
        name: enteredname,
        email: enteredemail,
        address: enteredaddress,
        phone: enteredphone,
        website: enteredwebsite,
        company: enteredcompany);

    BlocProvider.of<UserBloc>(context).addUser(new_user);
  }

  void _startAddNewContact(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
              addTx: _addNewContact,
              name: "",
              email: "",
              phone: "",
              address: "",
              website: "",
              company: ""),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            centerTitle: false,
            title: const Text("Contact"),
            backgroundColor: Color.fromARGB(255, 48, 48, 48),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    _startAddNewContact(context);
                  },
                  icon: Icon(Icons.add))
            ]),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 129,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 41, 41, 41),
                    Color.fromARGB(255, 31, 31, 31)
                  ],
                ),
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  List<user> userValues1 = state.users;

                  List<user> userValues2 = [...userValues1];

                  RegExp exp = RegExp(search_string);
                  userValues2.retainWhere((u) {
                    return u.name.toString().toLowerCase().contains(exp);
                  });

                  switch (sort) {
                    case 'id':
                      userValues2.sort((a, b) => (a.id).compareTo(b.id));
                      break;
                    case 'name':
                      userValues2.sort((a, b) => (a.name.toLowerCase())
                          .compareTo(b.name.toLowerCase()));
                      break;
                    default:
                      userValues2.sort((a, b) => (a.company.toLowerCase())
                          .compareTo(b.company.toLowerCase()));
                      break;
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 82, 82, 82),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              width: 235,
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SearchBar(update_search_string),
                                  const Icon(Icons.search,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 82, 82, 82),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              width: 110,
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                              padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                              child: Dropdown(update_sort),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              ...(userValues2).map(
                                (element) {
                                  return MyWidget(user_: element);
                                },
                              ).toList(),
                              Center(
                                child: userValues2.isEmpty
                                    ? const Text(
                                        "no result found",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      )
                                    : const Text(""),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class Dropdown extends StatefulWidget {
  final Function update_sort;

  const Dropdown(this.update_sort, {super.key});

  @override
  State<Dropdown> createState() => _DropdownState(update_sort);
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;
  final Function update_sort;

  _DropdownState(this.update_sort);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: Color(0xff2d2d2d),
      icon: const Icon(Icons.sort, color: Color.fromARGB(255, 255, 255, 255)),
      elevation: 16,
      underline: Container(
        height: 0,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          update_sort(value);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function search_text_handler;

  const SearchBar(this.search_text_handler);

  @override
  // ignore: no_logic_in_create_state
  State<SearchBar> createState() => _SearchBarState(search_text_handler);
}

class _SearchBarState extends State<SearchBar> {
  final Function search_text_handler;

  _SearchBarState(this.search_text_handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 80,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: TextField(
        onChanged: (val) {
          search_text_handler(val.toLowerCase());
        },
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 255, 255, 255)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 255, 255, 255)),
          ),
          hintText: ' search',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          focusColor: Color.fromARGB(255, 255, 255, 255),
        ),
        autocorrect: true,
        cursorColor: const Color.fromARGB(255, 255, 255, 255),
        style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
      ),
    );
  }
}
