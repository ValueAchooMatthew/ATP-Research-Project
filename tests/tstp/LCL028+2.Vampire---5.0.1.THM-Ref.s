
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : LCL028+2 : TPTP v9.2.1. Released v9.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n018.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:36:37 PM UTC 2026

% Result   : Theorem 83.50s 14.73s
% Output   : Refutation 83.50s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   57
%            Number of leaves      :    5
% Syntax   : Number of formulae    :  139 (  22 unt;   2 def)
%            Number of atoms       :  357 (   0 equ)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :  440 ( 222   ~; 214   |;   1   &)
%                                         (   2 ;   1  =>;   0  )
%            Maximal formula depth :   18 (   7 avg)
%            Maximal term depth    :   12 (   2 avg)
%            Number of predicates  :    4 (   3 usr;   3 prp; 0-1 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :  487 (   0 sgn 487   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( ( is_a_theorem(implies(X0,X1))
        & is_a_theorem(X0) )
     => is_a_theorem(X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',condensed_detachment) ).

fof(f2,axiom,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14] : is_a_theorem(implies(implies(implies(implies(implies(X0,implies(X1,X0)),implies(implies(X2,implies(X3,implies(X4,X3))),X5)),X5),implies(implies(implies(implies(implies(implies(X6,implies(X7,X6)),implies(implies(implies(implies(X8,falsehood),falsehood),X8),X9)),X9),implies(implies(implies(X10,implies(X11,X12)),implies(implies(X10,X11),implies(X10,X12))),X13)),X13),X14)),X14)),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',f2) ).

fof(f3,conjecture,
    is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',f3) ).

fof(f4,negated_conjecture,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(negated_conjecture,[status(cth)],[f3]) ).

fof(f5,plain,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(flattening,[],[f4]) ).

fof(f6,plain,
    ! [X0,X1] :
      ( is_a_theorem(X1)
      | ~ is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(X0) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f7,plain,
    ! [X0,X1] :
      ( is_a_theorem(X1)
      | ~ is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(X0) ),
    inference(flattening,[],[f6]) ).

fof(f8,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(X0,X1))
      | is_a_theorem(X1)
      | ~ is_a_theorem(X0) ),
    inference(cnf_transformation,[],[f7]) ).

fof(f9,plain,
    ! [X2,X3,X10,X0,X11,X1,X8,X6,X9,X7,X14,X4,X5,X12,X13] : is_a_theorem(implies(implies(implies(implies(implies(X0,implies(X1,X0)),implies(implies(X2,implies(X3,implies(X4,X3))),X5)),X5),implies(implies(implies(implies(implies(implies(X6,implies(X7,X6)),implies(implies(implies(implies(X8,falsehood),falsehood),X8),X9)),X9),implies(implies(implies(X10,implies(X11,X12)),implies(implies(X10,X11),implies(X10,X12))),X13)),X13),X14)),X14)),
    inference(cnf_transformation,[],[f2]) ).

fof(f10,plain,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(cnf_transformation,[],[f5]) ).

fof(f11,plain,
    ! [X2,X3,X10,X0,X11,X1,X8,X6,X9,X7,X14,X4,X5,X12,X13] :
      ( ~ is_a_theorem(implies(implies(implies(implies(X1,implies(X2,X1)),implies(implies(X3,implies(X4,implies(X5,X4))),X6)),X6),implies(implies(implies(implies(implies(implies(X7,implies(X8,X7)),implies(implies(implies(implies(X9,falsehood),falsehood),X9),X10)),X10),implies(implies(implies(X11,implies(X12,X13)),implies(implies(X11,X12),implies(X11,X13))),X14)),X14),X0)))
      | is_a_theorem(X0) ),
    inference(resolution,[],[f9,f8]) ).

fof(f12,plain,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(X1,X0))),
    inference(resolution,[],[f11,f9]) ).

fof(f13,plain,
    ! [X2,X3,X0,X1,X4,X5] : is_a_theorem(implies(implies(implies(X0,implies(X1,X0)),implies(implies(X2,implies(X3,implies(X4,X3))),X5)),X5)),
    inference(resolution,[],[f12,f11]) ).

fof(f14,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(X1)
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f12,f8]) ).

fof(f16,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(X2,X1)))),
    inference(resolution,[],[f14,f12]) ).

fof(f18,plain,
    ! [X2,X3,X0,X1,X4,X5] :
      ( ~ is_a_theorem(implies(implies(X1,implies(X2,X1)),implies(implies(X3,implies(X4,implies(X5,X4))),X0)))
      | is_a_theorem(X0) ),
    inference(resolution,[],[f13,f8]) ).

fof(f19,plain,
    ! [X2,X3,X0,X1,X6,X4,X5] : is_a_theorem(implies(X0,implies(implies(implies(X1,implies(X2,X1)),implies(implies(X3,implies(X4,implies(X5,X4))),X6)),X6))),
    inference(resolution,[],[f13,f14]) ).

fof(f21,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(X2,implies(X3,X2))))),
    inference(resolution,[],[f18,f13]) ).

fof(f27,plain,
    ! [X2,X3,X0,X1,X8,X6,X7,X4,X5] : is_a_theorem(implies(X0,implies(implies(implies(implies(implies(X1,implies(X2,X1)),implies(implies(implies(implies(X3,falsehood),falsehood),X3),X4)),X4),implies(implies(implies(X5,implies(X6,X7)),implies(implies(X5,X6),implies(X5,X7))),X8)),X8))),
    inference(resolution,[],[f16,f11]) ).

fof(f31,plain,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(implies(implies(X1,falsehood),falsehood),X1))),
    inference(resolution,[],[f19,f11]) ).

fof(f38,definition,
    ( spl0_1
   ! [X1] : ~ is_a_theorem(X1) ),
    introduced(definition,[new_symbols(naming,[spl0_1])],[avatar_definition]) ).

fof(f39,plain,
    ( ! [X1] : ~ is_a_theorem(X1)
    | ~ spl0_1 ),
    inference(avatar_component_clause,[],[f38]) ).

fof(f67,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(X0,implies(implies(X1,implies(X2,X3)),implies(implies(X1,X2),implies(X1,X3))))),
    inference(resolution,[],[f27,f18]) ).

fof(f92,plain,
    ( $false
    | ~ spl0_1 ),
    inference(unit_resulting_resolution,[],[f14,f9,f39]) ).

fof(f141,plain,
    ~ spl0_1,
    inference(avatar_contradiction_clause,[],[f92]) ).

fof(f143,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X1)))),
    inference(resolution,[],[f67,f18]) ).

fof(f144,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X2))))
      | ~ is_a_theorem(X3) ),
    inference(resolution,[],[f67,f8]) ).

fof(f147,definition,
    ( spl0_4
   ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X2)))) ),
    introduced(definition,[new_symbols(naming,[spl0_4])],[avatar_definition]) ).

fof(f148,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X2))))
    | ~ spl0_4 ),
    inference(avatar_component_clause,[],[f147]) ).

fof(f149,plain,
    ( spl0_1
    | spl0_4 ),
    inference(avatar_split_clause,[],[f144,f147,f38]) ).

fof(f151,plain,
    ( ! [X2,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X0,X2)))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f148,f8]) ).

fof(f155,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,X2)))
        | is_a_theorem(implies(X0,X2))
        | ~ is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f151,f8]) ).

fof(f156,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(X3,implies(implies(X0,X1),implies(X0,X2))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f151,f14]) ).

fof(f167,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(X0,implies(X1,X2)))
      | ~ is_a_theorem(implies(X0,X2)) ),
    inference(resolution,[],[f143,f8]) ).

fof(f171,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,implies(X1,X0)),X2))
      | is_a_theorem(X2) ),
    inference(resolution,[],[f167,f18]) ).

fof(f199,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,X1)))
        | is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f155,f148]) ).

fof(f210,plain,
    ( ! [X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,falsehood),falsehood)))
        | is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f155,f31]) ).

fof(f213,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(X0,implies(implies(X1,X2),implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f155,f67]) ).

fof(f219,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | is_a_theorem(implies(X0,implies(X1,X3)))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f213,f155]) ).

fof(f236,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(implies(X1,X0),X2)),implies(X0,X2)))
    | ~ spl0_4 ),
    inference(resolution,[],[f199,f16]) ).

fof(f289,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X2,X0),X1)))
        | is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f236,f8]) ).

fof(f295,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),implies(X2,X1))))
    | ~ spl0_4 ),
    inference(resolution,[],[f289,f67]) ).

fof(f296,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X0,X2))))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f289,f213]) ).

fof(f297,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X1,implies(X0,X2)))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f289,f156]) ).

fof(f312,plain,
    ( ! [X2,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X0,X2)))
        | ~ is_a_theorem(implies(X1,X2)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f295,f8]) ).

fof(f317,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X0,implies(X1,X2)),implies(X0,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f297,f148]) ).

fof(f321,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(implies(X0,X1),implies(X2,X1))))
    | ~ spl0_4 ),
    inference(resolution,[],[f297,f143]) ).

