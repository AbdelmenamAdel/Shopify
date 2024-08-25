import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/core/utils/admin_drawer_list.dart';
import 'package:shopify/features/admin/dashboard/presentation/views/dashboard_view.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({super.key});

  @override
  State<HomeAdminView> createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  Widget page = const DashboardView();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScren(
            onPageChanged: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminScren extends StatelessWidget {
  const MenuAdminScren({required this.onPageChanged, super.key});

  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const AdminAppBar(
        isMain: false,
        backgroundColor: ColorsDark.blueDark,
        title: 'Shopify',
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onPageChanged(e.page);
                    },
                    title: e.title,
                    leading: e.icon,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Image.asset(AppImages.drawerImage),
          ),
        ],
      ),
    );
  }
}
