
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : SET002+3 : TPTP v8.1.0. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n028.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Tue Jul 19 05:05:30 EDT 2022

% Result   : Theorem 0.21s 0.52s
% Output   : Refutation 0.21s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    1
%            Number of leaves      :    3
% Syntax   : Number of clauses     :    4 (   3 unt;   0 nHn;   3 RR)
%            Number of literals    :    5 (   2 equ;   2 neg)
%            Maximal clause size   :    2 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   1 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :    3 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    ( ~ subset(X,Y)
    | union(X,Y) = Y ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',subset_union) ).

cnf(9,axiom,
    subset(X,X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',reflexivity_of_subset) ).

cnf(13,negated_conjecture,
    union('SKOLEMAAAV3','SKOLEMAAAV3') != 'SKOLEMAAAV3',
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_idempotency_of_union) ).

cnf(14,plain,
    $false,
    inference('UR-RESOLVE',[status(thm)],[1,9,13]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.07/0.13  % Problem  : SET002+3 : TPTP v8.1.0. Released v2.2.0.
% 0.07/0.14  % Command  : run-snark %s %d
% 0.14/0.35  % Computer : n028.cluster.edu
% 0.14/0.35  % Model    : x86_64 x86_64
% 0.14/0.35  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.35  % Memory   : 8042.1875MB
% 0.14/0.35  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.35  % CPULimit : 300
% 0.14/0.35  % WCLimit  : 600
% 0.14/0.35  % DateTime : Sat Jul  9 19:44:11 EDT 2022
% 0.14/0.35  % CPUTime  : 
% 0.21/0.48  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.49  * 
% 0.21/0.49  * 
% 0.21/0.49  #
% 0.21/0.49  * 
% 0.21/0.49  SNARK-TPTP-OPTIONS
% 0.21/0.49  * 
% 0.21/0.49  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.21/0.49   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.21/0.49   (USE-FACTORING :POS)
% 0.21/0.49   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.21/0.49   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.21/0.49   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.21/0.49   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.21/0.49   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.21/0.49   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.21/0.49   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.21/0.49   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.21/0.49   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.21/0.49   (DECLARE-TPTP-SYMBOLS2))
% 0.21/0.49  * 
% 0.21/0.49  "."
% 0.21/0.49  * 
% 0.21/0.49  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-07-09T19:44:11
% 0.21/0.50  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n028.cluster.edu at 2022-07-09T19:44:11
% 0.21/0.51  
% 0.21/0.51  ; Recognized commutativity assertion (= (|union| ?X ?Y) (|union| ?Y ?X)).
% 0.21/0.52  ; Declaring union to be commutative.
% 0.21/0.52  
% 0.21/0.52  #||
% 0.21/0.52  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.52  % SZS output start Refutation
% See solution above
% 0.21/0.52  ||#
% 0.21/0.52  
% 0.21/0.52  ; Summary of computation:
% 0.21/0.52  ;        23 formulas have been input or derived (from 5 formulas).
% 0.21/0.52  ;        14 (61%) were retained.  Of these,
% 0.21/0.52  ;           14 (100%) are still being kept.
% 0.21/0.52  ; 
% 0.21/0.52  ; Run time in seconds excluding printing time:
% 0.21/0.52  ;     0.002   7%   Read assertion file          (1 call)
% 0.21/0.52  ;     0.001   4%   Assert                       (8 calls)
% 0.21/0.52  ;     0.001   4%   Process new row              (19 calls)
% 0.21/0.52  ;     0.000   0%   Resolution                   (8 calls)
% 0.21/0.52  ;     0.000   0%   Paramodulation               (4 calls)
% 0.21/0.52  ;     0.002   7%   Condensing                   (14 calls)
% 0.21/0.52  ;     0.000   0%   Forward subsumption          (14 calls)
% 0.21/0.52  ;     0.000   0%   Backward subsumption         (11 calls)
% 0.21/0.52  ;     0.000   0%   Clause clause subsumption    (3 calls)
% 0.21/0.52  ;     0.001   4%   Forward simplification       (19 calls)
% 0.21/0.52  ;     0.000   0%   Backward simplification      (14 calls)
% 0.21/0.52  ;     0.000   0%   Ordering                     (6 calls)
% 0.21/0.52  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.21/0.52  ;     0.000   0%   Purity testing               (1 call)
% 0.21/0.52  ;     0.020  74%   Other
% 0.21/0.52  ;     0.027        Total
% 0.21/0.52  ;     0.028        Real time
% 0.21/0.52  ; 
% 0.21/0.52  ; Term-hash-array has 20 terms in all.
% 0.21/0.52  ; Feature-vector-row-index has 11 entries (11 at peak, 11 added, 0 deleted).
% 0.21/0.52  ; Feature-vector-row-index has 28 nodes (28 at peak, 28 added, 0 deleted).
% 0.21/0.52  ;  Retrieved 3 possibly forward subsuming rows in 14 calls.
% 0.21/0.52  ;  Retrieved 0 possibly backward subsumed rows in 11 calls.
% 0.21/0.52  ; Path-index has 21 entries (21 at peak, 21 added, 0 deleted).
% 0.21/0.52  ; Path-index has 43 nodes (43 at peak, 43 added, 0 deleted).
% 0.21/0.52  ; Trie-index has 21 entries (21 at peak, 21 added, 0 deleted).
% 0.21/0.52  ; Trie-index has 40 nodes (40 at peak, 40 added, 0 deleted).
% 0.21/0.52  ; Retrieved 1 generalization term in 1 call.
% 0.21/0.52  ; Retrieved 4 instance terms in 2 calls.
% 0.21/0.52  ; Retrieved 28 unifiable terms in 16 calls.
% 0.21/0.52  ; 
% 0.21/0.52  ; The agenda of rows to process has 2 entries:
% 0.21/0.52  ;     1 with value 5               1 with value 8
% 0.21/0.52  ; The agenda of input rows to give has 9 entries:
% 0.21/0.52  ;     3 with value 11              1 with value 15               2 with value 18
% 0.21/0.52  ;     3 with value 12
% 0.21/0.52  Evaluation took:
% 0.21/0.52    0.029 seconds of real time
% 0.21/0.52    0.02612 seconds of user run time
% 0.21/0.52    0.002858 seconds of system run time
% 0.21/0.52    0 calls to %EVAL
% 0.21/0.52    0 page faults and
% 0.21/0.52    1,481,648 bytes consed.
% 0.21/0.52  :PROOF-FOUND
% 0.21/0.52  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-07-09T19:44:11
% 0.21/0.52  :PROOF-FOUND
% 0.21/0.52  * 
%------------------------------------------------------------------------------
