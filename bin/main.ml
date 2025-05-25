let () =
  let success = Surf.glfw_init () in
  Printf.printf "glfwInit returned: %d\n%!" success;

  let _window =
    Surf.glfw_create_window 640 480 "Hello" Surf.null_monitor Surf.null_window
  in

  while true do
    Printf.printf "hello\n%!"
  done
