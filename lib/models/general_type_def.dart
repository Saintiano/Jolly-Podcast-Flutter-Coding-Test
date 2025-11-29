typedef VmActionResponse = ({
  bool success,
  String? error,
});

typedef DataVmActionResponse<T> = ({bool success, String? error, T data});

typedef StatementQueryArgs = ({
  String account,
  DateTime startDate,
  DateTime endDate
});

// typedef FilterResult = ({
//   String account,
//   String status,
//   FilterSortType sortType
// });

typedef FilterResult = ({
  int transactionType,
  String account,
  String status,
  String? startDate,
  String? endDate,
  String? manageUserStaus,
  String? manageUserRole,
  FilterSortType sortType,
});

enum FilterSortType {
  oldest,
  latest,
}
