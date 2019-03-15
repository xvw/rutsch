(** Deal with Errors *)

open Js_of_ocaml

(** {2 Types} *)

type t = Js.error Js.t

(** {2 Api} *)

val from_string : string -> t
val raise_ : t -> 'a
val raise_message : string -> 'a
