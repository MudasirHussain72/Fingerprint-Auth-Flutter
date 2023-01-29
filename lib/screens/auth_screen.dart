import 'package:biometric_auth/screens/home_screen.dart';
import 'package:biometric_auth/services/local_auth_services.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 1;
    return Scaffold(
        backgroundColor: Color(0xff110E31),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Finger authorization",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color(0xff1C183C),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Authorization",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .02),
                    Text(
                      "Please use finger print to login",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .06),
                    Icon(
                      Icons.fingerprint,
                      color: Colors.green.shade500,
                      size: 80,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: InkWell(
                  onTap: () async {
                    final authenticate = await LocalAuth.authenticate();
                    setState(() {
                      authenticated = authenticate;
                    });
                    print(authenticated);
                    if (authenticated) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                        color: Color(0xff614BF7),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