fof(f322,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X1,X2),implies(X0,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f297,f295]) ).

fof(f348,plain,
    ( ! [X2,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X2,X1)))
        | ~ is_a_theorem(implies(X2,X0)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f322,f8]) ).

fof(f425,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,X0),X2)))
        | is_a_theorem(implies(implies(X1,X0),implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f312,f296]) ).

fof(f428,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X2,X0))
        | is_a_theorem(implies(X2,X1))
        | ~ is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f312,f8]) ).

fof(f433,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(implies(implies(X0,X1),implies(X0,X2)),X3))
        | is_a_theorem(implies(implies(X0,implies(X1,X2)),X3)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f428,f148]) ).

fof(f442,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X2,X0),X1))
        | is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f428,f12]) ).

fof(f444,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X2,X3),X1))
        | is_a_theorem(implies(X0,X1))
        | ~ is_a_theorem(implies(X0,X3)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f428,f167]) ).

fof(f531,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(implies(X1,implies(X0,X2)),implies(X1,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f317,f442]) ).

fof(f741,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(implies(X3,implies(X4,X3)),implies(X0,implies(X1,X2))))
        | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f171,f213]) ).

fof(f766,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f219,f21]) ).

fof(f775,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X3,X2)))
        | ~ is_a_theorem(implies(X0,implies(X1,X3)))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f219,f167]) ).

fof(f794,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X3,implies(X0,X1))))
        | is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X3,implies(X0,X2)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f775,f148]) ).

fof(f856,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X3),implies(X0,X2))))
        | ~ is_a_theorem(implies(X0,implies(X3,X1))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f794,f156]) ).

fof(f880,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X2,X3),implies(implies(X0,X1),implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f856,f442]) ).

fof(f892,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X2,X3)))
        | is_a_theorem(implies(implies(X0,X1),implies(X0,X3)))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f856,f8]) ).

fof(f900,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,X2),X1)))
        | is_a_theorem(implies(implies(X1,X2),implies(X0,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f880,f289]) ).

fof(f945,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(implies(X2,falsehood),falsehood))))
        | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f892,f31]) ).

fof(f979,plain,
    ( ! [X0,X1] : is_a_theorem(implies(implies(X0,falsehood),implies(X0,X1)))
    | ~ spl0_4 ),
    inference(resolution,[],[f945,f16]) ).

fof(f1007,plain,
    ( ! [X2,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X0,X2),X1))
        | is_a_theorem(implies(implies(X0,falsehood),X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f979,f428]) ).

fof(f1517,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(implies(X3,implies(X4,X3)),implies(X1,X2)))
        | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f741,f167]) ).

fof(f1663,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X1,implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f1517,f156]) ).

fof(f1754,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,falsehood),implies(X1,implies(X0,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f1007,f12]) ).

fof(f1844,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X2),implies(implies(X0,falsehood),X2)))
    | ~ spl0_4 ),
    inference(resolution,[],[f1754,f900]) ).

fof(f1917,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),falsehood),implies(implies(X0,falsehood),X2)))
    | ~ spl0_4 ),
    inference(resolution,[],[f1844,f1007]) ).

fof(f2003,plain,
    ( ! [X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),falsehood),X0))
    | ~ spl0_4 ),
    inference(resolution,[],[f210,f1917]) ).

fof(f2029,plain,
    ( ! [X2,X0,X1] :
        ( is_a_theorem(implies(implies(implies(X0,X1),falsehood),X2))
        | ~ is_a_theorem(implies(X0,X2)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f2003,f428]) ).

fof(f2044,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(implies(implies(X1,X2),falsehood),X1)))
    | ~ spl0_4 ),
    inference(resolution,[],[f2003,f14]) ).

fof(f2048,plain,
    ( ~ is_a_theorem(implies(implies(implies(a,b),implies(c,falsehood)),implies(implies(falsehood,a),implies(c,a))))
    | ~ spl0_4 ),
    inference(resolution,[],[f2029,f10]) ).

fof(f3272,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f433,f1663]) ).

fof(f3319,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ is_a_theorem(implies(implies(implies(X0,X1),implies(X0,X2)),implies(X3,implies(X4,X5))))
        | is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X3,X4),implies(X3,X5)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f433,f213]) ).

fof(f3335,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X3,X1),implies(implies(X0,X3),implies(X0,X2))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3272,f442]) ).

fof(f3382,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,X2)))
        | is_a_theorem(implies(implies(X0,X3),implies(X0,X2)))
        | ~ is_a_theorem(implies(X3,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3335,f8]) ).

fof(f3462,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X3))))
        | ~ is_a_theorem(implies(X1,implies(X0,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3382,f321]) ).

fof(f3481,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( is_a_theorem(implies(implies(X0,implies(X2,X1)),implies(implies(X0,X2),implies(X4,X3))))
        | ~ is_a_theorem(implies(implies(X0,X1),implies(implies(X0,X2),X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3462,f433]) ).

fof(f4006,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(implies(X0,X1),implies(implies(X0,X2),X3)))
        | is_a_theorem(implies(implies(X2,X1),implies(implies(X0,X2),implies(X4,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3481,f442]) ).

fof(f4029,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(implies(X0,X1),implies(implies(X0,X2),X3)))
        | is_a_theorem(implies(implies(X0,X2),implies(X4,X3)))
        | ~ is_a_theorem(implies(X0,implies(X2,X1))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f3481,f8]) ).

fof(f4039,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X3))))
        | is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f4029,f148]) ).

fof(f4148,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(X2,implies(X0,X1))))
    | ~ spl0_4 ),
    inference(resolution,[],[f4039,f321]) ).

fof(f4178,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,implies(X1,X2))),implies(X0,implies(X1,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f4148,f425]) ).

fof(f4357,plain,
    ( ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(implies(X2,X0),implies(X3,implies(X2,X1)))))
    | ~ spl0_4 ),
    inference(resolution,[],[f4006,f148]) ).

fof(f4422,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(implies(X2,X0),implies(X2,X1))))
    | ~ spl0_4 ),
    inference(resolution,[],[f4357,f296]) ).

fof(f6906,plain,
    ( ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,implies(X0,X2))),implies(implies(X0,X1),implies(X0,X2))))
    | ~ spl0_4 ),
    inference(resolution,[],[f4178,f433]) ).

fof(f7121,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X1,implies(X2,X3)),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f348,f433]) ).

fof(f7411,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X2,X3),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f7121,f442]) ).

fof(f9005,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X3))))
        | ~ is_a_theorem(implies(X1,implies(X2,implies(X0,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f531,f3382]) ).

fof(f9027,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | is_a_theorem(implies(X0,implies(X2,implies(X1,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9005,f442]) ).

fof(f9135,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9027,f151]) ).

fof(f9221,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | is_a_theorem(implies(X1,implies(X2,implies(X0,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9135,f442]) ).

fof(f9277,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | is_a_theorem(implies(X2,implies(X0,X3)))
        | ~ is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9135,f8]) ).

fof(f9567,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X3,X2)))
        | ~ is_a_theorem(implies(X1,implies(X0,X3)))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9277,f156]) ).

fof(f9706,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,X2),X1)))
        | is_a_theorem(implies(implies(X1,X2),implies(X0,X3)))
        | ~ is_a_theorem(implies(X1,implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9567,f151]) ).

fof(f9878,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(X2,X3)))
        | ~ is_a_theorem(implies(X0,implies(X1,X3)))
        | ~ is_a_theorem(implies(X2,X0)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9706,f167]) ).

fof(f10431,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,X2)))
        | ~ is_a_theorem(implies(X3,X0))
        | is_a_theorem(implies(X3,X2))
        | ~ is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f9878,f8]) ).

fof(f11989,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X3,X1),X2)))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f444,f236]) ).

fof(f12014,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(X0,implies(implies(X1,X2),implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X2,implies(X1,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f444,f6906]) ).

fof(f12016,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(X0,implies(implies(X1,X2),implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f444,f4422]) ).

fof(f12126,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(implies(X0,implies(X1,X0)),implies(X2,implies(X3,X4))))
        | is_a_theorem(implies(implies(X3,X2),implies(X3,X4))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f12014,f171]) ).

fof(f12147,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X2,X1),implies(X2,implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f12014,f9221]) ).

fof(f13041,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( is_a_theorem(implies(implies(X1,implies(X3,X2)),implies(implies(X1,X3),implies(X0,X4))))
        | ~ is_a_theorem(implies(X0,implies(implies(X1,X2),implies(implies(X1,X3),X4)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f12147,f433]) ).

fof(f14642,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X3,X1),implies(X0,implies(X3,X2))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f12016,f297]) ).

fof(f14681,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,X2),X3)))
        | is_a_theorem(implies(implies(X2,X0),implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f14642,f12126]) ).

fof(f15899,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(X0,implies(implies(X1,X2),implies(implies(X1,X3),X4))))
        | is_a_theorem(implies(implies(X1,X3),implies(X0,X4)))
        | ~ is_a_theorem(implies(X1,implies(X3,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f13041,f8]) ).

