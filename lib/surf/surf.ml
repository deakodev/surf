let window_init desc : Surf_window.t = Surf_window.init desc
let window_should_close (w : Surf_window.t) = Surf_window.should_close w
let window_poll_events () = Surf_window.poll_events ()
