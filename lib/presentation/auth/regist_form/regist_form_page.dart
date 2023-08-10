import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:elearning/presentation/auth/regist_form/regist_form_controller.dart';

import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../widgets/form_text_field_widget.dart';

class RegistFormPage extends StatefulWidget {
  const RegistFormPage({Key? key}) : super(key: key);

  @override
  State<RegistFormPage> createState() => _RegistFormPageState();
}

class _RegistFormPageState extends State<RegistFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController =
      TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistFormController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 110,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: const Text(
              "Yuk isi data diri",
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 12,
                    // spreadRadius: 1,
                    // offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 20),
              const Text('Email'),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.emailTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                enabled: false,
              ),
              SizedBox(height: 16),
              const Text('Nama Lengkap'),
              SizedBox(height: 10),
              TextFormField(
                controller: _fullNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'contoh: Ihsan Adireja',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              SizedBox(height: 16),
              const Text('Nama Sekolah'),
              SizedBox(height: 10),
              TextFormField(
                controller: _schoolNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nama Sekolah',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: DropdownButton<String?>(
                    hint: Text("Pilih Kelas"),
                    dropdownColor: Colors.grey.shade200,
                    elevation: 5,
                    icon: Icon(Icons.arrow_drop_down),
                    value: selectedKelas,
                    items: ['10', '11', '12']
                        .map((element) => DropdownMenuItem<String?>(
                              child: Text('Kelas $element'),
                              value: element,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          selectedKelas = value;
                        }
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Laki-Laki';
                        });
                      },
                      child: Container(
                        color: jenisKelamin == 'Laki-Laki'
                            ? Colors.blue
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          'Laki-Laki',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: jenisKelamin == 'Laki-Laki'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Perempuan';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: jenisKelamin == 'Perempuan'
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFD6D6D6),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Perempuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: jenisKelamin == 'Perempuan'
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(0, 60),
                  shape: StadiumBorder(),
                  shadowColor: Colors.black,
                ),

                // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(100),
                //     ),
                //   ),

                onPressed: () {
                  if (_formKey.currentState!.validate() == true) {
                    if (selectedKelas != null) {
                      if (jenisKelamin != '') {
                        // TODO: call RegistFormController.registerUser()
                        // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                        Get.snackbar('Valid!!!', '.......',
                            snackPosition: SnackPosition.BOTTOM);
                        Get.offAllNamed(Routes.dashboard);
                      } else {
                        Get.snackbar(
                          'Invalid!!!',
                          'Jenis Kelamin Harus Diisi!',
                          backgroundColor: Colors.red,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Invalid!!!',
                        'Kelas Harus Diisi!',
                        backgroundColor: Colors.red,
                      );
                    }
                  } else {
                    Get.snackbar(
                      'Invalid!!',
                      'Harap isi data dengan benar!',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.blue,
                    );
                  }
                },
                child: const Text(
                  'DAFTAR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
