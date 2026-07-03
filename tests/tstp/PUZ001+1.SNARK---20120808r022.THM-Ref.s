
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : PUZ001+1 : TPTP v8.1.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n024.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Mon Jul 18 18:26:21 EDT 2022

% Result   : Theorem 0.18s 0.50s
% Output   : Refutation 0.18s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    5
%            Number of leaves      :   12
% Syntax   : Number of clauses     :   23 (  14 unt;   5 nHn;  21 RR)
%            Number of literals    :   35 (  12 equ;  13 neg)
%            Maximal clause size   :    4 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    6 (   4 usr;   1 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-1 aty)
%            Number of variables   :   10 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    lives('SKOLEMAAAV1'),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_1) ).

cnf(2,axiom,
    killed('SKOLEMAAAV1',agatha),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_1) ).

cnf(6,axiom,
    ( ~ lives(X)
    | X = agatha
    | X = butler
    | X = charles ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_3) ).

cnf(7,axiom,
    ( ~ killed(X,Y)
    | hates(X,Y) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_4) ).

cnf(8,axiom,
    ( ~ killed(X,Y)
    | ~ richer(X,Y) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_5) ).

cnf(9,axiom,
    ( ~ hates(agatha,X)
    | ~ hates(charles,X) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_6) ).

cnf(10,axiom,
    ( X = butler
    | hates(agatha,X) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_7) ).

cnf(11,axiom,
    ( richer(X,agatha)
    | hates(butler,X) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_8) ).

cnf(12,axiom,
    ( ~ hates(agatha,X)
    | hates(butler,X) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_9) ).

cnf(13,axiom,
    ~ hates(X,'SKOLEMAAAV2'(X)),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_10) ).

cnf(14,axiom,
    agatha != butler,
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_11) ).

cnf(15,negated_conjecture,
    ~ killed(agatha,agatha),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55) ).

cnf(16,plain,
    hates('SKOLEMAAAV1',agatha),
    inference('HYPERRESOLVE',[status(thm)],[7,2]) ).

cnf(19,plain,
    hates(agatha,agatha),
    inference('UR-RESOLVE',[status(thm)],[10,14]) ).

cnf(21,plain,
    hates(butler,'SKOLEMAAAV1'),
    inference('HYPERRESOLVE',[status(thm)],[8,11,2]) ).

cnf(23,plain,
    ~ hates(agatha,'SKOLEMAAAV2'(butler)),
    inference('UR-RESOLVE',[status(thm)],[12,13]) ).

cnf(25,plain,
    ( 'SKOLEMAAAV1' = agatha
    | 'SKOLEMAAAV1' = butler
    | 'SKOLEMAAAV1' = charles ),
    inference('HYPERRESOLVE',[status(thm)],[6,1]) ).

cnf(27,plain,
    ~ hates(charles,agatha),
    inference('UR-RESOLVE',[status(thm)],[9,19]) ).

cnf(32,plain,
    'SKOLEMAAAV2'(butler) = butler,
    inference('HYPERRESOLVE',[status(thm)],[23,10]) ).

cnf(36,plain,
    ~ hates(butler,butler),
    inference('PARAMODULATE',[status(thm)],[13,32,theory(equality)]) ).

cnf(39,plain,
    ( 'SKOLEMAAAV1' = agatha
    | 'SKOLEMAAAV1' = butler ),
    inference('REWRITE',[status(thm)],[inference('PARAMODULATE',[status(thm)],[16,25,theory(equality)]),27]) ).

cnf(40,plain,
    'SKOLEMAAAV1' = agatha,
    inference('REWRITE',[status(thm)],[inference('PARAMODULATE',[status(thm)],[21,39,theory(equality)]),36]) ).

