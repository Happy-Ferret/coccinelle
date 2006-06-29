open Common open Commonop

(* It is not the same thing than Unparse_c. Unparse_c correctly insert spaces, comments,
   and so on, but that means that Unparse_c cannot pretty print an expression independently, 
   and that Unparse_c need also the original file to be able to unparse, so
   for debugging purpose Unparse_c is not practical, hence this module.
*)

open Ast_c

let pr_elem ((info,(mcode,env))) = 
  let s = info.str in
  Format.print_string s


let rec pp_expression x =
  match x with
  | Constant (String s),        typ, is     -> is +> List.iter pr_elem
  | Ident (c),         typ,[i]     -> pr_elem i
  | Constant (c),         typ,[i]     -> pr_elem i
  | FunCall  (e, es),     typ,[i1;i2] -> 
        pp_expression e; pr_elem i1; 
        es +> List.iter (fun (e, opt) -> 
          (match opt with
          | [] -> ()
          | [i] -> pr_elem i
          | x -> error_cant_have x
          );
          (match e with
          | Left e -> pp_expression e
          | Right (returnType, (sto, iisto)) -> raise Todo
          );
            );
        pr_elem i2;
  | _ -> raise Todo

and pp_binding = function
  | MetaId        s -> Format.print_string ("id " ^ s)
  | MetaFunc      s -> Format.print_string ("func " ^ s)
  | MetaLocalFunc s -> Format.print_string ("localfunc " ^ s)
  | MetaExpr      expr -> pp_expression expr
  | MetaExprList  expr_list -> raise Todo
  | MetaType      typ -> raise Todo
  | MetaStmt      statement -> raise Todo
  | MetaParam     params -> raise Todo
  | MetaParamList params -> raise Todo
