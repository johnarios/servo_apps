import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livechatt/livechatt.dart';
import 'package:provider/provider.dart';
import 'package:servo_applications/screens/page/theme_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/constants.dart';

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
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
      ),
    );
  }

  Widget _buildHeaderImage() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            image: DecorationImage(
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
                  Text(widget.title.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text("24/7 Support Available", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, _) => Tooltip(
              message: isDark ? "Switch to Light Mode" : "Switch to Dark Mode",
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: IconButton(
                  key: ValueKey<bool>(isDark),
                  icon: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    themeNotifier.toggleTheme();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(isDark ? "Light mode enabled" : "Dark mode enabled"),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildContactOptions() {
    return Column(
      children: [
        _buildOptionRow(icon: Icons.phone, label: "Call Us", buttonIcon: Icons.phone, onTap: () => _startCalling(phoneNumbers, 0)),
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

  Widget _buildOptionRow({required IconData icon, required String label, required IconData buttonIcon, required VoidCallback onTap}) {
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
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: const Offset(2, 2))],
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600))),
            Material(
              color: const Color(0xFF2A2F92),
              borderRadius: BorderRadius.circular(12),
              elevation: 4,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(height: 48, width: 48, child: Icon(buttonIcon, color: Colors.white, size: 26)),
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
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ariosjohnvincent@gmail.com',
      queryParameters: {
        'subject': widget.title,
        'body': 'Hello, Customer Support Team,',
      },
    );

    if (!await launchUrl(emailUri)) {
      _showError('Email app is not available.');
    } else {
      _showSuccess('Email app opened.');
    }
  }

  void _launchMap() => _launchUri(
      Uri.parse('https://www.google.com/maps/place/Servo+IT+Solutions'), 'Could not open map.');

  void _launchFAQ() => _launchUri(
      Uri.parse('https://servoitsolutions.ph/support/kb/index.php'), 'Could not open FAQ.');

  Future<void> _launchUri(Uri uri, String errorMsg) async {
    try {
      if (!await launchUrl(uri)) _showError(errorMsg);
    } catch (_) {
      _showError(errorMsg);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ));
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    ));
  }

  void _openChatDialog() {
    _nameController.clear();
    _emailController.clear();
    _orgController.clear();
    _positionController.clear();

    _showChatDialog();
  }

  void _startCalling(List<String> numbers, int index) async {
    if (index >= numbers.length) {
      _showError("Unable to place a call.");
      return;
    }

    final Uri phoneUri = Uri(scheme: 'tel', path: numbers[index]);
    _showSuccess("Dialing: ${numbers[index]}");

    if (!await canLaunchUrl(phoneUri) || !await launchUrl(phoneUri)) {
      _startCalling(numbers, index + 1);
    }
  }

  Future<void> _showChatDialog() async {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: theme.dialogBackgroundColor,
        title: Text('Enter Your Details', style: theme.textTheme.titleLarge),
        content: SingleChildScrollView(
          child: Column(
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
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
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

              await _startLiveChat(
                name: _nameController.text.trim(),
                email: _emailController.text.trim(),
                org: _orgController.text.trim(),
                position: _positionController.text.trim(),
              );

              Navigator.of(context).pop();
            },
            child: const Text('Start Chat'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade800
              : Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Future<void> _startLiveChat({required String name, required String email, required String org, required String position}) async {
    Livechat.beginChat(
      Constants.licenseNo,
      groupId: Constants.groupId,
      visitorName: name,
      visitorEmail: email,
      customParams: {'org': org, 'position': position},
    );
  }
}
