import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livechatt/livechatt.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';
import '../../widget/contact_option.dart';


@RoutePage()
class SupportCenterPage extends StatefulWidget {
  const SupportCenterPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<SupportCenterPage> createState() => _SupportCenterPageState();
}
class _SupportCenterPageState extends State<SupportCenterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _orgController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  final List<String> phoneNumbers = <String>[
    'tel:+1234567890',
    'tel:+0987654321',
    'tel:+1123456789',

    // Add more numbers as needed
  ];


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _orgController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Constants.assetMyIcon),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white60,
                            width: 0,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "24/7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // const Spacer(),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.title.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ContactOption(
                text: "Call Us",
                icon: Icons.phone,
                url: '+63 994 214 5707',
              ),
              const SizedBox(height: 5),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.email, color: Color(0xFF101820)),
                  const SizedBox(width: 10),
                  const Text(
                    "Email Us",
                    style: TextStyle(
                      color: Color(0xFF101820),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00539C),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'consult@servoitsolutions.ph',
                            query: encodeQueryParameters({
                              'subject': widget.title,
                              'body': 'Hello, Customer Support Team,'
                            }),
                          );
                          try {
                            launchUrl(emailLaunchUri);
                          } catch (e) {
                            // print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Email is not available',
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.message, color: Color(0xFF101820)),
                  const SizedBox(width: 10),
                  const Text(
                    "Chat With Us",
                    style: TextStyle(
                      color: Color(0xFF101820),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00539C),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          // Livechat.beginChat(
                          //   Constants.licenseNo,
                          //   Constants.groupId,
                          //   "Vince",
                          //   "kervinjumar.kj@gmail.com",
                          //   <String, String>{'org': "Servo", 'position': "SoftDev"},
                          // );

                          /// Create alert dialog

                          /// username - textfield
                          /// email - textfield
                          /// org - textfield
                          /// role - textfield
                          /// button - ok -> call this function _onCallLiveChat()

                          _nameController.clear();
                          _emailController.clear();
                          _orgController.clear();
                          _positionController.clear();

                          _showMyDialog(
                            context: context,
                            userName: '',
                            email: '',
                            org: '',
                            position: '',
                          );
                        },
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.location_on, color: Color(0xFF101820)),
                  const SizedBox(width: 10),
                  const Text(
                    "Visit Us",
                    style: TextStyle(
                      color: Color(0xFF101820),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00539C),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          final Uri mapLaunchUri = Uri(
                            scheme: 'https',
                            path:
                            'www.google.com/maps/place/Servo+IT+Solutions+Angeles+City+Office/@15.15935,120.596908,15z/data=!4m6!3m5!1s0x3396f31240b2d5e9:0x8a45ca63c3c80a5c!8m2!3d15.1604133!4d120.5973204!16s%2Fg%2F11b5rf1dzm?hl=en-US&entry=ttu&g_ep=EgoyMDI0MDkxOC4xIKXMDSoASAFQAw%3D%3D',
                          );

                          try {
                            launchUrl(mapLaunchUri);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Map is not available',
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 5),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.help, color: Color(0xFF101820)),
                  const SizedBox(width: 10),
                  const Text(
                    "FAQs",
                    style: TextStyle(
                      color: Color(0xFF101820),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00539C),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          final Uri mapLaunchUri = Uri(
                            scheme: 'https',
                            path: 'servoitsolutions.ph/support/kb/index.php',
                          );
                          try {
                            launchUrl(mapLaunchUri);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sorry no Connection',
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog({
    required BuildContext context,
    required String userName,
    required String email,
    required String org,
    required String position,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fill up the information'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 12.0.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0).r,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 12.0.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0).r,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  child: TextFormField(
                    controller: _orgController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "org",
                      labelStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 12.0.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0).r,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  child: TextFormField(
                    controller: _positionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Position",
                      labelStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 12.0.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0).r,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                context.router.maybePop();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () async {
                // Livechat.beginChat(
                //   Constants.licenseNo,
                //   Constants.groupId,
                //   'Vincent',
                //   'gardosupremo02@gmail.com',
                //   <String, String>{'org': 'Servo IT Solutions', 'position': 'Software Developer'},
                // );

                context.router.maybePop();
                _onCallLiveChat(
                  userName: _nameController.text.toString().trim(),
                  email: _emailController.text.toString().trim(),
                  org: _orgController.text.toString().trim(),
                  position: _positionController.text.toString().trim(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onCallLiveChat({
    required String userName,
    required String email,
    required String org,
    required String position,
  }) async {
    Livechat.beginChat(
      Constants.licenseNo,
      groupId: Constants.groupId,
      visitorName: userName,
      visitorEmail: email,
      customParams: <String, String>{'org': org, 'position': position},
    );
  }
}