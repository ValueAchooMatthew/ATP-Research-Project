
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : PUZ001+2 : TPTP v8.1.0. Released v4.0.0.
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
% DateTime : Mon Jul 18 18:26:21 EDT 2022

% Result   : Theorem 0.19s 0.50s
% Output   : Refutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    7
%            Number of leaves      :   14
% Syntax   : Number of clauses     :   27 (  17 unt;   6 nHn;  24 RR)
%            Number of literals    :   42 (  16 equ;  16 neg)
%            Maximal clause size   :    5 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    6 (   4 usr;   1 prp; 0-4 aty)
%            Number of functors    :   19 (  19 usr;  13 con; 0-2 aty)
%            Number of variables   :   23 (  10 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,axiom,
    predicate1('SKOLEMAAAV2',live,'SKOLEMAAAV1'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(2,axiom,
    modifier_pp('SKOLEMAAAV2',in,'DreadburyMansion'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(3,axiom,
    predicate2('SKOLEMAAAV3',kill,'SKOLEMAAAV1','AuntAgatha'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(4,axiom,
    ( ~ predicate1(X,live,Y)
    | ~ modifier_pp(X,in,'DreadburyMansion')
    | Y = 'AuntAgatha'
    | Y = 'Butler'
    | Y = 'Charles' ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(5,axiom,
    ( ~ predicate2(X,kill,Y,Z)
    | predicate2('SKOLEMAAAV4'(Y,Z),hate,Y,Z) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(6,axiom,
    ( ~ predicate2(X,kill,Y,Z)
    | ~ property2(U,rich,comp_than,Z)
    | Y != U ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(7,axiom,
    ( ~ predicate2(X,hate,'AuntAgatha',Y)
    | ~ predicate2(Z,hate,'Charles',Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(9,axiom,
    ( X = 'Butler'
    | predicate2('SKOLEMAAAV5'(X),hate,'AuntAgatha',X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(10,axiom,
    ( property2('SKOLEMAAAV6'(X),rich,comp_than,'AuntAgatha')
    | predicate2('SKOLEMAAAV7'(X),hate,'Butler',X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(11,axiom,
    ( X = 'SKOLEMAAAV6'(X)
    | predicate2('SKOLEMAAAV7'(X),hate,'Butler',X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(12,axiom,
    ( ~ predicate2(X,hate,'AuntAgatha',Y)
    | predicate2('SKOLEMAAAV8'(Y),hate,'Butler',Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(13,axiom,
    ~ predicate2(X,hate,Y,'SKOLEMAAAV9'(Y)),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(14,axiom,
    'AuntAgatha' != 'Butler',
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

cnf(15,negated_conjecture,
    ~ predicate2(X,kill,'AuntAgatha','AuntAgatha'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove) ).

cnf(17,plain,
    predicate2('SKOLEMAAAV5'('AuntAgatha'),hate,'AuntAgatha','AuntAgatha'),
    inference('UR-RESOLVE',[status(thm)],[9,14]) ).

cnf(18,plain,
    'SKOLEMAAAV9'('Butler') = 'SKOLEMAAAV6'('SKOLEMAAAV9'('Butler')),
    inference('HYPERRESOLVE',[status(thm)],[13,11]) ).

cnf(19,plain,
    ~ predicate2(X,hate,'AuntAgatha','SKOLEMAAAV9'('Butler')),
    inference('UR-RESOLVE',[status(thm)],[12,13]) ).

cnf(25,plain,
    property2('SKOLEMAAAV9'('Butler'),rich,comp_than,'AuntAgatha'),
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[10,13]),18,theory(equality)]) ).

cnf(26,plain,
    ( 'SKOLEMAAAV1' = 'AuntAgatha'
    | 'SKOLEMAAAV1' = 'Butler'
    | 'SKOLEMAAAV1' = 'Charles' ),
    inference('HYPERRESOLVE',[status(thm)],[4,1,2]) ).

cnf(27,plain,
    ~ predicate2(X,hate,'Charles','AuntAgatha'),
    inference('UR-RESOLVE',[status(thm)],[7,17]) ).

cnf(29,plain,
    ~ predicate2(X,kill,'Charles','AuntAgatha'),
    inference('UR-RESOLVE',[status(thm)],[5,27]) ).

cnf(30,plain,
    'SKOLEMAAAV9'('Butler') = 'Butler',
    inference('HYPERRESOLVE',[status(thm)],[19,9]) ).

cnf(32,plain,
    property2('Butler',rich,comp_than,'AuntAgatha'),
    inference('REWRITE',[status(thm)],[25,30,theory(equality)]) ).

cnf(33,plain,
    'SKOLEMAAAV1' != 'Butler',
    inference('UR-RESOLVE',[status(thm)],[6,32,3]) ).

cnf(34,plain,
    ( 'SKOLEMAAAV1' = 'AuntAgatha'
    | 'SKOLEMAAAV1' = 'Charles' ),
    inference('REWRITE',[status(thm)],[26,33]) ).

cnf(42,plain,
    'SKOLEMAAAV1' = 'AuntAgatha',
    inference('REWRITE',[status(thm)],[inference('PARAMODULATE',[status(thm)],[3,34,theory(equality)]),29]) ).

cnf(44,plain,
    $false,
    inference('REWRITE',[status(thm)],[3,15,42,theory(equality)]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.12  % Problem  : PUZ001+2 : TPTP v8.1.0. Released v4.0.0.
% 0.03/0.12  % Command  : run-snark %s %d
% 0.12/0.33  % Computer : n018.cluster.edu
% 0.12/0.33  % Model    : x86_64 x86_64
% 0.12/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.33  % Memory   : 8042.1875MB
% 0.12/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.33  % CPULimit : 300
% 0.12/0.33  % WCLimit  : 600
% 0.12/0.33  % DateTime : Sun May 29 00:39:25 EDT 2022
% 0.12/0.33  % CPUTime  : 
% 0.19/0.44  /export/starexec/sandbox2/benchmark/theBenchmark.p
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
% 0.19/0.46  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-05-29T00:39:25
% 0.19/0.46  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n018.cluster.edu at 2022-05-29T00:39:25
% 0.19/0.50  
% 0.19/0.50  
% 0.19/0.50  #||
% 0.19/0.50  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.19/0.50  % SZS output start Refutation
% See solution above
% 0.19/0.50  ||#
% 0.19/0.50  
% 0.19/0.50  ; Summary of computation:
% 0.19/0.50  ;        71 formulas have been input or derived (from 30 formulas).
% 0.19/0.50  ;        44 (62%) were retained.  Of these,
% 0.19/0.50  ;           14 (32%) were simplified or subsumed later,
% 0.19/0.50  ;           30 (68%) are still being kept.
% 0.19/0.50  ; 
% 0.19/0.50  ; Run time in seconds excluding printing time:
% 0.19/0.50  ;     0.003   9%   Read assertion file          (1 call)
% 0.19/0.50  ;     0.001   3%   Assert                       (2 calls)
% 0.19/0.50  ;     0.003   9%   Process new row              (56 calls)
% 0.19/0.50  ;     0.003   9%   Resolution                   (58 calls)
% 0.19/0.50  ;     0.000   0%   Paramodulation               (29 calls)
% 0.19/0.50  ;     0.000   0%   Factoring                    (4 calls)
% 0.19/0.50  ;     0.001   3%   Condensing                   (14 calls)
% 0.19/0.50  ;     0.001   3%   Forward subsumption          (14 calls)
% 0.19/0.50  ;     0.001   3%   Backward subsumption         (14 calls)
% 0.19/0.50  ;     0.000   0%   Forward simplification       (55 calls)
% 0.19/0.50  ;     0.000   0%   Backward simplification      (44 calls)
% 0.19/0.50  ;     0.000   0%   Ordering                     (68 calls)
% 0.19/0.50  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.19/0.50  ;     0.000   0%   Purity testing               (1 call)
% 0.19/0.50  ;     0.021  62%   Other
% 0.19/0.50  ;     0.034        Total
% 0.19/0.50  ;     0.039        Real time
% 0.19/0.50  ; 
% 0.19/0.50  ; Term-hash-array has 66 terms in all.
% 0.19/0.50  ; Feature-vector-row-index has 9 entries (13 at peak, 14 added, 5 deleted).
% 0.19/0.50  ; Feature-vector-row-index has 54 nodes (81 at peak, 87 added, 33 deleted).
% 0.19/0.50  ;  Retrieved 0 possibly forward subsuming rows in 14 calls.
% 0.19/0.50  ;  Retrieved 0 possibly backward subsumed rows in 14 calls.
% 0.19/0.50  ; Path-index has 62 entries (74 at peak, 81 added, 19 deleted).
% 0.19/0.50  ; Path-index has 108 nodes (121 at peak, 127 added, 19 deleted).
% 0.19/0.50  ; Trie-index has 62 entries (74 at peak, 81 added, 19 deleted).
% 0.19/0.50  ; Trie-index has 135 nodes (165 at peak, 182 added, 47 deleted).
% 0.19/0.50  ; Retrieved 14 generalization terms in 72 calls.
% 0.19/0.50  ; Retrieved 29 instance terms in 29 calls.
% 0.19/0.50  ; Retrieved 217 unifiable terms in 221 calls.
% 0.19/0.50  ; 
% 0.19/0.50  ; The agenda of backward simplifiable rows to process has 8 entries:
% 0.19/0.50  ;     8 with value 0
% 0.19/0.50  ; The agenda of rows to process has 1 entry:
% 0.19/0.50  ;     1 with value 14
% 0.19/0.50  ; The agenda of input rows to give has 1 entry:
% 0.19/0.50  ;     1 with value 5
% 0.19/0.50  ; The agenda of rows to give has 5 entries:
% 0.19/0.50  ;     1 with value (4 6)           1 with value (4 10)           1 with value (4 13)
% 0.19/0.50  ;     2 with value (4 9)
% 0.19/0.50  Evaluation took:
% 0.19/0.50    0.039 seconds of real time
% 0.19/0.50    0.03365 seconds of user run time
% 0.19/0.50    0.004902 seconds of system run time
% 0.19/0.50    0 calls to %EVAL
% 0.19/0.50    0 page faults and
% 0.19/0.50    3,446,960 bytes consed.
% 0.19/0.50  :PROOF-FOUND
% 0.19/0.50  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-05-29T00:39:25
% 0.19/0.50  :PROOF-FOUND
% 0.19/0.50  * 
%------------------------------------------------------------------------------
