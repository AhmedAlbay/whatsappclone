import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.countryCode, required this.number});
  final String countryCode;
  final String number;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Define accentPurpleColor and otpTextStyles
  final Color accentPurpleColor = Colors.teal[800]!;
  final TextStyle otpTextStyles = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Verify ${widget.countryCode} ${widget.number}",
          style: TextStyle(color: Colors.teal[800], fontSize: 18.5),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Add some space at the top
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.5,
                ),
                children: [
                  const TextSpan(
                    text: "We have sent an SMS with a code to ",
                  ),
                  TextSpan(
                    text: "${widget.countryCode} ${widget.number}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " Wrong Number!",
                    style: TextStyle(color: Colors.teal[800]),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 20), // Add space between the text and OTP field
            OtpTextField(
              numberOfFields: 6,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              styles: const [],
              showFieldAsBox: true,
              borderWidth: 4.0,
              onCodeChanged: (String code) {
                // Handle validation or checks here if necessary
              },
              onSubmit: (String verificationCode) {
                // Handle the OTP submission here
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Enter 6-digit code ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            bottomButton(
              Icons.message,
              "Resand Message",
            ),
            const SizedBox(
              height: 15,
            ),
            bottomButton(
              Icons.call,
              "call",
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButton(
    IconData icon,
    String name,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.teal,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
