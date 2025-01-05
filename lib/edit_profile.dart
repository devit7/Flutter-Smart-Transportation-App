import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),            
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Profile
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Avatar
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 26, 42, 69),
                        shape: BoxShape.circle),
                    child: ClipOval(
                        child: Image.asset(
                      "assets/images/wife.jpg",
                      fit: BoxFit.cover,
                      width: 90,
                    )),
                  ),
                  //Nickname
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Istrinya Devit",
                          style: TextStyle(
                            fontFamily: 'FigtreeBold',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "istri_sah_devit@gmail.com",
                          style: TextStyle(
                              fontFamily: 'FigtreeBold',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        
            //Edit Profile
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Define a TextStyle biar gk ngulang
                  Builder(builder: (context) {
                    final labelStyle = TextStyle(
                      fontFamily: 'FigtreeBold',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    );
        
                    return Column(
                      spacing: 20,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Full Name :",
                                style: labelStyle,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Masukan Nama Anda",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Alamat :",
                                style: labelStyle,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                minLines: 3,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "Masukan Alamat Lngkap",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "No Tlp :",
                                style: labelStyle,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "+6281.......",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // profile change
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Profile Photo :",
                                style: labelStyle,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10, left: 10),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 26, 42, 69),
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                        child: Image.asset(
                                      "assets/images/wife.jpg",
                                      fit: BoxFit.cover,
                                      width: 70,
                                    )),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        child: Text("Click to replace")),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Button cancel and Save Change
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 30,
                          children: [
                            SizedBox(
                              height: 45,
                              width: 170,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 170,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: Text("Save Change",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
