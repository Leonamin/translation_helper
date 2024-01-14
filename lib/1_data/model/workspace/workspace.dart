class WorkSpace {
  final int id;
  final String name;
  final String description;

  const WorkSpace({
    required this.id,
    required this.name,
    required this.description,
  });

  factory WorkSpace.defaultWorkSpcae() => const WorkSpace(
        id: 1,
        name: '기본 작업환경',
        description: '기본 작업환경입니다.',
      );

  @override
  String toString() =>
      'WorkSpace(id: $id, name: $name, description: $description)';
}
