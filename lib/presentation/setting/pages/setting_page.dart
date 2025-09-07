import 'package:flutter/material.dart';
import 'package:flutter_pos_app/core/constants/colors.dart';
import 'package:flutter_pos_app/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_pos_app/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_pos_app/presentation/setting/pages/manage_printer_page.dart';
import 'package:flutter_pos_app/presentation/setting/pages/report/report_page.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              context.push(const DashboardPage());
            },
          ),
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceHeight(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: MenuButton(
                        iconPath: Assets.images.report.path,
                        label: 'Report',
                        onPressed: () => context.push(const ReportPage()),
                        isImage: true,
                      ),
                    ),
                    const SpaceWidth(15.0),
                    Flexible(
                      child: MenuButton(
                        iconPath: Assets.images.managePrinter.path,
                        label: 'Setting Printer',
                        onPressed: () {
                          context.push(const ManagePrinterPage());
                        },
                        isImage: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(60),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const Divider(),
            ],
          ),
        ));
  }
}
