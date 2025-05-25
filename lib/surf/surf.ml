include Glfw.Functions
include Glfw.Types

type 'a abstract = 'a Ctypes.abstract
type 'a ptr = 'a abstract Ctypes_static.ptr

let null_monitor = Ctypes.from_voidp GLFWmonitor.t Ctypes.null
let null_window = Ctypes.from_voidp GLFWwindow.t Ctypes.null
