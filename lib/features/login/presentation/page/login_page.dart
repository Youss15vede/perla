import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:perla/core/utils/constants.dart';
import 'package:perla/features/home/persentation/home_page.dart';
import 'package:perla/features/login/presentation/bloc/login_bloc.dart';
import 'package:perla/features/login/presentation/bloc/login_state.dart';
import 'package:perla/features/register/presentation/page/register_page.dart';
import 'package:perla/injection.dart';

class LoginPage extends StatefulWidget {
  static const kLoginPath = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSecure = true;
  final bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: bloc,
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => error(errorMsg: state.error, bloc: bloc, context: context),
        );
        if (state.success) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.pushReplacement(HomePage.kHomePath),
          );
        }
        return Form(
          key: formKey,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 96.h,
                      ),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff6C63FF),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Enter Your data to continue',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xffB1B1B1),
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                              color: const Color(0xff333333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter your phone number',
                            prefixIcon: Icon(Icons.call),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: const Color(0xff333333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecure == true
                                        ? isSecure = false
                                        : isSecure = true;
                                  });
                                },
                                icon: Icon(
                                  isSecure == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isSecure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 225.h,
                      ),
                      state.isLoading == false
                          ? Center(
                              child: Container(
                              width: 300.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // context.pushReplacement(HomePage.kHomePath);
                                  if (formKey.currentState!.validate()) {
                                    bloc.login(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff6C63FF),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ))
                          : const Center(child: CircularProgressIndicator()),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ? ",
                            style: TextStyle(
                              color: const Color(
                                0xffB1B1B1,
                              ),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.push(RegisterPage.kRegisterPath);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: const Color(0xff6C63FF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
