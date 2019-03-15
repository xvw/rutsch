open Js_of_ocaml

type t = Js.error Js.t

let from_string message =
  let m = Js.string message in
  new%js Js.error_constr m
;;

let raise_ error = Js.raise_js_error error
let raise_message message = message |> from_string |> raise_
