import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/penumpang_api.dart';
import 'package:tugas_akhir/edit_profile.dart';
import 'package:tugas_akhir/history_journey.dart';
import 'package:tugas_akhir/history_report.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.idUser});
  final String idUser;

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
      futureProfile = penumpangApi.getById(id: widget.idUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 26, 42, 69),
        // Button Back Pada Navbar
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
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
                                penumpang.email,
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
                              SizedBox(
                                width: 380,
                                height: 60,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(idUser: widget.idUser,),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    side: BorderSide(
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_rounded,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Button History Report
                              SizedBox(
                                width: 380,
                                height: 60,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HistoryReport(idUser: "9"),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    side: BorderSide(
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.report_gmailerrorred_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "History Report",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Button History Journey
                              SizedBox(
                                width: 380,
                                height: 60,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HistoryJourney(idUser: widget.idUser,),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    side: BorderSide(
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.signpost_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "History Journey",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
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
                                              BorderRadius.circular(10),
                                        ),
                                      ),
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
        ),
      ),
    );
  }
}
