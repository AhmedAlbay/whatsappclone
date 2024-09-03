import 'package:flutter/material.dart';
import '../model/country_model.dart';

class CountryPage extends StatefulWidget {
  final Function(CountryModel) setCountryData;

  const CountryPage({super.key, required this.setCountryData});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel> countries = [
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
    CountryModel(name: "Egypt", code: "+20", flag: "🇪🇬"),
    CountryModel(name: "Germany", code: "+49", flag: "🇩🇪"),
    CountryModel(name: "Canada", code: "+1", flag: "🇨🇦"),
    CountryModel(name: "Australia", code: "+61", flag: "🇦🇺"),
    CountryModel(name: "Brazil", code: "+55", flag: "🇧🇷"),
    CountryModel(name: "Japan", code: "+81", flag: "🇯🇵"),
    CountryModel(name: "Saudi Arabia", code: "+966", flag: "🇸🇦"),
    CountryModel(name: "United Arab Emirates", code: "+971", flag: "🇦🇪"),
    CountryModel(name: "Qatar", code: "+974", flag: "🇶🇦"),
    CountryModel(name: "Kuwait", code: "+965", flag: "🇰🇼"),
    CountryModel(name: "Oman", code: "+968", flag: "🇴🇲"),
    CountryModel(name: "Bahrain", code: "+973", flag: "🇧🇭"),
    CountryModel(name: "Jordan", code: "+962", flag: "🇯🇴"),
    CountryModel(name: "Lebanon", code: "+961", flag: "🇱🇧"),
    CountryModel(name: "Morocco", code: "+212", flag: "🇲🇦"),
    CountryModel(name: "Algeria", code: "+213", flag: "🇩🇿"),
    CountryModel(name: "Tunisia", code: "+216", flag: "🇹🇳"),
    CountryModel(name: "Libya", code: "+218", flag: "🇱🇾"),
    CountryModel(name: "Sudan", code: "+249", flag: "🇸🇩"),
    CountryModel(name: "Yemen", code: "+967", flag: "🇾🇪"),
    CountryModel(name: "Syria", code: "+963", flag: "🇸🇾"),
    CountryModel(name: "Iraq", code: "+964", flag: "🇮🇶"),
    CountryModel(name: "Palestine", code: "+970", flag: "🇵🇸"),
    CountryModel(name: "Somalia", code: "+252", flag: "🇸🇴"),
    CountryModel(name: "Djibouti", code: "+253", flag: "🇩🇯"),
    CountryModel(name: "Mauritania", code: "+222", flag: "🇲🇷"),
    CountryModel(name: "Comoros", code: "+269", flag: "🇰🇲"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Choose a Country",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.teal,
            wordSpacing: 1,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.teal,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return countryCard(countries[index]);
        },
      ),
    );
  }

  Widget countryCard(CountryModel country) {
    return InkWell(
      onTap: () => widget.setCountryData(country),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(country.flag),
              const SizedBox(width: 15),
              Text(country.name),
              const Spacer(),
              Text(country.code),
            ],
          ),
        ),
      ),
    );
  }
}
