open Surf_glfw

type graphics_api = OpenGL | Vulkan

let opengl_api_callback window = glfw_make_context_current window
let vulkan_api_callback (_ : Surf_glfw.window) = ()

let api_hint = function
  | OpenGL ->
      glfw_window_hint glfw_client_api glfw_opengl_api;
      opengl_api_callback
  | Vulkan ->
      glfw_window_hint glfw_client_api glfw_no_api;
      vulkan_api_callback
