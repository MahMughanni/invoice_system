import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/domain/entities/address_entities.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/presentation/controller/create_invoice_bloc/create_invoice_bloc.dart';
import 'package:invoice_system/presentation/screens/widget/custom_button.dart';
import 'package:invoice_system/presentation/screens/widget/custom_dropdown.dart';
import 'package:invoice_system/presentation/screens/widget/shared_appbar.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/extentions/string_validate_extention.dart';

import '../../controller/localData/shared_perf.dart';
import '../widget/custom_Text_field.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => getIt<CreateInvoiceBloc>(),
      child: const CreateInvoiceBody(),
    );
  }
}

class CreateInvoiceBody extends StatefulWidget {
  const CreateInvoiceBody({Key? key}) : super(key: key);

  @override
  State<CreateInvoiceBody> createState() => _CreateInvoiceBodyState();
}

class _CreateInvoiceBodyState extends State<CreateInvoiceBody> {
  List<Widget> itemsList = [];

  var countryList = [
    'Palestine',
  ];
  var currencyList = [
    'USD',
  ];

  final _formKey = GlobalKey<FormState>();
  final contentKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  final jobTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  final jobTitleController1 = TextEditingController();
  final descriptionController1 = TextEditingController();
  final priceController1 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    jobTitleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    jobTitleController1.dispose();
    descriptionController1.dispose();
    priceController1.dispose();
  }

  late CreateInvoiceEntities createInvoiceEntities;

  @override
  Widget build(BuildContext context) {
    itemsList = [
      ContentToAddService(
          jobTitleController: jobTitleController,
          descriptionController: descriptionController,
          priceController: priceController),
    ];
    return BlocBuilder<CreateInvoiceBloc, CreateInvoiceSuccess>(
      builder: (context, state) {
        var id = state.id;

        state.servesList = [
          ContentToAddService(
            jobTitleController: jobTitleController1,
            descriptionController: descriptionController1,
            priceController: priceController1,
          ),
        ];
        // print(state.id);
        return Form(
          key: _formKey,
          child: Scaffold(
            appBar: SharedAppBar(isBack: true, title: 'Create Invoice'),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingHorizontal,
                    vertical: AppSizes.paddingVertival),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Client Information',
                          style: TextStyle(
                            color: Color(AppColor.gray),
                            fontSize: AppSizes.textDefaultSize,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: CustomTextFormField(
                              validator: (value) {
                                if (!value!.isValidName) {
                                  return 'enter valid name';
                                }
                              },
                              controller: firstNameController,
                              hintText: 'First name',
                              keyboardType: TextInputType.text,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: CustomTextFormField(
                              validator: (value) {
                                if (!value!.isValidName) {
                                  return 'enter valid name';
                                }
                              },
                              controller: lastNameController,
                              hintText: 'Last name',
                              keyboardType: TextInputType.text,
                            ))
                          ],
                        ),
                        const SizedBox(height: 8),
                        CustomTextFormField(
                            validator: (value) {
                              if (!value!.isValidEmail) {
                                return 'enter valid email';
                              }
                            },
                            controller: emailController,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomDropDown(
                                  dropDownValue: countryList.first,
                                  items: countryList),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomDropDown(
                                  dropDownValue: currencyList.first,
                                  items: currencyList),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itemsList.length,
                          itemBuilder: (context, index) => itemsList[index],
                        ),
                        TextButton(
                          onPressed: () {
                            state.servesList.add(
                              ContentToAddService(
                                key: contentKey,
                                jobTitleController: jobTitleController1,
                                descriptionController: descriptionController1,
                                priceController: priceController1,
                              ),
                            );
                            if (itemsList.length != 2) {
                              itemsList.add(
                                ContentToAddService(
                                  key: contentKey,
                                  jobTitleController: jobTitleController1,
                                  descriptionController: descriptionController1,
                                  priceController: priceController1,
                                ),
                              );
                            }
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('max 2 job\'s ')));
                            }

                            BlocProvider.of<CreateInvoiceBloc>(context).add(
                              AddFixedEvent(
                                fixedEntities: itemsList,
                              ),
                            );
                            // print(counter);
                            // setState(() {});
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('+ Add item or service'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomMainButton(
                          title: 'Preview Invoice',
                          isBorder: false,
                          textColorIsWhite: true,
                          onPressed: () async {
                            // if (contentKey.currentState!.validate()) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text('Valid')));
                            // }
                            if (_formKey.currentState!.validate()) {
                              createInvoiceEntities = CreateInvoiceEntities(
                                  client: CreateClientEntities(
                                      firstName: firstNameController.text
                                          .toString()
                                          .trim(),
                                      lastName: lastNameController.text
                                          .toString()
                                          .trim(),
                                      email: emailController.text
                                          .toString()
                                          .trim(),
                                      address: AddressEntities(
                                          country: countryList.first)),
                                  fixed: [
                                    FixedEntities(
                                        itemName: jobTitleController.text
                                            .toString()
                                            .trim(),
                                        description: descriptionController.text
                                            .toString()
                                            .trim(),
                                        price: int.tryParse(
                                                priceController.text) ??
                                            0),
                                    FixedEntities(
                                        itemName: jobTitleController1.text
                                            .toString()
                                            .trim(),
                                        description: descriptionController1.text
                                            .toString()
                                            .trim(),
                                        price: int.tryParse(
                                                priceController1.text) ??
                                            0),
                                  ]);
                              BlocProvider.of<CreateInvoiceBloc>(context).add(
                                CreateInvoiceEvent(
                                    createInvoiceEntities:
                                        createInvoiceEntities,
                                    currency: 'USD',
                                    token: SharedPrefController()
                                        .getUser()
                                        .accessToken),
                              );
                              print("Invoice ID : $id");

                              Future.delayed(const Duration(seconds: 1), () {
                                print("Invoice ID : $id");

                                AppRouter.navigatorKey.currentState!.pushNamed(
                                    ScreenName.previewScreen,
                                    arguments: id.toString());
                              });
                            }
                          },
                        )
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}

class ContentToAddService extends StatelessWidget {
  const ContentToAddService({
    super.key,
    this.jobTitleController,
    this.descriptionController,
    this.priceController,
  });

  final TextEditingController? jobTitleController;

  final TextEditingController? descriptionController;

  final TextEditingController? priceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: [
            const Expanded(
                flex: 5,
                child: Text(
                  'Job Details',
                  style: TextStyle(
                      color: Color(AppColor.gray),
                      fontSize: AppSizes.textDefaultSize),
                )),
            const Expanded(
              flex: 2,
              child: Text(
                'Amount',
                style: TextStyle(
                    color: Color(AppColor.gray),
                    fontSize: AppSizes.textDefaultSize),
              ),
            ),
            Visibility(
              child: InkWell(
                onTap: () {
                  // value.decrement(index);
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: CustomTextFormField(
                  validator: (value) {
                    if (!value!.isValidName) {
                      return 'enter valid title';
                    }
                  },
                  controller: jobTitleController,
                  hintText: 'Job Title',
                  keyboardType: TextInputType.text,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: CustomTextFormField(
              validator: (value) {
                if (!value!.isValidNumber) {
                  return 'valid amount !';
                }
              },
              controller: priceController,
              isSuffix: true,
              testSuffix: 'USD',
              hintText: '0.00',
              keyboardType: TextInputType.number,
            ))
          ],
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: descriptionController,
          hintText: 'Description',
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          minLines: 3,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
