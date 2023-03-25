import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/domain/entities/service_entities/service_entities.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/presentation/screens/widget/custom_button.dart';
import 'package:invoice_system/presentation/screens/widget/custom_dropdown.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/extentions/string_validate_extention.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/routes/named_router.dart';
import '../../../domain/usecase/create_Service_usecase.dart';
import '../../controller/cubit/add_fixed_item_cubit.dart';
import '../widget/custom_Text_field.dart';
import '../widget/shared_appbar.dart';

class CreateLinkScreen extends StatelessWidget {
  const CreateLinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddFixedItemCubit>(),
      child: const CreateLinkBodyScreen(),
    );
  }
}

class CreateLinkBodyScreen extends StatefulWidget {
  const CreateLinkBodyScreen({Key? key}) : super(key: key);

  @override
  State<CreateLinkBodyScreen> createState() => _CreateLinkBodyScreenState();
}

class _CreateLinkBodyScreenState extends State<CreateLinkBodyScreen> {
  String dropdownvalue = 'USD';

  var country = [
    'USD',
  ];
  final _formKey = GlobalKey<FormState>();
  final contentKey = GlobalKey<FormState>();
  late NewServiceEntities newServiceEntities;

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

  List<FixedItem> itemsList = [];
  List<FixedItem> items = [FixedItem()]; // initial empty item

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFixedItemCubit, AddFixedItemState>(
      builder: (context, state) {
        var items = state.items;
        return Form(
          key: _formKey,
          child: Scaffold(
            appBar: SharedAppBar(isBack: true, title: 'Create Link'),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal,
                  vertical: AppSizes.paddingVertival),
              child: ListView(
                children: [
                  const Text(
                    'Currency',
                    style: TextStyle(
                        fontSize: AppSizes.textDefaultSize,
                        color: Color(AppColor.gray)),
                  ),
                  const SizedBox(height: 8),
                  CustomDropDown(dropDownValue: dropdownvalue, items: country),
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
                              context.read<AddFixedItemCubit>().delete(index);
                            },
                          )
                        : index == 1
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
                    title: 'Preview Link',
                    isBorder: false,
                    textColorIsWhite: true,
                    onPressed: () async {
                      List<FixedItem> fixedItems = [
                        FixedItem(
                          price: int.tryParse(priceController1.text) ?? 0,
                          description: descriptionController.text ?? '',
                          itemName: jobTitleController.text ?? '',
                        ),
                      ];
                      NewServiceEntities newServiceEntities =
                          NewServiceEntities(
                              fixed: fixedItems, currency: dropdownvalue);
                      CreateServiceParameter parameter = CreateServiceParameter(
                          newServiceEntities: newServiceEntities,
                          token: SharedPrefController().getUser().accessToken);

                      if (_formKey.currentState!.validate() ||
                          _formKey.currentState != null) {
                        AppRouter.navigatorKey.currentState!.pushNamed(
                            ScreenName.previewServiceScreen,
                            arguments: parameter);
                      }
                    },
                  )
                ],
              ),
            ),
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
                        size: 14,
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
