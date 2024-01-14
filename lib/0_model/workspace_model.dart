import 'package:translation_helper/1_data/0_common/reqeust_result.dart';
import 'package:translation_helper/1_data/model/workspace/workspace.dart';
import 'package:translation_helper/1_data/model/workspace/workspace_add_form.dart';

class WorkSpaceModel {
  WorkSpaceModel._();

  static final WorkSpaceModel instance = WorkSpaceModel._();

  factory WorkSpaceModel() => instance;

  // Todo
  final List<WorkSpace> _workspaceList = [WorkSpace.defaultWorkSpcae()];

  Future<RequestResult<List<WorkSpace>>> getWorkspaceList() =>
      handleRequest(() async {
        return _workspaceList;
      });

  Future<RequestResult<int>> createWorkspace(WorkSpaceAddForm addForm) =>
      handleRequest(() async {
        final id = _workspaceList.length;
        _workspaceList.add(WorkSpace(
          id: id,
          name: addForm.name,
          description: addForm.description,
        ));
        return id;
      });

  Future<RequestResult<void>> updateWorkspace(
          int id, WorkSpaceAddForm addForm) =>
      handleRequest(() async {
        _workspaceList[id] = WorkSpace(
          id: id,
          name: addForm.name,
          description: addForm.description,
        );
      });

  Future<RequestResult<void>> deleteWorkspace(int id) =>
      handleRequest(() async {
        _workspaceList.removeAt(id);
      });
}
