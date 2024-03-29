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

  /// `Position`
  String get appname {
    return Intl.message(
      'Position',
      name: 'appname',
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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Go ahead`
  String get go {
    return Intl.message(
      'Go ahead',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailed {
    return Intl.message(
      'Login Failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Connection...`
  String get loggin {
    return Intl.message(
      'Connection...',
      name: 'loggin',
      desc: '',
      args: [],
    );
  }

  /// `A reset email has been sent to you`
  String get emailSend {
    return Intl.message(
      'A reset email has been sent to you',
      name: 'emailSend',
      desc: '',
      args: [],
    );
  }

  /// `Email error. Try again!!!`
  String get emailNoSend {
    return Intl.message(
      'Email error. Try again!!!',
      name: 'emailNoSend',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidMail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidMail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone`
  String get invalidPhone {
    return Intl.message(
      'Invalid Phone',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `yourmail@xyz.com`
  String get hintEmail {
    return Intl.message(
      'yourmail@xyz.com',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get hintName {
    return Intl.message(
      'Your Name',
      name: 'hintName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get invalidPass {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPass',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPass {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get connexion {
    return Intl.message(
      'Login',
      name: 'connexion',
      desc: '',
      args: [],
    );
  }

  /// `No Account yet?  `
  String get noAccount {
    return Intl.message(
      'No Account yet?  ',
      name: 'noAccount',
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

  /// `Account creation...`
  String get registering {
    return Intl.message(
      'Account creation...',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Successful account creation check your emails...`
  String get registerSuccess {
    return Intl.message(
      'Successful account creation check your emails...',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Account creation failed`
  String get registerFailed {
    return Intl.message(
      'Account creation failed',
      name: 'registerFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Different passwords`
  String get passError {
    return Intl.message(
      'Different passwords',
      name: 'passError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get cpassword {
    return Intl.message(
      'Confirm Password',
      name: 'cpassword',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get alreadyAccount {
    return Intl.message(
      'I already have an account',
      name: 'alreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the email address`
  String get addEmail {
    return Intl.message(
      'Fill in the email address',
      name: 'addEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get dashboard {
    return Intl.message(
      'Home',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Search for an establishment, a place...`
  String get search {
    return Intl.message(
      'Search for an establishment, a place...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Cannot get current location`
  String get noLocation {
    return Intl.message(
      'Cannot get current location',
      name: 'noLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you enable GPS`
  String get enableGps {
    return Intl.message(
      'Please make sure you enable GPS',
      name: 'enableGps',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been deactivated`
  String get disabledAccount {
    return Intl.message(
      'Your account has been deactivated',
      name: 'disabledAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get hintPhone {
    return Intl.message(
      'Phone number',
      name: 'hintPhone',
      desc: '',
      args: [],
    );
  }

  /// `Select Layer`
  String get selectLayer {
    return Intl.message(
      'Select Layer',
      name: 'selectLayer',
      desc: '',
      args: [],
    );
  }

  /// `Find my position`
  String get findPosition {
    return Intl.message(
      'Find my position',
      name: 'findPosition',
      desc: '',
      args: [],
    );
  }

  /// `GPS access is required`
  String get gpsAccess {
    return Intl.message(
      'GPS access is required',
      name: 'gpsAccess',
      desc: '',
      args: [],
    );
  }

  /// `Request access`
  String get askAccess {
    return Intl.message(
      'Request access',
      name: 'askAccess',
      desc: '',
      args: [],
    );
  }

  /// `Loading of Buildings...`
  String get batimentDownload {
    return Intl.message(
      'Loading of Buildings...',
      name: 'batimentDownload',
      desc: '',
      args: [],
    );
  }

  /// `Online data recovery`
  String get getdata {
    return Intl.message(
      'Online data recovery',
      name: 'getdata',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get serverError {
    return Intl.message(
      'An error has occurred',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternet {
    return Intl.message(
      'No internet connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Loaded Buildings`
  String get loaded {
    return Intl.message(
      'Loaded Buildings',
      name: 'loaded',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get noData {
    return Intl.message(
      'No data found',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `I use the Position application to guide me. Follow my position on the map`
  String get shareContent {
    return Intl.message(
      'I use the Position application to guide me. Follow my position on the map',
      name: 'shareContent',
      desc: '',
      args: [],
    );
  }

  /// `My Adress`
  String get myAdress {
    return Intl.message(
      'My Adress',
      name: 'myAdress',
      desc: '',
      args: [],
    );
  }

  /// `Adress`
  String get adress {
    return Intl.message(
      'Adress',
      name: 'adress',
      desc: '',
      args: [],
    );
  }

  /// `Share My Position`
  String get shareMyPosition {
    return Intl.message(
      'Share My Position',
      name: 'shareMyPosition',
      desc: '',
      args: [],
    );
  }

  /// `Share Position`
  String get sharePosition {
    return Intl.message(
      'Share Position',
      name: 'sharePosition',
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

  /// `New Company`
  String get addEtablissement {
    return Intl.message(
      'New Company',
      name: 'addEtablissement',
      desc: '',
      args: [],
    );
  }

  /// `Edit a Company`
  String get editEtablissement {
    return Intl.message(
      'Edit a Company',
      name: 'editEtablissement',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Theme`
  String get chooseTheme {
    return Intl.message(
      'Choose a Theme',
      name: 'chooseTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get dark {
    return Intl.message(
      'Dark Theme',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Theme Light`
  String get light {
    return Intl.message(
      'Theme Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
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

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Search for points of interest and access essential city services`
  String get title1 {
    return Intl.message(
      'Search for points of interest and access essential city services',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Print official location map, share, save to favorites or navigate from one place to another On-call pharmacy, bank, health center, schools, social infrastructure and public services`
  String get subtitle1 {
    return Intl.message(
      'Print official location map, share, save to favorites or navigate from one place to another On-call pharmacy, bank, health center, schools, social infrastructure and public services',
      name: 'subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Showcase your skills, products and services online`
  String get title2 {
    return Intl.message(
      'Showcase your skills, products and services online',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `A virtual store and digital marketplace for formal and informal activities ...`
  String get subtitle2 {
    return Intl.message(
      'A virtual store and digital marketplace for formal and informal activities ...',
      name: 'subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Find practical information and consult the calendar of events`
  String get title3 {
    return Intl.message(
      'Find practical information and consult the calendar of events',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `Declarations of Work, follow the local news via notices and announcements`
  String get subtitle3 {
    return Intl.message(
      'Declarations of Work, follow the local news via notices and announcements',
      name: 'subtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get identifiant {
    return Intl.message(
      'Login',
      name: 'identifiant',
      desc: '',
      args: [],
    );
  }

  /// `Select a language`
  String get selectLanguage {
    return Intl.message(
      'Select a language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get name {
    return Intl.message(
      'Full name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Send a reset link`
  String get sendResetLink {
    return Intl.message(
      'Send a reset link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone or Email Invalid`
  String get invalidId {
    return Intl.message(
      'Phone or Email Invalid',
      name: 'invalidId',
      desc: '',
      args: [],
    );
  }

  /// `see all categories`
  String get showCategorie {
    return Intl.message(
      'see all categories',
      name: 'showCategorie',
      desc: '',
      args: [],
    );
  }

  /// `hide categories`
  String get hideCategorie {
    return Intl.message(
      'hide categories',
      name: 'hideCategorie',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get hintSearch {
    return Intl.message(
      'Search',
      name: 'hintSearch',
      desc: '',
      args: [],
    );
  }

  /// `My Saved Places`
  String get savedplaces {
    return Intl.message(
      'My Saved Places',
      name: 'savedplaces',
      desc: '',
      args: [],
    );
  }

  /// `My reviews`
  String get myreviews {
    return Intl.message(
      'My reviews',
      name: 'myreviews',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get confidentialite {
    return Intl.message(
      'Privacy',
      name: 'confidentialite',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions of use`
  String get conditions {
    return Intl.message(
      'Terms and conditions of use',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get aide {
    return Intl.message(
      'Help',
      name: 'aide',
      desc: '',
      args: [],
    );
  }

  /// `My Settings`
  String get settings {
    return Intl.message(
      'My Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `My information`
  String get infos {
    return Intl.message(
      'My information',
      name: 'infos',
      desc: '',
      args: [],
    );
  }

  /// `- OR -`
  String get or {
    return Intl.message(
      '- OR -',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with`
  String get signwith {
    return Intl.message(
      'Sign in with',
      name: 'signwith',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get trier {
    return Intl.message(
      'Sort by',
      name: 'trier',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get avis {
    return Intl.message(
      'Reviews',
      name: 'avis',
      desc: '',
      args: [],
    );
  }

  /// `Relevance`
  String get pertinence {
    return Intl.message(
      'Relevance',
      name: 'pertinence',
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

  /// `Apply`
  String get valider {
    return Intl.message(
      'Apply',
      name: 'valider',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contacter {
    return Intl.message(
      'Contact',
      name: 'contacter',
      desc: '',
      args: [],
    );
  }

  /// `Routing`
  String get routing {
    return Intl.message(
      'Routing',
      name: 'routing',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Write a review`
  String get newreview {
    return Intl.message(
      'Write a review',
      name: 'newreview',
      desc: '',
      args: [],
    );
  }

  /// `Amenities`
  String get commodite {
    return Intl.message(
      'Amenities',
      name: 'commodite',
      desc: '',
      args: [],
    );
  }

  /// `Services and Benefits`
  String get services {
    return Intl.message(
      'Services and Benefits',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Open Now : `
  String get opennow {
    return Intl.message(
      'Open Now : ',
      name: 'opennow',
      desc: '',
      args: [],
    );
  }

  /// `Fermé : `
  String get close {
    return Intl.message(
      'Fermé : ',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Presentation`
  String get presentation {
    return Intl.message(
      'Presentation',
      name: 'presentation',
      desc: '',
      args: [],
    );
  }

  /// `See More Reviews`
  String get showmorereviews {
    return Intl.message(
      'See More Reviews',
      name: 'showmorereviews',
      desc: '',
      args: [],
    );
  }

  /// `The most recent`
  String get latestreview {
    return Intl.message(
      'The most recent',
      name: 'latestreview',
      desc: '',
      args: [],
    );
  }

  /// `Load error`
  String get searcherror {
    return Intl.message(
      'Load error',
      name: 'searcherror',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get searchnotfound {
    return Intl.message(
      'No results found',
      name: 'searchnotfound',
      desc: '',
      args: [],
    );
  }

  /// `Registered`
  String get saved {
    return Intl.message(
      'Registered',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `No Website`
  String get nowebsite {
    return Intl.message(
      'No Website',
      name: 'nowebsite',
      desc: '',
      args: [],
    );
  }

  /// `Establishments Charged`
  String get etablissementLoaded {
    return Intl.message(
      'Establishments Charged',
      name: 'etablissementLoaded',
      desc: '',
      args: [],
    );
  }

  /// `Etablissements Added`
  String get etablissementAdded {
    return Intl.message(
      'Etablissements Added',
      name: 'etablissementAdded',
      desc: '',
      args: [],
    );
  }

  /// `Loading Error`
  String get etablissementError {
    return Intl.message(
      'Loading Error',
      name: 'etablissementError',
      desc: '',
      args: [],
    );
  }

  /// `Loading of Establishments Completed`
  String get etablissementLoadComplete {
    return Intl.message(
      'Loading of Establishments Completed',
      name: 'etablissementLoadComplete',
      desc: '',
      args: [],
    );
  }

  /// `filter`
  String get filtre {
    return Intl.message(
      'filter',
      name: 'filtre',
      desc: '',
      args: [],
    );
  }

  /// `View Map`
  String get showmap {
    return Intl.message(
      'View Map',
      name: 'showmap',
      desc: '',
      args: [],
    );
  }

  /// `View List`
  String get showlist {
    return Intl.message(
      'View List',
      name: 'showlist',
      desc: '',
      args: [],
    );
  }

  /// `Your opinion is important to us`
  String get commentdesc {
    return Intl.message(
      'Your opinion is important to us',
      name: 'commentdesc',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment`
  String get commenthint {
    return Intl.message(
      'Write your comment',
      name: 'commenthint',
      desc: '',
      args: [],
    );
  }

  /// `Review added`
  String get reviewadded {
    return Intl.message(
      'Review added',
      name: 'reviewadded',
      desc: '',
      args: [],
    );
  }

  /// `Error adding review`
  String get reviewerror {
    return Intl.message(
      'Error adding review',
      name: 'reviewerror',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoris {
    return Intl.message(
      'Favorites',
      name: 'favoris',
      desc: '',
      args: [],
    );
  }

  /// `You have not yet registered a location`
  String get nofavoris {
    return Intl.message(
      'You have not yet registered a location',
      name: 'nofavoris',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `This week`
  String get thisweek {
    return Intl.message(
      'This week',
      name: 'thisweek',
      desc: '',
      args: [],
    );
  }

  /// `One week`
  String get oneweek {
    return Intl.message(
      'One week',
      name: 'oneweek',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Establishment Name`
  String get etablissement_name {
    return Intl.message(
      'Establishment Name',
      name: 'etablissement_name',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category {
    return Intl.message(
      'category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Sub-catégory`
  String get subcategory {
    return Intl.message(
      'Sub-catégory',
      name: 'subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Choose Category`
  String get choose_category {
    return Intl.message(
      'Choose Category',
      name: 'choose_category',
      desc: '',
      args: [],
    );
  }

  /// `Choose Sub-Category`
  String get choose_sub_category {
    return Intl.message(
      'Choose Sub-Category',
      name: 'choose_sub_category',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to the Terms of Use and Privacy Policy. All information is subject to change at a later date.`
  String get terms {
    return Intl.message(
      'By continuing, you agree to the Terms of Use and Privacy Policy. All information is subject to change at a later date.',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `PO BOX`
  String get code_postal {
    return Intl.message(
      'PO BOX',
      name: 'code_postal',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get ville {
    return Intl.message(
      'City',
      name: 'ville',
      desc: '',
      args: [],
    );
  }

  /// `Indications`
  String get indication {
    return Intl.message(
      'Indications',
      name: 'indication',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp`
  String get whatsapp {
    return Intl.message(
      'Whatsapp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Choose Hour`
  String get choose_hours {
    return Intl.message(
      'Choose Hour',
      name: 'choose_hours',
      desc: '',
      args: [],
    );
  }

  /// `Add Picture`
  String get add_picture {
    return Intl.message(
      'Add Picture',
      name: 'add_picture',
      desc: '',
      args: [],
    );
  }

  /// `You have finished configuring the facility!`
  String get complete_add {
    return Intl.message(
      'You have finished configuring the facility!',
      name: 'complete_add',
      desc: '',
      args: [],
    );
  }

  /// `The establishment will be put online after the payment. You will still be able to modify the information from your account.`
  String get complete_add_desc {
    return Intl.message(
      'The establishment will be put online after the payment. You will still be able to modify the information from your account.',
      name: 'complete_add_desc',
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

  /// `Removed maps`
  String get removeMap {
    return Intl.message(
      'Removed maps',
      name: 'removeMap',
      desc: '',
      args: [],
    );
  }

  /// `Map downloaded successfully`
  String get successDownload {
    return Intl.message(
      'Map downloaded successfully',
      name: 'successDownload',
      desc: '',
      args: [],
    );
  }

  /// `Downloaded maps in background`
  String get backgroundDownload {
    return Intl.message(
      'Downloaded maps in background',
      name: 'backgroundDownload',
      desc: '',
      args: [],
    );
  }

  /// `Download error`
  String get errorDownload {
    return Intl.message(
      'Download error',
      name: 'errorDownload',
      desc: '',
      args: [],
    );
  }

  /// `Route recovery error`
  String get routingError {
    return Intl.message(
      'Route recovery error',
      name: 'routingError',
      desc: '',
      args: [],
    );
  }

  /// `Sharing error`
  String get sharedError {
    return Intl.message(
      'Sharing error',
      name: 'sharedError',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get error {
    return Intl.message(
      'An error has occurred',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recentSearch {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearch',
      desc: '',
      args: [],
    );
  }

  /// `reset done`
  String get resetsuccess {
    return Intl.message(
      'reset done',
      name: 'resetsuccess',
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