fof(f16276,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ is_a_theorem(implies(X2,implies(implies(X0,X4),X3)))
        | ~ is_a_theorem(implies(X0,implies(X1,X4)))
        | is_a_theorem(implies(implies(X0,X1),implies(X2,X3))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f15899,f766]) ).

fof(f41552,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(implies(X0,X2),implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f16276,f317]) ).

fof(f41767,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
        | is_a_theorem(implies(implies(X0,X2),implies(X0,X3)))
        | ~ is_a_theorem(implies(X0,X1)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f41552,f8]) ).

fof(f53334,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f41767,f67]) ).

fof(f53382,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X3))))
        | ~ is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f53334,f433]) ).

fof(f53502,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X3))))
        | is_a_theorem(implies(implies(X1,X2),implies(implies(X0,X1),implies(X0,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f53382,f442]) ).

fof(f53670,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),implies(X2,X3))))
        | ~ is_a_theorem(implies(X2,implies(X0,implies(X1,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f53502,f151]) ).

fof(f53799,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X1,implies(X1,X2)),implies(X1,implies(X0,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f53670,f14681]) ).

fof(f57336,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X1,implies(X1,X2)),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f53799,f9027]) ).

fof(f58064,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X1,implies(X1,X2)))
        | is_a_theorem(implies(X0,implies(X1,X3)))
        | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f57336,f8]) ).

fof(f58164,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,implies(X1,implies(implies(X3,X1),X2))))
        | is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58064,f16]) ).

fof(f58337,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X2,implies(implies(X3,X2),X0)))
        | is_a_theorem(implies(implies(X0,X1),implies(X2,X1))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58164,f7411]) ).

fof(f58443,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(implies(X0,X1),X2),implies(X3,X2)))
        | ~ is_a_theorem(implies(X0,implies(X3,X1))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58337,f156]) ).

fof(f58630,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X2,X3)),implies(implies(X1,X0),implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58443,f3319]) ).

fof(f58895,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X2,X3)),implies(X0,implies(X1,X3))))
        | ~ is_a_theorem(implies(X0,implies(X1,X2))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58630,f11989]) ).

fof(f76476,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(implies(X0,X1),implies(X2,X0)))
        | is_a_theorem(implies(implies(X0,implies(X1,X3)),implies(implies(X0,X1),implies(X2,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f58895,f433]) ).

fof(f76972,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X3,X2))))
        | ~ is_a_theorem(implies(X0,implies(X1,X0)))
        | ~ is_a_theorem(implies(X3,X0)) )
    | ~ spl0_4 ),
    inference(resolution,[],[f76476,f9878]) ).

fof(f77018,plain,
    ( ! [X2,X3,X0,X1] :
        ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X3,X2))))
        | ~ is_a_theorem(implies(X3,X0)) )
    | ~ spl0_4 ),
    inference(forward_subsumption_resolution,[],[f76972,f12]) ).

fof(f77060,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ is_a_theorem(implies(X0,X1))
        | is_a_theorem(implies(implies(X2,X3),implies(implies(X1,X2),implies(X0,X3)))) )
    | ~ spl0_4 ),
    inference(resolution,[],[f77018,f442]) ).

fof(f77450,plain,
    ( ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(implies(X2,X3),X0),implies(X3,X1))))
    | ~ spl0_4 ),
    inference(resolution,[],[f77060,f12]) ).

fof(f77627,plain,
    ( ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X2),implies(implies(X2,X3),implies(X1,X3))))
    | ~ spl0_4 ),
    inference(resolution,[],[f77450,f297]) ).

fof(f77955,plain,
    ( ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(implies(X0,X2),X3),implies(X1,X3))))
    | ~ spl0_4 ),
    inference(resolution,[],[f77627,f433]) ).

fof(f78141,plain,
    ( $false
    | ~ spl0_4 ),
    inference(unit_resulting_resolution,[],[f10431,f2048,f2044,f143,f77955]) ).

fof(f78307,plain,
    ~ spl0_4,
    inference(avatar_contradiction_clause,[],[f78141]) ).

cnf(s36,plain,
    ~ spl0_1,
    inference(sat_conversion,[],[f141]) ).

cnf(s37,plain,
    ( spl0_1
    | spl0_4 ),
    inference(sat_conversion,[],[f149]) ).

cnf(s9923,plain,
    ~ spl0_4,
    inference(sat_conversion,[],[f78307]) ).

cnf(s9924,plain,
    spl0_1,
    inference(rat,[],[s37,s9923]) ).

cnf(s9925,plain,
    $false,
    inference(rat,[],[s36,s9924]) ).

