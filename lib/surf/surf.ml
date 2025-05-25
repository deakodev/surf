open Surf_glfw

let window_init width height title =
  if glfw_init () = 1 then
    match glfw_create_window width height title None None with
    | Some _ -> Stdio.printf "Window created!\n%!"
    | None -> raise (Failure "Failed to create window!")
  else raise (Failure "GLFW init failed!")
