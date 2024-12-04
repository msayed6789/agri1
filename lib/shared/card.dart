// ignore_for_file: prefer_const_constructors

import 'package:agri/shared/colors_constants.dart';
import 'package:flutter/material.dart';

class CardF extends StatelessWidget {
  final String hisNumber;
  final DateTime birthday;
  final bool status;
  final Function deleteCard;
  final int index;

  const CardF({
    super.key,
    required this.hisNumber,
    required this.birthday,
    required this.status,
    required this.deleteCard,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: status ? BTNgreen : BTNgreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hisNumber,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
              Text(
                "${birthday.day}/${birthday.month}/${birthday.year}",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: status ? Colors.red : BTNgreen),
                padding: EdgeInsets.all(5),
                child: Text(
                  "1",
                  style: TextStyle(
                      fontSize: 20, color: status ? Colors.black : BTNgreen),
                ),
              ),
              IconButton(
                  onPressed: () {
                    deleteCard(index);
                  },
                  icon: Icon(
                    size: 27,
                    Icons.delete,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
