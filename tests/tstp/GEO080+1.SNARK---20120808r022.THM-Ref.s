
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : GEO080+1 : TPTP v8.1.0. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n029.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sat Jul 16 06:13:43 EDT 2022

% Result   : Theorem 0.22s 0.56s
% Output   : Refutation 0.22s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    2
%            Number of leaves      :    3
% Syntax   : Number of clauses     :    5 (   3 unt;   1 nHn;   4 RR)
%            Number of literals    :    7 (   0 equ;   2 neg)
%            Maximal clause size   :    2 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :    4 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(2,axiom,
    ( part_of(X,Y)
    | incident_c('SKOLEMAAAV1'(X,Y),X) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

cnf(3,axiom,
    ( part_of(X,Y)
    | ~ incident_c('SKOLEMAAAV1'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

cnf(44,negated_conjecture,
    ~ part_of('SKOLEMAAAV14','SKOLEMAAAV14'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_reflexivity) ).

cnf(49,plain,
    incident_c('SKOLEMAAAV1'('SKOLEMAAAV14','SKOLEMAAAV14'),'SKOLEMAAAV14'),
    inference('HYPERRESOLVE',[status(thm)],[44,2]) ).

cnf(50,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[3,44]),49]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.10/0.14  % Problem  : GEO080+1 : TPTP v8.1.0. Released v2.4.0.
% 0.10/0.15  % Command  : run-snark %s %d
% 0.15/0.36  % Computer : n029.cluster.edu
% 0.15/0.36  % Model    : x86_64 x86_64
% 0.15/0.36  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.36  % Memory   : 8042.1875MB
% 0.15/0.36  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.15/0.37  % CPULimit : 300
% 0.15/0.37  % WCLimit  : 600
% 0.15/0.37  % DateTime : Sat Jun 18 11:28:14 EDT 2022
% 0.15/0.37  % CPUTime  : 
% 0.22/0.50  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.22/0.51  * 
% 0.22/0.51  * 
% 0.22/0.52  #
% 0.22/0.52  * 
% 0.22/0.52  SNARK-TPTP-OPTIONS
% 0.22/0.52  * 
% 0.22/0.52  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.22/0.52   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.22/0.52   (USE-FACTORING :POS)
% 0.22/0.52   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.22/0.52   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.22/0.52   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.22/0.52   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.22/0.52   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.22/0.52   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.22/0.52   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.22/0.52   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.22/0.52   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.22/0.52   (DECLARE-TPTP-SYMBOLS2))
% 0.22/0.52  * 
% 0.22/0.52  "."
% 0.22/0.52  * 
% 0.22/0.52  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-18T11:28:14
% 0.22/0.52  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n029.cluster.edu at 2022-06-18T11:28:14
% 0.22/0.56  
% 0.22/0.56  
% 0.22/0.56  #||
% 0.22/0.56  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.22/0.56  % SZS output start Refutation
% See solution above
% 0.22/0.56  ||#
% 0.22/0.56  
% 0.22/0.56  ; Summary of computation:
% 0.22/0.56  ;        52 formulas have been input or derived (from 14 formulas).
% 0.22/0.56  ;        50 (96%) were retained.  Of these,
% 0.22/0.56  ;           50 (100%) are still being kept.
% 0.22/0.56  ; 
% 0.22/0.56  ; Run time in seconds:
% 0.22/0.56  ;     0.006  15%   Read assertion file          (1 call)
% 0.22/0.56  ;     0.002   5%   Assert                       (17 calls)
% 0.22/0.56  ;     0.003   8%   Process new row              (50 calls)
% 0.22/0.56  ;     0.000   0%   Resolution                   (26 calls)
% 0.22/0.56  ;     0.000   0%   Paramodulation               (13 calls)
% 0.22/0.56  ;     0.000   0%   Factoring                    (2 calls)
% 0.22/0.56  ;     0.002   5%   Condensing                   (44 calls)
% 0.22/0.56  ;     0.000   0%   Forward subsumption          (44 calls)
% 0.22/0.56  ;     0.000   0%   Backward subsumption         (44 calls)
% 0.22/0.56  ;     0.000   0%   Clause clause subsumption    (15 calls)
% 0.22/0.56  ;     0.003   8%   Forward simplification       (50 calls)
% 0.22/0.56  ;     0.000   0%   Backward simplification      (50 calls)
% 0.22/0.56  ;     0.000   0%   Ordering                     (5 calls)
% 0.22/0.56  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.22/0.56  ;     0.000   0%   Purity testing               (1 call)
% 0.22/0.56  ;     0.024  60%   Other
% 0.22/0.56  ;     0.040        Total
% 0.22/0.56  ;     0.041        Real time
% 0.22/0.56  ; 
% 0.22/0.56  ; Term-hash-array has 84 terms in all.
% 0.22/0.56  ; Feature-vector-row-index has 44 entries (44 at peak, 44 added, 0 deleted).
% 0.22/0.56  ; Feature-vector-row-index has 106 nodes (106 at peak, 106 added, 0 deleted).
% 0.22/0.56  ;  Retrieved 7 possibly forward subsuming rows in 44 calls.
% 0.22/0.56  ;  Retrieved 8 possibly backward subsumed rows in 44 calls.
% 0.22/0.56  ; Path-index has 85 entries (85 at peak, 85 added, 0 deleted).
% 0.22/0.56  ; Path-index has 224 nodes (224 at peak, 224 added, 0 deleted).
% 0.22/0.56  ; Trie-index has 85 entries (85 at peak, 85 added, 0 deleted).
% 0.22/0.56  ; Trie-index has 165 nodes (165 at peak, 165 added, 0 deleted).
% 0.22/0.56  ; Retrieved 1 generalization term in 5 calls.
% 0.22/0.56  ; Retrieved 5 instance terms in 5 calls.
% 0.22/0.56  ; Retrieved 236 unifiable terms in 50 calls.
% 0.22/0.56  ; 
% 0.22/0.56  ; The agenda of input rows to give has 31 entries:
% 0.22/0.56  ;     3 with value 11              4 with value 17               2 with value 24
% 0.22/0.56  ;     2 with value 12              2 with value 18               1 with value 27
% 0.22/0.56  ;     2 with value 14              1 with value 19               1 with value 28
% 0.22/0.56  ;     6 with value 15              2 with value 20               1 with value 31
% 0.22/0.56  ;     1 with value 16              2 with value 23               1 with value 48
% 0.22/0.56  ; The agenda of rows to give has 5 entries:
% 0.22/0.56  ;     3 with value (4 7)           1 with value (4 8)            1 with value (4 10)
% 0.22/0.56  Evaluation took:
% 0.22/0.56    0.042 seconds of real time
% 0.22/0.56    0.036723 seconds of user run time
% 0.22/0.56    0.004821 seconds of system run time
% 0.22/0.56    0 calls to %EVAL
% 0.22/0.56    0 page faults and
% 0.22/0.56    2,141,472 bytes consed.
% 0.22/0.56  :PROOF-FOUND
% 0.22/0.56  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-18T11:28:14
% 0.22/0.56  :PROOF-FOUND
% 0.22/0.56  * 
%------------------------------------------------------------------------------
