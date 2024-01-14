import 'package:translation_helper/0_model/workspace_model.dart';
import 'package:translation_helper/1_data/model/workspace/workspace.dart';
import 'package:translation_helper/1_data/model/workspace/workspace_add_form.dart';

class HomeViewModel {
  final WorkSpaceModel _workSpaceModel = WorkSpaceModel();

  HomeViewModel();

  List<WorkSpace> workspaceList = [];

  Future<void> init() async {
    final result = await _workSpaceModel.getWorkspaceList();

    result
      ..onFailure((e) => null)
      ..onSuccess((list) {
        workspaceList = list;
      });
  }

  Future<void> onTapAddWorkSpace() async {
    final result = await _workSpaceModel.createWorkspace(
      WorkSpaceAddForm(
        name: 'name',
        description: 'description',
      ),
    );

    result
      ..onFailure((e) => null)
      ..onSuccess((id) {
        workspaceList.add(WorkSpace(
          id: id,
          name: 'name',
          description: 'description',
        ));
      });
  }
}
