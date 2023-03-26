import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/Orders.dart';

class SellerVerification extends StatefulWidget {
  const SellerVerification({Key? key}) : super(key: key);

  @override
  State<SellerVerification> createState() => _SellerVerificationState();
}

class _SellerVerificationState extends State<SellerVerification> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }
  // @override
  // void dispose() {
  //   timer!.cancel();
  //   super.dispose();
  // }

  final _fireStoreSnapshot = FirebaseFirestore.instance
      .collection('SellerCenterUsers')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // verification(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: const Image(
              image: AssetImage("assets/images/backgroundimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // height: 222,
                  // width: 222,
                  child: FutureBuilder<DocumentSnapshot>(
                      future: _fireStoreSnapshot,
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }

                        if (snapshot.hasError) {
                          return const Center(child: Text('Some Error'));
                        }

                        // if(snapshot.data!['Name'] == 'fahad'){
                        //
                        //   print('gooooooooooood');
                        //
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Orders()));
                        //
                        // }

                        if (snapshot.hasData) {
                          bool verf = snapshot.data!['Verification'];
                          if (verf == true) {
                            return ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Orders()));
                                },
                                child: Text('Continue'));
                          }
                        }

                        return const Text('Error');
                      }),
                ),
                SizedBox(
                  height: 11,
                ),
                const Center(
                  child: Text(
                    'Contact to the admin of MobidThrift to',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    'verify your account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Center(
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Center(
                  child: Text(
                    'Wait upto 2 working days',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // var verification;
  //
  // Future<void> getName() async {
  //   DocumentSnapshot document = await FirebaseFirestore.instance.collection('SellerCenterUsers').doc(FirebaseAuth.instance.currentUser?.uid).get();
  //   verification = (document.data as DocumentSnapshot)['Verification'];
  //   if(verification == true){
  //     print('gooooooooooooooooood');
  //   } else {
  //     print('bad      bad     bad      bad');
  //
  //   }
  // }

  // verification() {
  //  FutureBuilder<DocumentSnapshot>(
  //      future: _fireStoreSnapshot,
  //      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
  //        if(snapshot.connectionState == ConnectionState.waiting)
  //          return Center(child: CircularProgressIndicator(color: Colors.white,));
  //
  //        if(snapshot.hasError)
  //          return Center(child: Text('Some Error'));
  //
  //
  //        if(snapshot.data!['Verification'] == true){
  //
  //          Navigator.pushReplacement(
  //              context,
  //              MaterialPageRoute(
  //                  builder: (context) => Orders()));
  //
  //        }
  //
  //        return Expanded(
  //          child: InkWell(
  //            onTap: (){
  //              // print(snapshot.data!['Verification'].toString());
  //            },
  //            child: Container(
  //              height: 85,
  //              width: 33,
  //              color: Colors.amber,
  //            ),
  //          ),
  //        );
  //      }
  //  );
  // }
}
