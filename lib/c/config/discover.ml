module C = Configurator.V1

let rec link ?(flag = "-l") = function
  | lib :: libs -> "-cclib" :: (flag ^ " " ^ lib) :: link ~flag libs
  | [] -> []

let lib_flags c =
  match C.ocaml_config_var c "system" with
  | Some ("linux" | "linux_elf" | "elf") ->
      link
        [
          "GL";
          "X11";
          "Xrandr";
          "Xi";
          "Xxf86vm";
          "Xcursor";
          "Xinerama";
          "pthread";
          "dl";
        ]
  | Some system -> C.die "unsupported system: %s" system
  | None -> C.die "unsupported system"

let main c = lib_flags c |> C.Flags.write_sexp "lib_flags.sexp"
let () = C.main ~name:"surf" main
