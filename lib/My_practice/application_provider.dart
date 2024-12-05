import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  String gender = "Gender", male = "Male", female = "Female";
  String genderupdate = "Gender", maleupdate = "Male", femaleupdate = 'Female';

  String? selectedstream;
  String? selectedstreamupdate;

  double? selectedage = 0;
  double? selectedageupdate = 0;

  bool iscricket = false,
      isfootball = false,
      isvolleyball = false,
      issubmitted = false,
      isactive = false,
      isupdate = false;
  bool iscricketupdate = false,
      isfootballupdate = false,
      isvolleyballupdate = false,
      isactiveupdate = false,
      isupdateupdate = false;

  List<String> streamdata = ['Science', 'Commerce', 'Arts', 'Diploma'];
  List<String> streamdataupdate = ['Science', 'Commerce', 'Arts', 'Diploma'];

  List<String> selectedhobby = [];
  int selectedIndex = 0;
  List<Map<String, dynamic>> data = [];

  TextEditingController txtFirstNameController = TextEditingController();
  TextEditingController txtMiddleNameController = TextEditingController();
  TextEditingController txtLastNameController = TextEditingController();
  TextEditingController txtUpdateFirstNameController = TextEditingController();
  TextEditingController txtUpdateMiddleNameController = TextEditingController();
  TextEditingController txtUpdateLastNameController = TextEditingController();

  void disposeTextField() {
    txtFirstNameController.dispose();
    txtMiddleNameController.dispose();
    txtLastNameController.dispose();
    txtUpdateFirstNameController.dispose();
    txtUpdateMiddleNameController.dispose();
    txtUpdateLastNameController.dispose();
  }

  void checkGender(String value) {
    issubmitted = false;
    gender = value;
    notifyListeners();
  }

  void checkGenderDialog(String value) {
    genderupdate = value;
    notifyListeners();
  }

  void selectcricket(bool value) {
    issubmitted = false;
    iscricket = value;
    // iscricket == true
    //     ? selectedhobby.add('Cricket')
    //     : selectedhobby.remove('Cricket');
    notifyListeners();
  }

  void selectcricketDialog(bool value) {
    // issubmitted = false;
    iscricketupdate = value;
    // iscricketupdate == true
    //     ? selectedhobby.add('Cricket')
    //     : selectedhobby.remove('Cricket');
    notifyListeners();
  }

  void selectfootball(bool value) {
    issubmitted = false;
    isfootball = value;
    // isfootball == true
    //     ? selectedhobby.add('Football')
    //     : selectedhobby.remove('Football');
    notifyListeners();
  }

  void selectfootballDialog(bool value) {
    // issubmitted = false;
    isfootballupdate = value;
    // isfootballupdate == true
    //     ? selectedhobby.add('Football')
    //     : selectedhobby.remove('Football');
    notifyListeners();
  }

  void selectvolleyball(bool value) {
    issubmitted = false;
    isvolleyball = value;
    // isvolleyball == true
    //     ? selectedhobby.add('Volleyball')
    //     : selectedhobby.remove('Volleyball');
    notifyListeners();
  }

  void selectvolleyballDialog(bool value) {
    // issubmitted = false;
    isvolleyballupdate = value;
    // isvolleyballupdate == true;
    //     ? selectedhobby.add('Volleyball')
    //     : selectedhobby.remove('Volleyball');
    notifyListeners();
  }

  void selectswitch(bool value) {
    issubmitted = false;
    isactive = value;
    notifyListeners();
  }

  void selectswitchDialog(bool value) {
    // issubmitted = false;
    isactiveupdate = value;
    notifyListeners();
  }

  void selectstream(String value) {
    selectedstream = value;
    notifyListeners();
  }

  void selectstreamDialog(String value) {
    selectedstreamupdate = value;
    notifyListeners();
  }

  void selectage(double value) {
    issubmitted = false;
    selectedage = value;
    notifyListeners();
  }

  void selectageDialog(double value) {
    // issubmitted = false;
    selectedageupdate = value;
    notifyListeners();
  }

  void showdata() {
    issubmitted = true;

    notifyListeners();
  }

  void addData() {
    selectedhobby.clear();
    if (iscricket == true) selectedhobby.add('Cricket');
    if (isfootball == true) selectedhobby.add('Football');
    if (isvolleyball == true) selectedhobby.add('Volleyball');
    data.add({
      'fname': txtFirstNameController.text,
      'mname': txtMiddleNameController.text,
      'lname': txtLastNameController.text,
      'gender': gender,
      'hobby': List.from(selectedhobby.map((e) => e)),
      'age': selectedage,
      'stream': selectedstream,
      'isactive': isactive
    });
  }

  void updateData() {
    selectedhobby.clear();
    if (iscricketupdate == true) selectedhobby.add('Cricket');
    if (isfootballupdate == true) selectedhobby.add('Football');
    if (isvolleyballupdate == true) selectedhobby.add('Volleyball');
    data[selectedIndex]['fname'] = txtUpdateFirstNameController.text;
    data[selectedIndex]['mname'] = txtUpdateMiddleNameController.text;
    data[selectedIndex]['lname'] = txtUpdateLastNameController.text;
    data[selectedIndex]['gender'] = genderupdate;
    data[selectedIndex]['hobby'] = List.from(selectedhobby.map((e) => e));
    data[selectedIndex]['age'] = selectedageupdate;
    data[selectedIndex]['stream'] = selectedstreamupdate;
    data[selectedIndex]['isactive'] = isactiveupdate;
    notifyListeners();
  }

  void onTapUpdate() {
    selectedhobby.clear();
    txtUpdateFirstNameController.text = data[selectedIndex]['fname'];
    txtUpdateMiddleNameController.text = data[selectedIndex]['mname'];
    txtUpdateLastNameController.text = data[selectedIndex]['lname'];
    genderupdate = data[selectedIndex]['gender'];
    if (data[selectedIndex]['hobby'].contains('Cricket')) {
      iscricketupdate = true;
    }
    if (data[selectedIndex]['hobby'].contains('Football')) {
      isfootballupdate = true;
    }
    if (data[selectedIndex]['hobby'].contains('Volleyball')) {
      isvolleyballupdate = true;
    }
    selectedageupdate = data[selectedIndex]['age'];
    selectedstreamupdate = data[selectedIndex]['stream'];
    isactiveupdate = data[selectedIndex]['isactive'];
    notifyListeners();
  }

  void clearData() {
    txtFirstNameController.clear();
    txtMiddleNameController.clear();
    txtLastNameController.clear();
    gender = 'gender';
    selectedhobby.clear();
    iscricket = false;
    isfootball = false;
    isvolleyball = false;
    selectedage = 0;
    selectedstream = null;
    isactive = false;
  }

  void clearUpdateData() {
    txtUpdateFirstNameController.clear();
    txtUpdateMiddleNameController.clear();
    txtUpdateLastNameController.clear();
    genderupdate = 'gender';
    selectedhobby.clear();
    selectedageupdate = 0;
    selectedstreamupdate = null;
    isactiveupdate = false;
  }

  void updateButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void deleteButton(dynamic context, index) {
    data.removeAt(index);
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleDeleteButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }
}
