val window_init : Surf_window.desc -> Surf_window.t
(** [window_init desc] initializes GLFW and returns a window based on the given
    [desc].

    This sets required glfw window hints and callbacks. If the window cannot be
    created or GLFW initialization fails, it raises a [Failure]. *)

val window_should_close : Surf_window.t -> bool
(** [window_should_close ()] returns [true] if the glfw window has been
    requested to close. *)

val window_poll_events : unit -> unit
(** [window_poll_events ()] polls for and processes pending glfw window events.
*)
