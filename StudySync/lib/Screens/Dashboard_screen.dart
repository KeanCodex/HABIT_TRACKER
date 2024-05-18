import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Components/NeoBox.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Functions/SmartUtility.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // padding constants

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  Future<String> getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('DataStore')
        .doc(user!.uid)
        .get();
    return docSnapshot['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),

              // welcome home
              NeoBox(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(),
                      LabelText(
                        textAlign: TextAlign.left,
                        label: 'Welcome Home',
                        fontsize: 20,
                        fontweight: FontWeight.w600,
                        colors: dblueBG,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.waves_outlined,
                            size: 60,
                            color: dblueBG,
                          ),
                          const Gap(15),
                          FutureBuilder<String>(
                            future: getUserName(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: GoogleFonts.bebasNeue(
                                        fontSize: 65, color: dblueBG),
                                  );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(15),
              const Divider(),
              const Gap(15),

              // smart devices grid
              LabelText(
                textAlign: TextAlign.left,
                label: 'TODO SYNC TASK:',
                letterSpacing: 1,
                fontsize: 15,
                fontweight: FontWeight.w600,
                colors: dblueBG,
              ),
              const Gap(10),

              // grid
              Expanded(
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartBox(
                      taskQuest: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
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
}
