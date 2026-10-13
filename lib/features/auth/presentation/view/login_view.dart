import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/config/firebase/auth_module.dart';
import 'package:elevate_cycle6/core/constants/ui_strings.dart';
import 'package:elevate_cycle6/features/home/presentation/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _auth = getIt.get<AuthService>();

  bool _isLoading = false;

  Future<void> _run(Future<UserCredential> Function() action) async {
    setState(() => _isLoading = true);
    try {
      await action();
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? e.code);
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _loginWithEmail() {
    if (!_formKey.currentState!.validate()) return;
    _run(
      () => _auth.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ),
    );
  }

  void _registerWithEmail() {
    if (!_formKey.currentState!.validate()) return;
    _run(
      () => _auth.registerWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email address';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(UiStrings.appName), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 24),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _loginWithEmail,
                        child: const Text('Login with email'),
                      ),
                    ),
                    TextButton(
                      onPressed: _registerWithEmail,
                      child: const Text('Create account'),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _run(_auth.signInWithGoogle),
                        icon: const Icon(Icons.g_mobiledata, size: 32),
                        label: const Text('Login with Google'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
