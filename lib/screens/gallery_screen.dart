import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'full_image_screen.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<GalleryScreen> createState() => _MyAppState();
}

class _MyAppState extends State<GalleryScreen> {
  var urlData;

  void getApiData() async {
    var url = Uri.parse(
        'https://api.unsplash.com/photos/?client_id=896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043');
    final res = await http.get(url);
    setState(() {
      urlData = jsonDecode(res.body);
      print(urlData);
    });
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageSize = size.height * 0.1;
    double padding = size.width * 0.03;
    double fontSize = size.height * 0.035;

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Gallery',
          style: TextStyle(
              fontFamily: 'Lobster-Regular',
              fontSize: 30.0,
              color: Color(0xffd1c4e9)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullImageScreen(
                                url: urlData[i]['urls']['full'],
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    children: [
                      Container(
                          width: imageSize,
                          height: imageSize,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(urlData[i]['urls']['small']),
                                  fit: BoxFit.cover))),
                      SizedBox(
                        width: padding,
                      ),
                      Center(
                        child: Text(
                          'Author:\n ${urlData[i]['user']['name']}',
                          style: TextStyle(
                              fontSize: fontSize,
                              fontFamily: 'NunitoSans-Regular',
                              color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
