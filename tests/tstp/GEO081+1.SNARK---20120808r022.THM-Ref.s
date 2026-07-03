
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : GEO081+1 : TPTP v8.1.0. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n009.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sat Jul 16 06:13:43 EDT 2022

% Result   : Theorem 0.41s 0.58s
% Output   : Refutation 0.41s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    3
%            Number of leaves      :    6
% Syntax   : Number of clauses     :   10 (   7 unt;   1 nHn;   9 RR)
%            Number of literals    :   14 (   0 equ;   5 neg)
%            Maximal clause size   :    3 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :    7 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    ( ~ part_of(X,Y)
    | ~ incident_c(Z,X)
    | incident_c(Z,Y) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

cnf(2,axiom,
    ( part_of(X,Y)
    | incident_c('SKOLEMAAAU1'(X,Y),X) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

cnf(3,axiom,
    ( part_of(X,Y)
    | ~ incident_c('SKOLEMAAAU1'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

cnf(44,negated_conjecture,
    part_of('SKOLEMAAAU14','SKOLEMAAAU15'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',part_of_transitivity) ).

cnf(45,negated_conjecture,
    part_of('SKOLEMAAAU15','SKOLEMAAAU16'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',part_of_transitivity) ).

cnf(46,negated_conjecture,
    ~ part_of('SKOLEMAAAU14','SKOLEMAAAU16'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',part_of_transitivity) ).

cnf(51,plain,
    incident_c('SKOLEMAAAU1'('SKOLEMAAAU14','SKOLEMAAAU16'),'SKOLEMAAAU14'),
    inference('HYPERRESOLVE',[status(thm)],[46,2]) ).

cnf(52,plain,
    ~ incident_c('SKOLEMAAAU1'('SKOLEMAAAU14','SKOLEMAAAU16'),'SKOLEMAAAU16'),
    inference('UR-RESOLVE',[status(thm)],[3,46]) ).

cnf(155,plain,
    incident_c('SKOLEMAAAU1'('SKOLEMAAAU14','SKOLEMAAAU16'),'SKOLEMAAAU15'),
    inference('HYPERRESOLVE',[status(thm)],[1,51,44]) ).

cnf(166,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[1,52,45]),155]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.12  % Problem  : GEO081+1 : TPTP v8.1.0. Released v2.4.0.
% 0.03/0.13  % Command  : run-snark %s %d
% 0.14/0.34  % Computer : n009.cluster.edu
% 0.14/0.34  % Model    : x86_64 x86_64
% 0.14/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.34  % Memory   : 8042.1875MB
% 0.14/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.34  % CPULimit : 300
% 0.14/0.34  % WCLimit  : 600
% 0.14/0.34  % DateTime : Sat Jun 18 00:58:08 EDT 2022
% 0.14/0.34  % CPUTime  : 
% 0.21/0.46  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.47  * 
% 0.21/0.47  * 
% 0.21/0.48  #
% 0.21/0.48  * 
% 0.21/0.48  SNARK-TPTP-OPTIONS
% 0.21/0.48  * 
% 0.21/0.48  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.21/0.48   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.21/0.48   (USE-FACTORING :POS)
% 0.21/0.48   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.21/0.48   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.21/0.48   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.21/0.48   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.21/0.48   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.21/0.48   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.21/0.48   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.21/0.48   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.21/0.48   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.21/0.48   (DECLARE-TPTP-SYMBOLS2))
% 0.21/0.48  * 
% 0.21/0.48  "."
% 0.21/0.48  * 
% 0.21/0.48  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-18T00:58:08
% 0.21/0.48  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n009.cluster.edu at 2022-06-18T00:58:08
% 0.41/0.58  
% 0.41/0.58  
% 0.41/0.58  #||
% 0.41/0.58  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.41/0.58  % SZS output start Refutation
% See solution above
% 0.41/0.58  ||#
% 0.41/0.58  
% 0.41/0.58  ; Summary of computation:
% 0.41/0.58  ;       312 formulas have been input or derived (from 53 formulas).
% 0.41/0.58  ;       166 (53%) were retained.  Of these,
% 0.41/0.58  ;            6 ( 4%) were simplified or subsumed later,
% 0.41/0.58  ;          160 (96%) are still being kept.
% 0.41/0.58  ; 
% 0.41/0.58  ; Run time in seconds excluding printing time:
% 0.41/0.58  ;     0.006   6%   Read assertion file          (1 call)
% 0.41/0.58  ;     0.002   2%   Assert                       (17 calls)
% 0.41/0.58  ;     0.022  22%   Process new row              (266 calls)
% 0.41/0.58  ;     0.018  18%   Resolution                   (104 calls)
% 0.41/0.58  ;     0.000   0%   Paramodulation               (52 calls)
% 0.41/0.58  ;     0.000   0%   Factoring                    (5 calls)
% 0.41/0.58  ;     0.006   6%   Condensing                   (197 calls)
% 0.41/0.58  ;     0.006   6%   Forward subsumption          (197 calls)
% 0.41/0.58  ;     0.001   1%   Backward subsumption         (136 calls)
% 0.41/0.58  ;     0.003   3%   Clause clause subsumption    (545 calls)
% 0.41/0.58  ;     0.009   9%   Forward simplification       (266 calls)
% 0.41/0.58  ;     0.000   0%   Backward simplification      (166 calls)
% 0.41/0.58  ;     0.002   2%   Ordering                     (991 calls)
% 0.41/0.58  ;     0.001   1%   Sortal reasoning             (32 calls)
% 0.41/0.58  ;     0.000   0%   Purity testing               (1 call)
% 0.41/0.58  ;     0.022  22%   Other
% 0.41/0.58  ;     0.098        Total
% 0.41/0.58  ;     0.100        Real time
% 0.41/0.58  ; 
% 0.41/0.58  ; Term-hash-array has 339 terms in all.
% 0.41/0.58  ; Feature-vector-row-index has 130 entries (130 at peak, 136 added, 6 deleted).
% 0.41/0.58  ; Feature-vector-row-index has 363 nodes (363 at peak, 374 added, 11 deleted).
% 0.41/0.58  ;  Retrieved 575 possibly forward subsuming rows in 197 calls.
% 0.41/0.58  ;  Retrieved 81 possibly backward subsumed rows in 136 calls.
% 0.41/0.58  ; Path-index has 332 entries (332 at peak, 344 added, 12 deleted).
% 0.41/0.58  ; Path-index has 738 nodes (738 at peak, 743 added, 5 deleted).
% 0.41/0.58  ; Trie-index has 332 entries (332 at peak, 344 added, 12 deleted).
% 0.41/0.58  ; Trie-index has 702 nodes (702 at peak, 715 added, 13 deleted).
% 0.41/0.58  ; Retrieved 166 generalization terms in 665 calls.
% 0.41/0.58  ; Retrieved 53 instance terms in 29 calls.
% 0.41/0.58  ; Retrieved 7,304 unifiable terms in 714 calls.
% 0.41/0.58  ; 
% 0.41/0.58  ; The agenda of rows to process has 8 entries:
% 0.41/0.58  ;     5 with value 9               2 with value 10               1 with value 11
% 0.41/0.58  ; The agenda of rows to give has 107 entries:
% 0.41/0.58  ;     7 with value (4 8)           6 with value (4 19)           2 with value (4 38)
% 0.41/0.58  ;     2 with value (4 9)           3 with value (4 20)           3 with value (4 39)
% 0.41/0.58  ;     4 with value (4 10)          7 with value (4 21)           7 with value (4 40)
% 0.41/0.58  ;     5 with value (4 11)          4 with value (4 26)           6 with value (4 43)
% 0.41/0.58  ;     2 with value (4 12)          4 with value (4 29)           6 with value (4 46)
% 0.41/0.58  ;     1 with value (4 13)          2 with value (4 30)           1 with value (4 54)
% 0.41/0.58  ;     2 with value (4 14)          4 with value (4 31)           2 with value (4 55)
% 0.41/0.58  ;     4 with value (4 15)          6 with value (4 32)           6 with value (4 56)
% 0.41/0.58  ;     5 with value (4 16)          6 with value (4 34)
% 0.41/0.58  Evaluation took:
% 0.41/0.58    0.1 seconds of real time
% 0.41/0.58    0.08974 seconds of user run time
% 0.41/0.58    0.010851 seconds of system run time
% 0.41/0.58    0 calls to %EVAL
% 0.41/0.58    0 page faults and
% 0.41/0.58    5,167,256 bytes consed.
% 0.41/0.58  :PROOF-FOUND
% 0.41/0.58  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-18T00:58:08
% 0.41/0.58  :PROOF-FOUND
% 0.41/0.58  * 
%------------------------------------------------------------------------------
