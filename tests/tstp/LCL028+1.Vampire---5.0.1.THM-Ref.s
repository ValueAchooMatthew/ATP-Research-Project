
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : LCL028+1 : TPTP v9.2.1. Released v9.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n006.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:36:37 PM UTC 2026

% Result   : Theorem 29.90s 9.12s
% Output   : Refutation 29.90s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   86
%            Number of leaves      :    5
% Syntax   : Number of formulae    :  152 (  55 unt;   0 def)
%            Number of atoms       :  271 (   0 equ)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  242 ( 123   ~; 117   |;   1   &)
%                                         (   0 ;   1  =>;   0  )
%            Maximal formula depth :    9 (   6 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-1 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :  475 ( 475   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( ( is_a_theorem(implies(X0,X1))
        & is_a_theorem(X0) )
     => is_a_theorem(X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',condensed_detachment) ).

fof(f2,axiom,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(X1,X0))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',c0_2) ).

fof(f3,axiom,
    ! [X0] : is_a_theorem(implies(implies(implies(X0,falsehood),falsehood),X0)),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',c0_5) ).

fof(f4,axiom,
    ! [X0,X1,X2] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X2)))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',c0_6) ).

fof(f5,conjecture,
    is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_c0_CAMeredith) ).

fof(f6,negated_conjecture,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(negated_conjecture,[status(cth)],[f5]) ).

fof(f7,plain,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(flattening,[],[f6]) ).

fof(f8,plain,
    ! [X0,X1] :
      ( is_a_theorem(X1)
      | ~ is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(X0) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f9,plain,
    ! [X0,X1] :
      ( is_a_theorem(X1)
      | ~ is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(X0) ),
    inference(flattening,[],[f8]) ).

fof(f10,plain,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(cnf_transformation,[],[f7]) ).

fof(f11,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X0,X1),implies(X0,X2)))),
    inference(cnf_transformation,[],[f4]) ).

fof(f12,plain,
    ! [X0] : is_a_theorem(implies(implies(implies(X0,falsehood),falsehood),X0)),
    inference(cnf_transformation,[],[f3]) ).

fof(f13,plain,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(X1,X0))),
    inference(cnf_transformation,[],[f2]) ).

fof(f14,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(X0,X1))
      | is_a_theorem(X1)
      | ~ is_a_theorem(X0) ),
    inference(cnf_transformation,[],[f9]) ).

fof(f15,plain,
    ! [X0,X1] :
      ( is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(X1) ),
    inference(resolution,[],[f13,f14]) ).

fof(f16,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X0,X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f11,f14]) ).

fof(f17,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,X2)))
      | is_a_theorem(implies(X0,X2))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f16,f14]) ).

fof(f19,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,X1)))
      | is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,X2))) ),
    inference(resolution,[],[f17,f11]) ).

fof(f28,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X2,X0))
      | is_a_theorem(implies(X2,X1))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f15,f17]) ).

fof(f29,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,X0),X1))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f28,f13]) ).

fof(f34,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),implies(X2,X1)))),
    inference(resolution,[],[f29,f11]) ).

fof(f35,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X0,X2)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f29,f16]) ).

fof(f36,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(X2,X0)))),
    inference(resolution,[],[f29,f13]) ).

fof(f37,plain,
    ! [X0] : is_a_theorem(implies(falsehood,X0)),
    inference(resolution,[],[f29,f12]) ).

fof(f39,plain,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(X1,X1))),
    inference(resolution,[],[f35,f13]) ).

fof(f40,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X0,implies(X1,X2)),implies(X0,X2)))),
    inference(resolution,[],[f35,f11]) ).

fof(f43,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(X0,implies(X1,X2)))
      | ~ is_a_theorem(implies(X0,X2)) ),
    inference(resolution,[],[f35,f15]) ).

fof(f45,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X1,X2),implies(X0,X2)))),
    inference(resolution,[],[f34,f35]) ).

fof(f46,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,X1),implies(X2,X0)))
      | is_a_theorem(implies(implies(X0,X1),implies(X2,X1))) ),
    inference(resolution,[],[f34,f17]) ).

fof(f47,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(implies(X3,X0),implies(X3,X1)),X2))
      | is_a_theorem(implies(implies(X0,X1),X2)) ),
    inference(resolution,[],[f34,f28]) ).

fof(f48,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X0,X2)))
      | ~ is_a_theorem(implies(X1,X2)) ),
    inference(resolution,[],[f34,f14]) ).

fof(f51,plain,
    ! [X0,X1] : is_a_theorem(implies(X0,implies(falsehood,X1))),
    inference(resolution,[],[f37,f35]) ).

fof(f63,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,X1),implies(X1,X2)))
      | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) ),
    inference(resolution,[],[f45,f17]) ).

fof(f65,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,X1)))
      | ~ is_a_theorem(implies(X2,X0)) ),
    inference(resolution,[],[f45,f14]) ).

fof(f71,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(X0,X1))),
    inference(resolution,[],[f39,f19]) ).

fof(f76,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,X2),X1))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f39,f28]) ).

fof(f97,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(X2,implies(implies(X2,X0),X1)))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f48,f35]) ).

fof(f102,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(X2,X1)))),
    inference(resolution,[],[f36,f35]) ).

fof(f104,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,implies(X3,X0)),X1))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f36,f28]) ).

fof(f106,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(implies(X1,X0),X2)),implies(X0,X2))),
    inference(resolution,[],[f102,f19]) ).

fof(f114,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X2),implies(X1,X2))),
    inference(resolution,[],[f106,f29]) ).

fof(f118,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X2,X0),X1)))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f106,f14]) ).

fof(f122,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(implies(X0,X1),X2),X1))
      | is_a_theorem(implies(implies(implies(X0,X1),X2),X2)) ),
    inference(resolution,[],[f114,f17]) ).

fof(f181,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,implies(falsehood,X1)),X2),X2)),
    inference(resolution,[],[f122,f51]) ).

fof(f190,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X3,X0),X2))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f104,f48]) ).

fof(f313,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X1,implies(falsehood,X2)),X0))
      | is_a_theorem(X0) ),
    inference(resolution,[],[f181,f14]) ).

fof(f347,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(X0,falsehood),implies(X0,X1))),
    inference(resolution,[],[f63,f51]) ).

fof(f356,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,falsehood),X0))
      | is_a_theorem(implies(implies(X0,falsehood),X1)) ),
    inference(resolution,[],[f347,f17]) ).

fof(f364,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(implies(X0,X0),falsehood),X1)),
    inference(resolution,[],[f356,f39]) ).

fof(f459,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),X3)))
      | ~ is_a_theorem(implies(implies(X2,X1),X3)) ),
    inference(resolution,[],[f47,f48]) ).

fof(f460,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,X0),implies(implies(X2,X1),X3)))
      | is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),X3))) ),
    inference(resolution,[],[f47,f16]) ).

fof(f498,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X0),implies(implies(X2,implies(X0,X1)),implies(X2,X1)))),
    inference(resolution,[],[f460,f11]) ).

fof(f501,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(implies(X2,X0),implies(X2,X1)))),
    inference(resolution,[],[f460,f40]) ).

fof(f525,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X1,X2)))
      | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) ),
    inference(resolution,[],[f501,f14]) ).

fof(f558,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(implies(X1,X2),X1),implies(X0,X2)))),
    inference(resolution,[],[f498,f35]) ).

fof(f613,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X2),implies(X3,implies(X1,X2)))),
    inference(resolution,[],[f190,f106]) ).

