import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/home/screen/modal/home_modal.dart';
import 'package:sky_scrapper/home/screen/provider/home_provider.dart';
import 'package:sky_scrapper/home/utiles/ApiHelpers.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroProvider? ProviderTrue;
  IntroProvider? ProviderFalse;

  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<IntroProvider>(context, listen: true);
    ProviderFalse = Provider.of<IntroProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "RANDOM DATA",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: IconButton(
                onPressed: () async {
                  ProviderFalse!.Refresh(ProviderFalse!.getNews());
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey.shade800,
                    Colors.blueGrey.shade500,
                    Colors.blueGrey.shade300
                  ],
                ),
              ),
            ),
            Container(
              child: FutureBuilder<IntroModal?>(
                  future: ProviderTrue!.getNews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      ProviderFalse!.Refresh(snapshot.data!);
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                  "${ProviderTrue!.data!.results![0].picture!.large}",
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.sp),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 3.h,
                              alignment: Alignment.topLeft,
                              // color: Colors.yellow,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Name :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].email}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              // color: Colors.yellow,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Phone :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].phone}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              // color: Colors.yellow,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Cell :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].cell}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Address :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].location!.street!.number} ${ProviderTrue!.data!.results![0].location!.street!.name}, ${ProviderTrue!.data!.results![0].location!.city},\n${ProviderTrue!.data!.results![0].location!.state}, ${ProviderTrue!.data!.results![0].location!.country} -${ProviderTrue!.data!.results![0].location!.postcode}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Dob Date :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].dob!.date}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Dob Age :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].dob!.age}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "NAT :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].nat}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
