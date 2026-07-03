
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : GRP012+5 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n021.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sat Jul 16 11:35:14 EDT 2022

% Result   : Theorem 0.40s 0.58s
% Output   : Refutation 0.40s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    3
%            Number of leaves      :    7
% Syntax   : Number of clauses     :   11 (   9 unt;   0 nHn;   9 RR)
%            Number of literals    :   17 (   0 equ;   8 neg)
%            Maximal clause size   :    4 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-1 aty)
%            Number of variables   :   14 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(2,negated_conjecture,
    ( ~ product(X,Y,Z)
    | ~ product(Y,U,V)
    | ~ product(Z,U,W)
    | product(X,V,W) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(3,negated_conjecture,
    ( ~ product(X,Y,Z)
    | ~ product(Y,U,V)
    | ~ product(X,V,W)
    | product(Z,U,W) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(5,negated_conjecture,
    product('SKOLEMAAAW1',X,X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(6,negated_conjecture,
    product(X,inverse(X),'SKOLEMAAAW1'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(8,negated_conjecture,
    product(inverse('SKOLEMAAAW3'),inverse('SKOLEMAAAW4'),'SKOLEMAAAW5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(9,negated_conjecture,
    product('SKOLEMAAAW4','SKOLEMAAAW3','SKOLEMAAAW6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(10,negated_conjecture,
    ~ product(inverse('SKOLEMAAAW5'),inverse('SKOLEMAAAW6'),'SKOLEMAAAW1'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

cnf(11,plain,
    product('SKOLEMAAAW3','SKOLEMAAAW5',inverse('SKOLEMAAAW4')),
    inference('HYPERRESOLVE',[status(thm)],[2,6,8,5]) ).

cnf(90,plain,
    ~ product('SKOLEMAAAW6','SKOLEMAAAW1',inverse('SKOLEMAAAW5')),
    inference('UR-RESOLVE',[status(thm)],[3,5,6,10]) ).

cnf(152,plain,
    product('SKOLEMAAAW6','SKOLEMAAAW5','SKOLEMAAAW1'),
    inference('HYPERRESOLVE',[status(thm)],[3,11,9,6]) ).

cnf(177,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('HYPERRESOLVE',[status(thm)],[2,152,6,5]),90]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.04/0.13  % Problem  : GRP012+5 : TPTP v8.1.0. Released v3.1.0.
% 0.04/0.14  % Command  : run-snark %s %d
% 0.14/0.36  % Computer : n021.cluster.edu
% 0.14/0.36  % Model    : x86_64 x86_64
% 0.14/0.36  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.36  % Memory   : 8042.1875MB
% 0.14/0.36  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.36  % CPULimit : 300
% 0.14/0.36  % WCLimit  : 600
% 0.14/0.36  % DateTime : Tue Jun 14 13:41:43 EDT 2022
% 0.14/0.36  % CPUTime  : 
% 0.22/0.49  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.22/0.50  * 
% 0.22/0.50  * 
% 0.22/0.51  #
% 0.22/0.51  * 
% 0.22/0.51  SNARK-TPTP-OPTIONS
% 0.22/0.51  * 
% 0.22/0.51  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.22/0.51   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.22/0.51   (USE-FACTORING :POS)
% 0.22/0.51   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.22/0.51   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.22/0.51   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.22/0.51   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.22/0.51   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.22/0.51   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.22/0.51   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.22/0.51   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.22/0.51   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.22/0.51   (DECLARE-TPTP-SYMBOLS2))
% 0.22/0.51  * 
% 0.22/0.51  "."
% 0.22/0.51  * 
% 0.22/0.51  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-14T13:41:43
% 0.22/0.51  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n021.cluster.edu at 2022-06-14T13:41:43
% 0.22/0.53  
% 0.22/0.53  ; Recognized relation function assertion (|product| ?X ?Y (SKOLEMAAAW2 ?X ?Y)).
% 0.22/0.53  ; Recognized possible associativity assertion (OR (NOT (|product| ?X ?Y ?Z)) (NOT (|product| ?Y ?U ?V)) (NOT (|product| ?Z ?U ?W)) (|product| ?X ?V ?W)).
% 0.22/0.53  ; Recognized possible associativity assertion (OR (NOT (|product| ?X ?Y ?Z)) (NOT (|product| ?Y ?U ?V)) (NOT (|product| ?X ?V ?W)) (|product| ?Z ?U ?W)).
% 0.22/0.53  ; Recognized possible right identity assertion (|product| ?X SKOLEMAAAW1 ?X).
% 0.22/0.53  ; Recognized possible left identity assertion (|product| SKOLEMAAAW1 ?X ?X).
% 0.22/0.53  ; Recognized possible right inverse assertion (|product| ?X (|inverse| ?X) SKOLEMAAAW1).
% 0.40/0.58  ; Recognized possible left inverse assertion (|product| (|inverse| ?X) ?X SKOLEMAAAW1).
% 0.40/0.58  
% 0.40/0.58  #||
% 0.40/0.58  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.40/0.58  % SZS output start Refutation
% See solution above
% 0.40/0.58  ||#
% 0.40/0.58  
% 0.40/0.58  ; Summary of computation:
% 0.40/0.58  ;       640 formulas have been input or derived (from 13 formulas).
% 0.40/0.58  ;       177 (28%) were retained.  Of these,
% 0.40/0.58  ;          177 (100%) are still being kept.
% 0.40/0.58  ; 
% 0.40/0.58  ; Run time in seconds excluding printing time:
% 0.40/0.58  ;     0.002   3%   Read assertion file          (1 call)
% 0.40/0.58  ;     0.001   1%   Assert                       (1 call)
% 0.40/0.58  ;     0.016  24%   Process new row              (535 calls)
% 0.40/0.58  ;     0.016  24%   Resolution                   (24 calls)
% 0.40/0.58  ;     0.000   0%   Paramodulation               (12 calls)
% 0.40/0.58  ;     0.000   0%   Condensing                   (2 calls)
% 0.40/0.58  ;     0.000   0%   Forward subsumption          (2 calls)
% 0.40/0.58  ;     0.000   0%   Backward subsumption         (2 calls)
% 0.40/0.58  ;     0.000   0%   Clause clause subsumption    (2 calls)
% 0.40/0.58  ;     0.002   3%   Forward simplification       (535 calls)
% 0.40/0.58  ;     0.003   4%   Backward simplification      (177 calls)
% 0.40/0.58  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.40/0.58  ;     0.000   0%   Purity testing               (1 call)
% 0.40/0.58  ;     0.027  40%   Other
% 0.40/0.58  ;     0.067        Total
% 0.40/0.58  ;     0.069        Real time
% 0.40/0.58  ; 
% 0.40/0.58  ; Term-hash-array has 280 terms in all.
% 0.40/0.58  ; Feature-vector-row-index has 2 entries (2 at peak, 2 added, 0 deleted).
% 0.40/0.58  ; Feature-vector-row-index has 3 nodes (3 at peak, 3 added, 0 deleted).
% 0.40/0.58  ;  Retrieved 1 possibly forward subsuming row in 2 calls.
% 0.40/0.58  ;  Retrieved 1 possibly backward subsumed row in 2 calls.
% 0.40/0.58  ; Path-index has 285 entries (285 at peak, 285 added, 0 deleted).
% 0.40/0.58  ; Path-index has 291 nodes (291 at peak, 291 added, 0 deleted).
% 0.40/0.58  ; Trie-index has 285 entries (285 at peak, 285 added, 0 deleted).
% 0.40/0.58  ; Trie-index has 836 nodes (836 at peak, 836 added, 0 deleted).
% 0.40/0.58  ; Retrieved 589 generalization terms in 541 calls.
% 0.40/0.58  ; Retrieved 184 instance terms in 174 calls.
% 0.40/0.58  ; Retrieved 9,844 unifiable terms in 1,015 calls.
% 0.40/0.58  ; 
% 0.40/0.58  ; The agenda of rows to process has 56 entries:
% 0.40/0.58  ;     8 with value 10              4 with value 12               6 with value 14
% 0.40/0.58  ;    26 with value 11             12 with value 13
% 0.40/0.58  ; The agenda of rows to give has 164 entries:
% 0.40/0.58  ;    12 with value (4 8)          44 with value (4 11)          19 with value (4 14)
% 0.40/0.58  ;    21 with value (4 9)          34 with value (4 12)           2 with value (4 15)
% 0.40/0.58  ;    21 with value (4 10)         11 with value (4 13)
% 0.40/0.58  Evaluation took:
% 0.40/0.58    0.07 seconds of real time
% 0.40/0.58    0.060434 seconds of user run time
% 0.40/0.58    0.008885 seconds of system run time
% 0.40/0.58    0 calls to %EVAL
% 0.40/0.58    0 page faults and
% 0.40/0.58    3,615,128 bytes consed.
% 0.40/0.58  :PROOF-FOUND
% 0.40/0.58  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-14T13:41:43
% 0.40/0.58  :PROOF-FOUND
% 0.40/0.58  * 
%------------------------------------------------------------------------------
