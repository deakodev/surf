include Glfw.Functions
include Glfw.Types
include Glfw.Defines

let glfw_create_window width height title monitor_opt share_opt =
  let monitor = Option.value ~default:GLFWmonitor.null monitor_opt in
  let share = Option.value ~default:GLFWwindow.null share_opt in
  let window =
    Glfw.Functions.glfw_create_window width height title monitor share
  in
  if GLFWwindow.is_null window then None else Some window

let glfw_shutdown window =
  glfw_destroy_window window;
  glfw_terminate ();
  Echo.info "Window closed successfully."

type monitor = GLFWmonitor.t
type window = GLFWwindow.t
