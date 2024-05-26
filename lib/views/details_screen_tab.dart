import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/json_provider.dart';
import '../widget/model/model.dart';

class DetailsScreenTab extends StatelessWidget {
  final List<OdiAllRounder> playerList;
  const DetailsScreenTab({super.key, required this.playerList});

  // List<Map<String, String>> apiResponse = [
  //   {"id": "S1", "header": "hello", "name": "raj"},
  //   {"id": "S2", "header": "Hello", "name": "Ravi"},
  //   {"id": "S3", "header": "greet", "name": "nine"},
  // ];

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<TeamProvider>(context).loadTeams(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Scaffold(
        body: Consumer<TeamProvider>(
          builder: (context, teamProvider, _) {
            if (teamProvider.odiAllRounders.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: <Widget>[
                  Table(
                    // border: TableBorder.all(),
                    columnWidths: const {
                      0: FractionColumnWidth(0.20),
                      1: FractionColumnWidth(0.60),
                      2: FractionColumnWidth(0.20),
                    },
                    children: [
                      buildRow(
                        ["RANK", "PLAYER", "POINTS"],
                        1, // Header row index
                        isHeader: true,
                      ),
                      for (var i = 0; i < playerList.length; i++)
                        buildRow(
                          [
                            "    ${i + 1}",
                            playerList[i].playerName.toString(),
                            playerList[i].points.toString(),
                          ],
                          i,
                        ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, int index, {bool isHeader = false}) {
    final Color backgroundColor =
        index.isEven ? Colors.transparent : Colors.grey.shade200;
    return TableRow(
      decoration: BoxDecoration(color: backgroundColor),
      children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
          color: Colors.black,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            cell,
            style: style,
          ),
        );
      }).toList(),
    );
  }
}
