import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../helpers/api_helpers.dart';
import '../modals/person_modal.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserAPIHelper.userAPIHelper.fetchingUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error :- ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            PersonData? data = snapshot.data as PersonData?;

            return Stack(
              children: [
                Container(
                  height:900,
                  width: double.infinity,
                 child: Image.asset("assets/images/images (5).jfif",
                   fit: BoxFit.fill,
                   opacity: AlwaysStoppedAnimation(0.50),
                 )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,bottom: 10,left: 10,right: 10),
                  child: Container(
                      width: 900,
                      height: 1500,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(data!.photo),
                            ),
                            Text(
                              data.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                 Text(
                                  "Email  :-  ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data.email,
                                  style:  TextStyle(color: Colors.white,fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Phone  :-  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  data.number.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "BOD  :-  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  data.bod.toString().split("T")[0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Age  :-  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  data.age.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Gender  :-  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  data.gender,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Location  :-  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  data.location,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: GlassmorphicContainer(
                                width: 250,
                                height: 50,
                                borderRadius: 20,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 2,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFFffffff).withOpacity(0.1),
                                      const Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: const [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFFffffff).withOpacity(0.5),
                                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


