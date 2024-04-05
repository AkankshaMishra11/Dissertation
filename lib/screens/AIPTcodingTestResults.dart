
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TablePage(),
    );
  }
}

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  List<String> secondColumnData = [];
  List<String> thirdColumnData = [];
  List<String> fourthColumnData = [];
  List<String> fiveColumnData = [];
  List<String> sixColumnData = [];
  List<String> sevenColumnData = [];
  List<String> eightColumnData = [];
  List<String> nineColumnData = [];
  List<String> tenColumnData = [];
  List<String> elevenColumnData = [];
  List<String> twelthColumnData = [];

  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  void getDataFromFirebase() {
    databaseReference.child('AIPT coding-TEST').once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? values = event.snapshot.value as Map<dynamic, dynamic>?;

        if (values != null) {
          List<String> data1 = [];
          List<String> data3 = [];
          List<String> data4 = [];
          List<String> data5 = [];
          List<String> data6 = [];
          List<String> data7 = [];
          List<String> data8 = [];
          List<String> data9 = [];
          List<String> data10 = [];
          List<String> data11 = [];
          List<String> data12 = [];
          List<String> data13 = [];

          values.forEach((key, value) {
            if (value is Map<String, dynamic>) {
              // Add the name of the child node to data list (second column)
              data1.add(key.toString());
              value.forEach((experimentKey, experimentValue) {
                if (experimentValue is Map<String, dynamic>) {
                  String totalMarks = experimentValue['1_Total marks'].toString();
                  switch (experimentKey) {
                    case 'Experiment 1':
                      data3.add(totalMarks);
                      break;
                    case 'Experiment 2':
                      data4.add(totalMarks);
                      break;
                    case 'Experiment 3':
                      data5.add(totalMarks);
                      break;
                    case 'Experiment 4':
                      data6.add(totalMarks);
                      break;
                    case 'Experiment 5':
                      data7.add(totalMarks);
                      break;
                    case 'Experiment 6':
                      data8.add(totalMarks);
                      break;
                    case 'Experiment 7':
                      data9.add(totalMarks);
                      break;
                    case 'Experiment 8':
                      data10.add(totalMarks);
                      break;
                    case 'Experiment 9':
                      data11.add(totalMarks);
                      break;
                    case 'Experiment 10':
                      data12.add(totalMarks);
                      break;
                    default:
                      break;
                  }
                }
              });
            }
          });

          setState(() {
            secondColumnData = data1;
            thirdColumnData = data3;
            fourthColumnData = data4;
            fiveColumnData = data5;
            sixColumnData = data6;
            sevenColumnData = data7;
            eightColumnData = data8;
            nineColumnData = data9;
            tenColumnData = data10;
            elevenColumnData = data11;
            twelthColumnData = data12;
          });
        }
      }
    });
  }

  /*Future<void> _generateExcel() async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    // Add headers
    sheet.appendRow(['Serial number', 'Enrollment Number', 'Experiment 1', 'Experiment 2', 'Experiment 3', 'Experiment 4', 'Experiment 5', 'Experiment 6', 'Experiment 7', 'Experiment 8', 'Experiment 9', 'Experiment 10']);

    // Add data
    for (int i = 0; i < secondColumnData.length; i++) {
    List<String> rowData = [(i + 1).toString(), secondColumnData[i]];
    rowData.addAll([
      thirdColumnData.elementAt(i) ?? '',
      fourthColumnData.elementAt(i) ?? '',
      fiveColumnData.elementAt(i) ?? '',
      sixColumnData.elementAt(i) ?? '',
      sevenColumnData.elementAt(i) ?? '',
      eightColumnData.elementAt(i) ?? '',
      nineColumnData.elementAt(i) ?? '',
      tenColumnData.elementAt(i) ?? '',
      elevenColumnData.elementAt(i) ?? '',
      twelthColumnData.elementAt(i) ?? '',
    ]);
    sheet.appendRow(rowData);
  }

    final excelBytes = excel.encode();
  final String excelFileName = 'example.xlsx';

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final String filePath = '$appDocPath/$excelFileName';

  File file = File(filePath);
  await file.writeAsBytes(excelBytes!);
  
    // Show a dialog to indicate file saved
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('File Saved'),
          content: Text('Excel file has been saved to $filePath'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }*/


