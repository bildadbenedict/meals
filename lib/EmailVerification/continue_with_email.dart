import 'package:flutter/material.dart';

import '../Color/AppColor.dart';
import '../components/my_button.dart';
import 'Numerica_pad.dart';


class VerifyEmail extends StatefulWidget {
  final TextEditingController emailController;

  VerifyEmail({required this.emailController});

  @override
  VerifyEmailState createState() => VerifyEmailState();
}

class VerifyEmailState extends State<VerifyEmail> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 121.0),
                      child: Container(
                        height: 82,
                        width:310,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter OTP",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text("We sent a 6-digit verification code to ${widget.emailController.text}",
                              style:  const TextStyle(
                                fontSize: 19,
                                color: Color(0xFF818181),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height:31),
                    Container(
                      height: 182,
                      width:327,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              buildCodeNumberBox(
                                  code.isNotEmpty ? code.substring(0, 1) : ""),
                              buildCodeNumberBox(
                                  code.length > 1 ? code.substring(1, 2) : ""),
                              buildCodeNumberBox(
                                  code.length > 2 ? code.substring(2, 3) : ""),
                              buildCodeNumberBox(
                                  code.length > 3 ? code.substring(3, 4) : ""),
                              buildCodeNumberBox(
                                  code.length > 4 ? code.substring(4, 5) : ""),
                              buildCodeNumberBox(
                                  code.length > 5 ? code.substring(5, 6) : ""),
                            ],
                          ),

                          Container(
                            height: 42,
                            width:299,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Didn't receive code? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF6D7175),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Resend the code to the user");
                                  },
                                  child: const Text(
                                    "Resend",
                                    style: TextStyle(
                                      color: AppColors.redPink,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height:20),
                          MyButton(
                            onTap:(){}, buttonText: 'Submit', buttonColor:AppColors.redPink,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  if (value != -1) {
                    if (code.length < 6) {
                      code = code + value.toString();
                    }
                  } else {
                    code = code.substring(0, code.length - 1);
                  }
                  print(code);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: 46.17,
        height: 47.99,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
