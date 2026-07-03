
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : KRS130+1 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n032.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sun Jul 17 03:28:40 EDT 2022

% Result   : Theorem 0.14s 0.40s
% Output   : Refutation 0.14s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    6
%            Number of leaves      :    8
% Syntax   : Number of clauses     :   15 (   5 unt;   7 nHn;  13 RR)
%            Number of literals    :   35 (   0 equ;  13 neg)
%            Maximal clause size   :    6 (   2 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    7 (   6 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-1 aty)
%            Number of variables   :    8 (   4 sgn)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="1"></A>cnf(1,axiom,
    cowlThing(X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="2"></A>cnf(2,axiom,
    ~ cowlNothing(X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="3"></A>cnf(3,axiom,
    ( ~ xsd_string(X)
    | ~ xsd_integer(X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="4"></A>cnf(4,axiom,
    ( xsd_string(X)
    | xsd_integer(X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="5"></A>cnf(5,axiom,
    ( ~ cNothing(X)
    | ~ rp(X,Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_2) ).

<A NAME="6"></A>cnf(6,axiom,
    ( ~ cNothing(X)
    | rp(X,'SKOLEMAAAO1'(X)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="7"></A>cnf(7,negated_conjecture,
    ( ~ cowlThing('SKOLEMAAAO2')
    | cowlNothing('SKOLEMAAAO2')
    | ~ xsd_string('SKOLEMAAAO3')
    | xsd_integer('SKOLEMAAAO3')
    | cNothing('SKOLEMAAAO4')
    | cowlNothing('SKOLEMAAAO4') ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="8"></A>cnf(8,plain,
    ( ~ xsd_string('SKOLEMAAAO3')
    | xsd_integer('SKOLEMAAAO3')
    | cNothing('SKOLEMAAAO4') ),
    inference('REWRITE',[status(thm)],[<A HREF="#7">7</A>,<A HREF="#2">2</A>,<A HREF="#1">1</A>]) ).

<A NAME="9"></A>cnf(9,negated_conjecture,
    ( ~ cowlThing('SKOLEMAAAO2')
    | cowlNothing('SKOLEMAAAO2')
    | xsd_string('SKOLEMAAAO3')
    | ~ xsd_integer('SKOLEMAAAO3')
    | cNothing('SKOLEMAAAO4')
    | cowlNothing('SKOLEMAAAO4') ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="10"></A>cnf(10,plain,
    ( xsd_string('SKOLEMAAAO3')
    | ~ xsd_integer('SKOLEMAAAO3')
    | cNothing('SKOLEMAAAO4') ),
    inference('REWRITE',[status(thm)],[<A HREF="#9">9</A>,<A HREF="#2">2</A>,<A HREF="#1">1</A>]) ).

<A NAME="11"></A>cnf(11,plain,
    ( xsd_integer('SKOLEMAAAO3')
    | cNothing('SKOLEMAAAO4') ),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#8">8</A>,<A HREF="#4">4</A>]) ).

<A NAME="12"></A>cnf(12,plain,
    ( cNothing('SKOLEMAAAO4')
    | xsd_string('SKOLEMAAAO3') ),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#10">10</A>,<A HREF="#11">11</A>]) ).

<A NAME="13"></A>cnf(13,plain,
    cNothing('SKOLEMAAAO4'),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#3">3</A>,<A HREF="#12">12</A>,<A HREF="#11">11</A>]) ).

<A NAME="14"></A>cnf(14,plain,
    ~ rp('SKOLEMAAAO4',X),
    inference('UR-RESOLVE',[status(thm)],[<A HREF="#5">5</A>,<A HREF="#13">13</A>]) ).

<A NAME="15"></A>cnf(15,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('HYPERRESOLVE',[status(thm)],[<A HREF="#6">6</A>,13]),<A HREF="#14">14</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.10  % Problem  : KRS130+1 : TPTP v8.1.0. Released v3.1.0.
% 0.03/0.10  % Command  : run-snark %s %d
% 0.10/0.29  % Computer : n032.cluster.edu
% 0.10/0.29  % Model    : x86_64 x86_64
% 0.10/0.29  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.10/0.29  % Memory   : 8042.1875MB
% 0.10/0.29  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.10/0.29  % CPULimit : 300
% 0.10/0.29  % WCLimit  : 600
% 0.10/0.29  % DateTime : Tue Jun  7 15:09:20 EDT 2022
% 0.10/0.29  % CPUTime  : 
% 0.14/0.37  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.14/0.38  * 
% 0.14/0.38  * 
% 0.14/0.38  #<PACKAGE "SNARK-USER">
% 0.14/0.38  * 
% 0.14/0.38  SNARK-TPTP-OPTIONS
% 0.14/0.38  * 
% 0.14/0.39  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.14/0.39   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.14/0.39   (USE-FACTORING :POS)
% 0.14/0.39   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.14/0.39   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.14/0.39   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.14/0.39   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.14/0.39   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.14/0.39   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.14/0.39   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.14/0.39   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.14/0.39   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.14/0.39   (DECLARE-TPTP-SYMBOLS2))
% 0.14/0.39  * 
% 0.14/0.39  "."
% 0.14/0.39  * 
% 0.14/0.39  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-07T15:09:21
% 0.14/0.39  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n032.cluster.edu at 2022-06-07T15:09:21
% 0.14/0.40  
% 0.14/0.40  
% 0.14/0.40  #||
% 0.14/0.40  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.14/0.40  % SZS output start Refutation
% See solution above
% 0.14/0.40  ||#
% 0.14/0.40  
% 0.14/0.40  ; Summary of computation:
% 0.14/0.40  ;        19 formulas have been input or derived (from 12 formulas).
% 0.14/0.40  ;        15 (79%) were retained.  Of these,
% 0.14/0.40  ;            6 (40%) were simplified or subsumed later,
% 0.14/0.40  ;            9 (60%) are still being kept.
% 0.14/0.40  ; 
% 0.14/0.40  ; Run time in seconds excluding printing time:
% 0.14/0.40  ;     0.001   6%   Read assertion file          (1 call)
% 0.14/0.40  ;     0.000   0%   Assert                       (5 calls)
% 0.14/0.40  ;     0.001   6%   Process new row              (16 calls)
% 0.14/0.40  ;     0.000   0%   Resolution                   (22 calls)
% 0.14/0.40  ;     0.000   0%   Paramodulation               (11 calls)
% 0.14/0.40  ;     0.000   0%   Factoring                    (3 calls)
% 0.14/0.40  ;     0.000   0%   Condensing                   (9 calls)
% 0.14/0.40  ;     0.000   0%   Forward subsumption          (9 calls)
% 0.14/0.40  ;     0.000   0%   Backward subsumption         (8 calls)
% 0.14/0.40  ;     0.000   0%   Clause clause subsumption    (3 calls)
% 0.14/0.40  ;     0.000   0%   Forward simplification       (16 calls)
% 0.14/0.40  ;     0.000   0%   Backward simplification      (13 calls)
% 0.14/0.40  ;     0.000   0%   Ordering                     (4 calls)
% 0.14/0.40  ;     0.000   0%   Sortal reasoning             (32 calls)
% 0.14/0.40  ;     0.000   0%   Purity testing               (1 call)
% 0.14/0.40  ;     0.015  88%   Other
% 0.14/0.40  ;     0.017        Total
% 0.14/0.40  ;     0.019        Real time
% 0.14/0.40  ; 
% 0.14/0.40  ; Term-hash-array has 12 terms in all.
% 0.14/0.40  ; Feature-vector-row-index has 4 entries (6 at peak, 8 added, 4 deleted).
% 0.14/0.40  ; Feature-vector-row-index has 9 nodes (23 at peak, 31 added, 22 deleted).
% 0.14/0.40  ;  Retrieved 1 possibly forward subsuming row in 9 calls.
% 0.14/0.40  ;  Retrieved 2 possibly backward subsumed rows in 8 calls.
% 0.14/0.40  ; Path-index has 12 entries (14 at peak, 16 added, 4 deleted).
% 0.14/0.40  ; Path-index has 24 nodes (26 at peak, 28 added, 4 deleted).
% 0.14/0.40  ; Trie-index has 12 entries (14 at peak, 16 added, 4 deleted).
% 0.14/0.40  ; Trie-index has 23 nodes (24 at peak, 27 added, 4 deleted).
% 0.14/0.40  ; Retrieved 13 generalization terms in 13 calls.
% 0.14/0.40  ; Retrieved 4 instance terms in 4 calls.
% 0.14/0.40  ; Retrieved 50 unifiable terms in 44 calls.
% 0.14/0.40  ; 
% 0.14/0.40  ; The agenda of rows to give has 1 entry:
% 0.14/0.40  ;     1 with value (4 8)
% 0.14/0.40  Evaluation took:
% 0.14/0.40    0.019 seconds of real time
% 0.14/0.40    0.014217 seconds of user run time
% 0.14/0.40    0.004235 seconds of system run time
% 0.14/0.40    0 calls to %EVAL
% 0.14/0.40    0 page faults and
% 0.14/0.40    2,194,008 bytes consed.
% 0.14/0.40  :PROOF-FOUND
% 0.14/0.40  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-07T15:09:21
% 0.14/0.40  :PROOF-FOUND
% 0.14/0.40  * 
%------------------------------------------------------------------------------
