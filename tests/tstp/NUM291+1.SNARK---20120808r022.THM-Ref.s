
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : NUM291+1 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n015.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Mon Jul 18 14:07:39 EDT 2022

% Result   : Theorem 1.52s 1.71s
% Output   : Refutation 1.52s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    2
%            Number of leaves      :    6
% Syntax   : Number of clauses     :    8 (   6 unt;   0 nHn;   8 RR)
%            Number of literals    :   12 (   0 equ;   6 neg)
%            Maximal clause size   :    4 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-1 aty)
%            Number of variables   :    6 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(3,axiom,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+0.ax',rdn2) ).

cnf(4,axiom,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+0.ax',rdn3) ).

cnf(268,axiom,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',rdn_positive_less23) ).

cnf(281,axiom,
    ( ~ rdn_translate(X,rdn_pos(Y))
    | ~ rdn_translate(Z,rdn_pos(U))
    | ~ rdn_positive_less(Y,U)
    | less(X,Z) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',less_entry_point_pos_pos) ).

cnf(284,axiom,
    ( ~ less(X,Y)
    | ~ less(Y,X) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',less_property) ).

cnf(407,negated_conjecture,
    less(n3,n2),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',n3_not_less_n2) ).

cnf(408,plain,
    ~ less(n2,n3),
    inference('UR-RESOLVE',[status(thm)],[284,407]) ).

cnf(16949,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('HYPERRESOLVE',[status(thm)],[281,3,4,268]),408]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.12  % Problem  : NUM291+1 : TPTP v8.1.0. Released v3.1.0.
% 0.03/0.13  % Command  : run-snark %s %d
% 0.13/0.33  % Computer : n015.cluster.edu
% 0.13/0.33  % Model    : x86_64 x86_64
% 0.13/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.33  % Memory   : 8042.1875MB
% 0.13/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.33  % CPULimit : 300
% 0.13/0.33  % WCLimit  : 600
% 0.13/0.33  % DateTime : Tue Jul  5 13:06:32 EDT 2022
% 0.13/0.34  % CPUTime  : 
% 0.20/0.45  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.46  * 
% 0.20/0.46  * 
% 0.20/0.46  #
% 0.20/0.46  * 
% 0.20/0.46  SNARK-TPTP-OPTIONS
% 0.20/0.46  * 
% 0.20/0.46  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.20/0.46   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.20/0.46   (USE-FACTORING :POS)
% 0.20/0.46   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.20/0.46   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.20/0.46   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.20/0.46   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.20/0.46   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.20/0.46   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.20/0.46   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.20/0.46   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.20/0.46   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.20/0.46   (DECLARE-TPTP-SYMBOLS2))
% 0.20/0.46  * 
% 0.20/0.46  "."
% 0.20/0.46  * 
% 0.20/0.46  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-07-05T13:06:32
% 0.20/0.46  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n015.cluster.edu at 2022-07-05T13:06:32
% 0.20/0.54  
% 1.52/1.71  ; Recognized relation functionality assertion (OR (NOT (|sum| ?X ?Y ?Z)) (NOT (|sum| ?X ?Y ?U)) (= ?Z ?U)).
% 1.52/1.71  
% 1.52/1.71  #||
% 1.52/1.71  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 1.52/1.71  % SZS output start Refutation
% See solution above
% 1.52/1.71  ||#
% 1.52/1.71  
% 1.52/1.71  ; Summary of computation:
% 1.52/1.71  ;     33508 formulas have been input or derived (from 395 formulas).
% 1.52/1.71  ;     16949 (51%) were retained.  Of these,
% 1.52/1.71  ;        16949 (100%) are still being kept.
% 1.52/1.71  ; 
% 1.52/1.71  ; Run time in seconds excluding printing time:
% 1.52/1.71  ;     0.059   5%   Read assertion file          (1 call)
% 1.52/1.71  ;     0.007   1%   Assert                       (402 calls)
% 1.52/1.71  ;     0.509  41%   Process new row              (33,485 calls)
% 1.52/1.71  ;     0.377  30%   Resolution                   (788 calls)
% 1.52/1.71  ;     0.005   0%   Paramodulation               (394 calls)
% 1.52/1.71  ;     0.000   0%   Factoring                    (1 call)
% 1.52/1.71  ;     0.000   0%   Condensing                   (36 calls)
% 1.52/1.71  ;     0.000   0%   Forward subsumption          (36 calls)
% 1.52/1.71  ;     0.000   0%   Backward subsumption         (33 calls)
% 1.52/1.71  ;     0.000   0%   Clause clause subsumption    (12 calls)
% 1.52/1.71  ;     0.089   7%   Forward simplification       (33,485 calls)
% 1.52/1.71  ;     0.048   4%   Backward simplification      (16,949 calls)
% 1.52/1.71  ;     0.000   0%   Ordering                     (35 calls)
% 1.52/1.71  ;     0.000   0%   Sortal reasoning             (32 calls)
% 1.52/1.71  ;     0.000   0%   Purity testing               (1 call)
% 1.52/1.71  ;     0.148  12%   Other
% 1.52/1.71  ;     1.242        Total
% 1.52/1.71  ;     1.243        Real time
% 1.52/1.71  ; 
% 1.52/1.71  ; Term-hash-array has 17,407 terms in all.
% 1.52/1.71  ; Feature-vector-row-index has 33 entries (33 at peak, 33 added, 0 deleted).
% 1.52/1.71  ; Feature-vector-row-index has 155 nodes (155 at peak, 155 added, 0 deleted).
% 1.52/1.71  ;  Retrieved 9 possibly forward subsuming rows in 36 calls.
% 1.52/1.71  ;  Retrieved 3 possibly backward subsumed rows in 33 calls.
% 1.52/1.71  ; Path-index has 17,663 entries (17,663 at peak, 17,663 added, 0 deleted).
% 1.52/1.71  ; Path-index has 1,469 nodes (1,469 at peak, 1,469 added, 0 deleted).
% 1.52/1.71  ; Trie-index has 17,663 entries (17,663 at peak, 17,663 added, 0 deleted).
% 1.52/1.71  ; Trie-index has 20,518 nodes (20,518 at peak, 20,518 added, 0 deleted).
% 1.52/1.71  ; Retrieved 32,931 generalization terms in 33,561 calls.
% 1.52/1.71  ; Retrieved 16,924 instance terms in 16,915 calls.
% 1.52/1.71  ; Retrieved 266,223 unifiable terms in 70,991 calls.
% 1.52/1.71  ; 
% 1.52/1.71  ; The agenda of rows to process has 11 entries:
% 1.52/1.71  ;    11 with value 5
% 1.52/1.71  ; The agenda of input rows to give has 13 entries:
% 1.52/1.71  ;     1 with value 20              1 with value 32               1 with value 48
% 1.52/1.71  ;     1 with value 21              1 with value 33               1 with value 64
% 1.52/1.71  ;     2 with value 22              2 with value 35               1 with value 68
% 1.52/1.71  ;     2 with value 31
% 1.52/1.71  ; The agenda of rows to give has 16541 entries:
% 1.52/1.71  ; 16395 with value (4 5)           1 with value (4 13)           9 with value (4 15)
% 1.52/1.71  ;   136 with value (4 6)
% 1.52/1.71  Evaluation took:
% 1.52/1.71    1.244 seconds of real time
% 1.52/1.71    1.070468 seconds of user run time
% 1.52/1.71    0.172916 seconds of system run time
% 1.52/1.71    [Run times include 0.237 seconds GC run time.]
% 1.52/1.71    0 calls to %EVAL
% 1.52/1.71    0 page faults and
% 1.52/1.71    105,710,856 bytes consed.
% 1.52/1.71  :PROOF-FOUND
% 1.52/1.71  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-07-05T13:06:34
% 1.52/1.71  :PROOF-FOUND
% 1.52/1.71  * 
%------------------------------------------------------------------------------
