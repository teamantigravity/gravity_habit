import 'dart:isolate'; import 'dart:io'; void main() async { var uri = await Isolate.resolvePackageUri(Uri.parse('package:rive/rive.dart')); print(File(uri!.toFilePath()).readAsStringSync()); }
