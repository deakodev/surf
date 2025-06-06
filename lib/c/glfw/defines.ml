let glfw_client_api = 0x00022001
let glfw_no_api = 0x00000000
let glfw_opengl_api = 0x00030001

let glfw_error_code_to_string code =
  match code with
  | 0x00010001 -> "GLFW_NOT_INITIALIZED"
  | 0x00010002 -> "GLFW_NO_CURRENT_CONTEXT"
  | 0x00010003 -> "GLFW_INVALID_ENUM"
  | 0x00010004 -> "GLFW_INVALID_VALUE"
  | 0x00010005 -> "GLFW_OUT_OF_MEMORY"
  | 0x00010006 -> "GLFW_API_UNAVAILABLE"
  | 0x00010007 -> "GLFW_VERSION_UNAVAILABLE"
  | 0x00010008 -> "GLFW_PLATFORM_ERROR"
  | 0x00010009 -> "GLFW_FORMAT_UNAVAILABLE"
  | 0x0001000A -> "GLFW_NO_WINDOW_CONTEXT"
  | 0x0001000B -> "GLFW_FEATURE_UNAVAILABLE"
  | 0x0001000C -> "GLFW_FEATURE_UNSUPPORTED"
  | _ -> Printf.sprintf "Unknown error code: %d" code
