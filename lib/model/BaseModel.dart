import 'dart:convert';

class BaseModel<T>{

   bool error;

    T results;

  // ignore: const_constructor_with_non_final_field
   BaseModel(this.error, this.results);







   @override
   String toString() {
     return 'BaseModel{error: $error, results: $results}';
   }


}
