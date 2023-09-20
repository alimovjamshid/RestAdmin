import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/bron/widgets/NevTextField.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../home/widgets/CustomIconButton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  var errorText = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/img.png",
            width: width,
            height: 162,
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.only(top: 38, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  imageIcon: "assets/calendar.png",
                  height: 35,
                  width: 35,
                  borderRadius: 7,
                ),
                CustomIconButton(
                  onPressed: () {},
                  imageIcon: "assets/settings.png",
                  height: 35,
                  width: 35,
                  borderRadius: 7,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: height - 210,
              margin:
                  EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 30),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Kirish",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewTextField(
                          textEditingController: loginController,
                          text: "Login"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewTextField(
                          textEditingController: passwordController,
                          text: "Parol"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Parolingizni unutdingizmi?",
                          style: TextStyle(color: colorGreen2),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(onPressed: () {}, child: Text("Tiklash"))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                        text: "Tasdiqlash",
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await auth(loginController.text.toString(),passwordController.text.toString()).then((value) {
                            if (value.statusCode == 201) {
                              setState(() {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const MyApp()),
                                        (route) => false);
                                prefs.setString(token, value.data['token']);
                              });
                            }
                          }).onError((error, stackTrace) {
                            debugPrint("xato");
                            setState(() {
                              widget.errorText = "Login yoki parol xato";
                            });
                          });
                        },
                        borderRadius: 6,
                        textSize: 16,
                        buttonHeight: 45,
                        buttonWidth: 180,
                        color: colorGreen2,
                        textColor: Colors.white),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.errorText,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
