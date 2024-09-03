import 'package:flutter/material.dart';
import 'package:whatsappclone/newScreen/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Image.asset(
                "assets/images/bg.png",
                color: Colors.greenAccent[700],
                width: 340,
                height: 340,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Agree and Contiue accept the",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const TextSpan(
                            text:
                                " WhasApp Terms of Service and Privacy policy",
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ])),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const LoginPage(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 110,
                  child: Card(
                    color: Colors.greenAccent[700],
                    elevation: 8,
                    margin: const EdgeInsets.all(0),
                    child: const Center(
                        child: Text(
                      "Agree and Contiue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
