//    its a widgt for google like container
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BoxLikeGoogleUi extends StatefulWidget {
  final String hadder, content;
  const BoxLikeGoogleUi(
      {super.key, required this.hadder, required this.content});

  @override
  State<BoxLikeGoogleUi> createState() => _BoxLikeGoogleUiState();
}

class _BoxLikeGoogleUiState extends State<BoxLikeGoogleUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: const Alignment(-0.8, -1.5),
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.content));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('copied to clipboard')));
                    },
                    child: const Icon(
                      Icons.copy,
                      weight: 100,
                    ),
                  )
                ],
              )),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).canvasColor),
            child: Text(
              ' ${widget.hadder} ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width / 32),
            ),
          )
        ],
      ),
    );
  }
}
