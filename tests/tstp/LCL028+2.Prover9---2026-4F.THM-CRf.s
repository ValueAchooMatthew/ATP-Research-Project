
%------------------------------------------------------------------------------
% File     : Prover9---2026-4F
% Problem  : LCL028+2 : TPTP v9.2.1. Released v9.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p

% Computer : n010.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Jun 22 05:56:56 AM UTC 2026

% Result   : Theorem 39.27s 6.42s
% Output   : CNFRefutation 39.27s
% Verified : 
% SZS Type : ERROR: Analysing output (Could not find formula named condensed_detachment)

% Comments : 
%------------------------------------------------------------------------------
cnf(c_4,plain,
    ( ~ is_a_theorem(implies(A,B))
    | ~ is_a_theorem(A)
    | is_a_theorem(B) ),
    inference(clausify,[status(esa)],[condensed_detachment]) ).

cnf(c_5,plain,
    is_a_theorem(implies(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(V6,implies(V7,V6)),implies(implies(implies(implies(V8,falsehood),falsehood),V8),V9)),V9),implies(implies(implies(V10,implies(V11,V12)),implies(implies(V10,V11),implies(V10,V12))),V13)),V13),V14)),V14)),
    inference(clausify,[status(esa)],[f2]) ).

cnf(c_6,negated_conjecture,
    ~ is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))),
    inference(clausify,[status(esa)],[f3]) ).

cnf(c_32904,plain,
    ( ~ is_a_theorem(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(V6,implies(V7,V6)),implies(implies(implies(implies(V8,falsehood),falsehood),V8),V9)),V9),implies(implies(implies(V10,implies(V11,V12)),implies(implies(V10,V11),implies(V10,V12))),V13)),V13),V14)))
    | is_a_theorem(V14) ),
    inference(resolve,[status(thm)],[c_4,c_5]) ).

cnf(c_7,plain,
    is_a_theorem(implies(A,implies(B,A))),
    inference(resolve,[status(thm)],[c_32904,c_5]) ).

cnf(c_32905,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_4,c_7]) ).

cnf(c_8,plain,
    is_a_theorem(implies(A,implies(B,implies(C,B)))),
    inference(resolve,[status(thm)],[c_32905,c_7]) ).

cnf(c_32906,plain,
    ( ~ is_a_theorem(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(V6,implies(V7,V6)),implies(implies(implies(implies(V8,falsehood),falsehood),V8),V9)),V9),implies(implies(implies(V10,implies(V11,V12)),implies(implies(V10,V11),implies(V10,V12))),V13)),V13),V14)))
    | is_a_theorem(V14) ),
    inference(resolve,[status(thm)],[c_4,c_5]) ).

cnf(c_9,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F)),
    inference(resolve,[status(thm)],[c_32906,c_7]) ).

cnf(c_32907,plain,
    ( ~ is_a_theorem(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(V6,implies(V7,V6)),implies(implies(implies(implies(V8,falsehood),falsehood),V8),V9)),V9),implies(implies(implies(V10,implies(V11,V12)),implies(implies(V10,V11),implies(V10,V12))),V13)),V13),V14)))
    | is_a_theorem(V14) ),
    inference(resolve,[status(thm)],[c_4,c_5]) ).

cnf(c_11,plain,
    is_a_theorem(implies(A,implies(implies(implies(implies(implies(B,implies(C,B)),implies(implies(implies(implies(D,falsehood),falsehood),D),E)),E),implies(implies(implies(F,implies(V6,V7)),implies(implies(F,V6),implies(F,V7))),V8)),V8))),
    inference(resolve,[status(thm)],[c_32907,c_8]) ).

cnf(c_32908,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)))
    | is_a_theorem(F) ),
    inference(resolve,[status(thm)],[c_4,c_9]) ).

cnf(c_18,plain,
    is_a_theorem(implies(A,implies(implies(B,implies(C,D)),implies(implies(B,C),implies(B,D))))),
    inference(resolve,[status(thm)],[c_32908,c_11]) ).

cnf(c_32909,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(implies(B,implies(C,D)),implies(implies(B,C),implies(B,D)))) ),
    inference(resolve,[status(thm)],[c_4,c_18]) ).

cnf(c_20,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(implies(A,B),implies(A,C)))),
    inference(resolve,[status(thm)],[c_32909,c_18]) ).

cnf(c_32910,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)))
    | is_a_theorem(F) ),
    inference(resolve,[status(thm)],[c_4,c_9]) ).

