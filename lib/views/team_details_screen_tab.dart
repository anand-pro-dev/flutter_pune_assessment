import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/json_provider.dart';
import '../widget/model/model.dart';

class TeamDetailsScreenTab extends StatelessWidget {
  final List<Team> teamList; // Declare odiAllRounders as a required parameter
  const TeamDetailsScreenTab({super.key, required this.teamList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    1: FractionColumnWidth(0.40),
                    2: FractionColumnWidth(0.20),
                    3: FractionColumnWidth(0.20),
                  },
                  children: [
                    buildRow(
                      ["RANK", "PLAYERS", "RATING", "POINTS"],
                      1, // Header row index
                      isHeader: true,
                    ),
                    for (var i = 0; i < teamList.length; i++)
                      buildRow(
                        [
                          "   ${i + 1}",
                          teamList[i].teamName.toString(),
                          teamList[i].rating.toString(),
                          teamList[i].points.toString(),
                        ],
                        i, // Pass the index of the current row
                      ),
                  ],
                )
              ],
            );
          }
        },
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
          color: Colors.black, // Text color
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            cell,
            style: style,
          ),
        );
      }).toList(),
    );
  }
}
