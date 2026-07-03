
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : MGT002+1 : TPTP v8.1.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n018.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sun Jul 17 22:24:39 EDT 2022

% Result   : Theorem 0.21s 0.51s
% Output   : Refutation 0.21s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    3
%            Number of leaves      :   12
% Syntax   : Number of clauses     :   18 (  13 unt;   0 nHn;  18 RR)
%            Number of literals    :   36 (   0 equ;  19 neg)
%            Maximal clause size   :   10 (   2 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   1 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :   21 (   2 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    ( ~ organization(X,Y)
    | reproducibility(X,'SKOLEMAAAV1'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp3) ).

cnf(2,axiom,
    ( ~ reorganization_free(X,Y,Z)
    | reorganization_free(X,Y,Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp4) ).

cnf(3,axiom,
    ( ~ reorganization_free(X,Y,Z)
    | reorganization_free(X,Z,Z) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp4) ).

cnf(4,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(Z,U)
    | ~ reorganization_free(X,Y,Y)
    | ~ reorganization_free(Z,U,U)
    | ~ reproducibility(X,V,Y)
    | ~ reproducibility(Z,W,U)
    | ~ inertia(X,X1,Y)
    | ~ inertia(Z,Y1,U)
    | ~ greater(W,V)
    | greater(Y1,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a3_FOL) ).

cnf(6,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(X,Z)
    | ~ reorganization_free(X,Y,Z)
    | ~ reproducibility(X,U,Y)
    | ~ reproducibility(X,V,Z)
    | ~ greater(Z,Y)
    | greater(V,U) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a4_FOL) ).

cnf(7,negated_conjecture,
    organization('SKOLEMAAAV2','SKOLEMAAAV5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(8,negated_conjecture,
    organization('SKOLEMAAAV2','SKOLEMAAAV6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(9,negated_conjecture,
    reorganization_free('SKOLEMAAAV2','SKOLEMAAAV5','SKOLEMAAAV6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(10,negated_conjecture,
    inertia('SKOLEMAAAV2','SKOLEMAAAV3','SKOLEMAAAV5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(11,negated_conjecture,
    inertia('SKOLEMAAAV2','SKOLEMAAAV4','SKOLEMAAAV6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(12,negated_conjecture,
    greater('SKOLEMAAAV6','SKOLEMAAAV5'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(13,negated_conjecture,
    ~ greater('SKOLEMAAAV4','SKOLEMAAAV3'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

cnf(14,plain,
    reorganization_free('SKOLEMAAAV2','SKOLEMAAAV5','SKOLEMAAAV5'),
    inference('HYPERRESOLVE',[status(thm)],[2,9]) ).

cnf(15,plain,
    reorganization_free('SKOLEMAAAV2','SKOLEMAAAV6','SKOLEMAAAV6'),
    inference('HYPERRESOLVE',[status(thm)],[3,9]) ).

cnf(16,plain,
    reproducibility('SKOLEMAAAV2','SKOLEMAAAV1'('SKOLEMAAAV2','SKOLEMAAAV6'),'SKOLEMAAAV6'),
    inference('HYPERRESOLVE',[status(thm)],[1,8]) ).

cnf(17,plain,
    reproducibility('SKOLEMAAAV2','SKOLEMAAAV1'('SKOLEMAAAV2','SKOLEMAAAV5'),'SKOLEMAAAV5'),
    inference('HYPERRESOLVE',[status(thm)],[1,7]) ).

cnf(18,plain,
    greater('SKOLEMAAAV1'('SKOLEMAAAV2','SKOLEMAAAV6'),'SKOLEMAAAV1'('SKOLEMAAAV2','SKOLEMAAAV5')),
    inference('HYPERRESOLVE',[status(thm)],[6,17,7,8,9,16,12]) ).

cnf(19,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[4,17,7,8,14,15,16,10,11,13]),18]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.12  % Problem  : MGT002+1 : TPTP v8.1.0. Released v2.0.0.
% 0.06/0.13  % Command  : run-snark %s %d
% 0.14/0.34  % Computer : n018.cluster.edu
% 0.14/0.34  % Model    : x86_64 x86_64
% 0.14/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.34  % Memory   : 8042.1875MB
% 0.14/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.34  % CPULimit : 300
% 0.14/0.34  % WCLimit  : 600
% 0.14/0.34  % DateTime : Thu Jun  9 08:31:53 EDT 2022
% 0.14/0.34  % CPUTime  : 
% 0.21/0.46  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.47  * 
% 0.21/0.47  * 
% 0.21/0.47  #
% 0.21/0.47  * 
% 0.21/0.47  SNARK-TPTP-OPTIONS
% 0.21/0.47  * 
% 0.21/0.47  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.21/0.47   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.21/0.47   (USE-FACTORING :POS)
% 0.21/0.47   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.21/0.47   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.21/0.47   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.21/0.47   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.21/0.48   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.21/0.48   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.21/0.48   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.21/0.48   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.21/0.48   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.21/0.48   (DECLARE-TPTP-SYMBOLS2))
% 0.21/0.48  * 
% 0.21/0.48  "."
% 0.21/0.48  * 
% 0.21/0.48  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-09T08:31:53
% 0.21/0.48  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n018.cluster.edu at 2022-06-09T08:31:53
% 0.21/0.51  
% 0.21/0.51  
% 0.21/0.51  #||
% 0.21/0.51  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.51  % SZS output start Refutation
% See solution above
% 0.21/0.51  ||#
% 0.21/0.51  
% 0.21/0.51  ; Summary of computation:
% 0.21/0.51  ;        32 formulas have been input or derived (from 18 formulas).
% 0.21/0.51  ;        19 (59%) were retained.  Of these,
% 0.21/0.51  ;           19 (100%) are still being kept.
% 0.21/0.51  ; 
% 0.21/0.51  ; Run time in seconds excluding printing time:
% 0.21/0.51  ;     0.003   9%   Read assertion file          (1 call)
% 0.21/0.51  ;     0.001   3%   Assert                       (5 calls)
% 0.21/0.51  ;     0.001   3%   Process new row              (23 calls)
% 0.21/0.51  ;     0.007  21%   Resolution                   (34 calls)
% 0.21/0.51  ;     0.000   0%   Paramodulation               (17 calls)
% 0.21/0.51  ;     0.001   3%   Condensing                   (6 calls)
% 0.21/0.51  ;     0.000   0%   Forward subsumption          (6 calls)
% 0.21/0.51  ;     0.000   0%   Backward subsumption         (6 calls)
% 0.21/0.51  ;     0.000   0%   Clause clause subsumption    (6 calls)
% 0.21/0.51  ;     0.001   3%   Forward simplification       (23 calls)
% 0.21/0.51  ;     0.000   0%   Backward simplification      (19 calls)
% 0.21/0.51  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.21/0.51  ;     0.000   0%   Purity testing               (1 call)
% 0.21/0.51  ;     0.020  59%   Other
% 0.21/0.51  ;     0.034        Total
% 0.21/0.51  ;     0.036        Real time
% 0.21/0.51  ; 
% 0.21/0.51  ; Term-hash-array has 33 terms in all.
% 0.21/0.51  ; Feature-vector-row-index has 6 entries (6 at peak, 6 added, 0 deleted).
% 0.21/0.51  ; Feature-vector-row-index has 13 nodes (13 at peak, 13 added, 0 deleted).
% 0.21/0.51  ;  Retrieved 2 possibly forward subsuming rows in 6 calls.
% 0.21/0.51  ;  Retrieved 4 possibly backward subsumed rows in 6 calls.
% 0.21/0.51  ; Path-index has 38 entries (38 at peak, 38 added, 0 deleted).
% 0.21/0.51  ; Path-index has 83 nodes (83 at peak, 83 added, 0 deleted).
% 0.21/0.51  ; Trie-index has 38 entries (38 at peak, 38 added, 0 deleted).
% 0.21/0.51  ; Trie-index has 65 nodes (65 at peak, 65 added, 0 deleted).
% 0.21/0.51  ; Retrieved 5 generalization terms in 12 calls.
% 0.21/0.51  ; Retrieved 12 instance terms in 12 calls.
% 0.21/0.51  ; Retrieved 2,671 unifiable terms in 1,217 calls.
% 0.21/0.51  ; 
% 0.21/0.51  ; The agenda of rows to process has 1 entry:
% 0.21/0.51  ;     1 with value 11
% 0.21/0.51  ; The agenda of rows to give has 1 entry:
% 0.21/0.51  ;     1 with value (4 11)
% 0.21/0.51  Evaluation took:
% 0.21/0.51    0.037 seconds of real time
% 0.21/0.51    0.034628 seconds of user run time
% 0.21/0.51    0.001878 seconds of system run time
% 0.21/0.51    0 calls to %EVAL
% 0.21/0.51    0 page faults and
% 0.21/0.51    2,988,256 bytes consed.
% 0.21/0.51  :PROOF-FOUND
% 0.21/0.51  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-09T08:31:53
% 0.21/0.51  :PROOF-FOUND
% 0.21/0.51  * 
%------------------------------------------------------------------------------
