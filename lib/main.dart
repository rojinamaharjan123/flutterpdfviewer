import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PDF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url="http://www.pdf995.com/samples/pdf.pdf";

  String pdfasset = "assets/sample.pdf";
  PDFDocument _doc;
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPdf();

  }
  void _initPdf()  async{
    setState(() {
      loading=true;
    });
    final doc= await PDFDocument.fromURL(url);
    setState(() {
      _doc=doc;
      loading=false;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter PDF Demo'),
      ),
      body: loading? Center(child: CircularProgressIndicator(),):
      PDFViewer(document: _doc,indicatorBackground: Colors.red,showIndicator: false,showPicker: false,)
    );
  }
}


