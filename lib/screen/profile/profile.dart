import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final dynamic email;
  const Profile({
    Key? key,
    required this.email,}): super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget detailBox({
    required String type,
    required String data,
    required double width,
    String? image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                if (image != null) ...[
                  Row(
                    children: [
                      Image.asset(
                        image,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data,
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget detailSBox({
    required String type,
    required String data,
    required double width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: width - 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        elevation: 0,
        title: const Text("Profile"),
      ),
      backgroundColor: Colors.indigo.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 90,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detailSBox(
                          data: 'Tanyalak', type: 'Firstname', width: width),
                      const SizedBox(
                        height: 16,
                      ),
                      detailSBox(
                          data: 'Srianong', type: 'Lastname', width: width),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Nickname',
                data: 'Namwan',
                width: width,
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Birthdate',
                data: '28/02/1998',
                width: width,
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'E-mail',
                data: widget.email ?? "",
                width: width,
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Facebook',
                data: '',
                width: width,
                image: "assets/social_icon/facebook.png",
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Twitter',
                data: '',
                width: width,
                image: "assets/social_icon/twitter.png",
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Instagram',
                data: '',
                width: width,
                image: "assets/social_icon/instagram.png",
              ),
              const SizedBox(
                height: 16,
              ),
              detailBox(
                type: 'Line',
                data: '',
                width: width,
                image: "assets/social_icon/line.png",
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
