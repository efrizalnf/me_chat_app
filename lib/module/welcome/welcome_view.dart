import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../state_util.dart';
import '../login/view/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.52,
            color: const Color(0xFFFFCB45),
            child: Image.asset(
              'assets/images/welcome.png',
              width: 358.05,
              height: 300.55,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.48,
            color: Colors.black,
            child: Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
                child: Column(children: [
                  Text(
                    "Stay connected with your friends and family",
                    style: GoogleFonts.inter(
                      fontSize: 37,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.verified_user_rounded,
                        color: Colors.green,
                      ),
                      Text(
                        "Secure, private messaging",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(const LoginView()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[350],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