fof(f670,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(falsehood,X2),X1)))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f313,f16]) ).

fof(f1297,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(implies(X1,X2),X3)),implies(X0,implies(X2,X3)))),
    inference(resolution,[],[f613,f525]) ).

fof(f1328,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X3,X1),X2)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f1297,f14]) ).

fof(f1341,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(X0,implies(X2,X1)))),
    inference(resolution,[],[f1328,f501]) ).

fof(f1342,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X1,implies(X0,X2)))),
    inference(resolution,[],[f1328,f558]) ).

fof(f1360,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X3,X2),X0))
      | is_a_theorem(implies(implies(X0,X1),implies(X2,X1))) ),
    inference(resolution,[],[f1328,f65]) ).

fof(f1398,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X0,X2)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f1341,f14]) ).

fof(f1400,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(implies(X1,X2),X2)))),
    inference(resolution,[],[f1342,f76]) ).

fof(f1505,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(implies(X0,X1),X2),implies(X3,X2)))
      | ~ is_a_theorem(implies(X3,X1)) ),
    inference(resolution,[],[f1360,f48]) ).

fof(f1632,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(implies(X0,X1),X1),X2),implies(X0,X2))),
    inference(resolution,[],[f1400,f46]) ).

fof(f1660,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(X0,implies(X1,implies(implies(X0,X2),X2)))),
    inference(resolution,[],[f1400,f1398]) ).

fof(f1827,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X1,X2),implies(X0,implies(X3,X2))))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f1505,f47]) ).

fof(f1884,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X1,X3))
      | is_a_theorem(implies(X0,implies(X2,X3)))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f1827,f14]) ).

fof(f1885,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X2,falsehood),falsehood)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f1884,f12]) ).

fof(f1931,plain,
    ! [X2,X3,X0,X1,X4] :
      ( is_a_theorem(implies(X0,implies(X1,implies(implies(X2,X3),implies(X2,X4)))))
      | ~ is_a_theorem(implies(X0,implies(X2,implies(X3,X4)))) ),
    inference(resolution,[],[f1884,f11]) ).

fof(f1964,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,falsehood),implies(X1,X2)))
      | ~ is_a_theorem(implies(implies(X2,falsehood),X0)) ),
    inference(resolution,[],[f1885,f65]) ).

fof(f2014,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(X0,implies(implies(X1,X2),implies(X1,X3))))
      | ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) ),
    inference(resolution,[],[f1931,f670]) ).

fof(f2084,plain,
    ~ is_a_theorem(implies(implies(implies(c,a),falsehood),implies(implies(implies(a,b),implies(c,falsehood)),e))),
    inference(resolution,[],[f1964,f10]) ).

fof(f2515,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,implies(X0,X2))))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f2014,f118]) ).

fof(f2527,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,implies(X2,X3))))
      | is_a_theorem(implies(implies(X1,X2),implies(X1,X3)))
      | ~ is_a_theorem(X0) ),
    inference(resolution,[],[f2014,f14]) ).

fof(f2546,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(implies(X0,X1),X2)))
      | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) ),
    inference(resolution,[],[f2515,f48]) ).

fof(f2556,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,X1),implies(implies(X0,X1),X3)))
      | is_a_theorem(implies(implies(X0,X1),implies(implies(X2,X0),X3))) ),
    inference(resolution,[],[f2515,f459]) ).

fof(f2939,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(implies(X0,X1),X0),implies(implies(X0,X1),X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f2527,f11]) ).

fof(f2999,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(falsehood,falsehood)))
      | is_a_theorem(implies(implies(implies(X0,falsehood),X0),implies(X1,X0))) ),
    inference(resolution,[],[f2939,f1885]) ).

fof(f3005,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(implies(X0,falsehood),X0),implies(X1,X0))),
    inference(forward_subsumption_resolution,[],[f2999,f39]) ).

fof(f3034,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(X0,implies(implies(X1,falsehood),X1)),implies(X0,X1))),
    inference(resolution,[],[f3005,f2546]) ).

fof(f3107,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X1,falsehood),X1)))
      | is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f3034,f14]) ).

fof(f3141,plain,
    ! [X0,X1] :
      ( ~ is_a_theorem(implies(implies(X1,falsehood),X0))
      | is_a_theorem(implies(implies(X0,X1),X1)) ),
    inference(resolution,[],[f3107,f65]) ).

fof(f3174,plain,
    ! [X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X0),X0)),
    inference(resolution,[],[f3141,f347]) ).

fof(f3231,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X2,X3),X2)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f3174,f1884]) ).

fof(f3672,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(X2,implies(X0,X1)))),
    inference(resolution,[],[f3231,f45]) ).

fof(f3681,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),falsehood),implies(X2,X0))),
    inference(resolution,[],[f3231,f347]) ).

fof(f3716,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X1,X0),implies(X1,X2)))),
    inference(resolution,[],[f3672,f2556]) ).

fof(f3778,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,X1),implies(implies(X2,implies(X2,X0)),implies(X2,X1)))),
    inference(resolution,[],[f3716,f47]) ).

fof(f4339,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(implies(X1,X2),implies(X0,X2)))),
    inference(resolution,[],[f3778,f35]) ).

fof(f4396,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X2,implies(X2,X0)))
      | is_a_theorem(implies(implies(X0,X1),implies(X2,X1))) ),
    inference(resolution,[],[f4339,f14]) ).

fof(f4421,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(implies(X2,falsehood),X1)))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X2)) ),
    inference(resolution,[],[f4396,f1964]) ).

fof(f4605,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,X1)))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X1)) ),
    inference(resolution,[],[f4421,f3231]) ).

fof(f4750,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X2,implies(X0,X1)),implies(X2,X1)))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X1)) ),
    inference(resolution,[],[f4605,f2546]) ).

fof(f10237,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X3,X1))))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X1)) ),
    inference(resolution,[],[f4750,f190]) ).

fof(f10281,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X2,X1),implies(implies(X0,X2),implies(X3,X1))))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X1)) ),
    inference(resolution,[],[f10237,f2556]) ).

fof(f10595,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X2),implies(X3,X1)))
      | ~ is_a_theorem(implies(implies(X0,falsehood),X1))
      | ~ is_a_theorem(implies(X2,X1)) ),
    inference(resolution,[],[f10281,f14]) ).

fof(f10732,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,falsehood),X1))
      | ~ is_a_theorem(implies(X2,X1))
      | is_a_theorem(implies(X3,X1))
      | ~ is_a_theorem(implies(X0,X2)) ),
    inference(resolution,[],[f10595,f14]) ).

fof(f10769,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X3,X3),X0))
      | is_a_theorem(implies(X2,X1))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f10732,f364]) ).

fof(f10893,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X2,X3),X1))
      | is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(implies(X2,implies(X2,X3))) ),
    inference(resolution,[],[f10769,f16]) ).

fof(f10997,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X1,implies(implies(X3,X1),X2))))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f10893,f106]) ).

fof(f11506,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X2,implies(X1,X3))))
      | is_a_theorem(implies(X0,implies(X1,implies(X2,X3)))) ),
    inference(resolution,[],[f10997,f1931]) ).

fof(f11539,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(X0,implies(X1,implies(implies(X1,X2),X3))))
      | ~ is_a_theorem(implies(X2,implies(X1,X3))) ),
    inference(resolution,[],[f11506,f97]) ).

fof(f11720,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X3,X1),implies(X3,implies(implies(X1,X0),X2))))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f11539,f525]) ).

