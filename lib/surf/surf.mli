(** The graphics API to use when creating the window. *)
type graphics_api =
  | OpenGL (* OpenGL graphics backend. *)
  | Vulkan (* Vulkan graphics backend. *)

type window_desc = {
  width : int; (* Width of the window in pixels. *)
  height : int; (* Height of the window in pixels. *)
  title : string; (* Title to display in the window’s title bar. *)
  graphics_api : graphics_api; (* The graphics API used by GLFW. *)
}
(** Description of a window to be created. *)

val window_init : window_desc -> unit
(** [window_init desc] initializes GLFW and creates a window based on the given
    [desc].

    This sets required glfw window hints and callbacks. If the window cannot be
    created or GLFW initialization fails, it raises a [Failure]. *)

val window_should_close : unit -> bool
(** [window_should_close ()] returns [true] if the glfw window has been
    requested to close. *)

val window_poll_events : unit -> unit
(** [window_poll_events ()] polls for and processes pending glfw window events.
*)
