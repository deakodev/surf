module Types (T : Ctypes.TYPE) = struct
  open T

  module GLFWwindow = struct
    type t

    let t : t Ctypes.abstract typ =
      abstract ~name:"GLFWwindow" ~size:0 ~alignment:0
  end

  module GLFWmonitor = struct
    type t

    let t : t Ctypes.abstract typ =
      abstract ~name:"GLFWmonitor" ~size:0 ~alignment:0
  end
end
