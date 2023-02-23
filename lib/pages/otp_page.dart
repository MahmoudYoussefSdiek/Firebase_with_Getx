import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text('Enter OTP Code'),
            SizedBox(
              height: 20,
            ),
            /* To do submit otp code */
          ],
        ),
      ),
    );
  }
}
