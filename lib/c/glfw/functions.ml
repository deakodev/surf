module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F
  open Glfw_types_generated

  (* --- Initialization --- *)
  let glfw_init = foreign "glfwInit" (void @-> returning int)

  let glfw_window_hint =
    foreign "glfwWindowHint" (int @-> int @-> returning void)

  (* --- Window Creation --- *)
  let glfw_create_window =
    foreign "glfwCreateWindow"
      (int @-> int @-> string @-> GLFWmonitor.t_typ @-> GLFWwindow.t_typ
     @-> returning GLFWwindow.t_typ)

  let glfw_make_context_current =
    foreign "glfwMakeContextCurrent" (GLFWwindow.t_typ @-> returning void)

  (* --- Callbacks --- *)
  let glfw_error_callback =
    Foreign.funptr Ctypes_static.(int @-> string @-> returning void)

  let glfw_set_error_callback =
    foreign "glfwSetErrorCallback" (glfw_error_callback @-> returning void)

  let glfw_window_close_callback =
    Foreign.funptr Ctypes_static.(GLFWwindow.t_typ @-> returning void)

  let glfw_set_window_close_callback =
    foreign "glfwSetWindowCloseCallback"
      (GLFWwindow.t_typ @-> glfw_window_close_callback @-> returning void)

  (* --- Main Loop Utilities --- *)
  let glfw_poll_events = foreign "glfwPollEvents" (void @-> returning void)

  let glfw_swap_buffers =
    foreign "glfwSwapBuffers" (GLFWwindow.t_typ @-> returning void)

  (* --- Cleanup --- *)
  let glfw_destroy_window =
    foreign "glfwDestroyWindow" (GLFWwindow.t_typ @-> returning void)

  let glfw_terminate = foreign "glfwTerminate" (void @-> returning void)
end
