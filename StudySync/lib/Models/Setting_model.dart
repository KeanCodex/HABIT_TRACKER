import 'package:codex_app/Components/LabelStyle.dart';
import 'package:flutter/material.dart';

import '../Customs/Customized_widget.dart';

class ProfileModel {
  IconData icon;
  int id;
  LabelText title;
  ProfileModel({
    required this.id,
    required this.icon,
    required this.title,
  });
}

List<ProfileModel> DATAPROFILE = [
  ProfileModel(
    id: 1,
    icon: Icons.person_outline_outlined,
    title: LabelText(
      label: 'Account',
      colors: dblueBG,
      fontsize: 16,
    ),
  ),
  ProfileModel(
    id: 2,
    icon: Icons.dark_mode_outlined,
    title: LabelText(
      label: 'Dark Mode',
      colors: dblueBG,
      fontsize: 16,
    ),
  ),
  ProfileModel(
    id: 3,
    icon: Icons.lock_outline_rounded,
    title: LabelText(
      label: 'Change Password',
      colors: dblueBG,
      fontsize: 16,
    ),
  ),
  ProfileModel(
    id: 4,
    icon: Icons.logout_outlined,
    title: LabelText(
      label: 'Logout',
      colors: dblueBG,
      fontsize: 16,
    ),
  ),
];
