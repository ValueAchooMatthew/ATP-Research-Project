
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : AGT001+2 : TPTP v8.1.0. Bugfixed v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n020.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Thu Jul 14 12:03:52 EDT 2022

% Result   : Theorem 0.48s 0.66s
% Output   : Refutation 0.48s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    1
%            Number of leaves      :    2
% Syntax   : Number of clauses     :    3 (   3 unt;   0 nHn;   3 RR)
%            Number of literals    :    3 (   0 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-4 aty)
%            Number of functors    :    4 (   4 usr;   4 con; 0-0 aty)
%            Number of variables   :    0 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="115"></A>cnf(115,axiom,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox2/benchmark/Axioms/AGT001+1.ax',event_27) ).

<A NAME="957"></A>cnf(957,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query_1) ).

<A NAME="958"></A>cnf(958,plain,
    $false,
    inference('REWRITE',[status(thm)],[<A HREF="#957">957</A>,<A HREF="#115">115</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.08/0.13  % Problem  : AGT001+2 : TPTP v8.1.0. Bugfixed v3.1.0.
% 0.08/0.14  % Command  : run-snark %s %d
% 0.14/0.35  % Computer : n020.cluster.edu
% 0.14/0.35  % Model    : x86_64 x86_64
% 0.14/0.35  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.35  % Memory   : 8042.1875MB
% 0.14/0.35  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.35  % CPULimit : 300
% 0.14/0.35  % WCLimit  : 600
% 0.14/0.35  % DateTime : Sat Jun  4 05:46:37 EDT 2022
% 0.14/0.36  % CPUTime  : 
% 0.21/0.48  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.49  * 
% 0.21/0.49  * 
% 0.21/0.49  #<PACKAGE "SNARK-USER">
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
% 0.21/0.50   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.21/0.50   (DECLARE-TPTP-SYMBOLS2))
% 0.21/0.50  * 
% 0.21/0.50  "."
% 0.21/0.50  * 
% 0.21/0.50  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-04T05:46:38
% 0.21/0.50  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n020.cluster.edu at 2022-06-04T05:46:38
% 0.46/0.61  WARNING:
% 0.46/0.61     |sum| is a 3-ary relation that occurs only negatively; disabling rows that contain it.
% 0.46/0.61  WARNING:
% 0.46/0.61     |min_number_of_proposed_agents| is a 2-ary relation that occurs only negatively; disabling rows that contain it.
% 0.48/0.66  
% 0.48/0.66  
% 0.48/0.66  #||
% 0.48/0.66  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.48/0.66  % SZS output start Refutation
% See solution above
% 0.48/0.66  ||#
% 0.48/0.66  
% 0.48/0.66  ; Summary of computation:
% 0.48/0.66  ;       997 formulas have been input or derived (from 1 formulas).
% 0.48/0.66  ;       958 (96%) were retained.  Of these,
% 0.48/0.66  ;            1 ( 0%) were simplified or subsumed later,
% 0.48/0.66  ;          957 (100%) are still being kept.
% 0.48/0.66  ; 
% 0.48/0.66  ; Run time in seconds excluding printing time:
% 0.48/0.66  ;     0.095  57%   Read assertion file          (1 call)
% 0.48/0.66  ;     0.009   5%   Assert                       (923 calls)
% 0.48/0.66  ;     0.026  16%   Process new row              (996 calls)
% 0.48/0.66  ;     0.000   0%   Condensing                   (103 calls)
% 0.48/0.66  ;     0.002   1%   Forward subsumption          (103 calls)
% 0.48/0.66  ;     0.001   1%   Backward subsumption         (103 calls)
% 0.48/0.66  ;     0.000   0%   Clause clause subsumption    (1 call)
% 0.48/0.66  ;     0.007   4%   Forward simplification       (994 calls)
% 0.48/0.66  ;     0.003   2%   Backward simplification      (957 calls)
% 0.48/0.66  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.48/0.66  ;     0.002   1%   Purity testing               (1 call)
% 0.48/0.66  ;     0.022  13%   Other
% 0.48/0.66  ;     0.167        Total
% 0.48/0.66  ;     0.168        Real time
% 0.48/0.66  ; 
% 0.48/0.66  ; Term-hash-array has 1,340 terms in all.
% 0.48/0.66  ; Feature-vector-row-index has 103 entries (103 at peak, 103 added, 0 deleted).
% 0.48/0.66  ; Feature-vector-row-index has 320 nodes (320 at peak, 320 added, 0 deleted).
% 0.48/0.66  ;  Retrieved 3 possibly forward subsuming rows in 103 calls.
% 0.48/0.66  ;  Retrieved 3 possibly backward subsumed rows in 103 calls.
% 0.48/0.66  ; Path-index has 1,626 entries (1,626 at peak, 1,626 added, 0 deleted).
% 0.48/0.66  ; Path-index has 1,094 nodes (1,094 at peak, 1,094 added, 0 deleted).
% 0.48/0.66  ; Trie-index has 1,626 entries (1,626 at peak, 1,626 added, 0 deleted).
% 0.48/0.66  ; Trie-index has 3,996 nodes (3,996 at peak, 3,996 added, 0 deleted).
% 0.48/0.66  ; Retrieved 38 generalization terms in 935 calls.
% 0.48/0.66  ; Retrieved 853 instance terms in 853 calls.
% 0.48/0.66  ; 
% 0.48/0.66  ; The agenda of input rows to give has 956 entries:
% 0.48/0.66  ;   196 with value 4               4 with value 10               1 with value 18
% 0.48/0.66  ;   240 with value 5               1 with value 11               2 with value 20
% 0.48/0.66  ;   152 with value 6             183 with value 12               1 with value 21
% 0.48/0.66  ;     9 with value 7               2 with value 13               1 with value 22
% 0.48/0.66  ;    23 with value 8               1 with value 14              13 with value 29
% 0.48/0.66  ;    68 with value 9              59 with value 16
% 0.48/0.66  Evaluation took:
% 0.48/0.66    0.168 seconds of real time
% 0.48/0.66    0.157385 seconds of user run time
% 0.48/0.66    0.011009 seconds of system run time
% 0.48/0.66    0 calls to %EVAL
% 0.48/0.66    0 page faults and
% 0.48/0.66    10,682,496 bytes consed.
% 0.48/0.66  :PROOF-FOUND
% 0.48/0.66  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-04T05:46:38
% 0.48/0.66  :PROOF-FOUND
% 0.48/0.66  * 
%------------------------------------------------------------------------------
