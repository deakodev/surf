open Glfw.Types

type 'a abstract = 'a Ctypes.abstract
type 'a ptr = 'a abstract Ctypes_static.ptr

val null_monitor : GLFWmonitor.t ptr
val null_window : GLFWwindow.t ptr
val glfw_init : unit -> int

val glfw_create_window :
  int ->
  int ->
  string ->
  GLFWmonitor.t ptr ->
  GLFWwindow.t ptr ->
  GLFWwindow.t ptr