fof(f11819,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X3,X1),X3))
      | is_a_theorem(implies(implies(X3,X1),implies(implies(X1,X0),X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f11720,f17]) ).

fof(f11864,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(implies(X0,X0),X1),implies(implies(X1,X2),X3)))
      | ~ is_a_theorem(implies(X2,implies(X1,X3))) ),
    inference(resolution,[],[f11819,f39]) ).

fof(f11975,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(implies(X3,X3),X1),implies(X0,X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f11864,f1328]) ).

fof(f12305,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X3,X3),X1))
      | is_a_theorem(implies(X0,X2))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f11975,f14]) ).

fof(f12319,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(X2,X3),X1)))
      | is_a_theorem(implies(X0,X1))
      | ~ is_a_theorem(implies(X2,implies(X2,X3))) ),
    inference(resolution,[],[f12305,f16]) ).

fof(f12547,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(X0,X2)))
      | ~ is_a_theorem(implies(X0,implies(X0,X1))) ),
    inference(resolution,[],[f12319,f11]) ).

fof(f12598,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X2,implies(X2,implies(X0,X1))))
      | is_a_theorem(implies(implies(implies(X0,X1),X0),implies(X2,X1))) ),
    inference(resolution,[],[f12319,f498]) ).

fof(f12657,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X0,X1)))
      | is_a_theorem(implies(implies(X1,X2),implies(X3,implies(X0,X2)))) ),
    inference(resolution,[],[f12547,f190]) ).

fof(f12710,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(implies(implies(X0,X1),X1),X2),implies(X3,implies(X0,X2)))),
    inference(resolution,[],[f12657,f1660]) ).

fof(f13134,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(implies(implies(X1,X2),X2),X3)),implies(X0,implies(X1,X3)))),
    inference(resolution,[],[f12710,f2546]) ).

fof(f13328,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(implies(implies(X1,X3),X3),X2)))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f13134,f14]) ).

fof(f13636,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,implies(X1,X2))),implies(X1,implies(X0,X2)))),
    inference(resolution,[],[f13328,f4339]) ).

fof(f14584,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,implies(implies(X1,X2),X3))),implies(X2,implies(X0,X3)))),
    inference(resolution,[],[f13636,f1328]) ).

fof(f16537,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X1,implies(implies(X3,X0),X2))))
      | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) ),
    inference(resolution,[],[f14584,f2527]) ).

fof(f16631,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(implies(X3,X0),X2)))
      | is_a_theorem(implies(implies(X0,X1),implies(X0,X2))) ),
    inference(resolution,[],[f16537,f15]) ).

fof(f16792,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,implies(X0,X1))),implies(X0,implies(X2,X1)))),
    inference(resolution,[],[f16631,f501]) ).

fof(f16902,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X0,X1)),implies(X2,implies(X0,implies(X3,X1))))),
    inference(resolution,[],[f16792,f190]) ).

fof(f17388,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,X2)),implies(implies(X1,X0),implies(X1,implies(X3,X2))))),
    inference(resolution,[],[f16902,f2556]) ).

fof(f17616,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X0,implies(X2,X3))))
      | ~ is_a_theorem(implies(X1,implies(X0,X3))) ),
    inference(resolution,[],[f17388,f14]) ).

fof(f17727,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,X2)))
      | is_a_theorem(implies(X1,implies(X3,X2)))
      | ~ is_a_theorem(implies(X1,X0)) ),
    inference(resolution,[],[f17616,f14]) ).

fof(f17748,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X0,X3)))
      | is_a_theorem(implies(X0,implies(X1,X2)))
      | ~ is_a_theorem(implies(X3,X2)) ),
    inference(resolution,[],[f17727,f48]) ).

fof(f18137,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(implies(X0,X3),X3),X2))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f17748,f1660]) ).

fof(f18244,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(X0,implies(X1,implies(implies(X0,X2),X3))))
      | ~ is_a_theorem(implies(X2,X3)) ),
    inference(resolution,[],[f18137,f48]) ).

fof(f18427,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ is_a_theorem(implies(implies(implies(X2,X0),X1),X4))
      | is_a_theorem(implies(X2,implies(X3,X4)))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f18244,f17748]) ).

fof(f18550,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3))))
      | ~ is_a_theorem(implies(X1,X3)) ),
    inference(resolution,[],[f18427,f1632]) ).

fof(f18757,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ is_a_theorem(implies(implies(X2,X1),X4))
      | is_a_theorem(implies(implies(X2,X0),implies(X3,X4)))
      | ~ is_a_theorem(implies(X0,X1)) ),
    inference(resolution,[],[f18550,f17748]) ).

fof(f19032,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3))))
      | ~ is_a_theorem(implies(X1,implies(X0,X3))) ),
    inference(resolution,[],[f18757,f71]) ).

fof(f19257,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ is_a_theorem(implies(implies(X1,X2),X4))
      | is_a_theorem(implies(implies(X1,X0),implies(X3,X4)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f19032,f17748]) ).

fof(f19528,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ is_a_theorem(implies(X1,implies(X0,implies(implies(X4,X0),X3))))
      | is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3)))) ),
    inference(resolution,[],[f19257,f106]) ).

fof(f19534,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3))))
      | ~ is_a_theorem(implies(X1,implies(X0,implies(X0,X3)))) ),
    inference(resolution,[],[f19257,f71]) ).

fof(f19667,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X3,X0),implies(implies(X1,X3),implies(X1,X2))))
      | ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X2)))) ),
    inference(resolution,[],[f19534,f2556]) ).

fof(f19741,plain,
    ! [X2,X0,X1] :
      ( is_a_theorem(implies(implies(implies(X1,X2),X1),implies(implies(X1,X0),X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X2)))) ),
    inference(resolution,[],[f19534,f12598]) ).

fof(f19921,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X2))))
      | is_a_theorem(implies(implies(X3,X0),implies(X3,implies(X1,X2)))) ),
    inference(resolution,[],[f19667,f1328]) ).

fof(f19955,plain,
    ! [X2,X3,X0,X1] : is_a_theorem(implies(implies(X0,implies(X1,implies(implies(X2,X1),X3))),implies(X0,implies(X1,X3)))),
    inference(resolution,[],[f19921,f1297]) ).

fof(f20155,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(X1,implies(X3,implies(implies(X1,X0),X2))))
      | ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X2)))) ),
    inference(resolution,[],[f19741,f190]) ).

fof(f20441,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,implies(implies(X3,X1),X2))))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f19955,f14]) ).

fof(f20571,plain,
    ! [X2,X0,X1] :
      ( ~ is_a_theorem(implies(X1,implies(X0,implies(X0,X2))))
      | is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f20441,f20155]) ).

fof(f20845,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(implies(X0,X2),implies(implies(X0,X1),X3)))
      | is_a_theorem(implies(implies(X0,X1),implies(implies(X1,X2),X3))) ),
    inference(resolution,[],[f20571,f459]) ).

fof(f21074,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),X2),implies(implies(X2,falsehood),X0))),
    inference(resolution,[],[f20845,f3681]) ).

fof(f21213,plain,
    ! [X2,X0,X1] : is_a_theorem(implies(implies(implies(X0,X1),implies(X2,falsehood)),implies(X2,X0))),
    inference(resolution,[],[f21074,f13328]) ).

