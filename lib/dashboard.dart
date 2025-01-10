import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/halte_api.dart';
import 'package:tugas_akhir/DB/penumpang_api.dart';
import 'package:tugas_akhir/Model/halte_api_model.dart';
import 'package:tugas_akhir/Model/transaksi_hisotry.dart';
import 'package:tugas_akhir/history_journey.dart';
import 'package:tugas_akhir/list_bus_api.dart';
import 'package:tugas_akhir/model/penumpang_api_model.dart';
import 'package:tugas_akhir/report_page.dart';
import 'package:tugas_akhir/edit_profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.idUser});
  final String idUser;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<dynamic>? futureDashboard;
  Future<dynamic>? futureHalte;
  final penumpangApi = PenumpangApi();
  final halte = HalteApi();

  @override
  void initState() {
    super.initState();
    getPenumpang(widget.idUser);
  }

  void getPenumpang(id) {
    setState(() {
      futureDashboard = penumpangApi.getById(id: id);
      futureHalte = halte.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: FutureBuilder(
          future: futureDashboard,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data == null) {
              return const Center(child: Text('No Data Found'));
            }

            final penumpang = snapshot.data;
            //final halte = snapshot.data;
            //print(halte.toString());
            //print(penumpang.toString());

            return Column(
              children: [
                //Profile
                Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Avatar
                        ClipOval(
                            child: Image.network(
                          penumpang.img == null
                              ? "https://static.vecteezy.com/system/resources/previews/002/608/327/non_2x/mobile-application-avatar-web-button-menu-digital-silhouette-style-icon-free-vector.jpg"
                              : "http://apibus.rngrelic.my.id/storage/${penumpang.img}",
                          fit: BoxFit.cover,
                          width: 80,
                        )),
                        //Nickname
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  fontFamily: 'FigtreeBold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              //Nama Penumpang
                              Text(
                                penumpang.name ?? "noname",
                                style: TextStyle(
                                    fontFamily: 'FigtreeBold',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                        //IconNotification
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications,
                                size: 35,
                              )),
                        )
                      ],
                    )),
                //Lokasi
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 30,
                        color: Color.fromARGB(255, 223, 37, 96),
                      ),
                      Text(
                        penumpang.alamat ?? "-",
                        style: TextStyle(
                            fontFamily: 'FigtreeBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                //Informasi lokasi
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            offset: Offset(0, 3),
                            blurRadius: 7)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rumah",
                        style: TextStyle(
                          fontFamily: "FigtreeBold",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            penumpang.name ?? "-",
                            style: TextStyle(
                                fontFamily: "FigtreeBold",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text(
                            penumpang.noTelp ?? "-",
                            style: TextStyle(
                              fontFamily: "FigtreeReguler",
                              fontSize: 15,
                              // fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home),
                          Text(
                            penumpang.alamat ?? "-",
                            style: TextStyle(
                              fontFamily: "FigtreeReguler",
                              fontSize: 15,
                              // fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 223, 37, 96)),
                            child: TextButton(
                                onPressed: () {
                                  penumpangApi.getById(id: "2");
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return EditProfile(
                                      idUser: penumpang.id,
                                    );
                                  }));
                                },
                                child: Text(
                                  "Change Address",
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HistoryJourney(
                                              idUser: widget.idUser)));
                                },
                                icon: Icon(
                                  Icons.history_edu,
                                  size: 40,
                                )),
                          ),
                          Text("History"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddReportPage()));
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  size: 40,
                                )),
                          ),
                          Text("Laporan")
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.map),
                                Text(
                                  "Halte",
                                  style: TextStyle(
                                      fontFamily: "FigtreeBold",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text("see all")
                          ],
                        ),
                      ),
                      //HALTE ITEM!!!
                      FutureBuilder(
                        future: futureHalte,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              (snapshot.data as List).isEmpty) {
                            return const Center(
                                child: Text('Halte tidak tersedia'));
                          }

                          final halte = snapshot.data!;
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemCount: halte.length,
                            itemBuilder: (context, index) {
                              final itemHalte = halte[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ListBusApi(
                                                idUser: widget.idUser,
                                                idHalte: itemHalte.id)));
                                  },
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/images/yelan.jpg",
                                      width: 50,
                                    ),
                                  ),
                                  title: Text(itemHalte.namaHalte),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // ListView.separated(
                      //   final halte = halte[index];
                      //   separatorBuilder: (context, index) => const
                      //   SizedBox(height: 12,),
                      //   itemBuilder: (context, index){
                      //     Container(
                      //       margin: EdgeInsets.only(bottom: 5),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           ClipRRect(
                      //             borderRadius: BorderRadius.circular(20),
                      //             child: Image.asset(
                      //               "assets/images/yelan.jpg",
                      //               width: 80,
                      //             ),
                      //           ),
                      //           Text(halte.namaLokasi)
                      //         ],
                      //       ),
                      //     );
                      //   }
                      // ,itemCount: halte.length),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: Row(
                      //     children: [
                      //       ClipRRect(
                      //         borderRadius: BorderRadius.circular(20),
                      //         child: Image.asset(
                      //           "assets/images/yelan.jpg",
                      //           width: 80,
                      //         ),
                      //       ),
                      //       Text(halte.namaHalte)
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            );
          },
        )),
      ),
    );
  }
}
