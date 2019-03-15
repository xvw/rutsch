(** Helpers to work with the console. *)

(** {2 Output direct values} *)

val log : 'a -> unit
val error : 'a -> unit
val warn : 'a -> unit
val debug : 'a -> unit
val info : 'a -> unit
val assert_ : bool -> 'a -> unit

(** {2 Output OCaml string} *)

val log_message : string -> unit
val error_message : string -> unit
val warn_message : string -> unit
val debug_message : string -> unit
val info_message : string -> unit
val assert_message : bool -> string -> unit

(** {2 Misc} *)

val trace : unit -> unit

val timetrack :
     ?start_message:string
  -> ?stop_message:string
  -> (unit -> unit)
  -> unit
