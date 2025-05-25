type graphics_api = OpenGL | Vulkan

type window_desc = {
  width : int;
  height : int;
  title : string;
  graphics_api : graphics_api;
}

val window_init : window_desc -> unit
