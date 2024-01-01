import 'package:covid_19_app/Services/countries_stats_api_hit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SingleCountryWidget extends StatelessWidget {
  var countryNumber;

  SingleCountryWidget({super.key, required this.countryNumber});

  CountriesClass myCountry = CountriesClass();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: myCountry.getCountriesStats(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Column(
                  children: [
                    Image(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        image: NetworkImage(
                            snapshot.data[countryNumber]['countryInfo']['flag']),),
                
                
                    const SizedBox(height: 30,),
                    SingleCountryDetails(title: 'Country Name', value: snapshot.data[countryNumber]['country']),
                    SingleCountryDetails(title: 'Total Cases', value: snapshot.data[countryNumber]['updated'].toString()),
                    SingleCountryDetails(title: 'Population', value: snapshot.data[countryNumber]['population'].toString()),
                    SingleCountryDetails(title: 'Cases Per One Million', value: snapshot.data[countryNumber]['casesPerOneMillion'].toString()),
                    SingleCountryDetails(title: 'Today Cases', value: snapshot.data[countryNumber]['todayCases'].toString()),
                    SingleCountryDetails(title: 'Active Cases', value: snapshot.data[countryNumber]['active'].toString()),
                    SingleCountryDetails(title: 'Total Deaths', value: snapshot.data[countryNumber]['deaths'].toString()),
                    SingleCountryDetails(title: 'Today Deaths', value: snapshot.data[countryNumber]['todayDeaths'].toString()),
                    SingleCountryDetails(title: 'Total Recovered', value: snapshot.data[countryNumber]['recovered'].toString()),
                    SingleCountryDetails(title: 'Today Recovered', value: snapshot.data[countryNumber]['todayRecovered'].toString()),
                    SingleCountryDetails(title: 'Critical', value: snapshot.data[countryNumber]['critical'].toString()),
                    SingleCountryDetails(title: 'latitude', value: snapshot.data[countryNumber]['countryInfo']['lat'].toString()),
                    SingleCountryDetails(title: 'latitude', value: snapshot.data[countryNumber]['countryInfo']['long'].toString()),
                

                        /* "cases": 230449,
                        "active": 13193,
                        "critical": 0,
                        "casesPerOneMillion": 5655,
                        "deathsPerOneMillion": 196,
                        "tests": 1349589,
                        "testsPerOneMillion": 33115,
                        "population": 40754388,
                        "continent": "Asia",
                        "oneCasePerPeople": 177,
                        "oneDeathPerPeople": 5112,
                        "oneTestPerPeople": 30,
                        "activePerOneMillion": 323.72,
                        "recoveredPerOneMillion": 5135.23,
                        "criticalPerOneMillion": 0*/
                    
                    
                    
                    
                    
                  ],
                ),
              );
            } else {
              return const SpinKitFadingCircle(
                color: Colors.white,
              );
            }
          },
        ));
  }
}


class SingleCountryDetails extends StatelessWidget {
  String title, value;
   SingleCountryDetails({super.key , required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Text(title),
          Text(value),

        ],
      ),
    );
  }
}



