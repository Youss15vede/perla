import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:perla/core/utils/constants.dart';
import 'package:perla/features/home/persentation/home_page.dart';
import 'package:perla/features/login/presentation/page/login_page.dart';
import 'package:perla/features/register/presentation/bloc/register_bloc.dart';
import 'package:perla/features/register/presentation/bloc/register_state.dart';
import 'package:perla/injection.dart';

class RegisterPage extends StatefulWidget {
  static const kRegisterPath = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = sl<RegisterBloc>();

  bool passwordIsSecure = true;
  bool confirmPasswordIsSecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Text(
                        'Create Account!',
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
                        'Register to get started.',
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
                          'User name',
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
                          textInputAction: TextInputAction.next,
                          controller: userNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter your name',
                            prefixIcon: Icon(Icons.person_2_rounded),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }

                            // Add regex validation
                            final regex = RegExp(r'^[a-zA-Z0-9]+$');
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid username';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
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
                          textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.next,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordIsSecure == true
                                        ? passwordIsSecure = false
                                        : passwordIsSecure = true;
                                  });
                                },
                                icon: Icon(
                                  passwordIsSecure == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordIsSecure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
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
                          'Confirm password',
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
                          textInputAction: TextInputAction.done,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Repaet your password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    confirmPasswordIsSecure == true
                                        ? confirmPasswordIsSecure = false
                                        : confirmPasswordIsSecure = true;
                                  });
                                },
                                icon: Icon(
                                  confirmPasswordIsSecure == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please re-enter password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: confirmPasswordIsSecure,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
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
                                  if (formKey.currentState!.validate()) {
                                    bloc.register(
                                        fullName: userNameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text);
                                    // context.pushReplacement(HomePage.kHomePath);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff6C63FF),
                                ),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ))
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ?",
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
                              context.push(LoginPage.kLoginPath);
                            },
                            child: Text(
                              'Login',
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
