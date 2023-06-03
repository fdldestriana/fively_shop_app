import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        backgroundColor: ColorLib.background,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
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
                    borderRadius: BorderRadius.circular(Get.width * 0.09),
                    child: Image.network(
                      controller.userData["photoProfile"] as String,
                      width: Get.width * 0.17,
                      height: Get.height * 0.08,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.05),
                  RichText(
                    text: TextSpan(
                      text: (controller.userData["firstName"] !=
                              controller.userData["lastName"])
                          ? controller.userData["firstName"] +
                              controller.userData["lastName"] +
                              "\n"
                          : controller.userData["firstName"] + "\n",
                      style: GoogleFonts.montserrat(
                        color: ColorLib.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: controller.userData["email"],
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
                    return SizedBox(
                      height: Get.height * 0.09,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.profileMenus[index],
                              style: GoogleFonts.montserrat(
                                  color: ColorLib.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: Get.width * 0.04,
                              color: ColorLib.gray,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
