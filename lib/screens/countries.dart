import 'package:covid_19_app/Services/countries_stats_api_hit.dart';
import 'package:covid_19_app/screens/single_country_stats.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesWidget extends StatefulWidget {
  const CountriesWidget({super.key});

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CountriesClass myCountry = CountriesClass();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search by Country',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: myCountry.getCountriesStats(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {




                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {

                          String name = snapshot.data[index]['country'];
                          if(searchController.text.isEmpty) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleCountryWidget(
                                              countryNumber: index,
                                            )));

                              },
                              child: ListTile(
                                title: Text(
                                    snapshot.data[index]['country'].toString()),
                                subtitle: Text(
                                    snapshot.data[index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data[index]
                                  ['countryInfo']['flag']
                                      .toString()),
                                ),
                              ),
                            );

                          }
                          else if(name.toLowerCase().contains(searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleCountryWidget(
                                              countryNumber: index,
                                            )));

                              },
                              child: ListTile(
                                title: Text(
                                    snapshot.data[index]['country'].toString()),
                                subtitle: Text(
                                    snapshot.data[index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data[index]
                                  ['countryInfo']['flag']
                                      .toString()),
                                ),
                              ),
                            );

                          }

                          else {
                        return Container();
                          }

                        });
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 50,
                                  width: 50,
                                color: Colors.black,
                              ),
                              title: Container(

                                height: 10,
                                width: 70,
                                color: Colors.black,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 70,
                                color: Colors.black,),
                            );
                          }),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
