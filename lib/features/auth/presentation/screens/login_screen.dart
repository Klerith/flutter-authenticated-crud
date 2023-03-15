import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GeometricalBackground( 
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox( height: 50 ),
              // Icon Banner
              const Icon( 
                Icons.production_quantity_limits_rounded, 
                color: Colors.white,
                size: 100,
              ),
              const SizedBox( height: 50 ),

              Container(
                height: size.height - 200, // 80 los dos sizebox y 100 el ícono
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const _LoginForm(),
              )
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox( height: 50 ),
        Text('Login', style: textStyles.titleLarge )
      ],
    );
  }
}