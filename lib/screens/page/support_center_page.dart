import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livechatt/livechatt.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';
import '../../widget/contact_option.dart';

// ... (imports unchanged)

@RoutePage()
class SupportCenterPage extends StatefulWidget {
  const SupportCenterPage({super.key, required this.title});
  final String title;

  @override
  State<SupportCenterPage> createState() => _SupportCenterPageState();
}

class _SupportCenterPageState extends State<SupportCenterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _orgController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  final List<String> phoneNumbers = [
    '9942145707',
    '1234567890',
    '0987654321',
    '1122334455',
    '5566778899',
    '6677889900',
    '7788990011',
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
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderImage(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "How can we help you?",
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildContactOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        image: const DecorationImage(
          image: AssetImage(Constants.assetMyIcon),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.title.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2)),
              const SizedBox(height: 6),
              const Text("24/7 Support Available", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOptions() {
    return Column(
      children: [
        _buildOptionRow(icon: Icons.phone, label: "Call Us", buttonIcon: Icons.phone, onTap: () => startCalling(phoneNumbers, 0)),
        _buildDivider(),
        _buildOptionRow(icon: Icons.email, label: "Email Us", buttonIcon: Icons.email, onTap: _launchEmail),
        _buildDivider(),
        _buildOptionRow(icon: Icons.message, label: "Chat With Us", buttonIcon: Icons.message, onTap: _openChatDialog),
        _buildDivider(),
        _buildOptionRow(icon: Icons.location_on, label: "Visit Us", buttonIcon: Icons.location_on, onTap: _launchMap),
        _buildDivider(),
        _buildOptionRow(icon: Icons.help, label: "FAQs", buttonIcon: Icons.help, onTap: _launchFAQ),
        _buildDivider(),
      ],
    );
  }

  Widget _buildOptionRow({
    required IconData icon,
    required String label,
    required IconData buttonIcon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: theme.primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 6, offset: const Offset(2, 2)),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(label, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            ),
            Material(
              color: const Color(0xFF2A2F92),
              borderRadius: BorderRadius.circular(12),
              elevation: 4,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Icon(buttonIcon, color: Colors.white, size: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() => Divider(
    color: Theme.of(context).dividerColor.withOpacity(0.5),
    thickness: 1.5,
    endIndent: 20,
    indent: 20,
  );

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'consult@servoitsolutions.ph',
      queryParameters: {
        'subject': widget.title,
        'body': 'Hello, Customer Support Team,',
      },
    );

    try {
      final launched = await launchUrl(emailLaunchUri);
      if (launched) {
        _showSuccess('Email app opened. Please send your message.');
      } else {
        _showError('Email is not available');
      }
    } catch (_) {
      _showError('Email is not available');
    }
  }

  void _launchMap() {
    final Uri mapLaunchUri = Uri.parse('https://www.google.nl/maps/place/...'); // Use valid link
    _launchUri(mapLaunchUri, 'Map is not available');
  }

  void _launchFAQ() {
    final Uri faqLaunchUri = Uri.parse('https://servoitsolutions.ph/support/kb/index.php');
    _launchUri(faqLaunchUri, 'Sorry, no connection');
  }

  Future<void> _launchUri(Uri uri, String errorMessage) async {
    try {
      if (!await launchUrl(uri)) {
        _showError(errorMessage);
      }
    } catch (_) {
      _showError(errorMessage);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(12),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFFFA500),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
      ),
    );
  }

  void _openChatDialog() {
    _nameController.clear();
    _emailController.clear();
    _orgController.clear();
    _positionController.clear();

    _showMyDialog();
  }

  void startCalling(List<String> numbers, int index) async {
    if (index >= numbers.length) {
      _showError("All numbers failed to launch.");
      return;
    }

    final currentNumber = numbers[index];
    final Uri launchUri = Uri(scheme: 'tel', path: currentNumber);

    _showSuccess("Attempting to call: $currentNumber");

    try {
      final canCall = await canLaunchUrl(launchUri);
      if (canCall) {
        final launched = await launchUrl(launchUri);
        if (!launched) {
          startCalling(numbers, index + 1);
        }
      } else {
        startCalling(numbers, index + 1);
      }
    } catch (_) {
      startCalling(numbers, index + 1);
    }
  }

  Future<void> _showMyDialog() async {
    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.dialogBackgroundColor,
          title: Text('Fill up the information', style: theme.textTheme.titleLarge),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _buildTextField(_nameController, "Name", Icons.person),
                _buildTextField(_emailController, "Email", Icons.email),
                _buildTextField(_orgController, "Organization", Icons.business),
                _buildTextField(_positionController, "Position", Icons.work),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(), // ✅ fixed line
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () async {
                if (_nameController.text.trim().isEmpty || _emailController.text.trim().isEmpty) {
                  _showError("Name and Email are required.");
                  return;
                }

                Navigator.of(context).pop();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(child: CircularProgressIndicator()),
                );

                await _onCallLiveChat(
                  userName: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  org: _orgController.text.trim(),
                  position: _positionController.text.trim(),
                );

                Navigator.of(context).pop(); // remove loader
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          labelStyle: theme.textTheme.bodySmall,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
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
      customParams: {'org': org, 'position': position},
    );
  }
}
