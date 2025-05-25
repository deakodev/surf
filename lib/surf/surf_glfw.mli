open Glfw.Types
open Surf_ctypes

val glfw_init : unit -> int

val glfw_create_window :
  int ->
  int ->
  string ->
  GLFWmonitor.t ptr_opt ->
  GLFWwindow.t ptr_opt ->
  GLFWwindow.t ptr_opt
