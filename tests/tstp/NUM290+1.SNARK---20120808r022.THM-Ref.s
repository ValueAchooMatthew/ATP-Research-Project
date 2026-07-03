
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : NUM290+1 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n006.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Mon Jul 18 14:07:39 EDT 2022

% Result   : Theorem 1.45s 1.64s
% Output   : Refutation 1.45s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    1
%            Number of leaves      :    5
% Syntax   : Number of clauses     :    6 (   5 unt;   0 nHn;   6 RR)
%            Number of literals    :    9 (   0 equ;   4 neg)
%            Maximal clause size   :    4 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-1 aty)
%            Number of variables   :    4 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(3,axiom,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+0.ax',rdn2) ).

cnf(4,axiom,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+0.ax',rdn3) ).

cnf(268,axiom,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+1.ax',rdn_positive_less23) ).

cnf(281,axiom,
    ( ~ rdn_translate(X,rdn_pos(Y))
    | ~ rdn_translate(Z,rdn_pos(U))
    | ~ rdn_positive_less(Y,U)
    | less(X,Z) ),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+1.ax',less_entry_point_pos_pos) ).

cnf(407,negated_conjecture,
    ~ less(n2,n3),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',n2_less_n3) ).

cnf(16942,plain,
    $false,
    inference('UR-RESOLVE',[status(thm)],[281,3,4,268,407]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.11/0.11  % Problem  : NUM290+1 : TPTP v8.1.0. Released v3.1.0.
% 0.11/0.12  % Command  : run-snark %s %d
% 0.12/0.33  % Computer : n006.cluster.edu
% 0.12/0.33  % Model    : x86_64 x86_64
% 0.12/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.33  % Memory   : 8042.1875MB
% 0.12/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.33  % CPULimit : 300
% 0.12/0.33  % WCLimit  : 600
% 0.12/0.33  % DateTime : Wed Jul  6 04:44:22 EDT 2022
% 0.12/0.33  % CPUTime  : 
% 0.19/0.44  /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.45  * 
% 0.19/0.45  * 
% 0.19/0.46  #
% 0.19/0.46  * 
% 0.19/0.46  SNARK-TPTP-OPTIONS
% 0.19/0.46  * 
% 0.19/0.46  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.19/0.46   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.19/0.46   (USE-FACTORING :POS)
% 0.19/0.46   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.19/0.46   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.19/0.46   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.19/0.46   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.19/0.46   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.19/0.46   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.19/0.46   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.19/0.46   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.19/0.46   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.19/0.46   (DECLARE-TPTP-SYMBOLS2))
% 0.19/0.46  * 
% 0.19/0.46  "."
% 0.19/0.46  * 
% 0.19/0.46  ; Begin refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-06T04:44:22
% 0.19/0.46  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n006.cluster.edu at 2022-07-06T04:44:22
% 0.19/0.53  
% 1.45/1.64  ; Recognized relation functionality assertion (OR (NOT (|sum| ?X ?Y ?Z)) (NOT (|sum| ?X ?Y ?U)) (= ?Z ?U)).
% 1.45/1.64  
% 1.45/1.64  #||
% 1.45/1.64  % SZS status Theorem for /export/starexec/sandbox/benchmark/theBenchmark.p
% 1.45/1.64  % SZS output start Refutation
% See solution above
% 1.45/1.64  ||#
% 1.45/1.64  
% 1.45/1.64  ; Summary of computation:
% 1.45/1.64  ;     33506 formulas have been input or derived (from 395 formulas).
% 1.45/1.64  ;     16942 (51%) were retained.  Of these,
% 1.45/1.64  ;        16942 (100%) are still being kept.
% 1.45/1.64  ; 
% 1.45/1.64  ; Run time in seconds:
% 1.45/1.64  ;     0.059   5%   Read assertion file          (1 call)
% 1.45/1.64  ;     0.006   1%   Assert                       (402 calls)
% 1.45/1.64  ;     0.499  42%   Process new row              (33,477 calls)
% 1.45/1.64  ;     0.351  30%   Resolution                   (788 calls)
% 1.45/1.64  ;     0.004   0%   Paramodulation               (394 calls)
% 1.45/1.64  ;     0.000   0%   Factoring                    (1 call)
% 1.45/1.64  ;     0.001   0%   Condensing                   (37 calls)
% 1.45/1.64  ;     0.000   0%   Forward subsumption          (37 calls)
% 1.45/1.64  ;     0.001   0%   Backward subsumption         (34 calls)
% 1.45/1.64  ;     0.000   0%   Clause clause subsumption    (12 calls)
% 1.45/1.64  ;     0.121  10%   Forward simplification       (33,477 calls)
% 1.45/1.64  ;     0.045   4%   Backward simplification      (16,942 calls)
% 1.45/1.64  ;     0.000   0%   Ordering                     (33 calls)
% 1.45/1.64  ;     0.000   0%   Sortal reasoning             (32 calls)
% 1.45/1.64  ;     0.001   0%   Purity testing               (1 call)
% 1.45/1.64  ;     0.095   8%   Other
% 1.45/1.64  ;     1.183        Total
% 1.45/1.64  ;     1.184        Real time
% 1.45/1.64  ; 
% 1.45/1.64  ; Term-hash-array has 17,402 terms in all.
% 1.45/1.64  ; Feature-vector-row-index has 34 entries (34 at peak, 34 added, 0 deleted).
% 1.45/1.64  ; Feature-vector-row-index has 162 nodes (162 at peak, 162 added, 0 deleted).
% 1.45/1.64  ;  Retrieved 9 possibly forward subsuming rows in 37 calls.
% 1.45/1.64  ;  Retrieved 3 possibly backward subsumed rows in 34 calls.
% 1.45/1.64  ; Path-index has 17,658 entries (17,658 at peak, 17,658 added, 0 deleted).
% 1.45/1.64  ; Path-index has 1,462 nodes (1,462 at peak, 1,462 added, 0 deleted).
% 1.45/1.64  ; Trie-index has 17,658 entries (17,658 at peak, 17,658 added, 0 deleted).
% 1.45/1.64  ; Trie-index has 20,507 nodes (20,507 at peak, 20,507 added, 0 deleted).
% 1.45/1.64  ; Retrieved 32,923 generalization terms in 33,548 calls.
% 1.45/1.64  ; Retrieved 16,914 instance terms in 16,907 calls.
% 1.45/1.64  ; Retrieved 266,198 unifiable terms in 70,990 calls.
% 1.45/1.64  ; 
% 1.45/1.64  ; The agenda of rows to process has 21 entries:
% 1.45/1.64  ;    18 with value 5               1 with value 8                2 with value 9
% 1.45/1.64  ; The agenda of input rows to give has 13 entries:
% 1.45/1.64  ;     1 with value 20              1 with value 32               1 with value 48
% 1.45/1.64  ;     1 with value 21              1 with value 33               1 with value 64
% 1.45/1.64  ;     2 with value 22              2 with value 35               1 with value 68
% 1.45/1.64  ;     2 with value 31
% 1.45/1.64  ; The agenda of rows to give has 16534 entries:
% 1.45/1.64  ; 16386 with value (4 5)           1 with value (4 7)            1 with value (4 13)
% 1.45/1.64  ;   136 with value (4 6)           1 with value (4 9)            9 with value (4 15)
% 1.45/1.64  Evaluation took:
% 1.45/1.64    1.184 seconds of real time
% 1.45/1.64    1.021418 seconds of user run time
% 1.45/1.64    0.162892 seconds of system run time
% 1.45/1.64    [Run times include 0.204 seconds GC run time.]
% 1.45/1.64    0 calls to %EVAL
% 1.45/1.64    0 page faults and
% 1.45/1.64    105,560,592 bytes consed.
% 1.45/1.64  :PROOF-FOUND
% 1.45/1.64  ; End refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-06T04:44:23
% 1.45/1.64  :PROOF-FOUND
% 1.45/1.64  * 
%------------------------------------------------------------------------------
