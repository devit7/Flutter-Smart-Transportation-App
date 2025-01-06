import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir/DB/penumpang_api.dart';
import 'package:tugas_akhir/model/penumpang_api_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;

  Future<dynamic>? futureDashboard;
  final penumpangApi = PenumpangApi();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController imgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPenumpang();
  }

  void getPenumpang() {
    setState(() {
      futureDashboard = penumpangApi.getById(id: "2");
      //print(futureDashboard.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
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
              nameController.text = penumpang.name ?? "";
              emailController.text = penumpang.email ?? "";
              noTelpController.text = penumpang.noTelp ?? "";
              alamatController.text = penumpang.alamat ?? "";
              imgController.text = penumpang.img ?? "";
              print(penumpang.toString());

              return Column(
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
                            'https://apibus.rngrelic.my.id/storage/' +
                                penumpang.img!,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )),
                        ),
                        //Nickname
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                penumpang.name ?? "Istri Sah Devit",
                                style: TextStyle(
                                  fontFamily: 'FigtreeBold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                penumpang.email ?? "",
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
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: "Masukan Nama Anda",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
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
                                      controller: alamatController,
                                      minLines: 3,
                                      maxLines: 5,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText: "Masukan Alamat Lngkap",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
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
                                      controller: noTelpController,
                                      decoration: InputDecoration(
                                        hintText: "+6281.......",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
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
                                          margin: EdgeInsets.only(
                                              right: 10, left: 10),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 26, 42, 69),
                                              shape: BoxShape.circle),
                                          child: ClipOval(
                                            child: image !=
                                                    null // Jika gambar sudah dipilih
                                                ? Image.file(
                                                    image!,
                                                    fit: BoxFit.cover,
                                                    width: 70,
                                                    height: 70,
                                                  )
                                                : Image.network(
                                                    'https://apibus.rngrelic.my.id/storage/' +
                                                        penumpang.img!,
                                                    fit: BoxFit.cover,
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed:
                                              pickImage, // Panggil fungsi untuk memilih gambar
                                          child: ElevatedButton(
                                            onPressed: pickImage,
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text("Click to replace"),
                                          ),
                                        ),
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
                                              borderRadius:
                                                  BorderRadius.circular(10))),
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
                                      onPressed: () async {
                                        /* if (image == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Pilih gambar terlebih dahulu")),
                                          );
                                          return;
                                        } */

                                        await penumpangApi.update(
                                          id: "2",
                                          name: nameController.text,
                                          noTelp: noTelpController.text,
                                          alamat: alamatController.text,
                                          img: image, // Kirim file gambar
                                          email: emailController.text,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("Data Berhasil Diubah")),

                                        );
                                        // refresh data
                                        getPenumpang();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Text("Save Change",
                                          style:
                                              TextStyle(color: Colors.white)),
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
              );
            }),
      ),
    );
  }

Future<void> pickImage() async {
    final imagePicker =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePicker == null) return;

    final imageTemp = File(imagePicker.path);
    setState(() {
      image = imageTemp;
    });
  }

}
