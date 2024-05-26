import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/model/model.dart';

class TeamProvider with ChangeNotifier {
  List<Team> _odiTeams = [];
  List<Team> get odiTeams => _odiTeams;

  List<Team> _testTeams = [];
  List<Team> get testTeams => _testTeams;

  List<Team> _t20Teams = [];
  List<Team> get t20Teams => _t20Teams;

  List<OdiAllRounder> _odiBatsmen = [];
  List<OdiAllRounder> get odiBatsmen => _odiBatsmen;

  List<OdiAllRounder> _odiBowlers = [];
  List<OdiAllRounder> get odiBowlers => _odiBowlers;

  List<OdiAllRounder> _odiAllRounders = [];
  List<OdiAllRounder> get odiAllRounders => _odiAllRounders;

  List<OdiAllRounder> _testBatsmen = [];
  List<OdiAllRounder> get testBatsmen => _testBatsmen;

  List<OdiAllRounder> _testBowlers = [];
  List<OdiAllRounder> get testBowlers => _testBowlers;

  List<OdiAllRounder> _testAllRounders = [];
  List<OdiAllRounder> get testAllRounders => _testAllRounders;

  List<OdiAllRounder> _t20Batsmen = [];
  List<OdiAllRounder> get t20Batsmen => _t20Batsmen;

  List<OdiAllRounder> _t20Bowlers = [];
  List<OdiAllRounder> get t20Bowlers => _t20Bowlers;

  List<OdiAllRounder> _t20AllRounders = [];
  List<OdiAllRounder> get t20AllRounders => _t20AllRounders;

  Future<void> loadTeams(BuildContext context) async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/flutter_sytem_test.json');
      final Map<String, dynamic> data = json.decode(response);

      // Load ODI Teams
      _odiTeams = _loadTeams(data['responseData']['result']['odiTeams']);

      // Load Test Teams
      _testTeams = _loadTeams(data['responseData']['result']['testTeams']);

      // Load T20 Teams
      _t20Teams = _loadTeams(data['responseData']['result']['t20Teams']);

      // Load ODI Batsmen
      _odiBatsmen = _loadPlayers(data['responseData']['result']['odiBatsman']);

      // Load ODI Bowlers
      _odiBowlers = _loadPlayers(data['responseData']['result']['odiBowler']);

      // Load ODI All-rounders
      _odiAllRounders =
          _loadPlayers(data['responseData']['result']['odiAllRounder']);

      // Load Test Batsmen
      _testBatsmen =
          _loadPlayers(data['responseData']['result']['testBatsman']);

      // Load Test Bowlers
      _testBowlers = _loadPlayers(data['responseData']['result']['testBowler']);

      // Load Test All-rounders
      _testAllRounders =
          _loadPlayers(data['responseData']['result']['testAllRounder']);

      // Load T20 Batsmen
      _t20Batsmen = _loadPlayers(data['responseData']['result']['t20Batsman']);

      // Load T20 Bowlers
      _t20Bowlers = _loadPlayers(data['responseData']['result']['t20Bowler']);

      // Load T20 All-rounders
      _t20AllRounders =
          _loadPlayers(data['responseData']['result']['t20AllRounder']);

      notifyListeners();
    } catch (e) {
      // Error handling
      log('Error loading teams: $e');
    }
  }

  List<Team> _loadTeams(List<dynamic> teamsData) {
    return teamsData.map((team) => Team.fromJson(team)).toList();
  }

  List<OdiAllRounder> _loadPlayers(List<dynamic> playersData) {
    return playersData.map((player) => OdiAllRounder.fromJson(player)).toList();
  }
}