cnf(41,plain,
    $false,
    inference('REWRITE',[status(thm)],[2,15,40,theory(equality)]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.11/0.11  % Problem  : PUZ001+1 : TPTP v8.1.0. Released v2.0.0.
% 0.11/0.12  % Command  : run-snark %s %d
% 0.11/0.33  % Computer : n024.cluster.edu
% 0.11/0.33  % Model    : x86_64 x86_64
% 0.11/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.11/0.33  % Memory   : 8042.1875MB
% 0.11/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.11/0.33  % CPULimit : 300
% 0.11/0.33  % WCLimit  : 600
% 0.11/0.33  % DateTime : Sat May 28 22:22:51 EDT 2022
% 0.11/0.34  % CPUTime  : 
% 0.18/0.44  /export/starexec/sandbox/benchmark/theBenchmark.p
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
% 0.18/0.46  ; Begin refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-05-28T22:22:52
% 0.18/0.46  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n024.cluster.edu at 2022-05-28T22:22:52
% 0.18/0.50  
% 0.18/0.50  
% 0.18/0.50  #||
% 0.18/0.50  % SZS status Theorem for /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.18/0.50  % SZS output start Refutation
% See solution above
% 0.18/0.50  ||#
% 0.18/0.50  
% 0.18/0.50  ; Summary of computation:
% 0.18/0.50  ;        79 formulas have been input or derived (from 37 formulas).
% 0.18/0.50  ;        41 (52%) were retained.  Of these,
% 0.18/0.50  ;           12 (29%) were simplified or subsumed later,
% 0.18/0.50  ;           29 (71%) are still being kept.
% 0.18/0.50  ; 
% 0.18/0.50  ; Run time in seconds excluding printing time:
% 0.18/0.50  ;     0.003   9%   Read assertion file          (1 call)
% 0.18/0.50  ;     0.000   0%   Assert                       (14 calls)
% 0.18/0.50  ;     0.001   3%   Process new row              (66 calls)
% 0.18/0.50  ;     0.002   6%   Resolution                   (72 calls)
% 0.18/0.50  ;     0.002   6%   Paramodulation               (36 calls)
% 0.18/0.50  ;     0.000   0%   Factoring                    (5 calls)
% 0.18/0.50  ;     0.000   0%   Condensing                   (12 calls)
% 0.18/0.50  ;     0.001   3%   Forward subsumption          (12 calls)
% 0.18/0.50  ;     0.000   0%   Backward subsumption         (12 calls)
% 0.18/0.50  ;     0.000   0%   Clause clause subsumption    (5 calls)
% 0.18/0.50  ;     0.002   6%   Forward simplification       (63 calls)
% 0.18/0.50  ;     0.000   0%   Backward simplification      (41 calls)
% 0.18/0.50  ;     0.000   0%   Ordering                     (81 calls)
% 0.18/0.50  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.18/0.50  ;     0.000   0%   Purity testing               (1 call)
% 0.18/0.50  ;     0.022  67%   Other
% 0.18/0.50  ;     0.033        Total
% 0.18/0.50  ;     0.035        Real time
% 0.18/0.50  ; 
% 0.18/0.50  ; Term-hash-array has 46 terms in all.
% 0.18/0.50  ; Feature-vector-row-index has 8 entries (11 at peak, 12 added, 4 deleted).
% 0.18/0.50  ; Feature-vector-row-index has 24 nodes (49 at peak, 55 added, 31 deleted).
% 0.18/0.50  ;  Retrieved 2 possibly forward subsuming rows in 12 calls.
% 0.18/0.50  ;  Retrieved 3 possibly backward subsumed rows in 12 calls.
% 0.18/0.50  ; Path-index has 38 entries (47 at peak, 52 added, 14 deleted).
% 0.18/0.50  ; Path-index has 56 nodes (63 at peak, 67 added, 11 deleted).
% 0.18/0.50  ; Trie-index has 38 entries (47 at peak, 52 added, 14 deleted).
% 0.18/0.50  ; Trie-index has 63 nodes (76 at peak, 87 added, 24 deleted).
% 0.18/0.50  ; Retrieved 19 generalization terms in 70 calls.
% 0.18/0.50  ; Retrieved 28 instance terms in 28 calls.
% 0.18/0.50  ; Retrieved 160 unifiable terms in 195 calls.
% 0.18/0.50  ; 
% 0.18/0.50  ; The agenda of backward simplifiable rows to process has 4 entries:
% 0.18/0.50  ;     4 with value 0
% 0.18/0.50  ; The agenda of rows to process has 4 entries:
% 0.18/0.50  ;     3 with value 11              1 with value 15
% 0.18/0.50  ; The agenda of rows to give has 1 entry:
% 0.18/0.50  ;     1 with value (4 7)
% 0.18/0.50  Evaluation took:
% 0.18/0.50    0.035 seconds of real time
% 0.18/0.50    0.033351 seconds of user run time
% 0.18/0.50    0.00226 seconds of system run time
% 0.18/0.50    0 calls to %EVAL
% 0.18/0.50    0 page faults and
% 0.18/0.50    2,686,120 bytes consed.
% 0.18/0.50  :PROOF-FOUND
% 0.18/0.50  ; End refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-05-28T22:22:52
% 0.18/0.50  :PROOF-FOUND
% 0.18/0.50  * 
%------------------------------------------------------------------------------
