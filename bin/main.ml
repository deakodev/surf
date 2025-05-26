(* open Base *)
(* open Stdio *)

let rec run () =
  Surf.window_poll_events ();
  match Surf.window_should_close () with true -> () | false -> run ()

let () =
  Surf.window_init
    { width = 640; height = 480; title = "Surf"; graphics_api = Vulkan };
  run ()
