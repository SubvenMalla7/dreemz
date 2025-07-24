class DataResponse<T> {
  DataResponse.success(this.data, {this.modelType, this.message})
      : status = Status.success,
        responseStatus = 0;

  DataResponse.error(this.message, [this.data, int statusCode = 0])
      : status = Status.error,
        responseStatus = statusCode;

  DataResponse.connectivityError()
      : status = Status.connectivityError,
        responseStatus = 0;
  DataResponse.loading(this.message)
      : status = Status.loading,
        responseStatus = 0;
  Status status;
  T? data;
  String? message;
  String? modelType;
  int responseStatus;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}

enum Status { loading, success, error, connectivityError }
