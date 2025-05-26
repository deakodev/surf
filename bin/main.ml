(* open Base *)
(* open Stdio *)

let rec run window =
  Surf.window_poll_events ();
  match Surf.window_should_close window with
  | true -> Surf.window_close window
  | false -> run window

let () =
  let window =
    Surf.window_init
      { width = 640; height = 480; title = "Surf"; graphics_api = OpenGL }
  in
  run window
