import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/text_highlited.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late String _email;
  bool _isLoading = false;

  Future<void> _getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _email = sp.getString('userEmail')!;
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState;
    _getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            CreateAccountScreenText.verifyCodeTitle,
            style: TextStyle(
              color: AppColors.tertiary,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          _isLoading
              ? TextHighted(
                  text:
                      '${CreateAccountScreenText.verifyCodeWelcomeText} \n $_email',
                  fontSize: 17,
                  highlightColor: AppColors.secondary,
                  normalTextColor: AppColors.textColorSubtitles,
                  textToHighlight: [_email],
                  textAlign: TextAlign.center,
                )
              : const Text(''),
          const SizedBox(height: 100),
          Row(
            children: List<Widget>.generate(
                4, (index) => const Expanded(child: TextField())),
          ),
        ]),
      ),
    );
  }
}
