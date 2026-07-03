
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : SYN001+1 : TPTP v8.1.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n012.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Thu Jul 21 11:56:17 EDT 2022

% Result   : Theorem 0.21s 0.52s
% Output   : Refutation 0.21s
% Verified : 
% SZS Type : Derivation
%            Derivation depth      :    0
%            Number of leaves      :    1
% Syntax   : Number of clauses     :    1 (   1 unt;   0 nHn;   1 RR)
%            Number of literals    :    1 (   0 equ;   0 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    0 (   0 avg)
%            Number of predicates  :    1 (   0 usr;   1 prp; 0-0 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :    0 (   0 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(1,negated_conjecture,
    $false,
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel2) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.08/0.13  % Problem  : SYN001+1 : TPTP v8.1.0. Released v2.0.0.
% 0.08/0.14  % Command  : run-snark %s %d
% 0.14/0.36  % Computer : n012.cluster.edu
% 0.14/0.36  % Model    : x86_64 x86_64
% 0.14/0.36  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.36  % Memory   : 8042.1875MB
% 0.14/0.36  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.36  % CPULimit : 300
% 0.14/0.36  % WCLimit  : 600
% 0.14/0.36  % DateTime : Mon Jul 11 12:44:13 EDT 2022
% 0.14/0.36  % CPUTime  : 
% 0.21/0.48  /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.21/0.49  * 
% 0.21/0.49  * 
% 0.21/0.49  #
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
% 0.21/0.49   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.21/0.49   (DECLARE-TPTP-SYMBOLS2))
% 0.21/0.49  * 
% 0.21/0.49  "."
% 0.21/0.49  * 
% 0.21/0.49  ; Begin refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-11T12:44:13
% 0.21/0.49  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n012.cluster.edu at 2022-07-11T12:44:13
% 0.21/0.52  
% 0.21/0.52  
% 0.21/0.52  #||
% 0.21/0.52  % SZS status Theorem for /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.21/0.52  % SZS output start Refutation
% See solution above
% 0.21/0.52  ||#
% 0.21/0.52  
% 0.21/0.52  ; Summary of computation:
% 0.21/0.52  ;         1 formulas have been input or derived (from 1 formulas).
% 0.21/0.52  ;         1 (100%) were retained.  Of these,
% 0.21/0.52  ;            1 (100%) are still being kept.
% 0.21/0.52  ; 
% 0.21/0.52  ; Run time in seconds:
% 0.21/0.52  ;     0.001   5%   Read assertion file          (1 call)
% 0.21/0.52  ;     0.000   0%   Assert                       (1 call)
% 0.21/0.52  ;     0.000   0%   Process new row              (1 call)
% 0.21/0.52  ;     0.000   0%   Forward simplification       (1 call)
% 0.21/0.52  ;     0.000   0%   Backward simplification      (1 call)
% 0.21/0.52  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.21/0.52  ;     0.000   0%   Purity testing               (1 call)
% 0.21/0.52  ;     0.021  95%   Other
% 0.21/0.52  ;     0.022        Total
% 0.21/0.52  ;     0.022        Real time
% 0.21/0.52  ; 
% 0.21/0.52  ; Term-hash-array has 0 terms in all.
% 0.21/0.52  ; Feature-vector-row-index has 0 entries (0 at peak, 0 added, 0 deleted).
% 0.21/0.52  ; Feature-vector-row-index has 1 node (1 at peak, 1 added, 0 deleted).
% 0.21/0.52  ; Path-index has 0 entries (0 at peak, 0 added, 0 deleted).
% 0.21/0.52  ; Path-index has 1 node (1 at peak, 1 added, 0 deleted).
% 0.21/0.52  ; Trie-index has 0 entries (0 at peak, 0 added, 0 deleted).
% 0.21/0.52  ; Trie-index has 1 node (1 at peak, 1 added, 0 deleted).
% 0.21/0.52  ; 
% 0.21/0.52  ; All agendas are empty.
% 0.21/0.52  Evaluation took:
% 0.21/0.52    0.023 seconds of real time
% 0.21/0.52    0.020594 seconds of user run time
% 0.21/0.52    0.002293 seconds of system run time
% 0.21/0.52    0 calls to %EVAL
% 0.21/0.52    0 page faults and
% 0.21/0.52    1,048,120 bytes consed.
% 0.21/0.52  :PROOF-FOUND
% 0.21/0.52  ; End refute-file /export/starexec/sandbox/benchmark/theBenchmark.p 2022-07-11T12:44:13
% 0.21/0.52  :PROOF-FOUND
% 0.21/0.52  * 
%------------------------------------------------------------------------------
