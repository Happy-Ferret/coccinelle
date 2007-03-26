type isomorphism = Ast_cocci.metavar list * Ast0_cocci.anything list list

val apply_isos :
    isomorphism list -> Ast0_cocci.rule -> string (* rule name *) ->
      Ast_cocci.metavar list * Ast0_cocci.rule

val rebuild_mcode : int option -> Visitor_ast0.rebuilder
