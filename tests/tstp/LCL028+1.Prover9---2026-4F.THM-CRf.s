
%------------------------------------------------------------------------------
% File     : Prover9---2026-4F
% Problem  : LCL028+1 : TPTP v9.2.1. Released v9.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p

% Computer : n021.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Jun 22 05:56:55 AM UTC 2026

% Result   : Theorem 53.49s 8.47s
% Output   : CNFRefutation 53.49s
% Verified : 
% SZS Type : ERROR: Analysing output (Could not find formula named condensed_detachment)

% Comments : 
%------------------------------------------------------------------------------
cnf(c_6,plain,
    ( ~ is_a_theorem(implies(A,B))
    | ~ is_a_theorem(A)
    | is_a_theorem(B) ),
    inference(clausify,[status(esa)],[condensed_detachment]) ).

cnf(c_7,plain,
    is_a_theorem(implies(A,implies(B,A))),
    inference(clausify,[status(esa)],[c0_2]) ).

cnf(c_8,plain,
    is_a_theorem(implies(implies(implies(A,falsehood),falsehood),A)),
    inference(clausify,[status(esa)],[c0_5]) ).

cnf(c_9,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(implies(A,B),implies(A,C)))),
    inference(clausify,[status(esa)],[c0_6]) ).

cnf(c_10,negated_conjecture,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(clausify,[status(esa)],[prove_c0_CAMeredith]) ).

cnf(c_29065,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_11,plain,
    is_a_theorem(implies(A,implies(B,implies(C,B)))),
    inference(resolve,[status(thm)],[c_29065,c_7]) ).

cnf(c_29066,plain,
    ( ~ is_a_theorem(implies(implies(A,falsehood),falsehood))
    | is_a_theorem(A) ),
    inference(resolve,[status(thm)],[c_6,c_8]) ).

cnf(c_12,plain,
    is_a_theorem(implies(falsehood,falsehood)),
    inference(resolve,[status(thm)],[c_29066,c_8]) ).

cnf(c_29067,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_13,plain,
    is_a_theorem(implies(A,implies(implies(implies(B,falsehood),falsehood),B))),
    inference(resolve,[status(thm)],[c_29067,c_8]) ).

cnf(c_29068,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_14,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,C)),implies(A,B)),implies(implies(A,implies(B,C)),implies(A,C)))),
    inference(resolve,[status(thm)],[c_29068,c_9]) ).

cnf(c_29069,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_15,plain,
    is_a_theorem(implies(A,implies(implies(B,implies(C,D)),implies(implies(B,C),implies(B,D))))),
    inference(resolve,[status(thm)],[c_29069,c_9]) ).

cnf(c_29070,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_17,plain,
    is_a_theorem(implies(implies(A,B),implies(A,A))),
    inference(resolve,[status(thm)],[c_29070,c_7]) ).

cnf(c_29071,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_18,plain,
    is_a_theorem(implies(implies(A,B),implies(A,implies(C,B)))),
    inference(resolve,[status(thm)],[c_29071,c_11]) ).

cnf(c_29072,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_20,plain,
    is_a_theorem(implies(A,implies(falsehood,falsehood))),
    inference(resolve,[status(thm)],[c_29072,c_12]) ).

cnf(c_29073,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(A,A)) ),
    inference(resolve,[status(thm)],[c_6,c_17]) ).

cnf(c_25,plain,
    is_a_theorem(implies(A,A)),
    inference(resolve,[status(thm)],[c_29073,c_20]) ).

cnf(c_29074,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_26,plain,
    is_a_theorem(implies(implies(implies(A,B),A),implies(implies(A,B),B))),
    inference(resolve,[status(thm)],[c_29074,c_25]) ).

cnf(c_29075,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_27,plain,
    is_a_theorem(implies(A,implies(B,B))),
    inference(resolve,[status(thm)],[c_29075,c_25]) ).

cnf(c_29076,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_31,plain,
    is_a_theorem(implies(implies(implies(A,B),A),implies(implies(A,B),implies(C,B)))),
    inference(resolve,[status(thm)],[c_29076,c_18]) ).

cnf(c_29077,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(A,implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_18]) ).

cnf(c_33,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(D,implies(implies(A,B),implies(A,C))))),
    inference(resolve,[status(thm)],[c_29077,c_9]) ).

