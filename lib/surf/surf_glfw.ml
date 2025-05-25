include Glfw.Functions
include Glfw.Types
include Glfw.Defines

let null_monitor = Ctypes.from_voidp GLFWmonitor.t Ctypes.null
let null_window = Ctypes.from_voidp GLFWwindow.t Ctypes.null

let glfw_create_window width height title monitor_opt share_opt =
  let monitor = Option.value ~default:null_monitor monitor_opt in
  let share = Option.value ~default:null_window share_opt in
  let result =
    Glfw.Functions.glfw_create_window width height title monitor share
  in
  if Ctypes.to_voidp result = Ctypes.null then None else Some result