fof(f22749,plain,
    ! [X2,X3,X0,X1] :
      ( ~ is_a_theorem(implies(X0,implies(X1,implies(X1,X3))))
      | is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3)))) ),
    inference(resolution,[],[f19528,f20155]) ).

fof(f23004,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X1),implies(X2,implies(X0,X3))))
      | ~ is_a_theorem(implies(X0,implies(X1,X3))) ),
    inference(resolution,[],[f22749,f43]) ).

fof(f23261,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X0,X3),implies(implies(X3,X1),implies(X0,X2))))
      | ~ is_a_theorem(implies(X0,implies(X1,X2))) ),
    inference(resolution,[],[f23004,f20845]) ).

fof(f26922,plain,
    ! [X2,X3,X0,X1] :
      ( is_a_theorem(implies(implies(X3,X1),implies(X0,X2)))
      | ~ is_a_theorem(implies(X0,implies(X1,X2)))
      | ~ is_a_theorem(implies(X0,X3)) ),
    inference(resolution,[],[f23261,f14]) ).

fof(f29732,plain,
    ( ~ is_a_theorem(implies(implies(implies(a,b),implies(c,falsehood)),implies(falsehood,e)))
    | ~ is_a_theorem(implies(implies(implies(a,b),implies(c,falsehood)),implies(c,a))) ),
    inference(resolution,[],[f26922,f2084]) ).

fof(f29985,plain,
    ~ is_a_theorem(implies(implies(implies(a,b),implies(c,falsehood)),implies(c,a))),
    inference(forward_subsumption_resolution,[],[f29732,f51]) ).

