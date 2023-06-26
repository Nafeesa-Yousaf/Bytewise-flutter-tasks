import 'package:ecommeceapp/Profile/proile_model.dart';
import 'package:hive/hive.dart';

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final typeId = 0;

  @override
  Profile read(BinaryReader reader) {
    return Profile(
      fullName: reader.read(),
      email: reader.read(),
      phoneNumber: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer.write(obj.fullName);
    writer.write(obj.email);
    writer.write(obj.phoneNumber);
  }
}
