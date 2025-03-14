// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Appointments`
  String get myAppointments {
    return Intl.message(
      'My Appointments',
      name: 'myAppointments',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get voirTous {
    return Intl.message(
      'See All',
      name: 'voirTous',
      desc: '',
      args: [],
    );
  }

  /// `Search a doctor or specialists`
  String get search {
    return Intl.message(
      'Search a doctor or specialists',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Let's find your doctor`
  String get findDoctor {
    return Intl.message(
      'Let\'s find your doctor',
      name: 'findDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Information`
  String get editInfo {
    return Intl.message(
      'Edit Personal Information',
      name: 'editInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changeLanguage {
    return Intl.message(
      'Change language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Ratings`
  String get ratings {
    return Intl.message(
      'Ratings',
      name: 'ratings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Go`
  String get go {
    return Intl.message(
      'Go',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to VSS`
  String get welcome {
    return Intl.message(
      'Welcome to VSS',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Book doctor appointments with ease, anytime, anywhere`
  String get onboarding {
    return Intl.message(
      'Book doctor appointments with ease, anytime, anywhere',
      name: 'onboarding',
      desc: '',
      args: [],
    );
  }

  /// `Find the Right Doctor`
  String get onboardingg {
    return Intl.message(
      'Find the Right Doctor',
      name: 'onboardingg',
      desc: '',
      args: [],
    );
  }

  /// `Explore trusted doctors and specialists for your care`
  String get onboard {
    return Intl.message(
      'Explore trusted doctors and specialists for your care',
      name: 'onboard',
      desc: '',
      args: [],
    );
  }

  /// `Get started today and take control of your health`
  String get started {
    return Intl.message(
      'Get started today and take control of your health',
      name: 'started',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get patients {
    return Intl.message(
      'Patients',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `Experiences`
  String get experiences {
    return Intl.message(
      'Experiences',
      name: 'experiences',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Email copied to clipboard!`
  String get emailCoppied {
    return Intl.message(
      'Email copied to clipboard!',
      name: 'emailCoppied',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Doctors`
  String get favDoctors {
    return Intl.message(
      'My Favorite Doctors',
      name: 'favDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this favorites?`
  String get deleteSure {
    return Intl.message(
      'Are you sure you want to delete this favorites?',
      name: 'deleteSure',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `No appointments scheduled`
  String get noappointments {
    return Intl.message(
      'No appointments scheduled',
      name: 'noappointments',
      desc: '',
      args: [],
    );
  }

  /// `You have no scheduled consultations`
  String get noscheduled {
    return Intl.message(
      'You have no scheduled consultations',
      name: 'noscheduled',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get editPassword {
    return Intl.message(
      'Change Password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Update profile`
  String get updateProfile {
    return Intl.message(
      'Update profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtp {
    return Intl.message(
      'Send OTP',
      name: 'sendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtp {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOtp',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get setNewPassword {
    return Intl.message(
      'Set New Password',
      name: 'setNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Total Appointment`
  String get totalRdv {
    return Intl.message(
      'Total Appointment',
      name: 'totalRdv',
      desc: '',
      args: [],
    );
  }

  /// `Diseases`
  String get maladies {
    return Intl.message(
      'Diseases',
      name: 'maladies',
      desc: '',
      args: [],
    );
  }

  /// `Pharmaceutical`
  String get pharmaceutique {
    return Intl.message(
      'Pharmaceutical',
      name: 'pharmaceutique',
      desc: '',
      args: [],
    );
  }

  /// `Surgical operations`
  String get Operationschirurgicales {
    return Intl.message(
      'Surgical operations',
      name: 'Operationschirurgicales',
      desc: '',
      args: [],
    );
  }

  /// `Medical Tests`
  String get ExamensMedicaux {
    return Intl.message(
      'Medical Tests',
      name: 'ExamensMedicaux',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any medical tests `
  String get noMedicalTests {
    return Intl.message(
      'You don\'t have any medical tests ',
      name: 'noMedicalTests',
      desc: '',
      args: [],
    );
  }

  /// `You can enter all information of the medical tests that your doctor cares about`
  String get descriptionMedicalTests {
    return Intl.message(
      'You can enter all information of the medical tests that your doctor cares about',
      name: 'descriptionMedicalTests',
      desc: '',
      args: [],
    );
  }

  /// `Selected file`
  String get selectedFile {
    return Intl.message(
      'Selected file',
      name: 'selectedFile',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmer {
    return Intl.message(
      'Confirm',
      name: 'confirmer',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Choose a file:`
  String get chooseFile {
    return Intl.message(
      'Choose a file:',
      name: 'chooseFile',
      desc: '',
      args: [],
    );
  }

  /// `Title of the exam`
  String get titleExams {
    return Intl.message(
      'Title of the exam',
      name: 'titleExams',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any Operations chirurgicales `
  String get noOperationschirurgicales {
    return Intl.message(
      'You don\'t have any Operations chirurgicales ',
      name: 'noOperationschirurgicales',
      desc: '',
      args: [],
    );
  }

  /// `You can enter all information of the Operations chirurgicales that your doctor cares about`
  String get descriptionOperationschirurgicales {
    return Intl.message(
      'You can enter all information of the Operations chirurgicales that your doctor cares about',
      name: 'descriptionOperationschirurgicales',
      desc: '',
      args: [],
    );
  }

  /// `You have no pharmaceutical information`
  String get nopharmaceutique {
    return Intl.message(
      'You have no pharmaceutical information',
      name: 'nopharmaceutique',
      desc: '',
      args: [],
    );
  }

  /// `You can enter all pharmaceutical information that interests your doctor`
  String get descriptionPharmaceutique {
    return Intl.message(
      'You can enter all pharmaceutical information that interests your doctor',
      name: 'descriptionPharmaceutique',
      desc: '',
      args: [],
    );
  }

  /// `You have no diseases`
  String get noDiseases {
    return Intl.message(
      'You have no diseases',
      name: 'noDiseases',
      desc: '',
      args: [],
    );
  }

  /// `You can enter all disease-related information that interests your doctor`
  String get descriptionDiseases {
    return Intl.message(
      'You can enter all disease-related information that interests your doctor',
      name: 'descriptionDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Title of the Operation chirurgicale`
  String get titleOperationschirurgicales {
    return Intl.message(
      'Title of the Operation chirurgicale',
      name: 'titleOperationschirurgicales',
      desc: '',
      args: [],
    );
  }

  /// `Add a Surgical Operations`
  String get addOperations {
    return Intl.message(
      'Add a Surgical Operations',
      name: 'addOperations',
      desc: '',
      args: [],
    );
  }

  /// `Add a Medical Test`
  String get addMedical {
    return Intl.message(
      'Add a Medical Test',
      name: 'addMedical',
      desc: '',
      args: [],
    );
  }

  /// `Medical Record`
  String get dossierMedical {
    return Intl.message(
      'Medical Record',
      name: 'dossierMedical',
      desc: '',
      args: [],
    );
  }

  /// `All your medical appointments`
  String get allappointments {
    return Intl.message(
      'All your medical appointments',
      name: 'allappointments',
      desc: '',
      args: [],
    );
  }

  /// `Old Reservations`
  String get encien {
    return Intl.message(
      'Old Reservations',
      name: 'encien',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Reservations`
  String get avenir {
    return Intl.message(
      'Upcoming Reservations',
      name: 'avenir',
      desc: '',
      args: [],
    );
  }

  /// `Filter by Date:`
  String get filterbydate {
    return Intl.message(
      'Filter by Date:',
      name: 'filterbydate',
      desc: '',
      args: [],
    );
  }

  /// `No old reservations available.`
  String get aucuneold {
    return Intl.message(
      'No old reservations available.',
      name: 'aucuneold',
      desc: '',
      args: [],
    );
  }

  /// `No upcoming reservations available.`
  String get aucunupcoming {
    return Intl.message(
      'No upcoming reservations available.',
      name: 'aucunupcoming',
      desc: '',
      args: [],
    );
  }

  /// `Diseases`
  String get diseases {
    return Intl.message(
      'Diseases',
      name: 'diseases',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites doctors`
  String get myfavoris {
    return Intl.message(
      'My Favorites doctors',
      name: 'myfavoris',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `My Calendar`
  String get mycalendar {
    return Intl.message(
      'My Calendar',
      name: 'mycalendar',
      desc: '',
      args: [],
    );
  }

  /// `My Reservations`
  String get myreservations {
    return Intl.message(
      'My Reservations',
      name: 'myreservations',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `About Consultations`
  String get aboutconsultations {
    return Intl.message(
      'About Consultations',
      name: 'aboutconsultations',
      desc: '',
      args: [],
    );
  }

  /// `About Doctors`
  String get aboutdoctors {
    return Intl.message(
      'About Doctors',
      name: 'aboutdoctors',
      desc: '',
      args: [],
    );
  }

  /// `About Prescriptions`
  String get aboutprescriptions {
    return Intl.message(
      'About Prescriptions',
      name: 'aboutprescriptions',
      desc: '',
      args: [],
    );
  }

  /// `About VSS`
  String get aboutvss {
    return Intl.message(
      'About VSS',
      name: 'aboutvss',
      desc: '',
      args: [],
    );
  }

  /// `About Privacy`
  String get aboutprivacy {
    return Intl.message(
      'About Privacy',
      name: 'aboutprivacy',
      desc: '',
      args: [],
    );
  }

  /// `Online Consultations`
  String get title1 {
    return Intl.message(
      'Online Consultations',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Simplified Planning and Management`
  String get title2 {
    return Intl.message(
      'Simplified Planning and Management',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Experienced doctors`
  String get title3 {
    return Intl.message(
      'Experienced doctors',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `Personalized consultations`
  String get title4 {
    return Intl.message(
      'Personalized consultations',
      name: 'title4',
      desc: '',
      args: [],
    );
  }

  /// `24/7 availability`
  String get title5 {
    return Intl.message(
      '24/7 availability',
      name: 'title5',
      desc: '',
      args: [],
    );
  }

  /// `Digital Prescriptions`
  String get title6 {
    return Intl.message(
      'Digital Prescriptions',
      name: 'title6',
      desc: '',
      args: [],
    );
  }

  /// `Simplified Access`
  String get title7 {
    return Intl.message(
      'Simplified Access',
      name: 'title7',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Reminders`
  String get title8 {
    return Intl.message(
      'Automatic Reminders',
      name: 'title8',
      desc: '',
      args: [],
    );
  }

  /// `Are the consultations private and confidential?`
  String get title9 {
    return Intl.message(
      'Are the consultations private and confidential?',
      name: 'title9',
      desc: '',
      args: [],
    );
  }

  /// `How secure are my medical records?`
  String get title10 {
    return Intl.message(
      'How secure are my medical records?',
      name: 'title10',
      desc: '',
      args: [],
    );
  }

  /// `Professional Medical Expertise`
  String get title11 {
    return Intl.message(
      'Professional Medical Expertise',
      name: 'title11',
      desc: '',
      args: [],
    );
  }

  /// `Simple and Quick Access`
  String get title12 {
    return Intl.message(
      'Simple and Quick Access',
      name: 'title12',
      desc: '',
      args: [],
    );
  }

  /// `Schedule secure and convenient online consultations`
  String get description1 {
    return Intl.message(
      'Schedule secure and convenient online consultations',
      name: 'description1',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy intuitive booking and reminder management to ensure seamless organization.`
  String get description2 {
    return Intl.message(
      'Enjoy intuitive booking and reminder management to ensure seamless organization.',
      name: 'description2',
      desc: '',
      args: [],
    );
  }

  /// `Our doctors are highly qualified and experienced in various medical fields.`
  String get description3 {
    return Intl.message(
      'Our doctors are highly qualified and experienced in various medical fields.',
      name: 'description3',
      desc: '',
      args: [],
    );
  }

  /// `Get personalized medical advice tailored to your specific needs.`
  String get description4 {
    return Intl.message(
      'Get personalized medical advice tailored to your specific needs.',
      name: 'description4',
      desc: '',
      args: [],
    );
  }

  /// `Our doctors are available at all times to answer your questions and concerns.`
  String get description5 {
    return Intl.message(
      'Our doctors are available at all times to answer your questions and concerns.',
      name: 'description5',
      desc: '',
      args: [],
    );
  }

  /// `Create and manage easy-to-share, secure digital prescriptions.`
  String get description6 {
    return Intl.message(
      'Create and manage easy-to-share, secure digital prescriptions.',
      name: 'description6',
      desc: '',
      args: [],
    );
  }

  /// `Quickly access your prescriptions from any connected device.`
  String get description7 {
    return Intl.message(
      'Quickly access your prescriptions from any connected device.',
      name: 'description7',
      desc: '',
      args: [],
    );
  }

  /// `Receive reminders to refill your prescriptions on time.`
  String get description8 {
    return Intl.message(
      'Receive reminders to refill your prescriptions on time.',
      name: 'description8',
      desc: '',
      args: [],
    );
  }

  /// `Yes, consultations are completely private and confidential. Your personal information is stored securely by VSS and will only be accessed by the VSS clinical team for the purpose of familiarising themselves with your medical history prior to your consultation.`
  String get description9 {
    return Intl.message(
      'Yes, consultations are completely private and confidential. Your personal information is stored securely by VSS and will only be accessed by the VSS clinical team for the purpose of familiarising themselves with your medical history prior to your consultation.',
      name: 'description9',
      desc: '',
      args: [],
    );
  }

  /// `Your medical records are securely stored by vss and can only be accessed when you log into your account through the vss app via a secure connection.`
  String get description10 {
    return Intl.message(
      'Your medical records are securely stored by vss and can only be accessed when you log into your account through the vss app via a secure connection.',
      name: 'description10',
      desc: '',
      args: [],
    );
  }

  /// `Connect with real, certified doctors. Sahha ensures direct access to qualified healthcare professionals, not algorithms.`
  String get description11 {
    return Intl.message(
      'Connect with real, certified doctors. Sahha ensures direct access to qualified healthcare professionals, not algorithms.',
      name: 'description11',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy an intuitive interface and quick access to telemedicine. Our services are designed for a smooth and efficient user experience.`
  String get description12 {
    return Intl.message(
      'Enjoy an intuitive interface and quick access to telemedicine. Our services are designed for a smooth and efficient user experience.',
      name: 'description12',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Unread`
  String get unread {
    return Intl.message(
      'Unread',
      name: 'unread',
      desc: '',
      args: [],
    );
  }

  /// `Book an Appointment `
  String get bookappointment {
    return Intl.message(
      'Book an Appointment ',
      name: 'bookappointment',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the appointment time`
  String get choisir {
    return Intl.message(
      'Please choose the appointment time',
      name: 'choisir',
      desc: '',
      args: [],
    );
  }

  /// `Smartwatch`
  String get smartwatch {
    return Intl.message(
      'Smartwatch',
      name: 'smartwatch',
      desc: '',
      args: [],
    );
  }

  /// `Track your health by connecting HealthKit.`
  String get smartwatchTitle {
    return Intl.message(
      'Track your health by connecting HealthKit.',
      name: 'smartwatchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Walk`
  String get walk {
    return Intl.message(
      'Walk',
      name: 'walk',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get gym {
    return Intl.message(
      'Gym',
      name: 'gym',
      desc: '',
      args: [],
    );
  }

  /// `Heart`
  String get heart {
    return Intl.message(
      'Heart',
      name: 'heart',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get sleep {
    return Intl.message(
      'Sleep',
      name: 'sleep',
      desc: '',
      args: [],
    );
  }

  /// `Oxygen`
  String get oxygen {
    return Intl.message(
      'Oxygen',
      name: 'oxygen',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