cnf(c_29078,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_37,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,falsehood),falsehood)),implies(A,B))),
    inference(resolve,[status(thm)],[c_29078,c_13]) ).

cnf(c_29079,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,C)),implies(A,B)))
    | is_a_theorem(implies(implies(A,implies(B,C)),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_14]) ).

cnf(c_42,plain,
    is_a_theorem(implies(implies(A,implies(A,B)),implies(A,B))),
    inference(resolve,[status(thm)],[c_29079,c_27]) ).

cnf(c_29080,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,C)),implies(A,B)))
    | is_a_theorem(implies(implies(A,implies(B,C)),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_14]) ).

cnf(c_44,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,A),C)),implies(A,C))),
    inference(resolve,[status(thm)],[c_29080,c_11]) ).

cnf(c_29081,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(A,implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_18]) ).

cnf(c_58,plain,
    is_a_theorem(implies(implies(A,implies(A,B)),implies(C,implies(A,B)))),
    inference(resolve,[status(thm)],[c_29081,c_42]) ).

cnf(c_29082,plain,
    ( ~ is_a_theorem(implies(implies(A,B),A))
    | is_a_theorem(implies(implies(A,B),B)) ),
    inference(resolve,[status(thm)],[c_6,c_26]) ).

cnf(c_68,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,A)),C),C)),
    inference(resolve,[status(thm)],[c_29082,c_11]) ).

cnf(c_29083,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,C)),implies(A,B)))
    | is_a_theorem(implies(implies(A,implies(B,C)),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_14]) ).

cnf(c_78,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,C)),implies(implies(implies(A,B),implies(A,C)),D)),implies(implies(A,implies(B,C)),D))),
    inference(resolve,[status(thm)],[c_29083,c_15]) ).

cnf(c_29084,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),C))
    | is_a_theorem(C) ),
    inference(resolve,[status(thm)],[c_6,c_68]) ).

cnf(c_180,plain,
    is_a_theorem(implies(falsehood,A)),
    inference(resolve,[status(thm)],[c_29084,c_37]) ).

cnf(c_29085,plain,
    ( ~ is_a_theorem(implies(A,implies(implies(B,falsehood),falsehood)))
    | is_a_theorem(implies(A,B)) ),
    inference(resolve,[status(thm)],[c_6,c_37]) ).

cnf(c_193,plain,
    is_a_theorem(implies(implies(implies(A,falsehood),A),A)),
    inference(resolve,[status(thm)],[c_29085,c_26]) ).

cnf(c_29086,plain,
    ( ~ is_a_theorem(implies(A,implies(A,B)))
    | is_a_theorem(implies(C,implies(A,B))) ),
    inference(resolve,[status(thm)],[c_6,c_58]) ).

cnf(c_218,plain,
    is_a_theorem(implies(A,implies(falsehood,B))),
    inference(resolve,[status(thm)],[c_29086,c_180]) ).

cnf(c_29087,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(D,implies(implies(A,B),implies(A,C)))) ),
    inference(resolve,[status(thm)],[c_6,c_33]) ).

cnf(c_222,plain,
    is_a_theorem(implies(A,implies(implies(B,falsehood),implies(B,C)))),
    inference(resolve,[status(thm)],[c_29087,c_218]) ).

cnf(c_29088,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_226,plain,
    is_a_theorem(implies(implies(A,falsehood),implies(A,B))),
    inference(resolve,[status(thm)],[c_29088,c_218]) ).

cnf(c_29089,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_232,plain,
    is_a_theorem(implies(implies(implies(A,falsehood),A),implies(implies(A,falsehood),B))),
    inference(resolve,[status(thm)],[c_29089,c_226]) ).

cnf(c_29090,plain,
    ( ~ is_a_theorem(implies(A,implies(implies(B,A),C)))
    | is_a_theorem(implies(A,C)) ),
    inference(resolve,[status(thm)],[c_6,c_44]) ).

cnf(c_411,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(C,A),implies(C,B)))),
    inference(resolve,[status(thm)],[c_29090,c_15]) ).

cnf(c_29091,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_9]) ).

cnf(c_430,plain,
    is_a_theorem(implies(implies(implies(A,B),implies(C,A)),implies(implies(A,B),implies(C,B)))),
    inference(resolve,[status(thm)],[c_29091,c_411]) ).

cnf(c_29092,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(C,A),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_411]) ).

