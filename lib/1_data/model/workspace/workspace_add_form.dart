class WorkSpaceAddForm {
  final String name;
  final String description;

  static const _nameLimit = 100;
  static const _descriptionLimit = 1000;

  WorkSpaceAddForm({
    required this.name,
    required this.description,
  }) {
    if (name.length > _nameLimit) {
      throw Exception('이름의 길이는 $_nameLimit보다 작아야합니다.');
    }
    if (description.length > _descriptionLimit) {
      throw Exception('설명의 길이는 $_descriptionLimit보다 작아야합니다.');
    }
  }

  @override
  String toString() => 'WorkSpace(name: $name, description: $description)';
}
