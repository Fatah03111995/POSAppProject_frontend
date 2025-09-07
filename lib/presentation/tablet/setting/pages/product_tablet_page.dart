import 'package:flutter/material.dart';
import 'package:flutter_pos_app/data/data_dummy.dart';
import 'package:flutter_pos_app/presentation/setting/widgets/menu_product_item.dart';
import 'package:flutter_pos_app/presentation/tablet/setting/dialogs/form_product_dialog.dart';
import 'package:flutter_pos_app/presentation/tablet/setting/widgets/add_data.dart';
import 'package:flutter_pos_app/presentation/tablet/setting/widgets/setting_title.dart';

class ProductTabletPage extends StatefulWidget {
  const ProductTabletPage({super.key});

  @override
  State<ProductTabletPage> createState() => _ProductTabletPageState();
}

class _ProductTabletPageState extends State<ProductTabletPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SettingsTitle('Manage Products'),
          const SizedBox(height: 24),
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: dummyProducts.length + 1,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return AddData(
                  title: 'Add New Product',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const FormProductDialog(),
                    );
                  },
                );
              }
              final item = dummyProducts[index - 1];
              return MenuProductItem(
                  isTablet: true,
                  data: item,
                  onTapEdit: () async {
                    showDialog(
                      context: context,
                      builder: (context) => FormProductDialog(
                        product: item,
                      ),
                    );
                  });
            },
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {

      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
