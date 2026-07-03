
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : MGT001+1 : TPTP v8.1.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n025.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sun Jul 17 22:24:38 EDT 2022

% Result   : Theorem 0.18s 0.51s
% Output   : Refutation 0.18s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :   17
% Syntax   : Number of clauses     :   27 (  20 unt;   0 nHn;  27 RR)
%            Number of literals    :   67 (   0 equ;  41 neg)
%            Maximal clause size   :   11 (   2 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    9 (   8 usr;   1 prp; 0-3 aty)
%            Number of functors    :   11 (  11 usr;   8 con; 0-2 aty)
%            Number of variables   :   44 (   4 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    ( ~ organization(X,Y)
    | reliability(X,'SKOLEMAAAU1'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp1) ).

cnf(2,axiom,
    ( ~ organization(X,Y)
    | accountability(X,'SKOLEMAAAU2'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp2) ).

cnf(3,axiom,
    ( ~ organization(X,Y)
    | reproducibility(X,'SKOLEMAAAU3'(X,Y),Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp3) ).

cnf(4,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(Z,U)
    | ~ reliability(X,V,Y)
    | ~ reliability(Z,W,U)
    | ~ accountability(X,X1,Y)
    | ~ accountability(Z,Y1,U)
    | ~ survival_chance(X,Z1,Y)
    | ~ survival_chance(Z,U1,U)
    | ~ greater(W,V)
    | ~ greater(Y1,X1)
    | greater(U1,Z1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a1_FOL) ).

cnf(5,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(Z,U)
    | ~ reliability(X,V,Y)
    | ~ reliability(Z,W,U)
    | ~ accountability(X,X1,Y)
    | ~ accountability(Z,Y1,U)
    | ~ reproducibility(X,Z1,Y)
    | ~ reproducibility(Z,U1,U)
    | ~ greater(U1,Z1)
    | greater(W,V) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a2_FOL) ).

cnf(6,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(Z,U)
    | ~ reliability(X,V,Y)
    | ~ reliability(Z,W,U)
    | ~ accountability(X,X1,Y)
    | ~ accountability(Z,Y1,U)
    | ~ reproducibility(X,Z1,Y)
    | ~ reproducibility(Z,U1,U)
    | ~ greater(U1,Z1)
    | greater(Y1,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a2_FOL) ).

cnf(9,hypothesis,
    ( ~ organization(X,Y)
    | ~ organization(Z,U)
    | ~ reorganization_free(X,Y,Y)
    | ~ reorganization_free(Z,U,U)
    | ~ reproducibility(X,V,Y)
    | ~ reproducibility(Z,W,U)
    | ~ inertia(X,X1,Y)
    | ~ inertia(Z,Y1,U)
    | greater(W,V)
    | ~ greater(Y1,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a3_FOL) ).

cnf(10,negated_conjecture,
    organization('SKOLEMAAAU4','SKOLEMAAAU6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(11,negated_conjecture,
    organization('SKOLEMAAAU5','SKOLEMAAAU7'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(12,negated_conjecture,
    reorganization_free('SKOLEMAAAU4','SKOLEMAAAU6','SKOLEMAAAU6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(13,negated_conjecture,
    reorganization_free('SKOLEMAAAU5','SKOLEMAAAU7','SKOLEMAAAU7'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(14,negated_conjecture,
    inertia('SKOLEMAAAU4','SKOLEMAAAU8','SKOLEMAAAU6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(15,negated_conjecture,
    inertia('SKOLEMAAAU5','SKOLEMAAAU9','SKOLEMAAAU7'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(16,negated_conjecture,
    survival_chance('SKOLEMAAAU4','SKOLEMAAAU10','SKOLEMAAAU6'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(17,negated_conjecture,
    survival_chance('SKOLEMAAAU5','SKOLEMAAAU11','SKOLEMAAAU7'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(18,negated_conjecture,
    greater('SKOLEMAAAU9','SKOLEMAAAU8'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(19,negated_conjecture,
    ~ greater('SKOLEMAAAU11','SKOLEMAAAU10'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

cnf(20,plain,
    reliability('SKOLEMAAAU5','SKOLEMAAAU1'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU7'),
    inference('HYPERRESOLVE',[status(thm)],[1,11]) ).

cnf(21,plain,
    reliability('SKOLEMAAAU4','SKOLEMAAAU1'('SKOLEMAAAU4','SKOLEMAAAU6'),'SKOLEMAAAU6'),
    inference('HYPERRESOLVE',[status(thm)],[1,10]) ).

cnf(22,plain,
    accountability('SKOLEMAAAU5','SKOLEMAAAU2'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU7'),
    inference('HYPERRESOLVE',[status(thm)],[2,11]) ).

cnf(23,plain,
    accountability('SKOLEMAAAU4','SKOLEMAAAU2'('SKOLEMAAAU4','SKOLEMAAAU6'),'SKOLEMAAAU6'),
    inference('HYPERRESOLVE',[status(thm)],[2,10]) ).

cnf(24,plain,
    reproducibility('SKOLEMAAAU5','SKOLEMAAAU3'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU7'),
    inference('HYPERRESOLVE',[status(thm)],[3,11]) ).

cnf(25,plain,
    reproducibility('SKOLEMAAAU4','SKOLEMAAAU3'('SKOLEMAAAU4','SKOLEMAAAU6'),'SKOLEMAAAU6'),
    inference('HYPERRESOLVE',[status(thm)],[3,10]) ).

cnf(26,plain,
    greater('SKOLEMAAAU3'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU3'('SKOLEMAAAU4','SKOLEMAAAU6')),
    inference('HYPERRESOLVE',[status(thm)],[9,25,10,11,12,13,24,14,15,18]) ).

cnf(27,plain,
    greater('SKOLEMAAAU2'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU2'('SKOLEMAAAU4','SKOLEMAAAU6')),
    inference('HYPERRESOLVE',[status(thm)],[6,26,10,11,21,20,23,22,25,24]) ).

cnf(28,plain,
    greater('SKOLEMAAAU1'('SKOLEMAAAU5','SKOLEMAAAU7'),'SKOLEMAAAU1'('SKOLEMAAAU4','SKOLEMAAAU6')),
    inference('HYPERRESOLVE',[status(thm)],[5,26,10,11,21,20,23,22,25,24]) ).

cnf(29,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[4,27,10,11,21,20,23,22,16,17,19]),28]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.11  % Problem  : MGT001+1 : TPTP v8.1.0. Released v2.0.0.
% 0.12/0.12  % Command  : run-snark %s %d
% 0.12/0.33  % Computer : n025.cluster.edu
% 0.12/0.33  % Model    : x86_64 x86_64
% 0.12/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.33  % Memory   : 8042.1875MB
% 0.12/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.33  % CPULimit : 300
% 0.12/0.33  % WCLimit  : 600
% 0.12/0.33  % DateTime : Thu Jun  9 09:20:20 EDT 2022
% 0.12/0.33  % CPUTime  : 
% 0.18/0.44  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.18/0.45  * 
% 0.18/0.45  * 
% 0.18/0.46  #
% 0.18/0.46  * 
% 0.18/0.46  SNARK-TPTP-OPTIONS
% 0.18/0.46  * 
% 0.18/0.46  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.18/0.46   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.18/0.46   (USE-FACTORING :POS)
% 0.18/0.46   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.18/0.46   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.18/0.46   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.18/0.46   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.18/0.46   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.18/0.46   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.18/0.46   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.18/0.46   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.18/0.46   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.18/0.46   (DECLARE-TPTP-SYMBOLS2))
% 0.18/0.46  * 
% 0.18/0.46  "."
% 0.18/0.46  * 
% 0.18/0.46  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-09T09:20:20
% 0.18/0.46  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n025.cluster.edu at 2022-06-09T09:20:20
% 0.18/0.51  
% 0.18/0.51  
% 0.18/0.51  #||
% 0.18/0.51  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.18/0.51  % SZS output start Refutation
% See solution above
% 0.18/0.52  ||#
% 0.18/0.52  
% 0.18/0.52  ; Summary of computation:
% 0.18/0.52  ;        40 formulas have been input or derived (from 28 formulas).
% 0.18/0.52  ;        29 (72%) were retained.  Of these,
% 0.18/0.52  ;           29 (100%) are still being kept.
% 0.18/0.52  ; 
% 0.18/0.52  ; Run time in seconds excluding printing time:
% 0.18/0.52  ;     0.004   7%   Read assertion file          (1 call)
% 0.18/0.52  ;     0.001   2%   Assert                       (7 calls)
% 0.18/0.52  ;     0.002   4%   Process new row              (38 calls)
% 0.18/0.52  ;     0.023  41%   Resolution                   (54 calls)
% 0.18/0.52  ;     0.000   0%   Paramodulation               (27 calls)
% 0.18/0.52  ;     0.000   0%   Condensing                   (9 calls)
% 0.18/0.52  ;     0.000   0%   Forward subsumption          (9 calls)
% 0.18/0.52  ;     0.001   2%   Backward subsumption         (9 calls)
% 0.18/0.52  ;     0.000   0%   Clause clause subsumption    (6 calls)
% 0.18/0.52  ;     0.002   4%   Forward simplification       (38 calls)
% 0.18/0.52  ;     0.000   0%   Backward simplification      (29 calls)
% 0.18/0.52  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.18/0.52  ;     0.000   0%   Purity testing               (1 call)
% 0.18/0.52  ;     0.023  41%   Other
% 0.18/0.52  ;     0.056        Total
% 0.18/0.52  ;     0.060        Real time
% 0.18/0.52  ; 
% 0.18/0.52  ; Term-hash-array has 50 terms in all.
% 0.18/0.52  ; Feature-vector-row-index has 9 entries (9 at peak, 9 added, 0 deleted).
% 0.18/0.52  ; Feature-vector-row-index has 24 nodes (24 at peak, 24 added, 0 deleted).
% 0.18/0.52  ;  Retrieved 4 possibly forward subsuming rows in 9 calls.
% 0.18/0.52  ;  Retrieved 2 possibly backward subsumed rows in 9 calls.
% 0.18/0.52  ; Path-index has 58 entries (58 at peak, 58 added, 0 deleted).
% 0.18/0.52  ; Path-index has 183 nodes (183 at peak, 183 added, 0 deleted).
% 0.18/0.52  ; Trie-index has 58 entries (58 at peak, 58 added, 0 deleted).
% 0.18/0.52  ; Trie-index has 146 nodes (146 at peak, 146 added, 0 deleted).
% 0.18/0.52  ; Retrieved 10 generalization terms in 21 calls.
% 0.18/0.52  ; Retrieved 19 instance terms in 19 calls.
% 0.18/0.52  ; Retrieved 9,192 unifiable terms in 5,147 calls.
% 0.18/0.52  ; 
% 0.18/0.52  ; The agenda of rows to give has 1 entry:
% 0.18/0.52  ;     1 with value (4 12)
% 0.18/0.52  Evaluation took:
% 0.18/0.52    0.06 seconds of real time
% 0.18/0.52    0.04861 seconds of user run time
% 0.18/0.52    0.010837 seconds of system run time
% 0.18/0.52    0 calls to %EVAL
% 0.18/0.52    0 page faults and
% 0.18/0.52    5,322,768 bytes consed.
% 0.18/0.52  :PROOF-FOUND
% 0.18/0.52  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-09T09:20:20
% 0.18/0.52  :PROOF-FOUND
% 0.18/0.52  * 
%------------------------------------------------------------------------------