cnf(c_444,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,falsehood),B)),implies(A,B))),
    inference(resolve,[status(thm)],[c_29092,c_193]) ).

cnf(c_29093,plain,
    ( ~ is_a_theorem(implies(implies(A,B),implies(C,A)))
    | is_a_theorem(implies(implies(A,B),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_430]) ).

cnf(c_570,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(implies(A,falsehood),C))),
    inference(resolve,[status(thm)],[c_29093,c_222]) ).

cnf(c_29094,plain,
    ( ~ is_a_theorem(implies(implies(A,B),implies(C,A)))
    | is_a_theorem(implies(implies(A,B),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_430]) ).

cnf(c_577,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(B,C))),
    inference(resolve,[status(thm)],[c_29094,c_11]) ).

cnf(c_29095,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_6,c_7]) ).

cnf(c_587,plain,
    is_a_theorem(implies(A,implies(implies(implies(B,C),D),implies(C,D)))),
    inference(resolve,[status(thm)],[c_29095,c_577]) ).

cnf(c_29096,plain,
    ( ~ is_a_theorem(implies(implies(A,B),C))
    | is_a_theorem(implies(B,C)) ),
    inference(resolve,[status(thm)],[c_6,c_577]) ).

cnf(c_588,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(B,C),implies(A,C)))),
    inference(resolve,[status(thm)],[c_29096,c_430]) ).

cnf(c_29097,plain,
    ( ~ is_a_theorem(implies(implies(A,B),C))
    | is_a_theorem(implies(B,C)) ),
    inference(resolve,[status(thm)],[c_6,c_577]) ).

cnf(c_589,plain,
    is_a_theorem(implies(A,implies(implies(A,falsehood),B))),
    inference(resolve,[status(thm)],[c_29097,c_232]) ).

cnf(c_29098,plain,
    ( ~ is_a_theorem(implies(implies(A,B),C))
    | is_a_theorem(implies(B,C)) ),
    inference(resolve,[status(thm)],[c_6,c_577]) ).

cnf(c_592,plain,
    is_a_theorem(implies(A,implies(implies(A,B),implies(C,B)))),
    inference(resolve,[status(thm)],[c_29098,c_31]) ).

cnf(c_29099,plain,
    ( ~ is_a_theorem(implies(A,implies(implies(B,falsehood),falsehood)))
    | is_a_theorem(implies(A,B)) ),
    inference(resolve,[status(thm)],[c_6,c_37]) ).

cnf(c_822,plain,
    is_a_theorem(implies(implies(implies(A,B),falsehood),A)),
    inference(resolve,[status(thm)],[c_29099,c_570]) ).

cnf(c_29100,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_588]) ).

cnf(c_893,plain,
    is_a_theorem(implies(implies(implies(implies(A,B),implies(C,B)),D),implies(implies(C,A),D))),
    inference(resolve,[status(thm)],[c_29100,c_588]) ).

cnf(c_29101,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_588]) ).

cnf(c_902,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(implies(A,C),falsehood),B))),
    inference(resolve,[status(thm)],[c_29101,c_822]) ).

cnf(c_29102,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_588]) ).

cnf(c_905,plain,
    is_a_theorem(implies(implies(implies(implies(A,falsehood),B),C),implies(A,C))),
    inference(resolve,[status(thm)],[c_29102,c_589]) ).

cnf(c_29103,plain,
    ( ~ is_a_theorem(implies(A,implies(implies(B,falsehood),B)))
    | is_a_theorem(implies(A,B)) ),
    inference(resolve,[status(thm)],[c_6,c_444]) ).

cnf(c_3287,plain,
    is_a_theorem(implies(implies(implies(A,B),A),A)),
    inference(resolve,[status(thm)],[c_29103,c_570]) ).

cnf(c_29104,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(C,A),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_6,c_411]) ).

cnf(c_3325,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,C),B)),implies(A,B))),
    inference(resolve,[status(thm)],[c_29104,c_3287]) ).

cnf(c_29105,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,C)),implies(implies(implies(A,B),implies(A,C)),D)))
    | is_a_theorem(implies(implies(A,implies(B,C)),D)) ),
    inference(resolve,[status(thm)],[c_6,c_78]) ).

cnf(c_4081,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(B,implies(A,C)))),
    inference(resolve,[status(thm)],[c_29105,c_587]) ).

