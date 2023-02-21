abstract class Sport {
  int get membersCount;
  set membersCount(int value);

  bool operator >(Sport sport) {
    throw UnimplementedError;
  }
}
