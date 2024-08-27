import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/modules/orders/models/models_card.dart';
import 'package:zalada_flutter/modules/orders/presenter/edit_address_page.dart';
import 'package:zalada_flutter/modules/orders/widgets/item_address.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/filled_button_custom.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  static const routePath = '/address';

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Address'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
        ),
        child: LazyListView(
          children: [
            ...List.generate(
              listAddress.length,
              (index) => ItemAddress(
                title: listAddress[index].title,
                address: listAddress[index].address,
                phone: listAddress[index].phone,
                isDefault: listAddress[index].isDefault,
                isSelected: listAddress[index].isSelected,
                onPressed: () {
                  setState(() {
                    for (var element in listAddress) {
                      element.isSelected = false;
                    }
                    listAddress[index].isSelected = true;
                  });
                },
                onEdit: () {
                  context.push(EditAddressPage.routePath);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.xlg,
          right: AppSpacing.xlg,
          bottom: AppSpacing.xxlg,
        ),
        child: FilledButtonCustom(
          onPressed: () {},
          text: 'Add New Address',
        ),
      ),
    );
  }
}
