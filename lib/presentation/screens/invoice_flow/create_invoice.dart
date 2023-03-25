import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../../../core/routes/app_router.dart';
import '../../../core/routes/named_router.dart';
import '../../../utils/helper.dart';
import '../../controller/cubit/add_fixed_item_cubit.dart';
import '../widget/custom_Text_field.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddFixedItemCubit>(),
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
  List<FixedEntities> itemsList = [];

  var countryList = [
    'Palestine',
  ];
  var currencyList = [
    'USD',
  ];

  final _formKey = GlobalKey<FormState>();

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

  final jobTitleController2 = TextEditingController();
  final descriptionController2 = TextEditingController();
  final priceController2 = TextEditingController();

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
    jobTitleController2.dispose();
    descriptionController2.dispose();
    priceController2.dispose();
  }

  late CreateInvoiceEntities createInvoiceEntities;
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFixedItemCubit, AddFixedItemState>(
      builder: (context, state) {
        List items = state.items;
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
                                  onChanged: (String? v) {},
                                  dropDownValue: countryList.first,
                                  items: countryList),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomDropDown(
                                onChanged: (String? v) {},
                                dropDownValue: currencyList.first,
                                items: currencyList,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) => index == 0
                              ? ContentToAddService(
                                  jobTitleController: jobTitleController,
                                  priceController: priceController,
                                  descriptionController: descriptionController,
                                  onPressed: () {
                                    context
                                        .read<AddFixedItemCubit>()
                                        .delete(index);
                                  },
                                )
                              : index == 1
                                  ? ContentToAddService(
                                      jobTitleController: jobTitleController1,
                                      descriptionController:
                                          descriptionController1,
                                      priceController: priceController1,
                                      onPressed: () {
                                        context
                                            .read<AddFixedItemCubit>()
                                            .delete(index);
                                      },
                                    )
                                  : index == 2
                                      ? ContentToAddService(
                                          jobTitleController:
                                              jobTitleController2,
                                          descriptionController:
                                              descriptionController2,
                                          priceController: priceController2,
                                          onPressed: () {
                                            context
                                                .read<AddFixedItemCubit>()
                                                .delete(index);
                                          },
                                        )
                                      : index == 3
                                          ? const Center(
                                              child: Text(
                                              'This is limited to add Service',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppSizes.textDefaultSize,
                                                  color: Color(
                                                      AppColor.redWarning)),
                                            ))
                                          : Container(),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AddFixedItemCubit>().increment();
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
                          onPressed: () {
                            createInvoiceEntities = CreateInvoiceEntities(
                                client: CreateClientEntities(
                                    fullName:
                                        '${firstNameController.text.toString().trim()}  ${lastNameController.text.toString().trim()}',
                                    email:
                                        emailController.text.toString().trim(),
                                    address: AddressEntities(
                                        country: countryList.first)),
                                fixed: itemsList);

                            if (_formKey.currentState!.validate()) {
                              final fixedItem = FixedEntities(
                                itemName: jobTitleController.text.toString(),
                                description:
                                    descriptionController.text.toString(),
                                price: int.tryParse(priceController.text) ?? 0,
                              );

                              createInvoiceEntities.fixed!.add(fixedItem);
                            }
                            if (_formKey.currentState!.validate()) {
                              createInvoiceEntities = CreateInvoiceEntities(
                                client: CreateClientEntities(
                                  fullName:
                                      '${firstNameController.text.toString().trim()}  ${lastNameController.text.toString().trim()}',
                                  email: emailController.text.toString().trim(),
                                  address: AddressEntities(
                                      country: countryList.first),
                                ),
                                fixed: [
                                  FixedEntities(
                                      itemName:
                                          jobTitleController.text.toString() ??
                                              '',
                                      description: descriptionController.text
                                              .toString() ??
                                          '',
                                      price:
                                          int.tryParse(priceController.text) ??
                                              0),
                                  FixedEntities(
                                      itemName:
                                          jobTitleController1.text.toString() ??
                                              '',
                                      description: descriptionController1.text
                                              .toString() ??
                                          '',
                                      price:
                                          int.tryParse(priceController1.text) ??
                                              0),
                                  FixedEntities(
                                    itemName:
                                        jobTitleController2.text.toString() ??
                                            '',
                                    description: descriptionController2.text
                                            .toString() ??
                                        '',
                                    price:
                                        int.tryParse(priceController2.text) ??
                                            0,
                                  ),
                                ],
                              );

                              // print (state)
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                AppRouter.navigatorKey.currentState!.pushNamed(
                                    ScreenName.previewScreen,
                                    arguments: createInvoiceEntities);
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
  ContentToAddService({
    super.key,
    this.jobTitleController,
    this.descriptionController,
    this.priceController,
    this.onPressed,
  });

  Function()? onPressed;

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
                onTap: onPressed,
                child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.white,
                    )),
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