void _exportToPDF() async {
  // Create a PDF document
  final pdf = pw.Document();

  // Create a list to hold table rows
  List<pw.TableRow> tableRows = [];

  // Add the header row to the list of table rows
  tableRows.add(
    pw.TableRow(
      children: [
        for (String header in ['Serial number', 'Enrollment Number', 'Experiment 1', 'Experiment 2', 'Experiment 3', 'Experiment 4', 'Experiment 5', 'Experiment 6', 'Experiment 7', 'Experiment 8', 'Experiment 9', 'Experiment 10'])
          pw.Container(
            padding: pw.EdgeInsets.all(5),
            alignment: pw.Alignment.center,
            child: pw.Text(header, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
      ],
    ),
  );

  // Add the data rows to the list of table rows
  for (int i = 0; i < secondColumnData.length; i++) {
    tableRows.add(
      pw.TableRow(
        children: [
          for (String data in [(i + 1).toString(), secondColumnData[i], thirdColumnData.elementAt(i) , fourthColumnData.elementAt(i) , fiveColumnData.elementAt(i) , sixColumnData.elementAt(i) , sevenColumnData.elementAt(i) , eightColumnData.elementAt(i) , nineColumnData.elementAt(i) , tenColumnData.elementAt(i) , elevenColumnData.elementAt(i) , twelthColumnData.elementAt(i) ])
            pw.Container(
              padding: pw.EdgeInsets.all(5),
              alignment: pw.Alignment.center,
              child: pw.Text(data),
            ),
        ],
      ),
    );
  }

  // Add the table to the PDF document
  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Table(
          border: pw.TableBorder.all(),
          children: tableRows,
        ),
      ],
    ),
  );

  // Save the PDF to a file
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final String pdfPath = '$appDocPath/table.pdf';
  final File file = File(pdfPath);
  await file.writeAsBytes(await pdf.save());

  

  // Show dialog with a link to the downloaded file
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('PDF file exported'),
      content: Text('The PDF file has been exported successfully. You can find it at: $pdfPath'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
}



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CODING ASSESSMENT RESULTS'),
        /*actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: _exportToPDF,
          ),
        ],*/
      ),

    body: SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          for (int i = 0; i < 13; i++) i: FlexColumnWidth(1.0),
        },
        children: List.generate(
          secondColumnData.length + 1, // Adjusted for headings
          (index) => TableRow(
            children: [
              // Serial number column
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    (index == 0) ? 'Serial number' : '$index',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                  ),
                ),
              ),
              // Heading for second column
              if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Enrollment Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= secondColumnData.length)
                          ? secondColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= thirdColumnData.length)
                          ? thirdColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= fourthColumnData.length)
                          ? fourthColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= fiveColumnData.length)
                          ? fiveColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= sixColumnData.length)
                          ? sixColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= sevenColumnData.length)
                          ? sevenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 6',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= eightColumnData.length)
                          ? eightColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= nineColumnData.length)
                          ? nineColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 8',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= tenColumnData.length)
                          ? tenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 9',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= elevenColumnData.length)
                          ? elevenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= twelthColumnData.length)
                          ? twelthColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),


                /*(index == 0)
  ? TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Total Marks',
          textAlign: TextAlign.center,
        ),
      ),
    )
  : TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          // Calculate the sum of the last 10 columns and handle null values
          (() {
            int sum = 0;
            for (int i = 0; i < 10; i++) {
              int dataIndex = index - 1 + i * thirdColumnData.length;
              if (dataIndex < thirdColumnData.length) {
                int value1 = int.tryParse(thirdColumnData[dataIndex]) ?? 0;
                int value2 = int.tryParse(fourthColumnData[dataIndex]) ?? 0;
                int value3 = int.tryParse(fiveColumnData[dataIndex]) ?? 0;
                int value4 = int.tryParse(sixColumnData[dataIndex]) ?? 0;
                int value5 = int.tryParse(sevenColumnData[dataIndex]) ?? 0;
                int value6 = int.tryParse(eightColumnData[dataIndex]) ?? 0;
                int value7 = int.tryParse(nineColumnData[dataIndex]) ?? 0;
                int value8 = int.tryParse(tenColumnData[dataIndex]) ?? 0;
                int value9 = int.tryParse(elevenColumnData[dataIndex]) ?? 0;
                int value10 = int.tryParse(twelthColumnData[dataIndex]) ?? 0;
                sum = value1+value2+value3+value4+value5+value6+value7+value8+value9+value10;
              }
            }
            return sum.toString();
          })(),
          textAlign: TextAlign.center,
        ),
      ),
    )

              */


              /*// Placeholders for remaining columns with headings
              for (int i = 2; i < 12; i++)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Heading for Column $i',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),*/
            ],
          ),
        ),
      ),
    ),
  );
}

}

