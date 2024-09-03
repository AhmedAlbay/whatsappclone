import 'package:flutter/material.dart';
import 'package:whatsappclone/model/country_model.dart';
import 'package:whatsappclone/newScreen/country_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "Egypt";
  String countryCode = "+20";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Enter whatsapp number",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.teal,
            wordSpacing: 1,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
              "Whatsapp will send an sms message to verfiy your number",
              style: TextStyle(
                fontSize: 13.5,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Whats may number",
              style: TextStyle(fontSize: 13.5, color: Colors.cyan[800]),
            ),
            const SizedBox(
              height: 15,
            ),
            countryCard(context),
            const SizedBox(
              height: 15,
            ),
            number(),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.teal, width: 1.8)),
            ),
            child: Row(
              children: [
                const Text(
                  "+",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  countryCode.substring(1),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.teal, width: 1.8)),
            ),
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone Number",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget countryCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CountryPage(
                    setCountryData: setCountryData,
                  )), // Fixing the route
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  countryName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.teal, size: 20),
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel country) {
    setState(() {
      countryName = country.name;
      countryCode = country.code;
    });
    Navigator.pop(context);
  }
}
