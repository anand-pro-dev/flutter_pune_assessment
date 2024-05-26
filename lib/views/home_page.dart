import 'package:assessment_task/views/team_details_screen_tab.dart';
import 'package:assessment_task/widget/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/json_provider.dart';
import 'details_screen_tab.dart';

/// Flutter code sample for [TabBar].

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "RANKING",
          ),
          backgroundColor:
              Colors.transparent, // Set app bar color to transparent
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 54, 22, 144),
                  AppColors.primeryboder,
                  Color.fromARGB(255, 72, 44, 94)
                ], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: 'ODI',
              ),
              Tab(
                text: 'TEST',
              ),
              Tab(
                text: 'T20',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('ODI'),
            NestedTabBar('TEST'),
            NestedTabBar('T20'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.outerTab.toString());
    final dataListProvider = Provider.of<TeamProvider>(context);
    return Column(
      children: <Widget>[
        TabBar.secondary(
          indicatorPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          unselectedLabelColor: AppColors.primeryColor,
          unselectedLabelStyle: GoogleFonts.poppins(color: AppColors.white),
          labelStyle: GoogleFonts.poppins(),
          labelColor: AppColors.white,
          indicator: BoxDecoration(
              color: AppColors.primeryColor,
              borderRadius: BorderRadius.circular(5)),
          controller: _tabController,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(text: 'Batsmen'),
            Tab(text: 'Bowlers'),
            Tab(text: 'All-rounders'),
            Tab(text: 'Teams'),
          ],
        ),
        if (widget.outerTab == 'ODI')
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                DetailsScreenTab(
                  playerList: dataListProvider.odiBatsmen,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.odiBowlers,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.odiAllRounders,
                ),
                TeamDetailsScreenTab(
                  teamList: dataListProvider.odiTeams,
                ),
              ],
            ),
          ),
        if (widget.outerTab == 'TEST')
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                DetailsScreenTab(
                  playerList: dataListProvider.t20Batsmen,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.testBowlers,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.testAllRounders,
                ),
                TeamDetailsScreenTab(
                  teamList: dataListProvider.testTeams,
                ),
              ],
            ),
          ),
        if (widget.outerTab == 'T20')
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                DetailsScreenTab(
                  playerList: dataListProvider.t20Batsmen,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.t20Bowlers,
                ),
                DetailsScreenTab(
                  playerList: dataListProvider.t20AllRounders,
                ),
                TeamDetailsScreenTab(
                  teamList: dataListProvider.t20Teams,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