fof(f29994,plain,
    $false,
    inference(forward_subsumption_resolution,[],[f29985,f21213]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : LCL028+1 : TPTP v9.2.1. Released v9.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.17/0.33  % Computer   : n006.cluster.edu
% 0.17/0.33  % Model      : x86_64 x86_64
% 0.17/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.17/0.33  % Memory     : 8042.1875MB
% 0.17/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.17/0.33  % CPULimit   : 300
% 0.17/0.33  % WCLimit    : 300
% 0.17/0.33  % DateTime   : Thu Apr 30 19:45:46 EDT 2026
% 0.17/0.33  % CPUTime    : 
% 0.17/0.35  This is a FOF_THM_RFO_NEQ problem
% 0.20/0.35  Running first-order theorem proving
% 0.20/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.46/0.63  % (20109)Detected formulas, will run a generic FOF schedule.
% 0.48/0.74  % (20117)dis-21_1_sil=8000:lcm=predicate:random_seed=2313945314:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.48/0.77  % (20112)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=3722630320:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.48/0.77  % (20111)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=4143539586:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.48/0.77  % (20114)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=2665256658:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.48/0.77  % (20113)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3945858113:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.48/0.77  % (20116)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=4159557145:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.48/0.77  % (20115)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=459783376:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.48/0.78  % (20114)Refutation not found, incomplete strategy
% 0.48/0.78  % (20114)------------------------------
% 0.48/0.78  % (20114)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.48/0.78  % (20114)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.48/0.78  % (20114)CaDiCaL version: 2.1.3
% 0.48/0.78  % (20114)Termination reason: Refutation not found, incomplete strategy
% 0.48/0.78  % (20114)Time elapsed: 0.0000 s
% 0.48/0.78  % (20114)Peak memory usage: 81 MB
% 0.48/0.79  % (20117)Instruction limit reached! 
% 0.48/0.79  % (20117)------------------------------
% 0.48/0.79  % (20117)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.48/0.79  % (20117)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.48/0.79  % (20117)CaDiCaL version: 2.1.3
% 0.48/0.79  % (20117)Termination reason: Instruction limit
% 0.48/0.79  % (20117)Termination phase: Saturation
% 0.48/0.79  % (20117)Time elapsed: 0.047 s
% 0.48/0.79  % (20117)Peak memory usage: 82 MB
% 0.48/0.79  % (20117)Instructions burned: 130 (million)
% 0.63/0.81  % (20115)Instruction limit reached! 
% 0.63/0.81  % (20115)------------------------------
% 0.63/0.81  % (20115)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.63/0.81  % (20115)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.63/0.81  % (20115)CaDiCaL version: 2.1.3
% 0.63/0.81  % (20115)Termination reason: Instruction limit
% 0.63/0.81  % (20115)Termination phase: Saturation
% 0.63/0.81  % (20115)Time elapsed: 0.041 s
% 0.63/0.81  % (20115)Peak memory usage: 81 MB
% 0.63/0.81  % (20115)Instructions burned: 120 (million)
% 0.63/0.83  % (20116)Instruction limit reached! 
% 0.63/0.83  % (20116)------------------------------
% 0.63/0.83  % (20116)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.63/0.83  % (20116)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.63/0.83  % (20116)CaDiCaL version: 2.1.3
% 0.63/0.83  % (20116)Termination reason: Instruction limit
% 0.63/0.83  % (20116)Termination phase: Saturation
% 0.63/0.83  % (20116)Time elapsed: 0.057 s
% 0.63/0.83  % (20116)Peak memory usage: 82 MB
% 0.63/0.83  % (20116)Instructions burned: 141 (million)
% 1.01/0.91  % (20114)------------------------------
% 1.01/0.91  % (20114)------------------------------
% 1.01/0.91  % (20125)lrs+10_1_sil=8000:sp=occurrence:random_seed=533762220:i=285:sd=3:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/285Mi)
% 1.01/0.94  % (20126)lrs+10_1_sil=32000:urr=on:br=off:random_seed=2764995507:i=157:sd=1:gtg=position:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/157Mi)
% 1.01/0.94  % (20127)lrs+1011_1_sil=32000:sp=occurrence:random_seed=2792253744:i=325:sd=1:ss=axioms:sgt=32_2997 on theBenchmark for (2997ds/325Mi)
% 1.01/0.99  % (20126)Instruction limit reached! 
% 1.01/0.99  % (20126)------------------------------
% 1.01/0.99  % (20126)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 1.01/0.99  % (20126)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 1.01/0.99  % (20126)CaDiCaL version: 2.1.3
% 1.01/0.99  % (20126)Termination reason: Instruction limit
% 1.01/0.99  % (20126)Termination phase: Saturation
% 1.01/0.99  % (20126)Time elapsed: 0.048 s
% 1.01/0.99  % (20126)Peak memory usage: 82 MB
% 1.01/0.99  % (20126)Instructions burned: 159 (million)
% 1.01/1.01  % (20125)Instruction limit reached! 
% 1.01/1.01  % (20125)------------------------------
% 1.01/1.01  % (20125)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 1.01/1.01  % (20125)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 1.01/1.01  % (20125)CaDiCaL version: 2.1.3
% 1.01/1.01  % (20125)Termination reason: Instruction limit
% 1.01/1.01  % (20125)Termination phase: Saturation
% 1.01/1.01  % (20125)Time elapsed: 0.098 s
% 1.01/1.01  % (20125)Peak memory usage: 83 MB
% 1.01/1.01  % (20125)Instructions burned: 285 (million)
% 3.08/1.04  % (20129)dis+10_5:1_slsqr=1,4:sil=8000:fde=unused:erd=off:urr=full:fd=off:s2agt=8:br=off:slsq=on:random_seed=1822144118:s2a=on:i=248:s2at=1.23:gtg=position_2997 on theBenchmark for (2997ds/248Mi)
% 3.08/1.11  % (20132)lrs+1002_1_to=lpo:sil=8000:sos=on:random_seed=3706652811:st=4:cts=off:i=294:sd=2:ins=7:amm=off:ss=axioms_2996 on theBenchmark for (2996ds/294Mi)
% 3.08/1.11  % (20132)Refutation not found, incomplete strategy
% 3.08/1.11  % (20132)------------------------------
% 3.08/1.11  % (20132)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.08/1.11  % (20132)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.08/1.11  % (20132)CaDiCaL version: 2.1.3
% 3.08/1.11  % (20132)Termination reason: Refutation not found, incomplete strategy
% 3.08/1.11  % (20132)Time elapsed: 0.0000 s
% 3.08/1.11  % (20132)Peak memory usage: 80 MB
% 3.08/1.11  % (20127)Instruction limit reached! 
% 3.08/1.11  % (20127)------------------------------
% 3.08/1.11  % (20127)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.08/1.11  % (20127)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.08/1.11  % (20127)CaDiCaL version: 2.1.3
% 3.08/1.11  % (20127)Termination reason: Instruction limit
% 3.08/1.11  % (20127)Termination phase: Saturation
% 3.08/1.11  % (20127)Time elapsed: 0.167 s
% 3.08/1.11  % (20127)Peak memory usage: 85 MB
% 3.08/1.11  % (20127)Instructions burned: 325 (million)
% 3.34/1.12  % (20129)Instruction limit reached! 
% 3.34/1.12  % (20129)------------------------------
% 3.34/1.12  % (20129)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.34/1.12  % (20129)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.34/1.12  % (20129)CaDiCaL version: 2.1.3
% 3.34/1.12  % (20129)Termination reason: Instruction limit
% 3.34/1.12  % (20129)Termination phase: Saturation
% 3.34/1.12  % (20129)Time elapsed: 0.080 s
% 3.34/1.12  % (20129)Peak memory usage: 82 MB
% 3.34/1.12  % (20129)Instructions burned: 250 (million)
% 3.34/1.13  % (20133)lrs+10_1_ncem=casc2026/models/loop7.pt:sil=32000:tgt=ground:npcc=on:random_seed=1221542494:i=2350_2996 on theBenchmark for (2996ds/2350Mi)
% 3.99/1.24  % (20132)------------------------------
% 3.99/1.24  % (20132)------------------------------
% 3.99/1.24  % (20138)lrs-1004_1_sil=8000:sp=occurrence:sos=all:erd=off:fs=off:bce=on:random_seed=1265150265:i=127:av=off:fsr=off:sup=off_2995 on theBenchmark for (2995ds/127Mi)
% 3.99/1.24  % (20136)dis-1011_32:1_sfv=off:sil=16000:sos=all:erd=off:acc=on:fd=off:flr=on:random_seed=3694944811:cts=off:i=113:fsr=off:ss=included:sgt=4_2995 on theBenchmark for (2995ds/113Mi)
% 3.99/1.28  % (20136)Instruction limit reached! 
% 3.99/1.28  % (20136)------------------------------
% 3.99/1.28  % (20136)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.99/1.28  % (20136)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.99/1.28  % (20136)CaDiCaL version: 2.1.3
% 3.99/1.28  % (20136)Termination reason: Instruction limit
% 3.99/1.28  % (20136)Termination phase: Saturation
% 3.99/1.28  % (20136)Time elapsed: 0.038 s
% 3.99/1.28  % (20136)Peak memory usage: 81 MB
% 3.99/1.28  % (20136)Instructions burned: 116 (million)
% 3.99/1.28  % (20138)Instruction limit reached! 
% 3.99/1.28  % (20138)------------------------------
% 3.99/1.28  % (20138)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 3.99/1.28  % (20138)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 3.99/1.28  % (20138)CaDiCaL version: 2.1.3
% 3.99/1.28  % (20138)Termination reason: Instruction limit
% 3.99/1.28  % (20138)Termination phase: Saturation
% 3.99/1.28  % (20138)Time elapsed: 0.038 s
% 3.99/1.28  % (20138)Peak memory usage: 81 MB
% 3.99/1.28  % (20138)Instructions burned: 128 (million)
% 4.66/1.36  % (20142)dis-1003_1024_sil=8000:sos=all:sac=on:random_seed=4193880148:cond=fast:i=114:sd=1:nm=0:fsr=off:gtg=exists_sym:ss=axioms_2993 on theBenchmark for (2993ds/114Mi)
% 4.66/1.39  % (20144)dis-1010_1_sil=16000:fde=unused:sp=occurrence:sos=on:random_seed=139674688:i=437:sd=1:aac=none:ss=included_2993 on theBenchmark for (2993ds/437Mi)
% 4.66/1.39  % (20144)Refutation not found, incomplete strategy
% 4.66/1.39  % (20144)------------------------------
% 4.66/1.39  % (20144)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 4.66/1.39  % (20144)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 4.66/1.39  % (20144)CaDiCaL version: 2.1.3
% 4.66/1.39  % (20144)Termination reason: Refutation not found, incomplete strategy
% 4.66/1.39  % (20144)Time elapsed: 0.0000 s
% 4.66/1.39  % (20144)Peak memory usage: 80 MB
% 4.96/1.40  % (20142)Instruction limit reached! 
% 4.96/1.40  % (20142)------------------------------
% 4.96/1.40  % (20142)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 4.96/1.40  % (20142)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 4.96/1.40  % (20142)CaDiCaL version: 2.1.3
% 4.96/1.40  % (20142)Termination reason: Instruction limit
% 4.96/1.40  % (20142)Termination phase: Saturation
% 4.96/1.40  % (20142)Time elapsed: 0.039 s
% 4.96/1.40  % (20142)Peak memory usage: 82 MB
% 4.96/1.40  % (20142)Instructions burned: 114 (million)
% 4.96/1.43  % (20143)lrs+10_1_sil=8000:sp=occurrence:random_seed=577634238:st=1.2:i=907:sd=14:ss=axioms:sgt=12_2993 on theBenchmark for (2993ds/907Mi)
% 5.43/1.52  % (20144)------------------------------
% 5.43/1.52  % (20144)------------------------------
% 5.43/1.53  % (20147)lrs-1002_1_ncem=casc2026/models/all5champsBiggishL14.pt:sil=16000:npcc=on:random_seed=2089698710:i=5202:ss=axioms:sgt=16_2992 on theBenchmark for (2992ds/5202Mi)
% 5.97/1.66  % (20149)dis+10_3:1_sil=8000:acc=on:urr=on:br=off:sac=on:newcnf=on:random_seed=171659297:i=134:sd=2:doe=on:nm=16:sup=off:ss=included_2991 on theBenchmark for (2991ds/134Mi)
% 6.27/1.70  % (20149)Instruction limit reached! 
% 6.27/1.70  % (20149)------------------------------
% 6.27/1.70  % (20149)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 6.27/1.70  % (20149)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 6.27/1.70  % (20149)CaDiCaL version: 2.1.3
% 6.27/1.70  % (20149)Termination reason: Instruction limit
% 6.27/1.70  % (20149)Termination phase: Saturation
% 6.27/1.70  % (20149)Time elapsed: 0.042 s
% 6.27/1.70  % (20149)Peak memory usage: 81 MB
% 6.27/1.70  % (20149)Instructions burned: 134 (million)
% 6.27/1.74  % (20143)Instruction limit reached! 
% 6.27/1.74  % (20143)------------------------------
% 6.27/1.74  % (20143)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 6.27/1.74  % (20143)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 6.27/1.74  % (20143)CaDiCaL version: 2.1.3
% 6.27/1.74  % (20143)Termination reason: Instruction limit
% 6.27/1.74  % (20143)Termination phase: Saturation
% 6.27/1.74  % (20143)Time elapsed: 0.315 s
% 6.27/1.74  % (20143)Peak memory usage: 87 MB
% 6.27/1.74  % (20143)Instructions burned: 909 (million)
% 7.21/1.83  % (20152)lrs+1002_8_sil=8000:sp=occurrence:sos=on:sac=on:random_seed=3488165075:st=8:i=592:sd=3:ep=RST:ss=axioms_2989 on theBenchmark for (2989ds/592Mi)
% 7.21/1.83  % (20152)Refutation not found, incomplete strategy
% 7.21/1.83  % (20152)------------------------------
% 7.21/1.83  % (20152)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 7.21/1.83  % (20152)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 7.21/1.83  % (20152)CaDiCaL version: 2.1.3
% 7.21/1.83  % (20152)Termination reason: Refutation not found, incomplete strategy
% 7.21/1.83  % (20152)Time elapsed: 0.0000 s
% 7.21/1.83  % (20152)Peak memory usage: 80 MB
% 7.21/1.88  % (20153)lrs+10_1_ncem=casc2026/models/loop6.pt:sil=32000:npcc=on:random_seed=2807049725:st=3:i=13193:sd=3:ss=axioms_2988 on theBenchmark for (2988ds/13193Mi)
% 7.52/1.95  % (20152)------------------------------
% 7.52/1.95  % (20152)------------------------------
% 7.52/1.98  % (20133)Instruction limit reached! 
% 7.52/1.98  % (20133)------------------------------
% 7.52/1.98  % (20133)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 7.52/1.98  % (20133)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 7.52/1.98  % (20133)CaDiCaL version: 2.1.3
% 7.52/1.98  % (20133)Termination reason: Instruction limit
% 7.52/1.98  % (20133)Termination phase: Saturation
% 7.52/1.98  % (20133)Time elapsed: 0.848 s
% 7.52/1.98  % (20133)Peak memory usage: 121 MB
% 7.52/1.98  % (20133)Instructions burned: 2350 (million)
% 9.89/2.08  % (20156)lrs+1666_7_slsqr=4,1:sil=8000:plsq=on:plsqc=1:sos=on:urr=on:plsql=on:rp=on:alpa=false:sac=on:slsq=on:random_seed=474184947:i=125:slsql=off:bs=unit_only:gtg=position:fdi=2:gsp=on:ss=axioms:sgt=8_2986 on theBenchmark for (2986ds/125Mi)
% 10.57/2.12  % (20156)Instruction limit reached! 
% 10.57/2.12  % (20156)------------------------------
% 10.57/2.12  % (20156)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 10.57/2.12  % (20156)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 10.57/2.12  % (20156)CaDiCaL version: 2.1.3
% 10.57/2.12  % (20156)Termination reason: Instruction limit
% 10.57/2.12  % (20156)Termination phase: Saturation
% 10.57/2.12  % (20156)Time elapsed: 0.041 s
% 10.57/2.12  % (20156)Peak memory usage: 82 MB
% 10.57/2.12  % (20156)Instructions burned: 128 (million)
% 10.57/2.12  % (20157)lrs+10_1024_to=lpo:sil=8000:tgt=full:sp=arity:slsq=on:random_seed=1221718411:i=134:gtgl=5:slsql=off:gtg=exists_sym_2986 on theBenchmark for (2986ds/134Mi)
% 10.57/2.17  % (20157)Instruction limit reached! 
% 10.57/2.17  % (20157)------------------------------
% 10.57/2.17  % (20157)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 10.57/2.17  % (20157)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 10.57/2.17  % (20157)CaDiCaL version: 2.1.3
% 10.57/2.17  % (20157)Termination reason: Instruction limit
% 10.57/2.17  % (20157)Termination phase: Saturation
% 10.57/2.17  % (20157)Time elapsed: 0.047 s
% 10.57/2.17  % (20157)Peak memory usage: 83 MB
% 10.57/2.17  % (20157)Instructions burned: 137 (million)
% 11.09/2.24  % (20160)lrs+10_1_sil=16000:plsq=on:plsqc=1:plsqr=32,1:sos=on:lcm=reverse:fd=off:newcnf=on:random_seed=1930413493:i=141:sd=1:gsp=on:sup=off:ss=axioms:sgt=8_2985 on theBenchmark for (2985ds/141Mi)
% 11.09/2.24  % (20160)Refutation not found, incomplete strategy
% 11.09/2.24  % (20160)------------------------------
% 11.09/2.24  % (20160)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 11.09/2.24  % (20160)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 11.09/2.24  % (20160)CaDiCaL version: 2.1.3
% 11.09/2.24  % (20160)Termination reason: Refutation not found, incomplete strategy
% 11.09/2.24  % (20160)Time elapsed: 0.0000 s
% 11.09/2.24  % (20160)Peak memory usage: 80 MB
% 11.58/2.30  % (20161)lrs+1011_1_sil=8000:plsq=on:sp=occurrence:fs=off:random_seed=1433551844:i=431:sd=1:fsr=off:sup=off:ss=axioms:sgt=64_2984 on theBenchmark for (2984ds/431Mi)
% 11.58/2.37  % (20160)------------------------------
% 11.58/2.37  % (20160)------------------------------
% 12.33/2.44  % (20161)Instruction limit reached! 
% 12.33/2.44  % (20161)------------------------------
% 12.33/2.44  % (20161)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 12.33/2.44  % (20161)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 12.33/2.44  % (20161)CaDiCaL version: 2.1.3
% 12.33/2.44  % (20161)Termination reason: Instruction limit
% 12.33/2.44  % (20161)Termination phase: Saturation
% 12.33/2.44  % (20161)Time elapsed: 0.136 s
% 12.33/2.44  % (20161)Peak memory usage: 84 MB
% 12.33/2.44  % (20161)Instructions burned: 432 (million)
% 12.33/2.49  % (20164)lrs+1010_1_ncem=casc2026/models/loop6.pt:sil=64000:tgt=full:npcc=on:prc=on:urr=ec_only:bsr=on:fd=preordered:gs=on:sac=on:newcnf=on:random_seed=3380643785:i=6060:aac=none:ins=25_2982 on theBenchmark for (2982ds/6060Mi)
% 13.12/2.57  % (20165)lrs+10_16_anc=all:slsqr=32,1:sil=8000:avsql=on:sp=unary_frequency:lcm=predicate:urr=full:rp=on:br=off:slsqc=4:flr=on:sac=on:slsq=on:avsqc=1:random_seed=278343689:avsq=on:s2a=on:i=150:kws=precedence:nicw=on:gsp=on:rawr=on_2981 on theBenchmark for (2981ds/150Mi)
% 13.60/2.63  % (20165)Instruction limit reached! 
% 13.60/2.63  % (20165)------------------------------
% 13.60/2.63  % (20165)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 13.60/2.63  % (20165)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 13.60/2.63  % (20165)CaDiCaL version: 2.1.3
% 13.60/2.63  % (20165)Termination reason: Instruction limit
% 13.60/2.63  % (20165)Termination phase: Saturation
% 13.60/2.63  % (20165)Time elapsed: 0.061 s
% 13.60/2.63  % (20165)Peak memory usage: 83 MB
% 13.60/2.63  % (20165)Instructions burned: 153 (million)
% 14.28/2.77  % (20168)lrs+1010_1_ncem=casc2026/models/loop8.pt:sil=64000:tgt=ground:npcc=on:sp=arity:urr=on:random_seed=4197070949:i=14155:bd=all_2979 on theBenchmark for (2979ds/14155Mi)
% 18.10/3.26  % (20147)Instruction limit reached! 
% 18.10/3.26  % (20147)------------------------------
% 18.10/3.26  % (20147)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 18.10/3.26  % (20147)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 18.10/3.26  % (20147)CaDiCaL version: 2.1.3
% 18.10/3.26  % (20147)Termination reason: Instruction limit
% 18.10/3.26  % (20147)Termination phase: Saturation
% 18.10/3.26  % (20147)Time elapsed: 1.729 s
% 18.10/3.26  % (20147)Peak memory usage: 135 MB
% 18.10/3.26  % (20147)Instructions burned: 5204 (million)
% 18.79/3.40  % (20170)lrs+10_1024_sil=16000:plsq=on:plsqr=32,1:sos=all:fs=off:gs=on:newcnf=on:random_seed=1872861128:i=667:av=off:fsr=off_2973 on theBenchmark for (2973ds/667Mi)
% 18.79/3.40  % (20170)Refutation not found, incomplete strategy
% 18.79/3.40  % (20170)------------------------------
% 18.79/3.40  % (20170)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 18.79/3.40  % (20170)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 18.79/3.40  % (20170)CaDiCaL version: 2.1.3
% 18.79/3.40  % (20170)Termination reason: Refutation not found, incomplete strategy
% 18.79/3.40  % (20170)Time elapsed: 0.0000 s
% 18.79/3.40  % (20170)Peak memory usage: 80 MB
% 20.01/3.52  % (20170)------------------------------
% 20.01/3.52  % (20170)------------------------------
% 20.85/3.65  % (20172)ott-1011_3:1_anc=all_dependent:to=lpo:sil=8000:drc=ordering:sas=cadical:fdtod=off:sp=reverse_frequency:spb=goal_then_units:urr=full:lftc=20:newcnf=on:random_seed=3591149004:s2a=on:i=185:s2at=1.8:fdi=4_2971 on theBenchmark for (2971ds/185Mi)
% 21.45/3.71  % (20172)Instruction limit reached! 
% 21.45/3.71  % (20172)------------------------------
% 21.45/3.71  % (20172)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 21.45/3.71  % (20172)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 21.45/3.71  % (20172)CaDiCaL version: 2.1.3
% 21.45/3.71  % (20172)Termination reason: Instruction limit
% 21.45/3.71  % (20172)Termination phase: Saturation
% 21.45/3.71  % (20172)Time elapsed: 0.053 s
% 21.45/3.71  % (20172)Peak memory usage: 82 MB
% 21.45/3.71  % (20172)Instructions burned: 188 (million)
% 22.24/3.84  % (20174)dis+1010_14_anc=all:to=lpo:sil=8000:sp=arity:slsq=on:random_seed=2596737163:i=193:ins=10:fsr=off:ss=axioms:fsd=on_2969 on theBenchmark for (2969ds/193Mi)
% 22.85/3.90  % (20174)Instruction limit reached! 
% 22.85/3.90  % (20174)------------------------------
% 22.85/3.90  % (20174)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 22.85/3.90  % (20174)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 22.85/3.90  % (20174)CaDiCaL version: 2.1.3
% 22.85/3.90  % (20174)Termination reason: Instruction limit
% 22.85/3.90  % (20174)Termination phase: Saturation
% 22.85/3.90  % (20174)Time elapsed: 0.063 s
% 22.85/3.90  % (20174)Peak memory usage: 85 MB
% 22.85/3.90  % (20174)Instructions burned: 196 (million)
% 23.82/4.03  % (20176)dis+1011_7_sil=8000:sp=occurrence:sos=all:fd=off:random_seed=2571812052:st=5.3:i=4850:sd=4:av=off:sup=off:ss=included:sgt=16_2967 on theBenchmark for (2967ds/4850Mi)
% 26.55/4.48  % (20164)Instruction limit reached! 
% 26.55/4.48  % (20164)------------------------------
% 26.55/4.48  % (20164)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 26.55/4.48  % (20164)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 26.55/4.48  % (20164)CaDiCaL version: 2.1.3
% 26.55/4.48  % (20164)Termination reason: Instruction limit
% 26.55/4.48  % (20164)Termination phase: Saturation
% 26.55/4.48  % (20164)Time elapsed: 1.983 s
% 26.55/4.48  % (20164)Peak memory usage: 132 MB
% 26.55/4.48  % (20164)Instructions burned: 6061 (million)
% 27.82/4.61  % (20178)lrs+1011_1_ncem=casc2026/models/loop8.pt:sil=32000:tgt=ground:npcc=on:sp=const_frequency:acc=on:urr=on:random_seed=3059068482:i=12111:sd=1:ss=included_2961 on theBenchmark for (2961ds/12111Mi)
% 36.31/5.86  % (20176)Instruction limit reached! 
% 36.31/5.86  % (20176)------------------------------
% 36.31/5.86  % (20176)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 36.31/5.86  % (20176)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 36.31/5.86  % (20176)CaDiCaL version: 2.1.3
% 36.31/5.86  % (20176)Termination reason: Instruction limit
% 36.31/5.86  % (20176)Termination phase: Saturation
% 36.31/5.86  % (20176)Time elapsed: 1.827 s
% 36.31/5.86  % (20176)Peak memory usage: 126 MB
% 36.31/5.86  % (20176)Instructions burned: 4850 (million)
% 37.01/5.99  % (20180)lrs-11_32_anc=all:sil=8000:spb=goal_then_units:sac=on:random_seed=2789646812:i=319:kws=precedence:fsr=off_2947 on theBenchmark for (2947ds/319Mi)
% 37.91/6.09  % (20180)Instruction limit reached! 
% 37.91/6.09  % (20180)------------------------------
% 37.91/6.09  % (20180)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 37.91/6.09  % (20180)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 37.91/6.09  % (20180)CaDiCaL version: 2.1.3
% 37.91/6.09  % (20180)Termination reason: Instruction limit
% 37.91/6.09  % (20180)Termination phase: Saturation
% 37.91/6.09  % (20180)Time elapsed: 0.103 s
% 37.91/6.09  % (20180)Peak memory usage: 84 MB
% 37.91/6.09  % (20180)Instructions burned: 321 (million)
% 39.03/6.22  % (20182)dis+2_1024_sil=8000:sp=reverse_arity:sos=on:lcm=reverse:sac=on:random_seed=3382096816:i=2064:ep=RST_2945 on theBenchmark for (2945ds/2064Mi)
% 39.03/6.23  % (20182)Refutation not found, incomplete strategy
% 39.03/6.23  % (20182)------------------------------
% 39.03/6.23  % (20182)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 39.03/6.23  % (20182)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 39.03/6.23  % (20182)CaDiCaL version: 2.1.3
% 39.03/6.23  % (20182)Termination reason: Refutation not found, incomplete strategy
% 39.03/6.23  % (20182)Time elapsed: 0.0000 s
% 39.03/6.23  % (20182)Peak memory usage: 80 MB
% 39.64/6.30  % (20153)Instruction limit reached! 
% 39.64/6.30  % (20153)------------------------------
% 39.64/6.30  % (20153)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 39.64/6.30  % (20153)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 39.64/6.30  % (20153)CaDiCaL version: 2.1.3
% 39.64/6.30  % (20153)Termination reason: Instruction limit
% 39.64/6.30  % (20153)Termination phase: Saturation
% 39.64/6.30  % (20153)Time elapsed: 4.422 s
% 39.64/6.30  % (20153)Peak memory usage: 219 MB
% 39.64/6.30  % (20153)Instructions burned: 13196 (million)
% 39.64/6.35  % (20182)------------------------------
% 39.64/6.35  % (20182)------------------------------
% 40.42/6.43  % (20184)dis-1011_128_sil=32000:random_seed=3594746027:i=3706:ep=RST:av=off_2943 on theBenchmark for (2943ds/3706Mi)
% 40.42/6.48  % (20185)lrs-1002_1_sil=8000:plsq=on:plsqr=32,1:sp=occurrence:sos=on:fs=off:gs=on:newcnf=on:random_seed=3140942192:i=757:sd=2:fsr=off:ss=axioms:sgt=40_2942 on theBenchmark for (2942ds/757Mi)
% 40.42/6.48  % (20185)Refutation not found, incomplete strategy
% 40.42/6.48  % (20185)------------------------------
% 40.42/6.48  % (20185)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 40.42/6.48  % (20185)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 40.42/6.48  % (20185)CaDiCaL version: 2.1.3
% 40.42/6.48  % (20185)Termination reason: Refutation not found, incomplete strategy
% 40.42/6.48  % (20185)Time elapsed: 0.001 s
% 40.42/6.48  % (20185)Peak memory usage: 82 MB
% 41.46/6.61  % (20185)------------------------------
% 41.46/6.61  % (20185)------------------------------
% 42.21/6.74  % (20188)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=64000:npcc=on:sp=occurrence:random_seed=882198104:i=13913:ss=axioms:sgt=8_2940 on theBenchmark for (2940ds/13913Mi)
% 42.70/6.86  % (20168)Instruction limit reached! 
% 42.70/6.86  % (20168)------------------------------
% 42.70/6.86  % (20168)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 42.70/6.86  % (20168)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 42.70/6.86  % (20168)CaDiCaL version: 2.1.3
% 42.70/6.86  % (20168)Termination reason: Instruction limit
% 42.70/6.86  % (20168)Termination phase: Saturation
% 42.70/6.86  % (20168)Time elapsed: 4.090 s
% 42.70/6.86  % (20168)Peak memory usage: 259 MB
% 42.70/6.86  % (20168)Instructions burned: 14155 (million)
% 43.17/7.00  % (20190)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=32000:npcc=on:sp=const_frequency:sos=all:lma=off:random_seed=1289286442:i=9925:aac=none_2937 on theBenchmark for (2937ds/9925Mi)
% 48.23/7.59  % (20184)Instruction limit reached! 
% 48.23/7.59  % (20184)------------------------------
% 48.23/7.59  % (20184)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 48.23/7.59  % (20184)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 48.23/7.59  % (20184)CaDiCaL version: 2.1.3
% 48.23/7.59  % (20184)Termination reason: Instruction limit
% 48.23/7.59  % (20184)Termination phase: Saturation
% 48.23/7.59  % (20184)Time elapsed: 1.157 s
% 48.23/7.59  % (20184)Peak memory usage: 106 MB
% 48.23/7.59  % (20184)Instructions burned: 3708 (million)
% 49.51/7.73  % (20192)dis-1010_50_to=lpo:sil=32000:sp=arity:sos=on:spb=goal_then_units:urr=ec_only:slsq=on:random_seed=4179733289:i=2479:sd=2:nm=16:fsr=off:ss=axioms_2930 on theBenchmark for (2930ds/2479Mi)
% 49.51/7.73  % (20192)Refutation not found, incomplete strategy
% 49.51/7.73  % (20192)------------------------------
% 49.51/7.73  % (20192)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 49.51/7.73  % (20192)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 49.51/7.73  % (20192)CaDiCaL version: 2.1.3
% 49.51/7.73  % (20192)Termination reason: Refutation not found, incomplete strategy
% 49.51/7.73  % (20192)Time elapsed: 0.0000 s
% 49.51/7.73  % (20192)Peak memory usage: 80 MB
% 50.11/7.86  % (20192)------------------------------
% 50.11/7.86  % (20192)------------------------------
% 50.99/7.99  % (20194)ott+1002_64_sil=16000:sp=const_min:nwc=0.5:random_seed=3988637622:i=440:nm=2:av=off:gtg=exists_all:fdi=8:gsp=on_2927 on theBenchmark for (2927ds/440Mi)
% 51.80/8.07  % (20178)Instruction limit reached! 
% 51.80/8.07  % (20178)------------------------------
% 51.80/8.07  % (20178)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 51.80/8.07  % (20178)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 51.80/8.07  % (20178)CaDiCaL version: 2.1.3
% 51.80/8.07  % (20178)Termination reason: Instruction limit
% 51.80/8.07  % (20178)Termination phase: Saturation
% 51.80/8.07  % (20178)Time elapsed: 3.457 s
% 51.80/8.07  % (20178)Peak memory usage: 228 MB
% 51.80/8.07  % (20178)Instructions burned: 12114 (million)
% 52.50/8.13  % (20194)Instruction limit reached! 
% 52.50/8.13  % (20194)------------------------------
% 52.50/8.13  % (20194)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 52.50/8.13  % (20194)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 52.50/8.13  % (20194)CaDiCaL version: 2.1.3
% 52.50/8.13  % (20194)Termination reason: Instruction limit
% 52.50/8.13  % (20194)Termination phase: Saturation
% 52.50/8.13  % (20194)Time elapsed: 0.140 s
% 52.50/8.13  % (20194)Peak memory usage: 82 MB
% 52.50/8.13  % (20194)Instructions burned: 441 (million)
% 52.97/8.20  % (20196)dis-1011_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:erd=off:lsd=100:bsr=unit_only:random_seed=2678207391:st=1.5:i=11145:s2at=3:sd=3:fsr=off:ss=axioms_2925 on theBenchmark for (2925ds/11145Mi)
% 52.97/8.27  % (20197)lrs+1002_1_to=lpo:ncem=casc2026/models/loop8.pt:sil=32000:npcc=on:sp=unary_frequency:lcm=reverse:urr=on:bsr=on:random_seed=900332268:cts=off:i=3034:av=off:er=known:fsd=on_2924 on theBenchmark for (2924ds/3034Mi)
% 56.48/8.95  % (20188)First to succeed.
% 56.48/8.95  % (20188)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-20109"
% 29.90/9.12  % (20188)Refutation found. Thanks to Tanya!
% 29.90/9.12  % SZS status Theorem for theBenchmark
% 29.90/9.12  % SZS output start Proof for theBenchmark
% See solution above
% 29.90/9.12  % (20188)------------------------------
% 29.90/9.12  % (20188)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 29.90/9.12  % (20188)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 29.90/9.12  % (20188)CaDiCaL version: 2.1.3
% 29.90/9.12  % (20188)Termination reason: Refutation
% 29.90/9.12  % (20188)Time elapsed: 2.210 s
% 29.90/9.12  % (20188)Peak memory usage: 160 MB
% 29.90/9.12  % (20188)Instructions burned: 6729 (million)
% 29.90/9.12  % (20188)------------------------------
% 29.90/9.12  % (20188)------------------------------
% 29.90/9.12  % (20109)Success in time 8.489 s
%------------------------------------------------------------------------------
