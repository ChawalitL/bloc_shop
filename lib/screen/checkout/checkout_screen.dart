import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CheckoutPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('ORDER NOW',
                    style: Theme.of(context).textTheme.headline3),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.headline3),
              _buildTextFormField(emailController, context, 'Email'),
              _buildTextFormField(nameController, context, 'Name'),
              Text('DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.headline3),
              _buildTextFormField(addressController, context, 'Address'),
              Text('ORDER INFORMATION',
                  style: Theme.of(context).textTheme.headline3),
              const OrderSummary()
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText + "*",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          )),
        ],
      ),
    );
  }
}
