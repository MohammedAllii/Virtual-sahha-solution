import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vsahha/MyCalendar/my_calendar.dart';
import 'package:vsahha/generated/l10n.dart';
import 'package:vsahha/utils/custom_navigation_bar.dart';

class OperationsChirurgicales extends StatefulWidget {
  const OperationsChirurgicales({super.key});

  @override
  State<OperationsChirurgicales> createState() =>
      _OperationsChirurgicalesState();

  void showpostDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        print("OK");
        return OperationsChirurgicales();
      },
    );
  }
}

class _OperationsChirurgicalesState extends State<OperationsChirurgicales> {
  int selectedIndex = 14;
  final List<MedicalExam> _medicalExams = [];
  final TextEditingController _titleController = TextEditingController();
  String? _selectedFilePath;
  bool _isPDF = false;

  @override
  void initState() {
    super.initState();
    // _checkPatientExists();
  }

  /* void _checkPatientExists() async {
    final authController = Get.find<AuthController>();
    final result = await authController.checkPatientExists();
    if (result['success'] == false) {
      Get.offAllNamed('/login');
    }
  }*/

  void pdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
        _isPDF = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          S.of(context).Operationschirurgicales,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF44a4a4).withOpacity(0.5),
                        blurRadius: 60.0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset(
                    "assets/operations.png",
                    height: 90.h,
                    width: 90.w,
                    color: Colors.black,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  S.of(context).Operationschirurgicales,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.h,
            left: 10,
            right: 10,
            child: Container(
              height: 350.h,
              width: 350.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(54),
                  topRight: Radius.circular(54),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF44a4a4),
                    blurRadius: 20.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Expanded(
                      child:
                          _medicalExams.isEmpty
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).noOperationschirurgicales,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                        right: 16.w,
                                      ),
                                      child: Text(
                                        S
                                            .of(context)
                                            .descriptionOperationschirurgicales,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          color: const Color.fromARGB(
                                            255,
                                            129,
                                            129,
                                            129,
                                          ),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : ListView.builder(
                                itemCount: _medicalExams.length,
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                itemBuilder: (context, index) {
                                  final operation = _medicalExams[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 12.w,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 8.h,
                                        ),
                                        leading: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(
                                              0xFF44a4a4,
                                            ).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.local_hospital_outlined,
                                            color: Color(0xFF44a4a4),
                                            size: 28,
                                          ),
                                        ),
                                        title: Text(
                                          operation.title,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        subtitle: Text(
                                          operation.filePath.split('/').last,
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          icon: Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: Colors.red.withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.delete_outline,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _medicalExams.removeAt(index);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 150.h),
                      child: Container(
                        height: 43.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF44a4a4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder:
                                  (context) => StatefulBuilder(
                                    builder:
                                        (context, setModalState) => Container(
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.70,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 1,
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  S.of(context).addOperations,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                TextField(
                                                  controller: _titleController,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        S
                                                            .of(context)
                                                            .titleOperationschirurgicales,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10.0,
                                                          ),
                                                    ),
                                                    prefixIcon: const Icon(
                                                      Icons.text_fields,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  S.of(context).chooseFile,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton.icon(
                                                        icon: const Icon(
                                                          Icons.image,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                        label: const Text(
                                                          'Galerie',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10
                                                          ),
                                                        ),
                                                        style:
                                                            ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .blueAccent,
                                                            ),
                                                        onPressed: () async {
                                                          final XFile?
                                                          pickedFile =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                    source:
                                                                        ImageSource
                                                                            .gallery,
                                                                  );
                                                          if (pickedFile !=
                                                              null) {
                                                            setModalState(() {
                                                              _selectedFilePath =
                                                                  pickedFile
                                                                      .path;
                                                              _isPDF = false;
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: ElevatedButton.icon(
                                                        icon: const Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                        label: const Text(
                                                          'Caméra',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10
                                                          ),
                                                        ),
                                                        style:
                                                            ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Color(
                                                                    0xFF44a4a4,
                                                                  ),
                                                            ),
                                                        onPressed: () async {
                                                          final XFile?
                                                          pickedFile =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                    source:
                                                                        ImageSource
                                                                            .camera,
                                                                  );
                                                          if (pickedFile !=
                                                              null) {
                                                            setModalState(() {
                                                              _selectedFilePath =
                                                                  pickedFile
                                                                      .path;
                                                              _isPDF = false;
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: ElevatedButton.icon(
                                                        icon: const Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                        label: const Text(
                                                          'PDF',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10
                                                          ),
                                                        ),
                                                        style:
                                                            ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .redAccent,
                                                            ),
                                                        onPressed: () async {
                                                          FilePickerResult?
                                                          result =
                                                              await FilePicker
                                                                  .platform
                                                                  .pickFiles();
                                                          if (result != null) {
                                                            setModalState(() {
                                                              _selectedFilePath =
                                                                  result
                                                                      .files
                                                                      .single
                                                                      .path!;
                                                              _isPDF = true;
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                if (_selectedFilePath != null)
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 8,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          spreadRadius: 1,
                                                          blurRadius: 6,
                                                          offset: const Offset(
                                                            0,
                                                            2,
                                                          ),
                                                        ),
                                                      ],
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFF44a4a4,
                                                        ).withOpacity(0.3),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                8,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(
                                                              0xFF44a4a4,
                                                            ).withOpacity(0.1),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8,
                                                                ),
                                                          ),
                                                          child: Icon(
                                                            _isPDF
                                                                ? Icons
                                                                    .picture_as_pdf
                                                                : Icons.image,
                                                            color: const Color(
                                                              0xFF44a4a4,
                                                            ),
                                                            size: 24,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                S
                                                                    .of(context)
                                                                    .selectedFile,
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                              Text(
                                                                _selectedFilePath!
                                                                    .split('/')
                                                                    .last,
                                                                style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                    0xFF44a4a4,
                                                                  ),
                                                                ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Container(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  6,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              color: Colors.red
                                                                  .withOpacity(
                                                                    0.1,
                                                                  ),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                            ),
                                                            child: const Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: Colors.red,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            setModalState(() {
                                                              _selectedFilePath =
                                                                  null;
                                                              _isPDF = false;
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                const Spacer(),
                                                ElevatedButton(
                                                  onPressed: _addMedicalExam,
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFF44a4a4),
                                                    minimumSize: const Size(
                                                      double.infinity,
                                                      50,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10.0,
                                                          ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        S.of(context).confirmer,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF44a4a4),
                            minimumSize: const Size(300, 43),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                S.of(context).add,
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Material(
        shape: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF44a4a4),
                blurRadius: 30.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCalendar()),
              );
            },
            child: Icon(Icons.calendar_month_outlined),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex),
    );
  }

  void _addMedicalExam() {
    if (_titleController.text.isNotEmpty && _selectedFilePath != null) {
      setState(() {
        _medicalExams.add(
          MedicalExam(
            title: _titleController.text,
            filePath: _selectedFilePath!,
            isPDF: _isPDF,
          ),
        );
      });
      _titleController.clear();
      _selectedFilePath = null;
      Navigator.pop(context);
    }
  }
}

class MedicalExam {
  final String title;
  final String filePath;
  final bool isPDF;

  MedicalExam({
    required this.title,
    required this.filePath,
    required this.isPDF,
  });
}
