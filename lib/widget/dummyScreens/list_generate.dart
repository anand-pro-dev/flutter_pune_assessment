// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _DataTableExampleState createState() => _DataTableExampleState();
// }

// class _DataTableExampleState extends State<MyApp> {
//   List<List<String>> apiResponse = [
//     ['S1', 'hello', 'raj'],
//     ['S2', 'Hello', 'Ravi'],
//     ['S3', 'greet', 'nine'],
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter DataTable Example'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Table(
//               // border: TableBorder.all(),
//               children: List.generate(
//                 apiResponse.length,
//                 (index) => buildRow(apiResponse[index]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   TableRow buildRow(List<String> cells) {
//     return TableRow(
//       children: cells.map((cell) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(child: Text(cell)),
//         );
//       }).toList(),
//     );
//   }
// }
