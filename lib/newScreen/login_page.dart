import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappclone/model/country_model.dart';
import 'package:whatsappclone/newScreen/country_page.dart';
import 'package:whatsappclone/newScreen/otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "Egypt";
  String countryCode = "+20";
  final TextEditingController _controller = TextEditingController();
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
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (_controller.text.length < 10) {
                  showMyDialog1(context);
                } else {
                  showMyDialog(context);
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.tealAccent[400],
                child: const Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'We will be verfyfying your phone Number',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$countryCode ${_controller.text}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "This is ok , or vaild like to edit the Number ?",
                    style: TextStyle(
                      fontSize: 15.5,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => OtpScreen(
                        countryCode: countryCode,
                        number: _controller.text,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          );
        });
  }

  Future<void> showMyDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'This is No Number Entered',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          );
        });
  }

  Widget number() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
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
                controller: _controller,
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
