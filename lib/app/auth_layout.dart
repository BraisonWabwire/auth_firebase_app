import 'package:auth_firebase_app/app/appNavigationLayout.dart';
import 'package:auth_firebase_app/app/app_loading_page.dart';
import 'package:auth_firebase_app/app/auth_service.dart';
import 'package:auth_firebase_app/app/welcomePage.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key,
  this.pageIfNotConnected,
  });

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
    valueListenable: authService,
    builder: (context, authService, child){
      return StreamBuilder(stream: authService.authStateChanges, builder:(context, snapshot) {
      Widget widget;
      if(snapshot.connectionState==ConnectionState.waiting){
        widget=AppLoadingPage();
      
      }else if(snapshot.hasData){
        widget=const AppNavigationLayout();
      }
      
      else{
        widget=pageIfNotConnected ?? const WelcomePage(); 
      }
      return widget;
      }
      
      );
    });
  }
}