cnf(c_21,plain,
    is_a_theorem(implies(implies(A,B),implies(A,implies(C,B)))),
    inference(resolve,[status(thm)],[c_32910,c_18]) ).

cnf(c_32911,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_4,c_7]) ).

cnf(c_24,plain,
    is_a_theorem(implies(A,implies(implies(B,C),implies(B,implies(D,C))))),
    inference(resolve,[status(thm)],[c_32911,c_21]) ).

cnf(c_32912,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)))
    | is_a_theorem(F) ),
    inference(resolve,[status(thm)],[c_4,c_9]) ).

cnf(c_37,plain,
    is_a_theorem(implies(A,A)),
    inference(resolve,[status(thm)],[c_32912,c_20]) ).

cnf(c_32913,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_38,plain,
    is_a_theorem(implies(implies(implies(A,B),A),implies(implies(A,B),implies(C,B)))),
    inference(resolve,[status(thm)],[c_32913,c_21]) ).

cnf(c_32914,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_39,plain,
    is_a_theorem(implies(implies(A,implies(B,implies(C,D))),implies(A,implies(implies(B,C),implies(B,D))))),
    inference(resolve,[status(thm)],[c_32914,c_18]) ).

cnf(c_32915,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_44,plain,
    is_a_theorem(implies(implies(implies(A,B),A),implies(implies(A,B),B))),
    inference(resolve,[status(thm)],[c_32915,c_37]) ).

cnf(c_32916,plain,
    ( ~ is_a_theorem(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(V6,implies(V7,V6)),implies(implies(implies(implies(V8,falsehood),falsehood),V8),V9)),V9),implies(implies(implies(V10,implies(V11,V12)),implies(implies(V10,V11),implies(V10,V12))),V13)),V13),V14)))
    | is_a_theorem(V14) ),
    inference(resolve,[status(thm)],[c_4,c_5]) ).

cnf(c_46,plain,
    is_a_theorem(implies(A,implies(implies(implies(B,falsehood),falsehood),B))),
    inference(resolve,[status(thm)],[c_32916,c_37]) ).

cnf(c_32917,plain,
    ( ~ is_a_theorem(implies(implies(A,B),A))
    | is_a_theorem(implies(implies(A,B),B)) ),
    inference(resolve,[status(thm)],[c_4,c_44]) ).

cnf(c_57,plain,
    is_a_theorem(implies(implies(implies(implies(A,implies(B,C)),implies(implies(A,B),implies(A,C))),D),D)),
    inference(resolve,[status(thm)],[c_32917,c_18]) ).

cnf(c_32918,plain,
    ( ~ is_a_theorem(implies(implies(A,B),A))
    | is_a_theorem(implies(implies(A,B),B)) ),
    inference(resolve,[status(thm)],[c_4,c_44]) ).

cnf(c_64,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,A)),C),C)),
    inference(resolve,[status(thm)],[c_32918,c_8]) ).

cnf(c_32919,plain,
    ( ~ is_a_theorem(implies(implies(A,B),A))
    | is_a_theorem(implies(implies(A,B),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_4,c_38]) ).

cnf(c_88,plain,
    is_a_theorem(implies(implies(implies(A,implies(B,A)),C),implies(D,C))),
    inference(resolve,[status(thm)],[c_32919,c_8]) ).

cnf(c_32920,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_115,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,falsehood),falsehood)),implies(A,B))),
    inference(resolve,[status(thm)],[c_32920,c_46]) ).

cnf(c_32921,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_164,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(A,implies(B,implies(D,C))))),
    inference(resolve,[status(thm)],[c_32921,c_24]) ).

cnf(c_32922,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),C))
    | is_a_theorem(implies(D,C)) ),
    inference(resolve,[status(thm)],[c_4,c_88]) ).

cnf(c_197,plain,
    is_a_theorem(implies(A,implies(falsehood,B))),
    inference(resolve,[status(thm)],[c_32922,c_115]) ).

cnf(c_32923,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_224,plain,
    is_a_theorem(implies(implies(A,falsehood),implies(A,B))),
    inference(resolve,[status(thm)],[c_32923,c_197]) ).

cnf(c_32924,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_230,plain,
    is_a_theorem(implies(implies(implies(A,falsehood),A),implies(implies(A,falsehood),B))),
    inference(resolve,[status(thm)],[c_32924,c_224]) ).

cnf(c_32925,plain,
    ( ~ is_a_theorem(A)
    | is_a_theorem(implies(B,A)) ),
    inference(resolve,[status(thm)],[c_4,c_7]) ).

