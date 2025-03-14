import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vsahha/generated/l10n.dart';

import '../utils/custom_clipper_path.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final ImagePicker _picker = ImagePicker();
  final List<File> selectedFiles = [];
  final List<String> diseases = [
    'Diabetes',
    'Hypertension',
    'Cholesterol',
    'Arthritis',
    'Allergies',
    'Asthma',
    'Heart Condition',
  ];

  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime;
  List<String> selectedDiseases = [];

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

  int currentStep = 0;
  String? sexe;
  int? age;
  double? poids;
  double? taille;
  String? maladiesChroniques;
  String? symptomsText;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF44a4a4),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _DoctorDetailsStack(),
            if (currentStep == 0) _DateAndTimeSelectionStep(),
            if (currentStep == 1) _SymptomsInputStep(),
            if (currentStep == 2) _PatientInfoStep(),
            if (currentStep == 3) UploadDocumentsStep(),
          ],
        ),
      ),
    );
  }

  Widget _DoctorDetailsStack() {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomClipperPath(),
          child: Container(height: 200, color: const Color(0xFF44a4a4)),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/doctor.png'),
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Dr. Layla Ben Ahmed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Neurology Specialist",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _DateAndTimeSelectionStep() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 5),
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            activeColor: const Color(0xFF44a4a4),
            headerProps: EasyHeaderProps(),
            dayProps: EasyDayProps(),
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
                selectedTime = null;
              });
            },
          ),
          const SizedBox(height: 20),
           Text(
            S.of(context).choisir,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          if (selectedDate != null)
            LayoutBuilder(
              builder: (context, constraints) {
                final List<TimeOfDay> timeSlots = [];
                for (int hour = 8; hour <= 12; hour++) {
                  timeSlots.add(TimeOfDay(hour: hour, minute: 0));
                  if (hour != 12) {
                    timeSlots.add(TimeOfDay(hour: hour, minute: 30));
                  }
                }

                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      timeSlots.map((time) {
                        final isSelected =
                            selectedTime?.hour == time.hour &&
                            selectedTime?.minute == time.minute;

                        return SizedBox(
                          width:
                              (constraints.maxWidth - 24) /
                              4, 
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            child: Card(
                              color:
                                  isSelected
                                      ? const Color.fromARGB(255, 107, 180, 180)
                                      : const Color.fromARGB(255, 149, 203, 203).withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Center(
                                  child: Text(
                                    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 13
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed:
                  selectedTime != null
                      ? () {
                        setState(() {
                          currentStep = 1;
                        });
                      }
                      : null,
              icon: const Icon(Icons.queue_play_next, color: Colors.white),
              label: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color(0xFF44a4a4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _SymptomsInputStep() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Tell us about our Symptoms',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'What is the main problem ? How long have had these symptoms? Is it getting better or worse? This information will help your doctor ahead of your consultation',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Describe your symptoms (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 6,
              onChanged: (value) {
                symptomsText = value;
              },
              controller: TextEditingController(text: symptomsText),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      currentStep = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Previous',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xFF44a4a4),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      currentStep = 2;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xFF44a4a4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _PatientInfoStep() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Patient Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: sexe,
            hint: const Text('Select Gender'),
            decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
            items:
                <String>['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                sexe = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.cake),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              age = int.tryParse(value);
            },
            controller: TextEditingController(text: age?.toString()),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.fitness_center),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    poids = double.tryParse(value);
                  },
                  controller: TextEditingController(text: poids?.toString()),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    taille = double.tryParse(value);
                  },
                  controller: TextEditingController(text: taille?.toString()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              phone = value;
            },
            controller: TextEditingController(text: phone),
          ),
          const SizedBox(height: 20),
          const Text('Chronic Diseases:'),
          _ChronicDiseasesSelector(
            selectedDiseases: selectedDiseases,
            diseases: diseases,
            onToggleDisease: (disease) {
              setState(() {
                if (selectedDiseases.contains(disease)) {
                  selectedDiseases.remove(disease);
                } else {
                  selectedDiseases.add(disease);
                }
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    currentStep = 1;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF44a4a4),
                ),
              ),
              ElevatedButton.icon(
                onPressed:
                    (sexe != null &&
                            age != null &&
                            poids != null &&
                            taille != null &&
                            phone != null &&
                            selectedDiseases.isNotEmpty)
                        ? () {
                          setState(() {
                            currentStep = 3;
                          });
                        }
                        : null,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF44a4a4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget UploadDocumentsStep() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Upload Document or Picture',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please upload any image or document you feel would be useful for doctor in your consultation',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Files selected:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildFilesList(),
          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image, size: 50),
                    onPressed: () async {
                      final XFile? image = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          selectedFiles.add(File(image.path));
                        });
                      }
                    },
                  ),
                  const Text('Choose Picture'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.attach_file, size: 50),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      if (result != null) {
                        setState(() {
                          selectedFiles.addAll(
                            result.paths.map((path) => File(path!)).toList(),
                          );
                        });
                      }
                    },
                  ),
                  const Text('Choose Document'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    currentStep = 2;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF44a4a4),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.done_outline, color: Colors.white),
                label: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF44a4a4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedFiles.length,
      itemBuilder: (context, index) {
        final file = selectedFiles[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(file.path.split('/').last),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  selectedFiles.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _ChronicDiseasesSelector extends StatelessWidget {
  final List<String> selectedDiseases;
  final List<String> diseases;
  final Function(String) onToggleDisease;

  const _ChronicDiseasesSelector({
    required this.selectedDiseases,
    required this.diseases,
    required this.onToggleDisease,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children:
          diseases.map((disease) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: selectedDiseases.contains(disease),
                  onChanged: (bool? value) {
                    onToggleDisease(disease);
                  },
                ),
                Text(disease),
              ],
            );
          }).toList(),
    );
  }
}
