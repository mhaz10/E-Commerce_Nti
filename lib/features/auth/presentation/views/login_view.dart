import 'package:ecommerce_nti/features/auth/data/repo/auth_repo_implemation.dart';
import 'package:ecommerce_nti/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:ecommerce_nti/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImplementation()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const LoginViewBody(),
      ),
    );
  }
}