/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TablePage(),
    );
  }
}

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  List<String> secondColumnData = [];
  List<String> thirdColumnData = [];
  List<String> fourthColumnData=[];
  List<String> fiveColumnData=[];
  List<String> sixColumnData =[];
          List<String> sevenColumnData =[];
          List<String> eightColumnData  =[];
          List<String> nineColumnData =[];
          List<String> tenColumnData =[];
          List<String> elevenColumnData =[];
          List<String> twelthColumnData =[];


  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  void getDataFromFirebase() {
  databaseReference.child('AIPT coding-TEST').once().then((DatabaseEvent event) {
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic>? values = event.snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {
        List<String> data1 = [];
List<String> data3 = [];
List<String> data4 = [];
List<String> data5 = [];
List<String> data6 = [];
List<String> data7 = [];
List<String> data8 = [];
List<String> data9 = [];
List<String> data10 = [];
List<String> data11 = [];
List<String> data12 = [];
List<String> data13 = [];

values.forEach((key, value) {
  if (value is Map<String, dynamic>) {
    // Add the name of the child node to data list (second column)
    data1.add(key.toString());
    value.forEach((experimentKey, experimentValue) {
      if (experimentValue is Map<String, dynamic> ) {
        String totalMarks = experimentValue['1_Total marks'].toString();
        switch (experimentKey) {
          case 'Experiment 1':
            data3.add(totalMarks);
            break;
          case 'Experiment 2':
            data4.add(totalMarks);
            break;
          case 'Experiment 3':
            data5.add(totalMarks);
            break;
          case 'Experiment 4':
            data6.add(totalMarks);
            break;
          case 'Experiment 5':
            data7.add(totalMarks);
            break;
          case 'Experiment 6':
            data8.add(totalMarks);
            break;
          case 'Experiment 7':
            data9.add(totalMarks);
            break;
          case 'Experiment 8':
            data10.add(totalMarks);
            break;
          case 'Experiment 9':
            data11.add(totalMarks);
            break;
          case 'Experiment 10':
            data12.add(totalMarks);
            break;
          default:
            break;
        }
      }
    });
  }
});

            // Add all the data inside the child node to data list (third column)
            

        setState(() {
          secondColumnData = data1;
          thirdColumnData = data3;
          fourthColumnData = data4;
          fiveColumnData = data5;
          sixColumnData = data6;
          sevenColumnData = data7;
          eightColumnData = data8;
          nineColumnData = data9;
          tenColumnData = data10;
          elevenColumnData=data11;
          twelthColumnData=data12;




        });
      }
    }
  });
}






  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('CODING ASSESSMENT RESULTS'),
    ),
    body: SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          for (int i = 0; i < 13; i++) i: FlexColumnWidth(1.0),
        },
        children: List.generate(
          secondColumnData.length + 1, // Adjusted for headings
          (index) => TableRow(
            children: [
              // Serial number column
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    (index == 0) ? 'Serial number' : '$index',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                  ),
                ),
              ),
              // Heading for second column
              if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Enrollment Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= secondColumnData.length)
                          ? secondColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= thirdColumnData.length)
                          ? thirdColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= fourthColumnData.length)
                          ? fourthColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= fiveColumnData.length)
                          ? fiveColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= sixColumnData.length)
                          ? sixColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= sevenColumnData.length)
                          ? sevenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 6',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= eightColumnData.length)
                          ? eightColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= nineColumnData.length)
                          ? nineColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 8',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= tenColumnData.length)
                          ? tenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 9',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= elevenColumnData.length)
                          ? elevenColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                if (index == 0)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experiment 10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                    ),
                  ),
                )
              else
                // Populate the second column with Firebase data
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      (index <= twelthColumnData.length)
                          ? twelthColumnData[index - 1]
                          : '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),


                /*(index == 0)
  ? TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Total Marks',
          textAlign: TextAlign.center,
        ),
      ),
    )
  : TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          // Calculate the sum of the last 10 columns and handle null values
          (() {
            int sum = 0;
            for (int i = 0; i < 10; i++) {
              int dataIndex = index - 1 + i * thirdColumnData.length;
              if (dataIndex < thirdColumnData.length) {
                int value1 = int.tryParse(thirdColumnData[dataIndex]) ?? 0;
                int value2 = int.tryParse(fourthColumnData[dataIndex]) ?? 0;
                int value3 = int.tryParse(fiveColumnData[dataIndex]) ?? 0;
                int value4 = int.tryParse(sixColumnData[dataIndex]) ?? 0;
                int value5 = int.tryParse(sevenColumnData[dataIndex]) ?? 0;
                int value6 = int.tryParse(eightColumnData[dataIndex]) ?? 0;
                int value7 = int.tryParse(nineColumnData[dataIndex]) ?? 0;
                int value8 = int.tryParse(tenColumnData[dataIndex]) ?? 0;
                int value9 = int.tryParse(elevenColumnData[dataIndex]) ?? 0;
                int value10 = int.tryParse(twelthColumnData[dataIndex]) ?? 0;
                sum = value1+value2+value3+value4+value5+value6+value7+value8+value9+value10;
              }
            }
            return sum.toString();
          })(),
          textAlign: TextAlign.center,
        ),
      ),
    )

              */


              /*// Placeholders for remaining columns with headings
              for (int i = 2; i < 12; i++)
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Heading for Column $i',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),*/
            ],
          ),
        ),
      ),
    ),
  );
}

}*/



