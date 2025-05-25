(lang dune 3.17)

(using ctypes 0.3)

(name surf)

(license MIT)

(source
 (github deakodev/surf))

(authors "Zachary Deak")

(maintainers "deakodev@outlook.com")

(generate_opam_files false)

(package
 (name surf)
 (synopsis "OCaml-C bindings for glfw")
 (description "OCaml-C bindings for glfw")
 (depends
  (ocaml
   (>= 4.05))
  (ctypes
   (>= 0.14))
  base
  stdio))
