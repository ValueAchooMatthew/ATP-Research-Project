
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : SYN000+1 : TPTP v8.1.0. Released v4.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n015.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Thu Jul 21 11:56:13 EDT 2022

% Result   : Theorem 0.20s 0.51s
% Output   : Refutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    1
%            Number of leaves      :    2
% Syntax   : Number of clauses     :    3 (   3 unt;   0 nHn;   3 RR)
%            Number of literals    :    3 (   0 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-1 aty)
%            Number of functors    :    1 (   1 usr;   1 con; 0-0 aty)
%            Number of variables   :    1 (   1 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(12,hypothesis,
    p(h),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_hypothesis) ).

cnf(13,negated_conjecture,
    ~ p(X),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_conjecture) ).

cnf(14,plain,
    $false,
    inference('REWRITE',[status(thm)],[12,13]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.12  % Problem  : SYN000+1 : TPTP v8.1.0. Released v4.0.0.
% 0.06/0.13  % Command  : run-snark %s %d
% 0.13/0.34  % Computer : n015.cluster.edu
% 0.13/0.34  % Model    : x86_64 x86_64
% 0.13/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.34  % Memory   : 8042.1875MB
% 0.13/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit : 300
% 0.13/0.34  % WCLimit  : 600
% 0.13/0.34  % DateTime : Tue Jul 12 05:06:40 EDT 2022
% 0.13/0.34  % CPUTime  : 
% 0.20/0.46  /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.20/0.47  * 
% 0.20/0.47  * 
% 0.20/0.48  #
% 0.20/0.48  * 
% 0.20/0.48  SNARK-TPTP-OPTIONS
% 0.20/0.48  * 
% 0.20/0.48  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.20/0.48   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.20/0.48   (USE-FACTORING :POS)
% 0.20/0.48   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.20/0.48   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.20/0.48   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.20/0.48   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.20/0.48   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.20/0.48   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.20/0.48   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.20/0.48   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.20/0.48   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.20/0.48   (DECLARE-TPTP-SYMBOLS2))
% 0.20/0.48  * 
% 0.20/0.48  "."
% 0.20/0.48  * 
% 0.20/0.48  ; Begin refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-12T05:06:40
% 0.20/0.48  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n015.cluster.edu at 2022-07-12T05:06:40
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|s0| is a proposition that occurs only negatively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|p0| is a proposition that occurs only negatively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|q0| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|r0| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|A proposition| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     |A predicate| is a 1-ary relation that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|ia1| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|ia2| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.49  WARNING:
% 0.20/0.49     #:|ia3| is a proposition that occurs only positively; disabling rows that contain it.
% 0.20/0.51  
% 0.20/0.51  
% 0.20/0.51  #||
% 0.20/0.51  % SZS status Theorem for /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.20/0.51  % SZS output start Refutation
% See solution above
% 0.20/0.51  ||#
% 0.20/0.51  
% 0.20/0.51  ; Summary of computation:
% 0.20/0.51  ;        24 formulas have been input or derived (from 1 formulas).
% 0.20/0.51  ;        14 (58%) were retained.  Of these,
% 0.20/0.51  ;            6 (43%) were simplified or subsumed later,
% 0.20/0.51  ;            8 (57%) are still being kept.
% 0.20/0.51  ; 
% 0.20/0.51  ; Run time in seconds excluding printing time:
% 0.20/0.51  ;     0.003  10%   Read assertion file          (1 call)
% 0.20/0.51  ;     0.001   3%   Assert                       (12 calls)
% 0.20/0.51  ;     0.000   0%   Process new row              (20 calls)
% 0.20/0.51  ;     0.000   0%   Condensing                   (15 calls)
% 0.20/0.51  ;     0.000   0%   Forward subsumption          (15 calls)
% 0.20/0.51  ;     0.001   3%   Backward subsumption         (11 calls)
% 0.20/0.51  ;     0.000   0%   Clause clause subsumption    (4 calls)
% 0.20/0.51  ;     0.000   0%   Forward simplification       (18 calls)
% 0.20/0.51  ;     0.000   0%   Backward simplification      (14 calls)
% 0.20/0.51  ;     0.001   3%   Sortal reasoning             (32 calls)
% 0.20/0.51  ;     0.001   3%   Purity testing               (1 call)
% 0.20/0.51  ;     0.023  77%   Other
% 0.20/0.51  ;     0.030        Total
% 0.20/0.51  ;     0.031        Real time
% 0.20/0.51  ; 
% 0.20/0.51  ; Term-hash-array has 30 terms in all.
% 0.20/0.51  ; Feature-vector-row-index has 6 entries (11 at peak, 11 added, 5 deleted).
% 0.20/0.51  ; Feature-vector-row-index has 76 nodes (125 at peak, 125 added, 49 deleted).
% 0.20/0.51  ;  Retrieved 4 possibly forward subsuming rows in 15 calls.
% 0.20/0.51  ;  Retrieved 0 possibly backward subsumed rows in 11 calls.
% 0.20/0.51  ; Path-index has 29 entries (34 at peak, 34 added, 5 deleted).
% 0.20/0.51  ; Path-index has 107 nodes (114 at peak, 114 added, 7 deleted).
% 0.20/0.51  ; Trie-index has 29 entries (34 at peak, 34 added, 5 deleted).
% 0.20/0.51  ; Trie-index has 101 nodes (112 at peak, 112 added, 11 deleted).
% 0.20/0.51  ; Retrieved 0 generalization terms in 1 call.
% 0.20/0.51  ; Retrieved 3 instance terms in 2 calls.
% 0.20/0.51  ; 
% 0.20/0.51  ; The agenda of input rows to process has 3 entries:
% 0.20/0.51  ;     3 with value 0
% 0.20/0.51  ; The agenda of backward simplifiable rows to process has 1 entry:
% 0.20/0.51  ;     1 with value 0
% 0.20/0.51  ; The agenda of input rows to give has 7 entries:
% 0.20/0.51  ;     1 with value 3               2 with value 20               2 with value 29
% 0.20/0.51  ;     1 with value 13              1 with value 27
% 0.20/0.51  Evaluation took:
% 0.20/0.51    0.032 seconds of real time
% 0.20/0.51    0.028344 seconds of user run time
% 0.20/0.51    0.003354 seconds of system run time
% 0.20/0.51    0 calls to %EVAL
% 0.20/0.51    0 page faults and
% 0.20/0.51    1,543,072 bytes consed.
% 0.20/0.51  :PROOF-FOUND
% 0.20/0.51  ; End refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-12T05:06:40
% 0.20/0.51  :PROOF-FOUND
% 0.20/0.51  * 
%------------------------------------------------------------------------------
