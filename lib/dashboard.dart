import 'package:flutter/material.dart';
import 'package:tugas_akhir/DB/penumpang_api.dart';
import 'package:tugas_akhir/model/penumpang_api_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Future<dynamic>? futureDashboard;
  final penumpangApi = PenumpangApi();
  
  @override
  void initState(){
    super.initState();
    getPenumpang();
  }
  void getPenumpang() {
    setState(() {
      futureDashboard = penumpangApi.getById(id: "2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            print(penumpang.toString());
          
          return Column(
            children: [
              //Profile
              Container(
                padding: EdgeInsets.all(20),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Avatar
                      ClipOval(
                        child:
                          Image.asset(
                          "assets/images/yelan.jpg",
                          fit: BoxFit.cover,
                          width: 80,)
                      ),
                      //Nickname
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("Hello",
                              style: TextStyle(
                                fontFamily: 'FigtreeBold',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,),
                              //Nama Penumpang
                            Text(penumpang.name ?? "noname",
                              style: TextStyle(
                                fontFamily: 'FigtreeBold',
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,)
                          ],
                        ),
                      ),
                      //IconNotification
                      Container(
                        
                        child: IconButton(
                          onPressed: (){}, 
                          icon: Icon(Icons.notifications, size: 35,)),
                      )
                    ],
                  )
              ),
              //Lokasi
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.location_on, size: 30,color: Color.fromARGB(255, 223, 37, 96),),
                    Text("Surabaya", 
                    style: TextStyle(
                      fontFamily: 'FigtreeBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)
                  ],
                ),
              ),
              //Informasi lokasi
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                      blurRadius: 7
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rumah", 
                      style: TextStyle(
                        fontFamily: "FigtreeBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text("Tes",
                          style: TextStyle(
                            fontFamily: "FigtreeBold",
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        Text("085745056220",
                        style: TextStyle(
                            fontFamily: "FigtreeReguler",
                            fontSize: 17,
                            // fontWeight: FontWeight.w500
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.home),
                        Text("Jl. Gundih",
                        style: TextStyle(
                            fontFamily: "FigtreeReguler",
                            fontSize: 17,
                            // fontWeight: FontWeight.w500
                          ),)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 223, 37, 96)
                          ),
                          child: TextButton(
                            onPressed: (){
                              penumpangApi.getById(id: "2");
          
                            }, 
                            child: Text("Change Address",
                            style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    ),
          
                    
                    
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 3)
                          )
                        ]
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.history_edu, size: 50,)),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 3)
                          )
                        ]
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month, size: 50,)),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 3)
                          )
                        ]
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.map_outlined, size: 50,)),
                    ),
                    
                  ],
                ),
              )
            ],
          );
          },
        )),
    );
  }
}