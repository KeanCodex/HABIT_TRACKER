import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_app/Functions/Navigation.dart';
import 'package:codex_app/Models/Setting_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Components/LabelStyle.dart';
import '../Customs/Customized_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> getUserName() async {
      User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('DataStore')
          .doc(user!.uid)
          .get();
      return docSnapshot['name'];
    }

    final dataProfile = DATAPROFILE;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarHeight: 50,
          centerTitle: true,
          title: LabelText(
            label: 'PROFILE VIEW',
            letterSpacing: 3,
            fontsize: 16,
            fontweight: FontWeight.w500,
            colors: dblueBG,
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Assets/Images/harry.jpg'),
                  backgroundColor: orangeBG,
                ),
                const Gap(10),
                FutureBuilder<String>(
                  future: getUserName(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LabelText(
                          label: snapshot.data!.toUpperCase(),
                          fontsize: 25,
                          colors: dblueBG,
                          fontweight: FontWeight.w700,
                        );
                      }
                    }
                  },
                ),
                const Gap(30),
                Expanded(
                  child: ListView.builder(
                    itemCount: dataProfile.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          onTap: () {
                            var whatIndex = dataProfile[index].id;

                            if (whatIndex == 4) {
                              logoutAuth(context);
                            } else if (whatIndex == 1) {}
                          },
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              dataProfile[index].icon,
                              color: dblueBG,
                              size: 25,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: dblueBG,
                                size: 18,
                              )),
                          title: dataProfile[index].title,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
