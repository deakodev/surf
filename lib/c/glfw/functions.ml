module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Glfw_types_generated

  let glfw_init = foreign "glfwInit" (void @-> returning int)

  let glfw_window_hint =
    foreign "glfwWindowHint" (int @-> int @-> returning void)

  let glfw_create_window =
    foreign "glfwCreateWindow"
      (int @-> int @-> string @-> ptr GLFWmonitor.t @-> ptr GLFWwindow.t
      @-> returning (ptr GLFWwindow.t))

  let glfw_error_callback =
    Foreign.funptr Ctypes_static.(int @-> string @-> returning void)

  let glfw_set_error_callback =
    foreign "glfwSetErrorCallback" (glfw_error_callback @-> returning void)

  let glfw_window_close_callback =
    Foreign.funptr Ctypes_static.(ptr GLFWwindow.t @-> returning void)

  let glfw_set_window_close_callback =
    foreign "glfwSetWindowCloseCallback"
      (ptr GLFWwindow.t @-> glfw_window_close_callback @-> returning void)

  let glfw_poll_events = foreign "glfwPollEvents" (void @-> returning void)
end
