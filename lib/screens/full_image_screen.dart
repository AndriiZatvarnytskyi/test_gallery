import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  var url;
  FullImageScreen({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Full image',
              style: TextStyle(
                  fontFamily: 'Lobster-Regular',
                  fontSize: 30.0,
                  color: Color(0xffd1c4e9))),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xffd1c4e9)),
              onPressed: () => Navigator.of(context).pop())),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      ),
    );
  }
}
