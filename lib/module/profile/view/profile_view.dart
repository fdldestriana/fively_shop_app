import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        backgroundColor: ColorLib.background,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: firestore.collection("users").doc(user!.uid).get(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            var userData = snapshot.data?.data() ??
                {}; // prevent Null check operator used on a null value
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorLib.primary,
                ),
              );
            } else {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        Text(
                          "My profile",
                          style: GoogleFonts.montserrat(
                              color: ColorLib.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.09),
                              child: Image.network(
                                userData["photoProfile"],
                                errorBuilder: (_, __, ___) => Container(
                                  alignment: Alignment.center,
                                  color: Colors.amber,
                                  child: const Text("Whoops!"),
                                ),
                                width: Get.width * 0.17,
                                height: Get.height * 0.08,
                              ),
                            ),
                            SizedBox(width: Get.width * 0.05),
                            RichText(
                              text: TextSpan(
                                text: (userData["firstName"] !=
                                        userData["lastName"])
                                    ? userData["firstName"] +
                                        userData["lastName"] +
                                        "\n"
                                    : userData["firstName"] + "\n",
                                style: GoogleFonts.montserrat(
                                  color: ColorLib.black,
                                  fontSize: 18,
                                ),
                                children: [
                                  TextSpan(
                                    text: userData["email"],
                                    style: GoogleFonts.montserrat(
                                      color: ColorLib.gray,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        SizedBox(
                          height: Get.height * 0.53,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.profileMenus.length,
                            itemBuilder: (context, index) {
                              return ProfileMenu(
                                menu:
                                    "${controller.profileMenus.keys.toList()[index]}\n",
                                subMenu:
                                    "${controller.profileMenus.values.toList()[index]}\n",
                                onTap: () {
                                  controller.navigatoProfileMenu(controller
                                      .profileMenus.keys
                                      .toList()[index]);
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }
          }),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
