import 'package:flutter/material.dart';
import 'pdfviewer/pdfviewer.dart';
import 'videoviewer/videoviewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   appBarTheme: const AppBarTheme(
      //     color: Colors.blueAccent,
      //     textTheme: TextTheme(
      //       headline6: TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.w300,
      //         fontSize: 20.0,
      //       ),
      //     ),
      //   ),
      //   iconTheme: const IconThemeData(
      //     color: Colors.blueAccent,
      //   ),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new Pdfview()));
                },
                child: Container(
                  height: 120,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0,1.0],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: " Pdf Viewer ",
                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                            ),
                            WidgetSpan(
                              child: Icon(Icons.picture_as_pdf_outlined, size: 25,color: Colors.white,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: " Image Viewer ",
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                          ),
                          WidgetSpan(
                            child: Icon(Icons.image, size: 25,color: Colors.white,),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new SamplePlayer()));
                },
                child: Container(
                  height: 120,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0,1.0],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: " Video Viewer ",
                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                            ),
                            WidgetSpan(
                              child: Icon(Icons.video_collection_outlined, size: 25,color: Colors.white,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: " Audio Viewer ",
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                          ),
                          WidgetSpan(
                            child: Icon(Icons.audiotrack_outlined, size: 25,color: Colors.white,),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
