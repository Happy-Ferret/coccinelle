open Common

class virtual objet =
object(o:'o)
  method invariant: unit -> unit = fun () -> 
    raise Todo
  (* method check: unit -> unit = fun () -> 
    assert(o#invariant());
  *)

  method string_of: unit -> string = 
    raise Todo
  method debug: unit -> unit = 
    raise Todo

  method misc_op_hook: unit -> 'o = 
    raise Todo

  method misc_op_hook2: unit = 
    ()
end
