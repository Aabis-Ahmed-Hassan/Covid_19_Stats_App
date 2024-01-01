import 'package:covid_19_app/Services/world_stats_api_hit.dart';
import 'package:covid_19_app/screens/countries.dart';
import 'package:covid_19_app/Models/WorldStatsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsWidget extends StatefulWidget {
  const WorldStatsWidget({super.key});

  @override
  State<WorldStatsWidget> createState() => _WorldStatsWidgetState();
}

class _WorldStatsWidgetState extends State<WorldStatsWidget>
    with TickerProviderStateMixin {
  List<WorldStatsModel> myList = [];
  WorldStatsClass worldStatsObject = WorldStatsClass();
  List<Color> myColors = [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: FutureBuilder(
              future: worldStatsObject.getDataWorldStats(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      PieChart(
                        dataMap: {
                          'Total': snapshot.data!.cases!.toDouble(),
                          'Recovered': snapshot.data!.recovered!.toDouble(),
                          'Deaths': snapshot.data!.deaths!.toDouble(),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        colorList: myColors,
                        chartType: ChartType.ring,
                        chartRadius: 175,
                        animationDuration: const Duration(seconds: 3),
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ReuseableRow(
                          title: 'Total Cases',
                          value: snapshot.data!.cases!.toString()),
                      ReuseableRow(
                          title: 'Today Cases',
                          value: snapshot.data!.todayCases!.toString()),
                      ReuseableRow(
                          title: 'Total Recovered',
                          value: snapshot.data!.todayRecovered!.toString()),
                      ReuseableRow(
                          title: 'Today Recovered',
                          value: snapshot.data!.todayRecovered!.toString()),
                      ReuseableRow(
                          title: 'Total Deaths',
                          value: snapshot.data!.deaths!.toString()),
                      ReuseableRow(
                          title: 'Today Deaths',
                          value: snapshot.data!.todayDeaths!.toString()),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CountriesWidget()));
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                    ],
                  );
                } else {
                  return const SpinKitFadingCircle(
                    color: Colors.white,
                  );
                }
              },
            ),
          ),
        ));
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;

  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        color: const Color(0xff424844),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            Text(value),
          ],
        ),
      ),
    );
  }
}
