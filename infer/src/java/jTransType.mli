open Javalib_pack
open Sawja_pack

(** transforms a Java type into a Sil named type  *)
val get_named_type : JBasics.value_type -> Sil.typ

(** transforms a Java class name into a Sil class name *)
val typename_of_classname : JBasics.class_name -> Sil.typename

(** returns a name for a field based on a class name and a field name  *)
val create_fieldname : JBasics.class_name -> JBasics.field_signature -> Ident.fieldname

(** returns a procedure name based on the class name and the method's signature. *)
val get_method_procname : JBasics.class_name -> JBasics.method_signature -> Procname.t

(** [get_class_type_no_pointer tenv cn] returns the sil type representation of the class  without the pointer part *)
val get_class_type_no_pointer: JClasspath.program -> Sil.tenv -> JBasics.class_name -> Sil.typ

(** [get_class_type tenv cn] returns the sil type representation of the class  *)
val get_class_type : JClasspath.program -> Sil.tenv -> JBasics.class_name -> Sil.typ

(** transforms a Java object type to a Sil type *)
val object_type : JClasspath.program -> Sil.tenv -> JBasics.object_type -> Sil.typ

(** create sizeof expressions from the object type and the list of subtypes *)
val sizeof_of_object_type : JClasspath.program -> Sil.tenv -> JBasics.object_type -> Sil.Subtype.t
-> Sil.exp

(** transforms a Java type to a Sil type. *)
val value_type : JClasspath.program -> Sil.tenv -> JBasics.value_type -> Sil.typ

(** return the type of a formal parameter, looking up the class name in case of "this" *)
val param_type : JClasspath.program -> Sil.tenv -> JBasics.class_name -> JBir.var -> JBasics.value_type -> Sil.typ

(** Returns the return type of the method based on the return type specified in ms.
If the method is the initialiser, return the type Object instead. *)
val return_type : JClasspath.program -> Sil.tenv -> JBasics.method_signature -> JContext.meth_kind -> Sil.typ

(** translates the type of an expression *)
val expr_type : JContext.t -> JBir.expr -> Sil.typ

(** translates a conversion type from Java to Sil. *)
val cast_type : JBir.conv -> Sil.typ

(** [create_array_type typ dim] creates an array type with dimension dim and content typ *)
val create_array_type : Sil.typ -> int -> Sil.typ

(** [extract_cn_type_np] returns the internal type of type when typ is a pointer type, otherwise returns typ *)
val extract_cn_type_np : Sil.typ -> Sil.typ

(** [extract_cn_type_np] returns the Java class name of typ when typ is a pointer type, otherwise returns None *)
val extract_cn_no_obj : Sil.typ -> JBasics.class_name option

(** returns a string representation of a Java basic type. *)
val string_of_basic_type : JBasics.java_basic_type -> string

(** returns a string representation of a Java type *)
val string_of_type : JBasics.value_type -> string

(** returns a string representation of an object Java type *)
val object_type_to_string : JBasics.object_type -> string

val vt_to_java_type : JBasics.value_type -> Procname.java_type

val cn_to_java_type : JBasics.class_name -> Procname.java_type

(** [update_tenv program] update the type environment with all the types found in [program] *)
val update_tenv : Sil.tenv -> JClasspath.program -> unit

(** Update a type environment with the types found in the classpath *)
val saturate_tenv_with_classpath : string -> Sil.tenv -> unit

(** list of methods that are never returning null *)
val never_returning_null : Procname.t list
