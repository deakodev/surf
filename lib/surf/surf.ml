let window_init desc = Surf_window.init desc
let window_close window = Surf_window.close window
let window_should_close window = Surf_window.should_close window
let window_poll_events () = Surf_window.poll_events ()
