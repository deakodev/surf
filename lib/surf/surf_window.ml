open Surf_glfw
open Surf_graphics
open GL

type t = {
  handle : Surf_glfw.window;  (** The raw GLFW window handle. *)
  mutable running : bool;  (** Whether the window is still open. *)
}

type desc = {
  width : int;
  height : int;
  title : string;
  graphics_api : graphics_api;
}

let error_callback code desc =
  let error = glfw_error_code_to_string code in
  Echo.error "[%s]: %s\n%!" error desc

let window_callbacks_set window =
  let close_callback _ =
    Echo.info "Closing window...";
    window.running <- false
  in
  glfw_set_window_close_callback window.handle close_callback

let init desc : t =
  if glfw_init () = 1 then (
    let graphics_api_callback = Surf_graphics.api_hint desc.graphics_api in
    glfw_set_error_callback error_callback;
    match glfw_create_window desc.width desc.height desc.title None None with
    | Some glfw_handle ->
        Echo.info "Window created!";
        graphics_api_callback glfw_handle;
        let window = { handle = glfw_handle; running = true } in
        window_callbacks_set window;
        window
    | None -> failwith "Failed to create window!")
  else failwith "GLFW init failed!"

let close window = glfw_shutdown window.handle
let should_close window = not window.running

let render_frame window =
  glClearColor ~r:1.0 ~g:0.0 ~b:0.0 ~a:1.0;
  glClear ~mask:[ GL_COLOR_BUFFER_BIT ];
  glfw_swap_buffers window.handle

let poll_events () = glfw_poll_events ()
