import 'dart:ui';

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 800,
            child: Image.asset('assets/image.png', fit: BoxFit.contain),
          ),
          Positioned(
            child: Text(
              "Todo App",
              style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            top: 50,
            left: 120,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            background: Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.delete),
                              ),
                            ),
                            key: ValueKey(index),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: Colors.black,
                                  )),
                              clipBehavior: Clip.hardEdge,
                              elevation: 30.0,
                              shadowColor: Colors.black87,
                              margin: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(
                                  "Task No $index",
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "This is the detail of task No $index",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                ),
                                trailing: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                isThreeLine: true,
                              ),
                            ),
                          ),
                        );
                      },
                      controller: scrollController,
                      itemCount: 21,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.pinkAccent,
                      onPressed: () {},
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
