import 'package:efpl/application/auth/request_reset_form/request_reset_form_bloc.dart';
import 'package:efpl/presentation/authentication/request_reset/widgets/request_reset_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injectable.dart';

class RequestResetPage extends StatefulWidget {
  const RequestResetPage({Key? key}) : super(key: key);

  @override
  State<RequestResetPage> createState() => _RequestResetPageState();
}

class _RequestResetPageState extends State<RequestResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<RequestResetFormBloc>(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/King Of Kings 05 - 16x9.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "A new way to enjoy the EPL.",
                              style: TextStyle(
                                height: 1.15,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Text(
                              "Join our community",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(35, 30, 35, 5),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RequestResetForm()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
