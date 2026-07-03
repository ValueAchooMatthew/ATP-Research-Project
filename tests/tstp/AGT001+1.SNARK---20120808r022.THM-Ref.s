
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : AGT001+1 : TPTP v8.1.0. Bugfixed v3.1.0.
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
% DateTime : Thu Jul 14 12:03:52 EDT 2022

% Result   : Theorem 0.48s 0.65s
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
    file('/export/starexec/sandbox/benchmark/Axioms/AGT001+1.ax',event_27) ).

<A NAME="627"></A>cnf(627,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',query_1) ).

<A NAME="628"></A>cnf(628,plain,
    $false,
    inference('REWRITE',[status(thm)],[<A HREF="#627">627</A>,<A HREF="#115">115</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.07/0.13  % Problem  : AGT001+1 : TPTP v8.1.0. Bugfixed v3.1.0.
% 0.07/0.14  % Command  : run-snark %s %d
% 0.15/0.36  % Computer : n025.cluster.edu
% 0.15/0.36  % Model    : x86_64 x86_64
% 0.15/0.36  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.36  % Memory   : 8042.1875MB
% 0.15/0.36  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.15/0.36  % CPULimit : 300
% 0.15/0.36  % WCLimit  : 600
% 0.15/0.36  % DateTime : Sat Jun  4 05:16:46 EDT 2022
% 0.15/0.36  % CPUTime  : 
% 0.22/0.49  /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.22/0.50  * 
% 0.22/0.50  * 
% 0.22/0.51  #<PACKAGE "SNARK-USER">
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
% 0.22/0.51  ; Begin refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-06-04T05:16:46
% 0.22/0.51  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n025.cluster.edu at 2022-06-04T05:16:46
% 0.22/0.60  WARNING:
% 0.22/0.60     |sum| is a 3-ary relation that occurs only negatively; disabling rows that contain it.
% 0.22/0.60  WARNING:
% 0.22/0.60     |min_number_of_proposed_agents| is a 2-ary relation that occurs only negatively; disabling rows that contain it.
% 0.48/0.65  
% 0.48/0.65  
% 0.48/0.65  #||
% 0.48/0.65  % SZS status Theorem for /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.48/0.65  % SZS output start Refutation
% See solution above
% 0.48/0.65  ||#
% 0.48/0.65  
% 0.48/0.65  ; Summary of computation:
% 0.48/0.65  ;       630 formulas have been input or derived (from 1 formulas).
% 0.48/0.65  ;       628 (100%) were retained.  Of these,
% 0.48/0.65  ;            1 ( 0%) were simplified or subsumed later,
% 0.48/0.65  ;          627 (100%) are still being kept.
% 0.48/0.65  ; 
% 0.48/0.65  ; Run time in seconds:
% 0.48/0.65  ;     0.073  53%   Read assertion file          (1 call)
% 0.48/0.65  ;     0.009   7%   Assert                       (556 calls)
% 0.48/0.65  ;     0.022  16%   Process new row              (629 calls)
% 0.48/0.65  ;     0.001   1%   Condensing                   (103 calls)
% 0.48/0.65  ;     0.001   1%   Forward subsumption          (103 calls)
% 0.48/0.65  ;     0.001   1%   Backward subsumption         (103 calls)
% 0.48/0.65  ;     0.000   0%   Clause clause subsumption    (1 call)
% 0.48/0.65  ;     0.005   4%   Forward simplification       (627 calls)
% 0.48/0.65  ;     0.002   1%   Backward simplification      (627 calls)
% 0.48/0.65  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.48/0.65  ;     0.001   1%   Purity testing               (1 call)
% 0.48/0.65  ;     0.023  17%   Other
% 0.48/0.65  ;     0.138        Total
% 0.48/0.65  ;     0.139        Real time
% 0.48/0.65  ; 
% 0.48/0.65  ; Term-hash-array has 1,010 terms in all.
% 0.48/0.65  ; Feature-vector-row-index has 103 entries (103 at peak, 103 added, 0 deleted).
% 0.48/0.65  ; Feature-vector-row-index has 320 nodes (320 at peak, 320 added, 0 deleted).
% 0.48/0.65  ;  Retrieved 3 possibly forward subsuming rows in 103 calls.
% 0.48/0.65  ;  Retrieved 3 possibly backward subsumed rows in 103 calls.
% 0.48/0.65  ; Path-index has 1,296 entries (1,296 at peak, 1,296 added, 0 deleted).
% 0.48/0.65  ; Path-index has 1,047 nodes (1,047 at peak, 1,047 added, 0 deleted).
% 0.48/0.65  ; Trie-index has 1,296 entries (1,296 at peak, 1,296 added, 0 deleted).
% 0.48/0.65  ; Trie-index has 3,570 nodes (3,570 at peak, 3,570 added, 0 deleted).
% 0.48/0.65  ; Retrieved 1 generalization term in 571 calls.
% 0.48/0.65  ; Retrieved 523 instance terms in 523 calls.
% 0.48/0.65  ; 
% 0.48/0.65  ; The agenda of input rows to give has 626 entries:
% 0.48/0.65  ;    37 with value 4               4 with value 10               1 with value 18
% 0.48/0.65  ;    69 with value 5               1 with value 11               2 with value 20
% 0.48/0.65  ;   152 with value 6             183 with value 12               1 with value 21
% 0.48/0.65  ;     9 with value 7               2 with value 13               1 with value 22
% 0.48/0.65  ;    23 with value 8               1 with value 14              13 with value 29
% 0.48/0.65  ;    68 with value 9              59 with value 16
% 0.48/0.65  Evaluation took:
% 0.48/0.65    0.139 seconds of real time
% 0.48/0.65    0.132796 seconds of user run time
% 0.48/0.65    0.005939 seconds of system run time
% 0.48/0.65    0 calls to %EVAL
% 0.48/0.65    0 page faults and
% 0.48/0.65    8,134,096 bytes consed.
% 0.48/0.65  :PROOF-FOUND
% 0.48/0.65  ; End refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-06-04T05:16:46
% 0.48/0.65  :PROOF-FOUND
% 0.48/0.65  * 
%------------------------------------------------------------------------------