cnf(c_231,plain,
    is_a_theorem(implies(A,implies(implies(B,falsehood),implies(B,C)))),
    inference(resolve,[status(thm)],[c_32925,c_224]) ).

cnf(c_32926,plain,
    ( ~ is_a_theorem(implies(implies(A,implies(B,A)),C))
    | is_a_theorem(C) ),
    inference(resolve,[status(thm)],[c_4,c_64]) ).

cnf(c_834,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(C,A),implies(C,B)))),
    inference(resolve,[status(thm)],[c_32926,c_39]) ).

cnf(c_32927,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(implies(A,B),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_20]) ).

cnf(c_891,plain,
    is_a_theorem(implies(implies(implies(A,B),implies(C,A)),implies(implies(A,B),implies(C,B)))),
    inference(resolve,[status(thm)],[c_32927,c_834]) ).

cnf(c_32928,plain,
    ( ~ is_a_theorem(implies(implies(A,B),implies(C,A)))
    | is_a_theorem(implies(implies(A,B),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_4,c_891]) ).

cnf(c_1109,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(implies(A,falsehood),C))),
    inference(resolve,[status(thm)],[c_32928,c_231]) ).

cnf(c_32929,plain,
    ( ~ is_a_theorem(implies(implies(A,B),implies(C,A)))
    | is_a_theorem(implies(implies(A,B),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_4,c_891]) ).

cnf(c_1120,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(B,C))),
    inference(resolve,[status(thm)],[c_32929,c_8]) ).

cnf(c_32930,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(C,A),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_4,c_834]) ).

cnf(c_1122,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,C),D)),implies(A,implies(C,D)))),
    inference(resolve,[status(thm)],[c_32930,c_1120]) ).

cnf(c_32931,plain,
    ( ~ is_a_theorem(implies(implies(A,B),C))
    | is_a_theorem(implies(B,C)) ),
    inference(resolve,[status(thm)],[c_4,c_1120]) ).

cnf(c_1136,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(B,C),implies(A,C)))),
    inference(resolve,[status(thm)],[c_32931,c_891]) ).

cnf(c_32932,plain,
    ( ~ is_a_theorem(implies(implies(A,B),C))
    | is_a_theorem(implies(B,C)) ),
    inference(resolve,[status(thm)],[c_4,c_1120]) ).

cnf(c_1137,plain,
    is_a_theorem(implies(A,implies(implies(A,falsehood),B))),
    inference(resolve,[status(thm)],[c_32932,c_230]) ).

cnf(c_32933,plain,
    ( ~ is_a_theorem(implies(A,implies(implies(B,falsehood),falsehood)))
    | is_a_theorem(implies(A,B)) ),
    inference(resolve,[status(thm)],[c_4,c_115]) ).

cnf(c_1497,plain,
    is_a_theorem(implies(implies(implies(A,B),falsehood),A)),
    inference(resolve,[status(thm)],[c_32933,c_1109]) ).

cnf(c_32934,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(C,A),implies(C,B))) ),
    inference(resolve,[status(thm)],[c_4,c_834]) ).

cnf(c_1536,plain,
    is_a_theorem(implies(implies(A,implies(implies(B,C),falsehood)),implies(A,B))),
    inference(resolve,[status(thm)],[c_32934,c_1497]) ).

cnf(c_32935,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_1136]) ).

cnf(c_1596,plain,
    is_a_theorem(implies(implies(implies(implies(A,B),implies(C,B)),D),implies(implies(C,A),D))),
    inference(resolve,[status(thm)],[c_32935,c_1136]) ).

cnf(c_32936,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_1136]) ).

cnf(c_1610,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(implies(A,C),falsehood),B))),
    inference(resolve,[status(thm)],[c_32936,c_1497]) ).

cnf(c_32937,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(B,C),implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_1136]) ).

cnf(c_1614,plain,
    is_a_theorem(implies(implies(implies(implies(A,falsehood),B),C),implies(A,C))),
    inference(resolve,[status(thm)],[c_32937,c_1137]) ).

cnf(c_32938,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(A,implies(B,implies(D,C)))) ),
    inference(resolve,[status(thm)],[c_4,c_164]) ).

cnf(c_8738,plain,
    is_a_theorem(implies(implies(A,B),implies(implies(implies(A,C),falsehood),implies(D,B)))),
    inference(resolve,[status(thm)],[c_32938,c_1610]) ).

cnf(c_32939,plain,
    ( ~ is_a_theorem(implies(implies(implies(A,implies(B,C)),implies(implies(A,B),implies(A,C))),D))
    | is_a_theorem(D) ),
    inference(resolve,[status(thm)],[c_4,c_57]) ).

