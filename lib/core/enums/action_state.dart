enum ActionState {
  initial,
  loading,
  success,
  failed,
  successSalesDirect,
  calculationSuccess,
  deleteSuccess,
  postSuccess,
}

extension ActionStateX on ActionState {
  bool get isInitial => this == ActionState.initial;
  bool get isLoading => this == ActionState.loading;
  bool get isSuccess => this == ActionState.success;
  bool get isFailed => this == ActionState.failed;
  bool get isCalculationSuccess => this == ActionState.calculationSuccess;
}
