import 'package:flutter/material.dart';
class ImageRaster {
  static const _path = "assets/images/raster";
  static const logo = "$_path/logo.png";
  static const youtube = "$_path/youtube.png";
  static const wavingHandEmoji = "$_path/waving-hand-emoji.png";
  static const boxCoins = "$_path/box_coins.png";
  static const megaphone = "$_path/megaphone.png";
  static const rocket = "$_path/rocket.png";
}

class ImageVector {
  static const _path = "assets/images/vector";
  static const folder = "$_path/folder.svg";
}

class FileIcons {
  static const _kFontFam = 'FileIcons';
  static const String? _kFontPkg = null;

  static const folder =
  IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const cloud_outlined =
  IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const cloud_solid =
  IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const home_outlined =
  IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const home_solid =
  IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const search =
  IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const ms_access =
  IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const ms_excel =
  IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const ms_outlook =
  IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const ms_power_point =
  IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const ms_word =
  IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const music =
  IconData(0xf001, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const folder_empty =
  IconData(0xf114, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const doc_text_inv =
  IconData(0xf15c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class FileDetail {
  final String name;
  final int size;
  final FileType type;

  FileDetail(this.name, this.size, this.type);

  String getFileSize() {
    return '100MB';
  }

  IconData getFileTypeIcon() =>
      switch (type) {
        FileType.msPowerPoint => FileIcons.ms_power_point,
        FileType.msWord => FileIcons.ms_word,
        _ => Icons.abc_outlined
      };

  LinearGradient getGradient() =>
      switch (type) {
        _ => const LinearGradient(colors: [Colors.redAccent, Colors.red])
      };

  Widget getFileIcon() {
    var (gradient, icon)=switch (type) {
      FileType.msExcel =>
      (const LinearGradient(colors: [Colors.greenAccent, Colors.green]), FileIcons
          .ms_excel),
      FileType.msPowerPoint =>
      (const LinearGradient(colors: [Colors.orangeAccent, Colors.orange]), FileIcons
          .ms_power_point),
      FileType.msWord =>
      (const LinearGradient(colors: [Colors.blueAccent, Colors.blue]), FileIcons
          .ms_word),
      _ =>
      (const LinearGradient(
          colors: [Colors.deepOrangeAccent, Colors.deepOrange]), Icons
          .extension)
    };
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(gradient: gradient),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}

enum FileType { msPowerPoint, msWord, msExcel, video, audio, other }
