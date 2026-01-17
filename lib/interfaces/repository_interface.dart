/// @author Giovane Neves
abstract class RepositoryInterface<T> {

  Future<dynamic> add(Map<String, dynamic> body);

  Future<dynamic> update(Map<String, dynamic> body, int? id);

  Future<dynamic> delete(int? id);

  Future<dynamic> getList();

  Future<dynamic> get(String? id);

}