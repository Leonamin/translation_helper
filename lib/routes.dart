enum ViewRoutes {
  fileDragAndDrop,
  edit,
}

extension ViewRoutesExtension on ViewRoutes {
  String get path {
    switch (this) {
      case ViewRoutes.fileDragAndDrop:
        return '/';
      case ViewRoutes.edit:
        return 'edit';

      default:
        return '/404';
    }
  }

  String get name {
    switch (this) {
      case ViewRoutes.fileDragAndDrop:
        return 'edit';
      case ViewRoutes.edit:
        return 'home';
      default:
        return '404';
    }
  }
}
