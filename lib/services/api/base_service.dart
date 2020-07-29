abstract class BaseService<Model> {
  // The specified endpoint e.g. '/api/resources/'
  String endpoint = "/api/resources";

  /// Get all resources from API.
  /// The parsing from JSON should be implemented here.
  ///
  /// @return [List]
  /// @returns a list of [Model]
  Future<List<Model>> fetchAll();

  /// Get a resource by specified ID.
  /// The parsing from JSON should be implemented here.
  ///
  /// @param [int] id
  /// @return [Model]
  /// @returns the [Model] that was requested
  Future<Model> fetchById({int id});

  /// Request to API to create a new record.
  /// The parsing from JSON should be implemented here.
  ///
  /// @param [int] id
  /// @param [Model] model
  /// @return [Model]
  /// @returns the [Model] that was requested
  Future<Model> requestCreate({Model model});

  /// Request to API to create a new record.
  /// The parsing from JSON should be implemented here.
  ///
  /// @param [int] id
  /// @return [Model] model
  /// @returns the [Model] that was requested
  Future<Model> requestUpdate({Model model, int id});

  /// Request to API to delete a resource from non-archive.
  ///
  /// @param [int] id
  /// @return [bool]
  /// @returns a boolean to determine if request was successful
  Future<bool> requestDeleteById({int id});

  /// Request to API to permanently delete record from archive.
  ///
  /// @param [int] id
  /// @return [bool]
  /// @returns a boolean to determine if request was successful
  Future<bool> requestForceDeleteById({int id});

  /// Request to API to restore from archive.
  ///
  /// @param [int] id
  /// @return [bool]
  /// @returns a boolean to determine if request was successful
  Future<bool> requestRestoreById({int id});
}
