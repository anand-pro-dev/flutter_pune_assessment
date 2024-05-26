// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _DataTableExampleState createState() => _DataTableExampleState();
// }

// class _DataTableExampleState extends State<MyApp> {
//   List<Map<String, String>> apiResponse = [
//     {"id": "S1", "header": "hello", "name": "raj"},
//     {"id": "S2", "header": "Hello", "name": "Ravi"},
//     {"id": "S3", "header": "greet", "name": "nine"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter DataTable Example'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Table(
//               // border: TableBorder.all(),
//               children: [
//                 buildRow(
//                   ["id", "header", "name"],
//                   isHeader: true,
//                 ),
//                 for (var data in apiResponse)
//                   buildRow([data["id"]!, data["header"]!, data["name"]!]),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   TableRow buildRow(List<String> cells, {bool isHeader = false}) {
//     return TableRow(
//       children: cells.map((cell) {
//         final style = TextStyle(
//           fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//           fontSize: 18,
//         );
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: Text(
//               cell,
//               style: style,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// // class DetailsScreenTab extends StatelessWidget {
// //   DetailsScreenTab({super.key});

// //   List<Map<String, String>> apiResponse = [
// //     {"id": "S1", "header": "hello", "name": "raj"},
// //     {"id": "S2", "header": "Hello", "name": "Ravi"},
// //     {"id": "S3", "header": "greet", "name": "nine"},
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final dataProvider = Provider.of<TeamProvider>(context).loadTeams(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Flutter DataTable Example'),
// //       ),
// //       body: Consumer<TeamProvider>(
// //         builder: (context, teamProvider, _) {
// //           if (teamProvider.odiAllRounders.isEmpty) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else {
// //             return ListView(
// //               children: <Widget>[
// //                 Table(
// //                   // border: TableBorder.all(),
// //                   columnWidths: const {
// //                     0: FractionColumnWidth(0.20),
// //                     1: FractionColumnWidth(0.5),
// //                     2: FractionColumnWidth(0.30),
// //                   },
// //                   children: [
// //                     buildRow(
// //                       ["id", "header", "name"],
// //                       1, // Header row index
// //                       isHeader: true,
// //                     ),
// //                     for (var i = 0; i < teamProvider.odiAllRounders.length; i++)
// //                       buildRow(
// //                         [
// //                           "${i + 1}",
// //                           teamProvider.odiAllRounders[i].playerName.toString(),
// //                           teamProvider.odiAllRounders[i].points.toString(),
// //                         ],
// //                         i, // Pass the index of the current row
// //                       ),
// //                   ],
// //                 )
// //               ],
// //             );

// //             // ListView.builder(
// //             //   itemCount: teamProvider.odiTeams.length,
// //             //   itemBuilder: (context, index) {
// //             //     final team = teamProvider.odiTeams[index];
// //             //     return ListTile(
// //             //       title: Text(team.teamName),
// //             //       subtitle: Text('Position: ${team.position}'),
// //             //       trailing: Text('Points: ${team.points}'),
// //             //     );
// //             //   },
// //             // );
// //           }
// //         },
// //       ),
// //     );
// //   }

// //   TableRow buildRow(List<String> cells, int index, {bool isHeader = false}) {
// //     final Color backgroundColor =
// //         index.isEven ? Colors.transparent : Colors.grey.shade200;
// //     return TableRow(
// //       decoration: BoxDecoration(color: backgroundColor),
// //       children: cells.map((cell) {
// //         final style = TextStyle(
// //           fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
// //           fontSize: 18,
// //           color: Colors.black, // Text color
// //         );
// //         return Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //           child: Text(
// //             cell,
// //             style: style,
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// // }
