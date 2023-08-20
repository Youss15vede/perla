import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:perla/features/home/persentation/home_page.dart';
import 'package:perla/features/login/presentation/page/login_page.dart';
import 'package:perla/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:perla/features/splash/presentation/bloc/splash_state.dart';
import 'package:perla/injection.dart';

class SplashPage extends StatefulWidget {
  static const kSplashPath = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final bloc = sl<SplashBloc>();

  @override
  void initState() {
    // TODO: implement initState
    bloc.checkAuth();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.isAuth!) {
              context.pushReplacement(HomePage.kHomePath);

        } else {
              context.pushReplacement(LoginPage.kLoginPath);


        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Center(
                child: Text(
              'LOGO',
              style: TextStyle(
                color: const Color(0xff6C63FF),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
