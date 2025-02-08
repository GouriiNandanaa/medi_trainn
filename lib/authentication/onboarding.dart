import 'package:flutter/material.dart';
import 'package:medii/homeScreen/homescreen.dart';
import 'auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSignUp = true;
  bool _obscurePassword = true;

  void _submitForm() async {
    print("Inside _submitForm()");

    if (!_formKey.currentState!.validate()) {
      print("Form validation failed");
      return;
    }

    print("Form is valid, proceeding with authentication...");

    if (isSignUp) {
      await _authService.signUp(
        context, // Pass context for navigation
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } else {
      await _authService.signIn(
        context, // Pass context for navigation
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/images/front2.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSignUp)
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Name cannot be empty'
                                  : null,
                            ),
                          if (isSignUp) const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Email cannot be empty' : null,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Password cannot be empty';
                              if (value.length < 8)
                                return 'Password must be at least 8 characters';
                              if (RegExp(r'(.)\1{2,}').hasMatch(value))
                                return 'No consecutive repeating digits';
                              return null;
                            },
                          ),
                          if (isSignUp) const SizedBox(height: 10),
                          if (isSignUp)
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) =>
                                  value != _passwordController.text
                                      ? 'Passwords do not match'
                                      : null,
                            ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _submitForm,
                            child: Text(isSignUp ? 'SIGN UP' : 'SIGN IN'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 24),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isSignUp = !isSignUp;
                              });
                            },
                            child: RichText(
                              text: TextSpan(
                                text: isSignUp
                                    ? 'Already a user? '
                                    : 'Not a user? ',
                                style: const TextStyle(
                                  inherit:
                                      true, // Ensure the same inherit value
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: isSignUp ? 'Login' : 'Register',
                                    style: const TextStyle(
                                      inherit:
                                          true, // Ensure the same inherit value
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
