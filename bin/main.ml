(* open Base *)
(* open Stdio *)

let run () =
  while true do
    ()
  done

let () =
  Surf.window_init
    { width = 640; height = 480; title = "Surf"; graphics_api = Vulkan };
  run ()
