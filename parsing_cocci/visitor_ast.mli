type 'a combiner =
    {combiner_ident : Ast_cocci.ident -> 'a;
     combiner_expression : Ast_cocci.expression -> 'a;
     combiner_fullType : Ast_cocci.fullType -> 'a;
     combiner_typeC : Ast_cocci.typeC -> 'a;
     combiner_declaration : Ast_cocci.declaration -> 'a;
     combiner_initialiser : Ast_cocci.initialiser -> 'a;
     combiner_parameter : Ast_cocci.parameterTypeDef -> 'a;
     combiner_parameter_list : Ast_cocci.parameter_list -> 'a;
     combiner_rule_elem : Ast_cocci.rule_elem -> 'a;
     combiner_statement : Ast_cocci.statement -> 'a;
     combiner_case_line : Ast_cocci.case_line -> 'a;
     combiner_top_level : Ast_cocci.top_level -> 'a;
     combiner_anything : Ast_cocci.anything  -> 'a;
     combiner_expression_dots :
	 Ast_cocci.expression Ast_cocci.dots -> 'a;
     combiner_statement_dots :
	     Ast_cocci.statement Ast_cocci.dots -> 'a;
     combiner_declaration_dots :
		 Ast_cocci.declaration Ast_cocci.dots -> 'a}

type ('mc,'a) cmcode = 'a combiner -> 'mc Ast_cocci.mcode -> 'a
type ('cd,'a) ccode = 'a combiner -> ('cd -> 'a) -> 'cd -> 'a

val combiner :
    ('a -> 'a -> 'a) -> 'a ->
      (((string*string),'a) cmcode) ->
      ((string,'a) cmcode) ->
	((Ast_cocci.constant,'a) cmcode) ->
	  ((Ast_cocci.assignOp,'a) cmcode) ->
	    ((Ast_cocci.fixOp,'a) cmcode) ->
	      ((Ast_cocci.unaryOp,'a) cmcode) ->
		((Ast_cocci.binaryOp,'a) cmcode) ->
		  ((Ast_cocci.const_vol,'a) cmcode) ->
		    ((Ast_cocci.baseType,'a) cmcode) ->
		      ((Ast_cocci.sign,'a) cmcode) ->
			((Ast_cocci.structUnion,'a) cmcode) ->
			  ((Ast_cocci.storage,'a) cmcode) ->
			    ((Ast_cocci.expression Ast_cocci.dots,'a) ccode) ->
			      ((Ast_cocci.parameterTypeDef Ast_cocci.dots,'a) ccode) ->
				((Ast_cocci.statement Ast_cocci.dots,'a) ccode) ->
				((Ast_cocci.declaration Ast_cocci.dots,'a) ccode) ->
				  ((Ast_cocci.ident,'a) ccode) ->
				    ((Ast_cocci.expression,'a) ccode) ->
				      ((Ast_cocci.fullType,'a) ccode) ->
					((Ast_cocci.typeC,'a) ccode) ->
					  ((Ast_cocci.initialiser,'a) ccode) ->
					  ((Ast_cocci.parameterTypeDef,'a) ccode) ->
					    ((Ast_cocci.declaration,'a) ccode) ->
					      ((Ast_cocci.rule_elem,'a) ccode) ->
						((Ast_cocci.statement,'a) ccode) ->
						((Ast_cocci.case_line,'a) ccode) ->
						  ((Ast_cocci.top_level,'a) ccode) ->
						    ((Ast_cocci.anything,'a) ccode) ->
						      'a combiner

type 'a inout = 'a -> 'a (* for specifying the type of rebuilder *)

type rebuilder =
    {rebuilder_ident : Ast_cocci.ident inout;
      rebuilder_expression : Ast_cocci.expression inout;
      rebuilder_typeC : Ast_cocci.typeC inout;
      rebuilder_declaration : Ast_cocci.declaration inout;
      rebuilder_initialiser : Ast_cocci.initialiser inout;
      rebuilder_parameter : Ast_cocci.parameterTypeDef inout;
      rebuilder_parameter_list : Ast_cocci.parameter_list inout;
      rebuilder_statement : Ast_cocci.statement inout;
      rebuilder_case_line : Ast_cocci.case_line inout;
      rebuilder_rule_elem : Ast_cocci.rule_elem inout;
      rebuilder_top_level : Ast_cocci.top_level inout;
      rebuilder_expression_dots : Ast_cocci.expression Ast_cocci.dots inout;
      rebuilder_statement_dots : Ast_cocci.statement Ast_cocci.dots inout;
      rebuilder_declaration_dots : Ast_cocci.declaration Ast_cocci.dots inout;
      rebuilder_anything : Ast_cocci.anything inout}

type 'mc rmcode = 'mc Ast_cocci.mcode inout
type 'cd rcode = rebuilder -> ('cd inout) -> 'cd inout

val rebuilder :
    ((string*string) rmcode) ->
    (string rmcode) ->
      (Ast_cocci.constant rmcode) ->
	(Ast_cocci.assignOp rmcode) ->
	  (Ast_cocci.fixOp rmcode) ->
	    (Ast_cocci.unaryOp rmcode) ->
	      (Ast_cocci.binaryOp rmcode) ->
		(Ast_cocci.const_vol rmcode) ->
		  (Ast_cocci.baseType rmcode) ->
		    (Ast_cocci.sign rmcode) ->
		      (Ast_cocci.structUnion rmcode) ->
			(Ast_cocci.storage rmcode) ->
			  (Ast_cocci.expression Ast_cocci.dots rcode) ->
			    (Ast_cocci.parameterTypeDef Ast_cocci.dots rcode) ->
			      (Ast_cocci.statement Ast_cocci.dots rcode) ->
			      (Ast_cocci.declaration Ast_cocci.dots rcode) ->
				(Ast_cocci.ident rcode) ->
				  (Ast_cocci.expression rcode) ->
				    (Ast_cocci.fullType rcode) ->
				    (Ast_cocci.typeC rcode) ->
				      (Ast_cocci.initialiser rcode) ->
				      (Ast_cocci.parameterTypeDef rcode) ->
					(Ast_cocci.declaration rcode) ->
					  (Ast_cocci.rule_elem rcode) ->
					  (Ast_cocci.statement rcode) ->
					  (Ast_cocci.case_line rcode) ->
					    (Ast_cocci.top_level rcode) ->
					    (Ast_cocci.anything rcode) ->
					      rebuilder