fof(f78308,plain,
    $false,
    inference(avatar_sat_refutation,[],[s9925]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : LCL028+2 : TPTP v9.2.1. Released v9.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.16/0.33  % Computer   : n018.cluster.edu
% 0.16/0.33  % Model      : x86_64 x86_64
% 0.16/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.16/0.33  % Memory     : 8042.1875MB
% 0.16/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.16/0.33  % CPULimit   : 300
% 0.16/0.33  % WCLimit    : 300
% 0.16/0.33  % DateTime   : Thu Apr 30 19:46:17 EDT 2026
% 0.16/0.33  % CPUTime    : 
% 0.16/0.34  This is a FOF_THM_RFO_NEQ problem
% 0.16/0.35  Running first-order theorem proving
% 0.16/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.47/0.64  % (15630)Detected formulas, will run a generic FOF schedule.
% 0.49/0.76  % (15638)dis-21_1_sil=8000:lcm=predicate:random_seed=1096290076:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.49/0.78  % (15636)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=2147556319:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.49/0.78  % (15634)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=1728322588:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.49/0.78  % (15632)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3489129934:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.49/0.78  % (15635)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=2979603125:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.49/0.78  % (15633)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=3155799228:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.49/0.78  % (15637)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=2762990616:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.49/0.79  % (15635)Refutation not found, incomplete strategy
% 0.49/0.79  % (15635)------------------------------
% 0.49/0.79  % (15635)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.79  % (15635)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.79  % (15635)CaDiCaL version: 2.1.3
% 0.49/0.79  % (15635)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.79  % (15635)Time elapsed: 0.0000 s
% 0.49/0.79  % (15635)Peak memory usage: 80 MB
% 0.49/0.81  % (15638)Instruction limit reached! 
% 0.49/0.81  % (15638)------------------------------
% 0.49/0.81  % (15638)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.81  % (15638)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.81  % (15638)CaDiCaL version: 2.1.3
% 0.49/0.81  % (15638)Termination reason: Instruction limit
% 0.49/0.81  % (15638)Termination phase: Saturation
% 0.49/0.81  % (15638)Time elapsed: 0.049 s
% 0.49/0.81  % (15638)Peak memory usage: 82 MB
% 0.49/0.81  % (15638)Instructions burned: 132 (million)
% 0.49/0.83  % (15636)Instruction limit reached! 
% 0.49/0.83  % (15636)------------------------------
% 0.49/0.83  % (15636)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.83  % (15636)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.83  % (15636)CaDiCaL version: 2.1.3
% 0.49/0.83  % (15636)Termination reason: Instruction limit
% 0.49/0.83  % (15636)Termination phase: Saturation
% 0.49/0.83  % (15636)Time elapsed: 0.043 s
% 0.49/0.83  % (15636)Peak memory usage: 81 MB
% 0.49/0.83  % (15636)Instructions burned: 120 (million)
% 0.49/0.83  % (15637)Instruction limit reached! 
% 0.49/0.83  % (15637)------------------------------
% 0.49/0.83  % (15637)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.83  % (15637)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.83  % (15637)CaDiCaL version: 2.1.3
% 0.49/0.83  % (15637)Termination reason: Instruction limit
% 0.49/0.83  % (15637)Termination phase: Saturation
% 0.49/0.83  % (15637)Time elapsed: 0.048 s
% 0.49/0.83  % (15637)Peak memory usage: 81 MB
% 0.49/0.83  % (15637)Instructions burned: 139 (million)
% 1.01/0.92  % (15635)------------------------------
% 1.01/0.92  % (15635)------------------------------
% 1.01/0.95  % (15646)lrs+10_1_sil=8000:sp=occurrence:random_seed=1783402713:i=285:sd=3:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/285Mi)
% 1.01/0.95  % (15649)lrs+1011_1_sil=32000:sp=occurrence:random_seed=1463225047:i=325:sd=1:ss=axioms:sgt=32_2998 on theBenchmark for (2998ds/325Mi)
% 1.01/0.95  % (15647)lrs+10_1_sil=32000:urr=on:br=off:random_seed=256594448:i=157:sd=1:gtg=position:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/157Mi)
% 1.01/1.00  % (15647)Instruction limit reached! 
% 1.01/1.00  % (15647)------------------------------
% 1.01/1.00  % (15647)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 1.01/1.00  % (15647)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 1.01/1.00  % (15647)CaDiCaL version: 2.1.3
% 1.01/1.00  % (15647)Termination reason: Instruction limit
% 1.01/1.00  % (15647)Termination phase: Saturation
% 1.01/1.00  % (15647)Time elapsed: 0.050 s
% 1.01/1.00  % (15647)Peak memory usage: 81 MB
% 1.01/1.00  % (15647)Instructions burned: 159 (million)
% 3.00/1.06  % (15649)Instruction limit reached! 
% 3.00/1.06  % (15649)------------------------------
% 3.00/1.06  % (15649)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.00/1.06  % (15649)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.00/1.06  % (15649)CaDiCaL version: 2.1.3
% 3.00/1.06  % (15649)Termination reason: Instruction limit
% 3.00/1.06  % (15649)Termination phase: Saturation
% 3.00/1.06  % (15649)Time elapsed: 0.108 s
% 3.00/1.06  % (15649)Peak memory usage: 81 MB
% 3.00/1.06  % (15649)Instructions burned: 327 (million)
% 3.00/1.06  % (15646)Instruction limit reached! 
% 3.00/1.06  % (15646)------------------------------
% 3.00/1.06  % (15646)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.00/1.06  % (15646)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.00/1.06  % (15646)CaDiCaL version: 2.1.3
% 3.00/1.06  % (15646)Termination reason: Instruction limit
% 3.00/1.06  % (15646)Termination phase: Saturation
% 3.00/1.06  % (15646)Time elapsed: 0.111 s
% 3.00/1.06  % (15646)Peak memory usage: 83 MB
% 3.00/1.06  % (15646)Instructions burned: 287 (million)
% 3.00/1.07  % (15650)dis+10_5:1_slsqr=1,4:sil=8000:fde=unused:erd=off:urr=full:fd=off:s2agt=8:br=off:slsq=on:random_seed=1977289474:s2a=on:i=248:s2at=1.23:gtg=position_2997 on theBenchmark for (2997ds/248Mi)
% 3.52/1.13  % (15654)lrs+1002_1_to=lpo:sil=8000:sos=on:random_seed=4282664029:st=4:cts=off:i=294:sd=2:ins=7:amm=off:ss=axioms_2996 on theBenchmark for (2996ds/294Mi)
% 3.52/1.13  % (15654)Refutation not found, incomplete strategy
% 3.52/1.13  % (15654)------------------------------
% 3.52/1.13  % (15654)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.52/1.13  % (15654)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.52/1.13  % (15654)CaDiCaL version: 2.1.3
% 3.52/1.13  % (15654)Termination reason: Refutation not found, incomplete strategy
% 3.52/1.13  % (15654)Time elapsed: 0.0000 s
% 3.52/1.13  % (15654)Peak memory usage: 80 MB
% 3.52/1.14  % (15650)Instruction limit reached! 
% 3.52/1.14  % (15650)------------------------------
% 3.52/1.14  % (15650)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.52/1.14  % (15650)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.52/1.14  % (15650)CaDiCaL version: 2.1.3
% 3.52/1.14  % (15650)Termination reason: Instruction limit
% 3.52/1.14  % (15650)Termination phase: Saturation
% 3.52/1.14  % (15650)Time elapsed: 0.075 s
% 3.52/1.14  % (15650)Peak memory usage: 81 MB
% 3.52/1.14  % (15650)Instructions burned: 252 (million)
% 3.52/1.18  % (15656)dis-1011_32:1_sfv=off:sil=16000:sos=all:erd=off:acc=on:fd=off:flr=on:random_seed=1722213622:cts=off:i=113:fsr=off:ss=included:sgt=4_2995 on theBenchmark for (2995ds/113Mi)
% 3.52/1.18  % (15655)lrs+10_1_ncem=casc2026/models/loop7.pt:sil=32000:tgt=ground:npcc=on:random_seed=365493331:i=2350_2995 on theBenchmark for (2995ds/2350Mi)
% 3.79/1.22  % (15656)Instruction limit reached! 
% 3.79/1.22  % (15656)------------------------------
% 3.79/1.22  % (15656)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.79/1.22  % (15656)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.79/1.22  % (15656)CaDiCaL version: 2.1.3
% 3.79/1.22  % (15656)Termination reason: Instruction limit
% 3.79/1.22  % (15656)Termination phase: Saturation
% 3.79/1.22  % (15656)Time elapsed: 0.034 s
% 3.79/1.22  % (15656)Peak memory usage: 81 MB
% 3.79/1.22  % (15656)Instructions burned: 115 (million)
% 3.79/1.26  % (15654)------------------------------
% 3.79/1.26  % (15654)------------------------------
% 3.79/1.27  % (15659)lrs-1004_1_sil=8000:sp=occurrence:sos=all:erd=off:fs=off:bce=on:random_seed=1395693974:i=127:av=off:fsr=off:sup=off_2994 on theBenchmark for (2994ds/127Mi)
% 4.51/1.30  % (15659)Instruction limit reached! 
% 4.51/1.30  % (15659)------------------------------
% 4.51/1.30  % (15659)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 4.51/1.30  % (15659)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 4.51/1.30  % (15659)CaDiCaL version: 2.1.3
% 4.51/1.30  % (15659)Termination reason: Instruction limit
% 4.51/1.30  % (15659)Termination phase: Saturation
% 4.51/1.30  % (15659)Time elapsed: 0.035 s
% 4.51/1.30  % (15659)Peak memory usage: 80 MB
% 4.51/1.30  % (15659)Instructions burned: 128 (million)
% 4.51/1.34  % (15662)dis-1003_1024_sil=8000:sos=all:sac=on:random_seed=1743522011:cond=fast:i=114:sd=1:nm=0:fsr=off:gtg=exists_sym:ss=axioms_2994 on theBenchmark for (2994ds/114Mi)
% 4.51/1.37  % (15662)Instruction limit reached! 
% 4.51/1.37  % (15662)------------------------------
% 4.51/1.37  % (15662)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 4.51/1.37  % (15662)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 4.51/1.37  % (15662)CaDiCaL version: 2.1.3
% 4.51/1.37  % (15662)Termination reason: Instruction limit
% 4.51/1.37  % (15662)Termination phase: Saturation
% 4.51/1.37  % (15662)Time elapsed: 0.032 s
% 4.51/1.37  % (15662)Peak memory usage: 81 MB
% 4.51/1.37  % (15662)Instructions burned: 118 (million)
% 4.51/1.39  % (15664)lrs+10_1_sil=8000:sp=occurrence:random_seed=2288139393:st=1.2:i=907:sd=14:ss=axioms:sgt=12_2993 on theBenchmark for (2993ds/907Mi)
% 5.12/1.42  % (15665)dis-1010_1_sil=16000:fde=unused:sp=occurrence:sos=on:random_seed=320650937:i=437:sd=1:aac=none:ss=included_2993 on theBenchmark for (2993ds/437Mi)
% 5.12/1.42  % (15665)Refutation not found, incomplete strategy
% 5.12/1.42  % (15665)------------------------------
% 5.12/1.42  % (15665)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 5.12/1.42  % (15665)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 5.12/1.42  % (15665)CaDiCaL version: 2.1.3
% 5.12/1.42  % (15665)Termination reason: Refutation not found, incomplete strategy
% 5.12/1.42  % (15665)Time elapsed: 0.0000 s
% 5.12/1.42  % (15665)Peak memory usage: 80 MB
% 5.43/1.50  % (15667)lrs-1002_1_ncem=casc2026/models/all5champsBiggishL14.pt:sil=16000:npcc=on:random_seed=548873543:i=5202:ss=axioms:sgt=16_2992 on theBenchmark for (2992ds/5202Mi)
% 5.43/1.55  % (15665)------------------------------
% 5.43/1.55  % (15665)------------------------------
% 5.98/1.69  % (15671)dis+10_3:1_sil=8000:acc=on:urr=on:br=off:sac=on:newcnf=on:random_seed=318479871:i=134:sd=2:doe=on:nm=16:sup=off:ss=included_2990 on theBenchmark for (2990ds/134Mi)
% 5.98/1.70  % (15664)Instruction limit reached! 
% 5.98/1.70  % (15664)------------------------------
% 5.98/1.70  % (15664)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 5.98/1.70  % (15664)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 5.98/1.70  % (15664)CaDiCaL version: 2.1.3
% 5.98/1.70  % (15664)Termination reason: Instruction limit
% 5.98/1.70  % (15664)Termination phase: Saturation
% 5.98/1.70  % (15664)Time elapsed: 0.310 s
% 5.98/1.70  % (15664)Peak memory usage: 89 MB
% 5.98/1.70  % (15664)Instructions burned: 908 (million)
% 6.29/1.73  % (15671)Instruction limit reached! 
% 6.29/1.73  % (15671)------------------------------
% 6.29/1.73  % (15671)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 6.29/1.73  % (15671)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 6.29/1.73  % (15671)CaDiCaL version: 2.1.3
% 6.29/1.73  % (15671)Termination reason: Instruction limit
% 6.29/1.73  % (15671)Termination phase: Saturation
% 6.29/1.73  % (15671)Time elapsed: 0.041 s
% 6.29/1.73  % (15671)Peak memory usage: 81 MB
% 6.29/1.73  % (15671)Instructions burned: 137 (million)
% 7.19/1.82  % (15673)lrs+1002_8_sil=8000:sp=occurrence:sos=on:sac=on:random_seed=2089150957:st=8:i=592:sd=3:ep=RST:ss=axioms_2989 on theBenchmark for (2989ds/592Mi)
% 7.19/1.82  % (15673)Refutation not found, incomplete strategy
% 7.19/1.82  % (15673)------------------------------
% 7.19/1.82  % (15673)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 7.19/1.82  % (15673)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 7.19/1.82  % (15673)CaDiCaL version: 2.1.3
% 7.19/1.82  % (15673)Termination reason: Refutation not found, incomplete strategy
% 7.19/1.82  % (15673)Time elapsed: 0.0000 s
% 7.19/1.82  % (15673)Peak memory usage: 80 MB
% 7.19/1.85  % (15674)lrs+10_1_ncem=casc2026/models/loop6.pt:sil=32000:npcc=on:random_seed=4122105974:st=3:i=13193:sd=3:ss=axioms_2989 on theBenchmark for (2989ds/13193Mi)
% 7.50/1.95  % (15673)------------------------------
% 7.50/1.95  % (15673)------------------------------
% 7.50/2.00  % (15655)Instruction limit reached! 
% 7.50/2.00  % (15655)------------------------------
% 7.50/2.00  % (15655)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 7.50/2.01  % (15655)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 7.50/2.01  % (15655)CaDiCaL version: 2.1.3
% 7.50/2.01  % (15655)Termination reason: Instruction limit
% 7.50/2.01  % (15655)Termination phase: Saturation
% 7.50/2.01  % (15655)Time elapsed: 0.821 s
% 7.50/2.01  % (15655)Peak memory usage: 123 MB
% 7.50/2.01  % (15655)Instructions burned: 2351 (million)
% 9.89/2.08  % (15677)lrs+1666_7_slsqr=4,1:sil=8000:plsq=on:plsqc=1:sos=on:urr=on:plsql=on:rp=on:alpa=false:sac=on:slsq=on:random_seed=2182974389:i=125:slsql=off:bs=unit_only:gtg=position:fdi=2:gsp=on:ss=axioms:sgt=8_2986 on theBenchmark for (2986ds/125Mi)
% 10.50/2.11  % (15677)Instruction limit reached! 
% 10.50/2.11  % (15677)------------------------------
% 10.50/2.11  % (15677)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 10.50/2.11  % (15677)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 10.50/2.11  % (15677)CaDiCaL version: 2.1.3
% 10.50/2.11  % (15677)Termination reason: Instruction limit
% 10.50/2.11  % (15677)Termination phase: Saturation
% 10.50/2.11  % (15677)Time elapsed: 0.035 s
% 10.50/2.11  % (15677)Peak memory usage: 81 MB
% 10.50/2.11  % (15677)Instructions burned: 129 (million)
% 10.50/2.14  % (15678)lrs+10_1024_to=lpo:sil=8000:tgt=full:sp=arity:slsq=on:random_seed=973516750:i=134:gtgl=5:slsql=off:gtg=exists_sym_2986 on theBenchmark for (2986ds/134Mi)
% 10.50/2.18  % (15678)Instruction limit reached! 
% 10.50/2.18  % (15678)------------------------------
% 10.50/2.18  % (15678)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 10.50/2.18  % (15678)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 10.50/2.18  % (15678)CaDiCaL version: 2.1.3
% 10.50/2.18  % (15678)Termination reason: Instruction limit
% 10.50/2.18  % (15678)Termination phase: Saturation
% 10.50/2.18  % (15678)Time elapsed: 0.039 s
% 10.50/2.18  % (15678)Peak memory usage: 82 MB
% 10.50/2.18  % (15678)Instructions burned: 138 (million)
% 11.10/2.24  % (15680)lrs+10_1_sil=16000:plsq=on:plsqc=1:plsqr=32,1:sos=on:lcm=reverse:fd=off:newcnf=on:random_seed=1894605848:i=141:sd=1:gsp=on:sup=off:ss=axioms:sgt=8_2985 on theBenchmark for (2985ds/141Mi)
% 11.10/2.24  % (15680)Refutation not found, incomplete strategy
% 11.10/2.24  % (15680)------------------------------
% 11.10/2.24  % (15680)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 11.10/2.24  % (15680)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 11.10/2.24  % (15680)CaDiCaL version: 2.1.3
% 11.10/2.24  % (15680)Termination reason: Refutation not found, incomplete strategy
% 11.10/2.24  % (15680)Time elapsed: 0.0000 s
% 11.10/2.24  % (15680)Peak memory usage: 80 MB
% 11.60/2.30  % (15682)lrs+1011_1_sil=8000:plsq=on:sp=occurrence:fs=off:random_seed=3407143389:i=431:sd=1:fsr=off:sup=off:ss=axioms:sgt=64_2984 on theBenchmark for (2984ds/431Mi)
% 11.60/2.37  % (15680)------------------------------
% 11.60/2.37  % (15680)------------------------------
% 12.35/2.43  % (15682)Instruction limit reached! 
% 12.35/2.43  % (15682)------------------------------
% 12.35/2.43  % (15682)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 12.35/2.43  % (15682)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 12.35/2.43  % (15682)CaDiCaL version: 2.1.3
% 12.35/2.43  % (15682)Termination reason: Instruction limit
% 12.35/2.43  % (15682)Termination phase: Saturation
% 12.35/2.43  % (15682)Time elapsed: 0.129 s
% 12.35/2.43  % (15682)Peak memory usage: 83 MB
% 12.35/2.43  % (15682)Instructions burned: 433 (million)
% 12.35/2.49  % (15685)lrs+1010_1_ncem=casc2026/models/loop6.pt:sil=64000:tgt=full:npcc=on:prc=on:urr=ec_only:bsr=on:fd=preordered:gs=on:sac=on:newcnf=on:random_seed=1562537334:i=6060:aac=none:ins=25_2982 on theBenchmark for (2982ds/6060Mi)
% 13.11/2.56  % (15686)lrs+10_16_anc=all:slsqr=32,1:sil=8000:avsql=on:sp=unary_frequency:lcm=predicate:urr=full:rp=on:br=off:slsqc=4:flr=on:sac=on:slsq=on:avsqc=1:random_seed=2215481316:avsq=on:s2a=on:i=150:kws=precedence:nicw=on:gsp=on:rawr=on_2982 on theBenchmark for (2982ds/150Mi)
% 13.61/2.60  % (15686)Instruction limit reached! 
% 13.61/2.60  % (15686)------------------------------
% 13.61/2.60  % (15686)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 13.61/2.60  % (15686)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 13.61/2.60  % (15686)CaDiCaL version: 2.1.3
% 13.61/2.60  % (15686)Termination reason: Instruction limit
% 13.61/2.60  % (15686)Termination phase: Saturation
% 13.61/2.60  % (15686)Time elapsed: 0.046 s
% 13.61/2.60  % (15686)Peak memory usage: 82 MB
% 13.61/2.60  % (15686)Instructions burned: 152 (million)
% 14.28/2.73  % (15689)lrs+1010_1_ncem=casc2026/models/loop8.pt:sil=64000:tgt=ground:npcc=on:sp=arity:urr=on:random_seed=4208887397:i=14155:bd=all_2980 on theBenchmark for (2980ds/14155Mi)
% 16.80/3.11  % (15667)Instruction limit reached! 
% 16.80/3.11  % (15667)------------------------------
% 16.80/3.11  % (15667)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 16.80/3.11  % (15667)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 16.80/3.11  % (15667)CaDiCaL version: 2.1.3
% 16.80/3.11  % (15667)Termination reason: Instruction limit
% 16.80/3.11  % (15667)Termination phase: Saturation
% 16.80/3.11  % (15667)Time elapsed: 1.609 s
% 16.80/3.11  % (15667)Peak memory usage: 124 MB
% 16.80/3.11  % (15667)Instructions burned: 5205 (million)
% 18.02/3.24  % (15691)lrs+10_1024_sil=16000:plsq=on:plsqr=32,1:sos=all:fs=off:gs=on:newcnf=on:random_seed=2027632195:i=667:av=off:fsr=off_2975 on theBenchmark for (2975ds/667Mi)
% 18.02/3.24  % (15691)Refutation not found, incomplete strategy
% 18.02/3.24  % (15691)------------------------------
% 18.02/3.24  % (15691)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 18.02/3.24  % (15691)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 18.02/3.24  % (15691)CaDiCaL version: 2.1.3
% 18.02/3.24  % (15691)Termination reason: Refutation not found, incomplete strategy
% 18.02/3.24  % (15691)Time elapsed: 0.0000 s
% 18.02/3.24  % (15691)Peak memory usage: 80 MB
% 18.63/3.37  % (15691)------------------------------
% 18.63/3.37  % (15691)------------------------------
% 20.10/3.50  % (15693)ott-1011_3:1_anc=all_dependent:to=lpo:sil=8000:drc=ordering:sas=cadical:fdtod=off:sp=reverse_frequency:spb=goal_then_units:urr=full:lftc=20:newcnf=on:random_seed=2719544989:s2a=on:i=185:s2at=1.8:fdi=4_2972 on theBenchmark for (2972ds/185Mi)
% 20.10/3.55  % (15693)Instruction limit reached! 
% 20.10/3.55  % (15693)------------------------------
% 20.10/3.55  % (15693)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 20.10/3.55  % (15693)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 20.10/3.55  % (15693)CaDiCaL version: 2.1.3
% 20.10/3.55  % (15693)Termination reason: Instruction limit
% 20.10/3.55  % (15693)Termination phase: Saturation
% 20.10/3.55  % (15693)Time elapsed: 0.051 s
% 20.10/3.55  % (15693)Peak memory usage: 81 MB
% 20.10/3.55  % (15693)Instructions burned: 185 (million)
% 20.87/3.68  % (15695)dis+1010_14_anc=all:to=lpo:sil=8000:sp=arity:slsq=on:random_seed=2547545796:i=193:ins=10:fsr=off:ss=axioms:fsd=on_2970 on theBenchmark for (2970ds/193Mi)
% 21.48/3.75  % (15695)Instruction limit reached! 
% 21.48/3.75  % (15695)------------------------------
% 21.48/3.75  % (15695)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 21.48/3.75  % (15695)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 21.48/3.75  % (15695)CaDiCaL version: 2.1.3
% 21.48/3.75  % (15695)Termination reason: Instruction limit
% 21.48/3.75  % (15695)Termination phase: Saturation
% 21.48/3.75  % (15695)Time elapsed: 0.063 s
% 21.48/3.75  % (15695)Peak memory usage: 84 MB
% 21.48/3.75  % (15695)Instructions burned: 196 (million)
% 22.28/3.88  % (15697)dis+1011_7_sil=8000:sp=occurrence:sos=all:fd=off:random_seed=2055321772:st=5.3:i=4850:sd=4:av=off:sup=off:ss=included:sgt=16_2968 on theBenchmark for (2968ds/4850Mi)
% 25.82/4.30  % (15685)Instruction limit reached! 
% 25.82/4.30  % (15685)------------------------------
% 25.82/4.30  % (15685)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 25.82/4.30  % (15685)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 25.82/4.30  % (15685)CaDiCaL version: 2.1.3
% 25.82/4.30  % (15685)Termination reason: Instruction limit
% 25.82/4.30  % (15685)Termination phase: Saturation
% 25.82/4.30  % (15685)Time elapsed: 1.808 s
% 25.82/4.30  % (15685)Peak memory usage: 133 MB
% 25.82/4.30  % (15685)Instructions burned: 6063 (million)
% 26.44/4.44  % (15699)lrs+1011_1_ncem=casc2026/models/loop8.pt:sil=32000:tgt=ground:npcc=on:sp=const_frequency:acc=on:urr=on:random_seed=10771517:i=12111:sd=1:ss=included_2963 on theBenchmark for (2963ds/12111Mi)
% 32.06/5.23  % (15697)Instruction limit reached! 
% 32.06/5.23  % (15697)------------------------------
% 32.06/5.23  % (15697)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 32.06/5.23  % (15697)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 32.06/5.23  % (15697)CaDiCaL version: 2.1.3
% 32.06/5.23  % (15697)Termination reason: Instruction limit
% 32.06/5.23  % (15697)Termination phase: Saturation
% 32.06/5.23  % (15697)Time elapsed: 1.358 s
% 32.06/5.23  % (15697)Peak memory usage: 120 MB
% 32.06/5.23  % (15697)Instructions burned: 4851 (million)
% 32.75/5.36  % (15701)lrs-11_32_anc=all:sil=8000:spb=goal_then_units:sac=on:random_seed=1422062037:i=319:kws=precedence:fsr=off_2953 on theBenchmark for (2953ds/319Mi)
% 33.39/5.46  % (15701)Instruction limit reached! 
% 33.39/5.46  % (15701)------------------------------
% 33.39/5.46  % (15701)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 33.39/5.46  % (15701)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 33.39/5.46  % (15701)CaDiCaL version: 2.1.3
% 33.39/5.46  % (15701)Termination reason: Instruction limit
% 33.39/5.46  % (15701)Termination phase: Saturation
% 33.39/5.46  % (15701)Time elapsed: 0.098 s
% 33.39/5.46  % (15701)Peak memory usage: 84 MB
% 33.39/5.46  % (15701)Instructions burned: 320 (million)
% 34.19/5.59  % (15703)dis+2_1024_sil=8000:sp=reverse_arity:sos=on:lcm=reverse:sac=on:random_seed=1438409403:i=2064:ep=RST_2951 on theBenchmark for (2951ds/2064Mi)
% 34.19/5.60  % (15703)Refutation not found, incomplete strategy
% 34.19/5.60  % (15703)------------------------------
% 34.19/5.60  % (15703)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 34.19/5.60  % (15703)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 34.19/5.60  % (15703)CaDiCaL version: 2.1.3
% 34.19/5.60  % (15703)Termination reason: Refutation not found, incomplete strategy
% 34.19/5.60  % (15703)Time elapsed: 0.0000 s
% 34.19/5.60  % (15703)Peak memory usage: 80 MB
% 35.39/5.72  % (15703)------------------------------
% 35.39/5.72  % (15703)------------------------------
% 36.26/5.85  % (15705)dis-1011_128_sil=32000:random_seed=3935015738:i=3706:ep=RST:av=off_2949 on theBenchmark for (2949ds/3706Mi)
% 38.64/6.14  % (15674)Instruction limit reached! 
% 38.64/6.14  % (15674)------------------------------
% 38.64/6.14  % (15674)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 38.64/6.14  % (15674)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 38.64/6.14  % (15674)CaDiCaL version: 2.1.3
% 38.64/6.14  % (15674)Termination reason: Instruction limit
% 38.64/6.14  % (15674)Termination phase: Saturation
% 38.64/6.14  % (15674)Time elapsed: 4.289 s
% 38.64/6.14  % (15674)Peak memory usage: 210 MB
% 38.64/6.14  % (15674)Instructions burned: 13193 (million)
% 39.10/6.29  % (15707)lrs-1002_1_sil=8000:plsq=on:plsqr=32,1:sp=occurrence:sos=on:fs=off:gs=on:newcnf=on:random_seed=1421126959:i=757:sd=2:fsr=off:ss=axioms:sgt=40_2944 on theBenchmark for (2944ds/757Mi)
% 39.10/6.29  % (15707)Refutation not found, incomplete strategy
% 39.10/6.29  % (15707)------------------------------
% 39.10/6.29  % (15707)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 39.10/6.29  % (15707)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 39.10/6.29  % (15707)CaDiCaL version: 2.1.3
% 39.10/6.29  % (15707)Termination reason: Refutation not found, incomplete strategy
% 39.10/6.29  % (15707)Time elapsed: 0.001 s
% 39.10/6.29  % (15707)Peak memory usage: 82 MB
% 40.29/6.42  % (15707)------------------------------
% 40.29/6.42  % (15707)------------------------------
% 41.14/6.55  % (15709)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=64000:npcc=on:sp=occurrence:random_seed=2579069446:i=13913:ss=axioms:sgt=8_2942 on theBenchmark for (2942ds/13913Mi)
% 42.96/6.83  % (15705)Instruction limit reached! 
% 42.96/6.83  % (15705)------------------------------
% 42.96/6.83  % (15705)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 42.96/6.83  % (15705)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 42.96/6.83  % (15705)CaDiCaL version: 2.1.3
% 42.96/6.83  % (15705)Termination reason: Instruction limit
% 42.96/6.83  % (15705)Termination phase: Saturation
% 42.96/6.83  % (15705)Time elapsed: 0.983 s
% 42.96/6.83  % (15705)Peak memory usage: 86 MB
% 42.96/6.83  % (15705)Instructions burned: 3706 (million)
% 43.54/6.96  % (15711)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=32000:npcc=on:sp=const_frequency:sos=all:lma=off:random_seed=731281561:i=9925:aac=none_2938 on theBenchmark for (2938ds/9925Mi)
% 44.82/7.04  % (15689)Instruction limit reached! 
% 44.82/7.04  % (15689)------------------------------
% 44.82/7.04  % (15689)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 44.82/7.04  % (15689)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 44.82/7.04  % (15689)CaDiCaL version: 2.1.3
% 44.82/7.04  % (15689)Termination reason: Instruction limit
% 44.82/7.04  % (15689)Termination phase: Saturation
% 44.82/7.04  % (15689)Time elapsed: 4.305 s
% 44.82/7.04  % (15689)Peak memory usage: 222 MB
% 44.82/7.04  % (15689)Instructions burned: 14156 (million)
% 45.46/7.19  % (15713)dis-1010_50_to=lpo:sil=32000:sp=arity:sos=on:spb=goal_then_units:urr=ec_only:slsq=on:random_seed=1879938851:i=2479:sd=2:nm=16:fsr=off:ss=axioms_2935 on theBenchmark for (2935ds/2479Mi)
% 45.46/7.19  % (15713)Refutation not found, incomplete strategy
% 45.46/7.19  % (15713)------------------------------
% 45.46/7.19  % (15713)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 45.46/7.19  % (15713)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 45.46/7.19  % (15713)CaDiCaL version: 2.1.3
% 45.46/7.19  % (15713)Termination reason: Refutation not found, incomplete strategy
% 45.46/7.19  % (15713)Time elapsed: 0.0000 s
% 45.46/7.19  % (15713)Peak memory usage: 80 MB
% 46.55/7.32  % (15713)------------------------------
% 46.55/7.32  % (15713)------------------------------
% 47.41/7.45  % (15715)ott+1002_64_sil=16000:sp=const_min:nwc=0.5:random_seed=255171104:i=440:nm=2:av=off:gtg=exists_all:fdi=8:gsp=on_2933 on theBenchmark for (2933ds/440Mi)
% 48.02/7.59  % (15715)Instruction limit reached! 
% 48.02/7.59  % (15715)------------------------------
% 48.02/7.59  % (15715)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 48.02/7.59  % (15715)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 48.02/7.59  % (15715)CaDiCaL version: 2.1.3
% 48.02/7.59  % (15715)Termination reason: Instruction limit
% 48.02/7.59  % (15715)Termination phase: Saturation
% 48.02/7.59  % (15715)Time elapsed: 0.133 s
% 48.02/7.59  % (15715)Peak memory usage: 82 MB
% 48.02/7.59  % (15715)Instructions burned: 442 (million)
% 49.49/7.73  % (15717)dis-1011_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:erd=off:lsd=100:bsr=unit_only:random_seed=659774904:st=1.5:i=11145:s2at=3:sd=3:fsr=off:ss=axioms_2930 on theBenchmark for (2930ds/11145Mi)
% 50.10/7.87  % (15699)Instruction limit reached! 
% 50.10/7.87  % (15699)------------------------------
% 50.10/7.87  % (15699)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 50.10/7.87  % (15699)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 50.10/7.87  % (15699)CaDiCaL version: 2.1.3
% 50.10/7.87  % (15699)Termination reason: Instruction limit
% 50.10/7.87  % (15699)Termination phase: Saturation
% 50.10/7.87  % (15699)Time elapsed: 3.434 s
% 50.10/7.87  % (15699)Peak memory usage: 312 MB
% 50.10/7.87  % (15699)Instructions burned: 12115 (million)
% 51.78/8.02  % (15719)lrs+1002_1_to=lpo:ncem=casc2026/models/loop8.pt:sil=32000:npcc=on:sp=unary_frequency:lcm=reverse:urr=on:bsr=on:random_seed=1462808452:cts=off:i=3034:av=off:er=known:fsd=on_2927 on theBenchmark for (2927ds/3034Mi)
% 57.94/8.99  % (15719)Instruction limit reached! 
% 57.94/8.99  % (15719)------------------------------
% 57.94/8.99  % (15719)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 57.94/8.99  % (15719)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 57.94/8.99  % (15719)CaDiCaL version: 2.1.3
% 57.94/8.99  % (15719)Termination reason: Instruction limit
% 57.94/8.99  % (15719)Termination phase: Saturation
% 57.94/8.99  % (15719)Time elapsed: 0.964 s
% 57.94/8.99  % (15719)Peak memory usage: 130 MB
% 57.94/8.99  % (15719)Instructions burned: 3036 (million)
% 58.82/9.12  % (15721)lrs-1011_64:1_sil=8000:erd=off:urr=on:nwc=0.7:br=off:random_seed=541782873:st=2:s2a=on:i=524:s2at=2:ss=axioms_2916 on theBenchmark for (2916ds/524Mi)
% 60.03/9.27  % (15721)Instruction limit reached! 
% 60.03/9.27  % (15721)------------------------------
% 60.03/9.27  % (15721)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 60.03/9.27  % (15721)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 60.03/9.27  % (15721)CaDiCaL version: 2.1.3
% 60.03/9.27  % (15721)Termination reason: Instruction limit
% 60.03/9.27  % (15721)Termination phase: Saturation
% 60.03/9.27  % (15721)Time elapsed: 0.150 s
% 60.03/9.27  % (15721)Peak memory usage: 82 MB
% 60.03/9.27  % (15721)Instructions burned: 527 (million)
% 60.72/9.40  % (15723)lrs+1011_16:1_sil=8000:acc=on:urr=on:fd=preordered:flr=on:random_seed=3718968375:avsq=on:i=1016:avsqr=676809,524288:sd=1:ss=axioms_2913 on theBenchmark for (2913ds/1016Mi)
% 63.13/9.72  % (15723)Instruction limit reached! 
% 63.13/9.72  % (15723)------------------------------
% 63.13/9.72  % (15723)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 63.13/9.72  % (15723)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 63.13/9.72  % (15723)CaDiCaL version: 2.1.3
% 63.13/9.72  % (15723)Termination reason: Instruction limit
% 63.13/9.72  % (15723)Termination phase: Saturation
% 63.13/9.72  % (15723)Time elapsed: 0.328 s
% 63.13/9.72  % (15723)Peak memory usage: 84 MB
% 63.13/9.72  % (15723)Instructions burned: 1018 (million)
% 64.21/9.85  % (15725)lrs+1010_1_ncem=casc2026/models/loop8.pt:sil=32000:npcc=on:drc=off:fde=none:s2agt=16:random_seed=793755146:i=14123:bd=preordered:ins=4_2909 on theBenchmark for (2909ds/14123Mi)
% 71.96/10.96  % (15711)Instruction limit reached! 
% 71.96/10.96  % (15711)------------------------------
% 71.96/10.96  % (15711)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 71.96/10.96  % (15711)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 71.96/10.96  % (15711)CaDiCaL version: 2.1.3
% 71.96/10.96  % (15711)Termination reason: Instruction limit
% 71.96/10.96  % (15711)Termination phase: Saturation
% 71.96/10.96  % (15711)Time elapsed: 3.995 s
% 71.96/10.96  % (15711)Peak memory usage: 164 MB
% 71.96/10.96  % (15711)Instructions burned: 9927 (million)
% 72.85/11.09  % (15727)dis+10_4096_slsqr=16,1:sil=32000:tgt=full:plsq=on:bsr=unit_only:slsqc=1:slsq=on:random_seed=621351181:i=5781:kws=precedence:bd=all:rawr=on_2896 on theBenchmark for (2896ds/5781Mi)
% 74.07/11.23  % (15709)Instruction limit reached! 
% 74.07/11.23  % (15709)------------------------------
% 74.07/11.23  % (15709)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 74.07/11.23  % (15709)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 74.07/11.23  % (15709)CaDiCaL version: 2.1.3
% 74.07/11.23  % (15709)Termination reason: Instruction limit
% 74.07/11.23  % (15709)Termination phase: Saturation
% 74.07/11.23  % (15709)Time elapsed: 4.676 s
% 74.07/11.23  % (15709)Peak memory usage: 214 MB
% 74.07/11.23  % (15709)Instructions burned: 13915 (million)
% 74.07/11.25  % (15717)Instruction limit reached! 
% 74.07/11.25  % (15717)------------------------------
% 74.07/11.25  % (15717)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 74.07/11.25  % (15717)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 74.07/11.25  % (15717)CaDiCaL version: 2.1.3
% 74.07/11.25  % (15717)Termination reason: Instruction limit
% 74.07/11.25  % (15717)Termination phase: Saturation
% 74.07/11.25  % (15717)Time elapsed: 3.525 s
% 74.07/11.25  % (15717)Peak memory usage: 214 MB
% 74.07/11.25  % (15717)Instructions burned: 11146 (million)
% 74.70/11.36  % (15729)lrs-1011_1_to=lpo:ncem=casc2026/models/loop7.pt:sil=64000:npcc=on:drc=off:sp=reverse_frequency:erd=off:urr=on:br=off:random_seed=1449108586:i=2448:gtgl=5:bd=preordered:gtg=all_2893 on theBenchmark for (2893ds/2448Mi)
% 74.70/11.38  % (15730)lrs+1011_1_ncem=casc2026/models/loop5.pt:sil=32000:tgt=full:npcc=on:lcm=reverse:random_seed=2536802607:i=3223:kws=precedence:fgj=on:av=off_2893 on theBenchmark for (2893ds/3223Mi)
% 80.46/12.14  % (15729)Instruction limit reached! 
% 80.46/12.14  % (15729)------------------------------
% 80.46/12.14  % (15729)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 80.46/12.14  % (15729)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 80.46/12.14  % (15729)CaDiCaL version: 2.1.3
% 80.46/12.14  % (15729)Termination reason: Instruction limit
% 80.46/12.14  % (15729)Termination phase: Saturation
% 80.46/12.14  % (15729)Time elapsed: 0.777 s
% 80.46/12.14  % (15729)Peak memory usage: 124 MB
% 80.46/12.14  % (15729)Instructions burned: 2452 (million)
% 81.01/12.28  % (15733)lrs+1002_1_ncem=casc2026/models/loop4.pt:sil=8000:npcc=on:sp=occurrence:sos=on:random_seed=3900217627:st=5.6:i=2033:sd=3:ss=axioms_2884 on theBenchmark for (2884ds/2033Mi)
% 82.84/12.51  % (15730)Instruction limit reached! 
% 82.84/12.51  % (15730)------------------------------
% 82.84/12.51  % (15730)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 82.84/12.51  % (15730)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 82.84/12.51  % (15730)CaDiCaL version: 2.1.3
% 82.84/12.51  % (15730)Termination reason: Instruction limit
% 82.84/12.51  % (15730)Termination phase: Saturation
% 82.84/12.51  % (15730)Time elapsed: 1.124 s
% 82.84/12.51  % (15730)Peak memory usage: 126 MB
% 82.84/12.51  % (15730)Instructions burned: 3226 (million)
% 83.37/12.63  % (15733)Refutation not found, incomplete strategy
% 83.37/12.63  % (15733)------------------------------
% 83.37/12.63  % (15733)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 83.37/12.63  % (15733)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 83.37/12.63  % (15733)CaDiCaL version: 2.1.3
% 83.37/12.63  % (15733)Termination reason: Refutation not found, incomplete strategy
% 83.37/12.63  % (15733)Time elapsed: 0.354 s
% 83.37/12.63  % (15733)Peak memory usage: 100 MB
% 83.37/12.63  % (15733)Instructions burned: 857 (million)
% 83.37/12.67  % (15735)lrs-1010_1_ncem=casc2026/models/loop8.pt:sil=64000:npcc=on:bsd=on:random_seed=686622705:i=2055:nm=16:gtg=position:ss=axioms:fsd=on_2881 on theBenchmark for (2881ds/2055Mi)
% 84.36/12.80  % (15733)------------------------------
% 84.36/12.80  % (15733)------------------------------
% 84.36/12.82  % (15727)Instruction limit reached! 
% 84.36/12.82  % (15727)------------------------------
% 84.36/12.82  % (15727)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 84.36/12.82  % (15727)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 84.36/12.82  % (15727)CaDiCaL version: 2.1.3
% 84.36/12.82  % (15727)Termination reason: Instruction limit
% 84.36/12.82  % (15727)Termination phase: Saturation
% 84.36/12.82  % (15727)Time elapsed: 1.731 s
% 84.36/12.82  % (15727)Peak memory usage: 115 MB
% 84.36/12.82  % (15727)Instructions burned: 5783 (million)
% 85.43/12.92  % (15737)dis+1010_1_ncem=casc2026/models/loop7.pt:sil=64000:tgt=full:npcc=on:fde=unused:sp=const_frequency:spb=goal:acc=on:random_seed=1789269614:i=21611:sd=3:ss=axioms_2878 on theBenchmark for (2878ds/21611Mi)
% 85.43/12.95  % (15738)lrs+10_1_sil=8000:sp=occurrence:sos=all:lma=off:random_seed=2145062089:i=4835:sd=13:ss=axioms:sgt=23_2878 on theBenchmark for (2878ds/4835Mi)
% 88.69/13.39  % (15735)Instruction limit reached! 
% 88.69/13.39  % (15735)------------------------------
% 88.69/13.39  % (15735)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 88.69/13.39  % (15735)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 88.69/13.39  % (15735)CaDiCaL version: 2.1.3
% 88.69/13.39  % (15735)Termination reason: Instruction limit
% 88.69/13.39  % (15735)Termination phase: Saturation
% 88.69/13.39  % (15735)Time elapsed: 0.718 s
% 88.69/13.39  % (15735)Peak memory usage: 113 MB
% 88.69/13.39  % (15735)Instructions burned: 2055 (million)
% 90.01/13.53  % (15741)lrs+10_1_to=lpo:sil=32000:plsq=on:plsqc=1:bsd=on:plsqr=64,1:sp=reverse_frequency:bsr=unit_only:plsql=on:fd=off:slsqc=4:newcnf=on:slsq=on:random_seed=1930661976:st=5:i=797:s2at=3:sd=4:bs=unit_only:av=off:sup=off:ss=included_2872 on theBenchmark for (2872ds/797Mi)
% 91.20/13.80  % (15741)Instruction limit reached! 
% 91.20/13.80  % (15741)------------------------------
% 91.20/13.80  % (15741)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 91.20/13.80  % (15741)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 91.20/13.80  % (15741)CaDiCaL version: 2.1.3
% 91.20/13.80  % (15741)Termination reason: Instruction limit
% 91.20/13.80  % (15741)Termination phase: Saturation
% 91.20/13.80  % (15741)Time elapsed: 0.269 s
% 91.20/13.80  % (15741)Peak memory usage: 84 MB
% 91.20/13.80  % (15741)Instructions burned: 798 (million)
% 92.81/13.92  % (15743)lrs-1011_5_sil=8000:sp=const_max:sos=on:lsd=50:rnwc=on:rp=on:nwc=2.6:alpa=false:random_seed=3941121515:i=2326:kws=inv_precedence:aac=none:nicw=on:bs=unit_only:nm=16:ins=2:fsd=on_2868 on theBenchmark for (2868ds/2326Mi)
% 92.81/13.92  % (15743)Refutation not found, incomplete strategy
% 92.81/13.92  % (15743)------------------------------
% 92.81/13.92  % (15743)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 92.81/13.92  % (15743)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 92.81/13.92  % (15743)CaDiCaL version: 2.1.3
% 92.81/13.92  % (15743)Termination reason: Refutation not found, incomplete strategy
% 92.81/13.92  % (15743)Time elapsed: 0.0000 s
% 92.81/13.92  % (15743)Peak memory usage: 80 MB
% 93.69/14.05  % (15743)------------------------------
% 93.69/14.05  % (15743)------------------------------
% 94.36/14.20  % (15745)lrs+10_1_ncem=casc2026/models/loop5.pt:sil=8000:npcc=on:sos=all:urr=on:br=off:random_seed=448019472:i=6038:nm=6_2865 on theBenchmark for (2865ds/6038Mi)
% 95.48/14.39  % (15738)Instruction limit reached! 
% 95.48/14.39  % (15738)------------------------------
% 95.48/14.39  % (15738)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 95.48/14.39  % (15738)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 95.48/14.39  % (15738)CaDiCaL version: 2.1.3
% 95.48/14.39  % (15738)Termination reason: Instruction limit
% 95.48/14.39  % (15738)Termination phase: Saturation
% 95.48/14.39  % (15738)Time elapsed: 1.443 s
% 95.48/14.39  % (15738)Peak memory usage: 136 MB
% 95.48/14.39  % (15738)Instructions burned: 4837 (million)
% 96.60/14.53  % (15747)lrs+10_1_sil=32000:sp=occurrence:random_seed=4123054451:st=2:i=33334:sd=3:ss=included:sgt=32_2862 on theBenchmark for (2862ds/33334Mi)
% 96.60/14.55  % (15633)First to succeed.
% 96.60/14.55  % (15633)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-15630"
% 97.08/14.68  % (15725)Instruction limit reached! 
% 97.08/14.68  % (15725)------------------------------
% 97.08/14.68  % (15725)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 97.08/14.68  % (15725)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 97.08/14.68  % (15725)CaDiCaL version: 2.1.3
% 97.08/14.68  % (15725)Termination reason: Instruction limit
% 97.08/14.68  % (15725)Termination phase: Saturation
% 97.08/14.68  % (15725)Time elapsed: 4.831 s
% 97.08/14.68  % (15725)Peak memory usage: 198 MB
% 97.08/14.68  % (15725)Instructions burned: 14126 (million)
% 83.50/14.73  % (15633)Refutation found. Thanks to Tanya!
% 83.50/14.73  % SZS status Theorem for theBenchmark
% 83.50/14.73  % SZS output start Proof for theBenchmark
% See solution above
% 83.50/14.73  % (15633)------------------------------
% 83.50/14.73  % (15633)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 83.50/14.73  % (15633)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 83.50/14.73  % (15633)CaDiCaL version: 2.1.3
% 83.50/14.73  % (15633)Termination reason: Refutation
% 83.50/14.73  % (15633)Time elapsed: 13.767 s
% 83.50/14.73  % (15633)Peak memory usage: 303 MB
% 83.50/14.73  % (15633)Instructions burned: 45094 (million)
% 83.50/14.73  % (15633)------------------------------
% 83.50/14.73  % (15633)------------------------------
% 83.50/14.73  % (15630)Success in time 14.089 s
%------------------------------------------------------------------------------
