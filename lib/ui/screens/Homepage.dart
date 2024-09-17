// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/data/user.dart';
import 'package:libraryapp/sttman/bloc/explre_bloc.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import 'package:libraryapp/ui/screens/Profile.dart';
import 'package:libraryapp/ui/screens/addbook.dart';
import 'package:libraryapp/ui/screens/profileset.dart';
import '../compenents/MyBook.dart';
import '../compenents/sheet.dart';
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
class Homepage extends StatefulWidget {
   Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

bool expend = false;
bool seeall = false;
bool Explore = true;

class _HomepageState extends State<Homepage> with RouteAware{
  @override
  void initState() {
    super.initState();
    expend = false;
    seeall = false;
  }
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
     await getimage();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      // Subscribe to RouteObserver if the route is a PageRoute
      routeObserver.subscribe(this, modalRoute);
    }
  }
  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
    getimage();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 56, 153, 24),
      body: Stack(
        children: [
          SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      if (!expend)
                        Positioned(
                          left: MediaQuery.of(context).size.width / 2 - 80,
                          child: Container(
                            height: 150,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(109, 118, 213, 86),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStatePropertyAll(0),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.zero),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromARGB(
                                                    94, 160, 249, 130)),
                                      ),
                                      onPressed: () async{
                                        final result=await Navigator.push(context, MaterialPageRoute(builder:(context) => addbook(),));
                                        if (result!=null) {
                                          if (result) {
                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Book add succesfuly',style: TextStyle(color: Colors.green),)));
                                        }
                                        }
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  BlocBuilder<UserBloc, UserState>(
                                    builder: (context, state) {
                                      if (state is Getuserstate) {
                                        return Text(
                                        state.username,
                                        style: TextStyle(
                                          color: Colors.black,
                                            fontFamily: 'libre', fontSize: 20),
                                      );
                                      }else{
                                        return Text('');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (!expend)
                        Positioned(
                          top: 80,
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => profileset(),
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.account_circle,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder:(context) => Profile(),));
                                    },
                                    icon: Icon(
                                      Icons.dashboard_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Most \nPopular Book',
                        style: TextStyle(fontFamily: 'libre', fontSize: 35),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'The Best Books Collection of all time',
                        style: TextStyle(
                            fontFamily: 'libre', color: Colors.black45),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            hintText: 'Search..',
                            hintStyle: TextStyle(color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.extent > 0.75) {
                    expend = true;
                  } else {
                    expend = false;
                  }

                  if (notification.extent > 0.55) {
                    seeall = true;
                  } else {
                    setState(() {
                      seeall = false;
                    });
                  }
                });
                return true;
              },
              child: DraggableScrollableSheet(
                maxChildSize: 0.95,
                minChildSize: 0.45,
                builder: (context, scrollController) {
                  return BlocBuilder<ExplreBloc, ExplreState>(
                    builder: (context, state) {
                      if (state is explr) {
                        if (state.isinexplore) {
                          return shetdraggbale(
                              scrollController: scrollController);
                        } else {
                          return MyBook(
                            scrollController: scrollController,
                          );
                        }
                      } else {
                        return shetdraggbale(
                            scrollController: scrollController);
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: !seeall ? 1 : 0,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      child: Center(
                          child: Column(
                        children: [
                          Icon(Icons.keyboard_arrow_up_rounded),
                          Text(
                            'Scroll Up To See All',
                            style: TextStyle(height: 0, fontFamily: 'libre'),
                          ),
                        ],
                      ))))),
        ],
      ),
    );
  }
}
