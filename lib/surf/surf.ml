open Surf_glfw

type graphics_api = OpenGL | Vulkan

type window_desc = {
  width : int;
  height : int;
  title : string;
  graphics_api : graphics_api;
}

let graphics_api_hint = function
  | OpenGL -> glfw_window_hint glfw_client_api glfw_opengl_api
  | Vulkan -> glfw_window_hint glfw_client_api glfw_no_api

let error_callback code desc =
  let error = glfw_error_code_to_string code in
  Echo.error "[%s]: %s\n%!" error desc

let running = ref true

let window_callbacks_set window =
  let close_callback _ =
    Echo.trace "Closing";
    running := false
  in
  glfw_set_window_close_callback window close_callback

let window_init { width; height; title; graphics_api } =
  if glfw_init () = 1 then (
    graphics_api_hint graphics_api;
    glfw_set_error_callback error_callback;
    match glfw_create_window width height title None None with
    | Some window ->
        Stdio.printf "Window created!\n%!";
        window_callbacks_set window
    | None -> raise (Failure "Failed to create window!"))
  else raise (Failure "GLFW init failed!")

let window_should_close () = not !running
let window_poll_events () = glfw_poll_events ()
