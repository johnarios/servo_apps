import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final String url;



  const ContactOption({
    super.key,
    required this.text,
    required this.icon,
    required this.url,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20),
        Icon(icon, color: const Color(0xFF101820)),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
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
                final Uri launchUri = Uri(
                  scheme: url.startsWith('http') ? 'https' : 'tel',
                  path: url,
                );


                try {
                  launchUrl(launchUri);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$text is not available'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}