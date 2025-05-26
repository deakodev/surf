module Types (T : Ctypes.TYPE) = struct
  open Ctypes

  module type S = sig
    val name : string
  end

  module MakeOpaque (M : S) = struct
    type c
    type t = c abstract ptr

    let c_typ : c abstract typ = abstract ~name:M.name ~size:0 ~alignment:0
    let t_typ : t typ = ptr c_typ
    let null : t = from_voidp c_typ null
    let is_null (x : t) = to_voidp x = Ctypes.null
  end

  module GLFWwindow = MakeOpaque (struct
    let name = "GLFWwindow"
  end)

  module GLFWmonitor = MakeOpaque (struct
    let name = "GLFWmonitor"
  end)
end