cnf(c_13442,plain,
    is_a_theorem(implies(implies(A,implies(B,C)),implies(B,implies(A,C)))),
    inference(resolve,[status(thm)],[c_32939,c_1122]) ).

cnf(c_32940,plain,
    ( ~ is_a_theorem(implies(implies(implies(A,B),implies(C,B)),D))
    | is_a_theorem(implies(implies(C,A),D)) ),
    inference(resolve,[status(thm)],[c_4,c_1596]) ).

cnf(c_31535,plain,
    is_a_theorem(implies(implies(implies(A,B),C),implies(implies(C,falsehood),A))),
    inference(resolve,[status(thm)],[c_32940,c_1536]) ).

cnf(c_32941,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(B,implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_13442]) ).

cnf(c_31571,plain,
    is_a_theorem(implies(implies(A,falsehood),implies(implies(implies(B,C),A),B))),
    inference(resolve,[status(thm)],[c_32941,c_31535]) ).

cnf(c_32942,plain,
    ( ~ is_a_theorem(implies(implies(implies(A,falsehood),B),C))
    | is_a_theorem(implies(A,C)) ),
    inference(resolve,[status(thm)],[c_4,c_1614]) ).

cnf(c_32053,plain,
    is_a_theorem(implies(A,implies(implies(implies(B,C),implies(A,falsehood)),B))),
    inference(resolve,[status(thm)],[c_32942,c_31571]) ).

cnf(c_32943,plain,
    ( ~ is_a_theorem(implies(A,implies(B,C)))
    | is_a_theorem(implies(B,implies(A,C))) ),
    inference(resolve,[status(thm)],[c_4,c_13442]) ).

cnf(c_32830,plain,
    is_a_theorem(implies(implies(implies(A,B),implies(C,falsehood)),implies(C,A))),
    inference(resolve,[status(thm)],[c_32943,c_32053]) ).

cnf(c_32944,plain,
    ( ~ is_a_theorem(implies(A,B))
    | is_a_theorem(implies(implies(implies(A,C),falsehood),implies(D,B))) ),
    inference(resolve,[status(thm)],[c_4,c_8738]) ).

cnf(c_32902,plain,
    is_a_theorem(implies(implies(implies(implies(implies(A,B),implies(C,falsehood)),D),falsehood),implies(E,implies(C,A)))),
    inference(resolve,[status(thm)],[c_32944,c_32830]) ).

cnf(c_32903,plain,
    $false,
    inference(resolve,[status(thm)],[c_32902,c_6]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem  : LCL028+2 : TPTP v9.2.1. Released v9.1.0.
% 0.12/0.12  % Command  : prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.15/0.33  % Computer : n010.cluster.edu
% 0.15/0.33  % Model    : x86_64 x86_64
% 0.15/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory   : 8042.1875MB
% 0.15/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit : 300
% 0.15/0.33  % WCLimit  : 300
% 0.15/0.33  % DateTime : Thu Apr 30 05:39:50 EDT 2026
% 0.15/0.33  % CPUTime  : 
% 0.15/0.33  % Prover9 (64) version 2026-4F, April 2026.
% 0.15/0.33  % Process 25293 was started by sandbox on n010.cluster.edu,
% 0.15/0.33  % Thu Apr 30 05:39:50 2026
% 0.15/0.33  % The command was "/export/starexec/sandbox/solver/bin/prover9 -casc 300 -f /export/starexec/sandbox/benchmark/theBenchmark.p".
% 0.15/0.34  
% 0.15/0.34  % From the command line: assign(max_seconds, 300).
% 39.27/6.42  
% 39.27/6.42  % given #500 (W,wt=39): 5086 is_a_theorem(implies(implies(A,implies(B,implies(A,falsehood))),implies(A,implies(B,C)))).  [hyper(4,a,20,a,b,2002,a)].
% 39.27/6.42  
% 39.27/6.42  % Proof 1 at 3.52 (+ 1.85) seconds.
% 39.27/6.42  % Length of proof is 48.
% 39.27/6.42  % Level of proof is 21.
% 39.27/6.42  % Maximum clause weight is 118.000.
% 39.27/6.42  % Given clauses 727.
% 39.27/6.42  
% 39.27/6.42  % SZS output start CNFRefutation for theBenchmark
% See solution above
% 39.27/6.42  
% 39.27/6.42  % SZS status Theorem for theBenchmark
%------------------------------------------------------------------------------
