import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';



final imgUrl = "http://www.pdf995.com/samples/pdf.pdf";
var dio = Dio();


class Pdfview extends StatefulWidget {
  @override
  _PdfviewState createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  @override
  void initState() {
    getPermission();

    _initPdf();

    super.initState();
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      ////toast show
      Fluttertoast.showToast(
          msg: "Downloading Completed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0
      );
      ////toast show
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  ////////////////
  String url = "http://www.pdf995.com/samples/pdf.pdf";
  String pdfasset = "assets/mypdf.pdf";
  PDFDocument _doc;
  bool _loading;


  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  ////////////////

  Random random = Random();
  String randomno = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  String path =
                  await ExtStorage.getExternalStoragePublicDirectory(
                      ExtStorage.DIRECTORY_DOWNLOADS);
                  //String fullPath = tempDir.path + "/boo2.pdf'";
                  randomno = random.nextInt(10000).toString();
                  String fullPath = "$path/pdf-$randomno.pdf";
                  print('full path ${fullPath}');
                  download2(dio, imgUrl, fullPath);

                  Fluttertoast.showToast(
                      msg: "Downloading Start",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 14.0
                  );

                },
                child: Icon(
                  Icons.download_rounded,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(
        document: _doc,
        indicatorBackground: Colors.red,
        //showIndicator: true,
        //showPicker: true,
      ), // body: Center(
    );
  }
}