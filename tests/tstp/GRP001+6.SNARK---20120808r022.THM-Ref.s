
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : GRP001+6 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n013.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sat Jul 16 11:35:08 EDT 2022

% Result   : Theorem 0.20s 0.55s
% Output   : Refutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    2
%            Number of leaves      :    7
% Syntax   : Number of clauses     :   10 (   8 unt;   0 nHn;   7 RR)
%            Number of literals    :   16 (   0 equ;   8 neg)
%            Maximal clause size   :    4 (   1 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    4 (   4 usr;   4 con; 0-0 aty)
%            Number of variables   :   15 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(2,negated_conjecture,
    ( ~ product(X,Y,Z)
    | ~ product(Y,U,V)
    | ~ product(Z,U,W)
    | product(X,V,W) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(3,negated_conjecture,
    ( ~ product(X,Y,Z)
    | ~ product(Y,U,V)
    | ~ product(X,V,W)
    | product(Z,U,W) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(4,negated_conjecture,
    product(X,'SKOLEMAAAV1',X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(5,negated_conjecture,
    product('SKOLEMAAAV1',X,X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(8,negated_conjecture,
    product(X,X,'SKOLEMAAAV1'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(9,negated_conjecture,
    product('SKOLEMAAAV3','SKOLEMAAAV4','SKOLEMAAAV5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(10,negated_conjecture,
    ~ product('SKOLEMAAAV4','SKOLEMAAAV3','SKOLEMAAAV5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

cnf(11,plain,
    product('SKOLEMAAAV3','SKOLEMAAAV5','SKOLEMAAAV4'),
    inference('HYPERRESOLVE',[status(thm)],[2,8,9,5]) ).

cnf(13,plain,
    ~ product('SKOLEMAAAV4','SKOLEMAAAV5','SKOLEMAAAV3'),
    inference('UR-RESOLVE',[status(thm)],[2,8,5,10]) ).

cnf(140,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('HYPERRESOLVE',[status(thm)],[3,11,8,4]),13]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.04/0.12  % Problem  : GRP001+6 : TPTP v8.1.0. Released v3.1.0.
% 0.04/0.13  % Command  : run-snark %s %d
% 0.13/0.35  % Computer : n013.cluster.edu
% 0.13/0.35  % Model    : x86_64 x86_64
% 0.13/0.35  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.35  % Memory   : 8042.1875MB
% 0.13/0.35  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.35  % CPULimit : 300
% 0.13/0.35  % WCLimit  : 600
% 0.13/0.35  % DateTime : Mon Jun 13 14:40:14 EDT 2022
% 0.13/0.35  % CPUTime  : 
% 0.20/0.47  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.48  * 
% 0.20/0.48  * 
% 0.20/0.48  #
% 0.20/0.48  * 
% 0.20/0.48  SNARK-TPTP-OPTIONS
% 0.20/0.48  * 
% 0.20/0.49  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.20/0.49   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.20/0.49   (USE-FACTORING :POS)
% 0.20/0.49   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.20/0.49   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.20/0.49   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.20/0.49   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.20/0.49   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.20/0.49   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.20/0.49   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.20/0.49   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.20/0.49   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.20/0.49   (DECLARE-TPTP-SYMBOLS2))
% 0.20/0.49  * 
% 0.20/0.49  "."
% 0.20/0.49  * 
% 0.20/0.49  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-13T14:40:14
% 0.20/0.49  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n013.cluster.edu at 2022-06-13T14:40:14
% 0.20/0.50  
% 0.20/0.50  ; Recognized relation function assertion (|product| ?X ?Y (SKOLEMAAAV2 ?X ?Y)).
% 0.20/0.50  ; Recognized possible associativity assertion (OR (NOT (|product| ?X ?Y ?Z)) (NOT (|product| ?Y ?U ?V)) (NOT (|product| ?Z ?U ?W)) (|product| ?X ?V ?W)).
% 0.20/0.50  ; Recognized possible associativity assertion (OR (NOT (|product| ?X ?Y ?Z)) (NOT (|product| ?Y ?U ?V)) (NOT (|product| ?X ?V ?W)) (|product| ?Z ?U ?W)).
% 0.20/0.50  ; Recognized possible right identity assertion (|product| ?X SKOLEMAAAV1 ?X).
% 0.20/0.50  ; Recognized possible left identity assertion (|product| SKOLEMAAAV1 ?X ?X).
% 0.20/0.50  ; Recognized possible right inverse assertion (|product| ?X (|inverse| ?X) SKOLEMAAAV1).
% 0.20/0.55  ; Recognized possible left inverse assertion (|product| (|inverse| ?X) ?X SKOLEMAAAV1).
% 0.20/0.55  
% 0.20/0.55  #||
% 0.20/0.55  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.55  % SZS output start Refutation
% See solution above
% 0.20/0.55  ||#
% 0.20/0.55  
% 0.20/0.55  ; Summary of computation:
% 0.20/0.55  ;       746 formulas have been input or derived (from 12 formulas).
% 0.20/0.55  ;       140 (19%) were retained.  Of these,
% 0.20/0.55  ;            1 ( 1%) were simplified or subsumed later,
% 0.20/0.55  ;          139 (99%) are still being kept.
% 0.20/0.55  ; 
% 0.20/0.55  ; Run time in seconds excluding printing time:
% 0.20/0.55  ;     0.002   3%   Read assertion file          (1 call)
% 0.20/0.55  ;     0.001   2%   Assert                       (1 call)
% 0.20/0.55  ;     0.014  23%   Process new row              (538 calls)
% 0.20/0.55  ;     0.016  27%   Resolution                   (22 calls)
% 0.20/0.55  ;     0.000   0%   Paramodulation               (11 calls)
% 0.20/0.55  ;     0.000   0%   Condensing                   (2 calls)
% 0.20/0.55  ;     0.000   0%   Forward subsumption          (2 calls)
% 0.20/0.55  ;     0.000   0%   Backward subsumption         (2 calls)
% 0.20/0.55  ;     0.000   0%   Clause clause subsumption    (2 calls)
% 0.20/0.55  ;     0.001   2%   Forward simplification       (538 calls)
% 0.20/0.55  ;     0.001   2%   Backward simplification      (140 calls)
% 0.20/0.55  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.20/0.55  ;     0.000   0%   Purity testing               (1 call)
% 0.20/0.55  ;     0.025  42%   Other
% 0.39/0.55  ;     0.060        Total
% 0.39/0.55  ;     0.062        Real time
% 0.39/0.55  ; 
% 0.39/0.55  ; Term-hash-array has 213 terms in all.
% 0.39/0.55  ; Feature-vector-row-index has 2 entries (2 at peak, 2 added, 0 deleted).
% 0.39/0.55  ; Feature-vector-row-index has 3 nodes (3 at peak, 3 added, 0 deleted).
% 0.39/0.55  ;  Retrieved 1 possibly forward subsuming row in 2 calls.
% 0.39/0.55  ;  Retrieved 1 possibly backward subsumed row in 2 calls.
% 0.39/0.55  ; Path-index has 216 entries (216 at peak, 217 added, 1 deleted).
% 0.39/0.55  ; Path-index has 226 nodes (226 at peak, 226 added, 0 deleted).
% 0.39/0.55  ; Trie-index has 216 entries (216 at peak, 217 added, 1 deleted).
% 0.39/0.55  ; Trie-index has 549 nodes (549 at peak, 552 added, 3 deleted).
% 0.39/0.55  ; Retrieved 736 generalization terms in 543 calls.
% 0.39/0.55  ; Retrieved 146 instance terms in 137 calls.
% 0.39/0.55  ; Retrieved 9,987 unifiable terms in 1,032 calls.
% 0.39/0.55  ; 
% 0.39/0.55  ; The agenda of rows to process has 82 entries:
% 0.39/0.55  ;    21 with value 7              37 with value 10              12 with value 12
% 0.39/0.55  ;     4 with value 9               4 with value 11               4 with value 13
% 0.39/0.55  ; The agenda of rows to give has 127 entries:
% 0.39/0.55  ;     5 with value (4 6)          16 with value (4 10)           6 with value (4 13)
% 0.39/0.55  ;    10 with value (4 8)          30 with value (4 11)           6 with value (4 14)
% 0.39/0.55  ;    34 with value (4 9)          20 with value (4 12)
% 0.39/0.55  Evaluation took:
% 0.39/0.55    0.063 seconds of real time
% 0.39/0.55    0.050221 seconds of user run time
% 0.39/0.55    0.012906 seconds of system run time
% 0.39/0.55    0 calls to %EVAL
% 0.39/0.55    0 page faults and
% 0.39/0.55    3,321,056 bytes consed.
% 0.39/0.55  :PROOF-FOUND
% 0.39/0.55  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-13T14:40:14
% 0.39/0.55  :PROOF-FOUND
% 0.39/0.55  * 
%------------------------------------------------------------------------------
