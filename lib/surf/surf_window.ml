open Surf_glfw

type t = {
  handle : Surf_glfw.window;  (** The raw GLFW window handle. *)
  mutable running : bool;  (** Whether the window is still open. *)
}

type graphics_api = OpenGL | Vulkan

type desc = {
  width : int;
  height : int;
  title : string;
  graphics_api : graphics_api;
}

let error_callback code desc =
  let error = glfw_error_code_to_string code in
  Echo.error "[%s]: %s\n%!" error desc

let window_callbacks_set (w : t) =
  let close_callback _ =
    Echo.info "Closing window...";
    w.running <- false
  in
  glfw_set_window_close_callback w.handle close_callback

let graphics_api_hint = function
  | OpenGL -> glfw_window_hint glfw_client_api glfw_opengl_api
  | Vulkan -> glfw_window_hint glfw_client_api glfw_no_api

let init desc : t =
  if glfw_init () = 1 then (
    graphics_api_hint desc.graphics_api;
    glfw_set_error_callback error_callback;
    match glfw_create_window desc.width desc.height desc.title None None with
    | Some glfw_handle ->
        Echo.info "Window created!";
        let window = { handle = glfw_handle; running = true } in
        window_callbacks_set window;
        window
    | None -> failwith "Failed to create window!")
  else failwith "GLFW init failed!"

let should_close (w : t) = not w.running
let poll_events () = glfw_poll_events ()
