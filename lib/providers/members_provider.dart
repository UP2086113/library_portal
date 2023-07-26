import 'dart:collection';

import 'package:get/get.dart';

import '../models/genre.dart';
import '../models/member.dart';
import '../services/repositories/data_repository.dart';
import '../utils/helper.dart';

class MembersProvider extends GetxController {
  late final DataRepository _dataRepository;

  late int _mId;

  bool _loggedIn = false;

  final Map<int, Member> _members = {};

  List<Genre> _memberPreferences = [];
  List<Genre> _tempPreferences = [];

  UnmodifiableMapView<int, Member> get membersMap =>
      UnmodifiableMapView(_members);

  UnmodifiableListView<Member> get members =>
      UnmodifiableListView(_members.values);
  UnmodifiableListView<Genre> get memberPreferences =>
      UnmodifiableListView(_memberPreferences);

  Member? get currentMember => _members[_mId];

  bool get loggedIn => _loggedIn;

  int get currentMId => _mId;

  MembersProvider({required dataRepository})
      : _dataRepository = dataRepository {
    _initializeData();
  }

  void _initializeData() {
    _initializeMembersMap();
  }

  void _initializeMembersMap() {
    _dataRepository.membersStream().listen((members) {
      for (var member in members) {
        _members[member.id] = member;
      }
   
    });
  }

  void signIn({required String email, required String password}) {
    _members.forEach((mId, member) {
      if (member.email == email && member.password == password) {
        _mId = member.id;
        _loggedIn = true;
     
        return;
      }
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int age,
  }) async {
    final startDate = DateTime.now();
    const bio = "New enthusiastic member";
    final newMember = {
      "m_first_name": firstName,
      "m_last_name": lastName,
      "m_age": age,
      "m_bio": bio,
      "m_start_date": Helper.dateSerializer(startDate),
      "m_email": email,
      "m_password": password,
    };

    final newMId = await _dataRepository.createAccount(data: newMember);

    //Member Object added to map
    _members[newMId] = Member(
        id: newMId,
        firstName: firstName,
        lastName: lastName,
        bio: bio,
        age: age,
        email: email,
        password: password,
        startDate: startDate,
        imageUrl: '');

    _mId = newMId;
    _loggedIn = true;
  }

  void toggleGenre(bool inActive, Genre genre) {
    inActive ? _tempPreferences.add(genre) : _tempPreferences.remove(genre);
  }

  setMemberPreferences(List<Genre> prefs) {
    _memberPreferences = [...prefs];
    _tempPreferences = [...prefs];
  }

  Future<void> changeMemberPreferences() async {
    _memberPreferences.forEach((genre) async {
      //if a preference has been removed, delete it
      if (!_tempPreferences.contains(genre)) {
        await _dataRepository.deleteMemberPreferences(id: "$_mId,${genre.id}");
      }
    });
    _tempPreferences.forEach((genre) async {
      if (!_memberPreferences.contains(genre)) {
        Map<String, dynamic> data = {
          "m_id": currentMId,
          "g_id": genre.id,
        };
        await _dataRepository.changeMemberPreferences(data: data);
      }
    });
    _tempPreferences.clear();
  }

  bool isPreference(Genre genre) => _tempPreferences.contains(genre);

  resetTempPreferences() => _tempPreferences.clear();

  Future<bool> changeProfileData({email, password, bio, int? age}) async {
    Member temp = currentMember!
        .copyWith(email: email, password: password, bio: bio, age: age);
    int mId =
        await _dataRepository.changeAccountData(data: temp.toMap(), id: _mId);
    _members[_mId] = temp;

    return true;
  }

// void _initializeCurrentMember() {
//   _dataRepository.memberStream(id: mId).listen((currMember) {
//     _currentMember = currMember;
//  
//   });
// }
}
