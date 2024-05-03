// ignore_for_file: file_names
import 'package:flutter/material.dart';

///interface button for books
Widget buttonWidget(List<String> valueData, Function() onTab) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: Colors.blue[300],
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //show name book
                  valueData[4],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  //show authors book and chapters
                  '${valueData[1]}, chapters: ${valueData[2]}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
