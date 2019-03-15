open Js_of_ocaml

type 'a t = 'a list
type 'a js = 'a Js.js_array Js.t

let from_js callback js_array =
  let len = js_array##.length in
  Stdlib.List.init len (fun i ->
      let element = Js.array_get js_array i in
      Js.Optdef.get element (fun () ->
          Error.raise_message "Unbound index" )
      |> callback )
;;

let to_js callback list =
  let js_array = new%js Js.array_empty in
  let () =
    Stdlib.List.iteri
      (fun i elt -> Js.array_set js_array i (callback elt))
      list
  in
  js_array
;;

include Stdlib.List
