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

let window_init { width; height; title; graphics_api } =
  if glfw_init () = 1 then (
    graphics_api_hint graphics_api;
    match glfw_create_window width height title None None with
    | Some _ -> Stdio.printf "Window created!\n%!"
    | None -> raise (Failure "Failed to create window!"))
  else raise (Failure "GLFW init failed!")