cnf(c_29106,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(implies(A,C),falsehood),B)) ),
    inference(resolve,[status(thm)],[c_6,c_902]) ).

cnf(c_5514,plain,
    is_a_theorem(implies(implies(implies(A,B),falsehood),implies(implies(A,C),implies(D,C)))),
    inference(resolve,[status(thm)],[c_29106,c_592]) ).

cnf(c_29107,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(B,implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_4081]) ).

cnf(c_5577,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(implies(A,C),falsehood),implies(D,B)))),
    inference(resolve,[status(thm)],[c_29107,c_5514]) ).

cnf(c_29108,plain,
    ( ~ is_a_theorem(implies(implies(implies(A,B),implies(C,B)),D))
    | is_a_theorem(implies(implies(C,A),D)) ),
    inference(resolve,[status(thm)],[c_6,c_893]) ).

cnf(c_27981,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(implies(C,A),A))),
    inference(resolve,[status(thm)],[c_29108,c_3325]) ).

cnf(c_29109,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(B,implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_4081]) ).

cnf(c_28024,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(implies(B,C),A),B))),
    inference(resolve,[status(thm)],[c_29109,c_27981]) ).

cnf(c_29110,plain,
    ( ~ is_a_theorem(implies(implies(implies(A,falsehood),B),C))
    | is_a_theorem(implies(A,C)) ),
    inference(resolve,[status(thm)],[c_6,c_905]) ).

cnf(c_28380,plain,
    is_a_theorem(implies(A,implies(implies(implies(B,C),implies(A,falsehood)),B))),
    inference(resolve,[status(thm)],[c_29110,c_28024]) ).

cnf(c_29111,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(B,implies(A,C))) ),
    inference(resolve,[status(thm)],[c_6,c_4081]) ).

cnf(c_29001,plain,
    is_a_theorem(implies(implies(implies(A,B),implies(C,falsehood)),implies(C,A))),
    inference(resolve,[status(thm)],[c_29111,c_28380]) ).

cnf(c_29112,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(implies(A,C),falsehood),implies(D,B))) ),
    inference(resolve,[status(thm)],[c_6,c_5577]) ).

cnf(c_29063,plain,
    is_a_theorem(implies(implies(implies(implies(implies(A,B),implies(C,falsehood)),D),falsehood),implies(E,implies(C,A)))),
    inference(resolve,[status(thm)],[c_29112,c_29001]) ).

cnf(c_29064,plain,
    $false,
    inference(resolve,[status(thm)],[c_29063,c_10]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.11  % Problem  : LCL028+1 : TPTP v9.2.1. Released v9.1.0.
% 0.00/0.12  % Command  : prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.14/0.33  % Computer : n021.cluster.edu
% 0.14/0.33  % Model    : x86_64 x86_64
% 0.14/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.33  % Memory   : 8042.1875MB
% 0.14/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.33  % CPULimit : 300
% 0.14/0.33  % WCLimit  : 300
% 0.14/0.33  % DateTime : Thu Apr 30 05:40:36 EDT 2026
% 0.14/0.33  % CPUTime  : 
% 0.14/0.33  % Prover9 (64) version 2026-4F, April 2026.
% 0.14/0.33  % Process 28641 was started by sandbox on n021.cluster.edu,
% 0.14/0.33  % Thu Apr 30 05:40:36 2026
% 0.14/0.33  % The command was "/export/starexec/sandbox/solver/bin/prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p".
% 0.14/0.33  
% 0.14/0.33  % From the command line: assign(max_seconds, 300).
% 53.49/8.47  
% 53.49/8.47  % given #500 (W,wt=39): 3909 is_a_theorem(implies(A,implies(implies(implies(B,B),C),implies(implies(C,falsehood),D)))).  [hyper(6,a,7,a,b,3809,a)].
% 53.49/8.47  
% 53.49/8.47  % Proof 1 at 5.43 (+ 2.00) seconds.
% 53.49/8.47  % Length of proof is 59.
% 53.49/8.47  % Level of proof is 18.
% 53.49/8.47  % Maximum clause weight is 54.000.
% 53.49/8.47  % Given clauses 772.
% 53.49/8.47  
% 53.49/8.47  % SZS output start CNFRefutation for theBenchmark
% See solution above
% 53.49/8.47  
% 53.49/8.47  % SZS status Theorem for theBenchmark
%------------------------------------------------------------------------------
