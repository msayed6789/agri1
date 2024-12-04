// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:agri/pages/cardInfo.dart';
import 'package:agri/pages/newData.dart';
import 'package:agri/shared/card.dart';
import 'package:agri/shared/colors_constants.dart';
import 'package:agri/shared/sharing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Datalist extends StatefulWidget {
  const Datalist({super.key});

  @override
  State<Datalist> createState() => _DatalistState();
}

class _DatalistState extends State<Datalist> {
  CollectionReference sheap = FirebaseFirestore.instance.collection('Sheap');

  void deleteCard(int index) {
    setState(() {
      sheap.doc(allData[index].fireSaveNum).delete();
      allData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Newdata()),
              );
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: BTNgreen,
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    for (int index = 0; index < allData.length; index++) {
                      sheap.doc(allData[index].hisNum).delete();
                    }
                    allData.clear();
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  size: 35,
                  color: Colors.black,
                ))
          ],
          backgroundColor: BTNgreen,
          title: Text(
            "Data List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: allData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cardinfo(index: index)),
                  );
                },
                child: CardF(
                  hisNumber: allData[index].hisNum,
                  birthday: allData[index].birthday,
                  status:  allData[index].timeForWeight,
                  deleteCard: deleteCard,
                  index: index,
                ),
              );
            }));
  }
}
