(lang dune 3.17)
(using ctypes 0.3)

(name bedbug)
(license Apache-2.0)
(source (github deakodev/bedbug))
(authors "Zachary Deak")
(maintainers "deakodev@outlook.com")

(generate_opam_files false)

(package
 (name bedbug)
 (synopsis "OCaml-C Game Engine")
 (description "OCaml-C Game Engine")
 (depends 
  (ocaml (>= 4.05))
  (ctypes (>= 0.14))))