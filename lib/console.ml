open Js_of_ocaml

class type hook =
  object
    inherit Firebug.console

    method clear : unit -> unit Js.meth

    method table :
      Js.js_string Js.t Js.js_array Js.t Js.Optdef.t -> unit Js.meth
  end

external get_console : unit -> hook Js.t = "caml_js_get_console"

let console = get_console ()
let log x = console##log x
let error x = console##error x
let warn x = console##warn x
let debug x = console##debug x
let info x = console##info x

let assert_ flag x =
  let flag' = Js.bool flag in
  console##assert_1 flag' x
;;

let log_message message = message |> Js.string |> log
let error_message message = message |> Js.string |> error
let warn_message message = message |> Js.string |> warn
let debug_message message = message |> Js.string |> debug
let info_message message = message |> Js.string |> info

let assert_message flag message =
  message |> Js.string |> assert_ flag
;;

let trace () = console##trace

let timetrack ?(start_message = "Start") ?(stop_message = "Stop") f =
  let () = console##time (Js.string start_message) in
  let () = f () in
  console##timeEnd (Js.string stop_message)
;;
