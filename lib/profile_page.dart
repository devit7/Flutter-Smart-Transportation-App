import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/penumpang_api.dart';
import 'package:tugas_akhir/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<dynamic>? futureProfile;
  final penumpangApi = PenumpangApi();

  @override
  void initState() {
    super.initState();
    getPenumpang();
  }

  void getPenumpang() {
    setState(() {
      futureProfile = penumpangApi.getById(id: "2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return const Center(child: Text('No Data Found'));
          }
          final penumpang = snapshot.data;
          print(penumpang.toString());

          return Container(
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
                            child: Image.network(
                          "https://apibus.rngrelic.my.id/storage/" +
                              penumpang.img,
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
                              penumpang.name,
                              style: TextStyle(
                                fontFamily: 'FigtreeBold',
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "geovandp@gmail.com",
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

                //Button Profile
                Container(
                  padding: EdgeInsets.all(16.0),
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
                          children: [
                            // Button Edit Profile
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  size: 35,
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(340, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      side: BorderSide(
                                        width: 2.5,
                                      ),
                                    ),
                                    child: const Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            // Button History Report
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.report_gmailerrorred_outlined,
                                  size: 35,
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(340, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      side: BorderSide(
                                        width: 2.5,
                                      ),
                                    ),
                                    child: const Text(
                                      "History Report",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              // Button History Journey
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.signpost_outlined,
                                  size: 35,
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(340, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      side: BorderSide(
                                        width: 2.5,
                                      ),
                                    ),
                                    child: const Text(
                                      "History Journey",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            // Button Logout
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 206, 14, 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: const Color(0xFFFFFFFF)),
                                    ),
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
          );
        },
      )),
    );
  }
}
