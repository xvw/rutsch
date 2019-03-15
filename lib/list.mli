(** Extension for lists. *)

open Js_of_ocaml

(** {2 Types} *)

type 'a t = 'a list
type 'a js = 'a Js.js_array Js.t

(** {2 Extensions} *)

val from_js : ('a -> 'b) -> 'a #Js.js_array Js.t -> 'b t
val to_js : ('a -> 'b) -> 'a t -> 'b js

(** {2 Stdlib} *)
include module type of Stdlib.List
