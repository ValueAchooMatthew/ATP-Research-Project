
%------------------------------------------------------------------------------
% File     : SNARK---20120808r022
% Problem  : KRS129+1 : TPTP v8.1.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run-snark %s %d

% Computer : n017.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 600s
% DateTime : Sun Jul 17 03:28:39 EDT 2022

% Result   : Theorem 0.19s 0.51s
% Output   : Refutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    6
%            Number of leaves      :    9
% Syntax   : Number of clauses     :   19 (   8 unt;   3 nHn;  17 RR)
%            Number of literals    :   39 (   0 equ;  19 neg)
%            Maximal clause size   :    5 (   2 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    8 (   7 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   4 con; 0-0 aty)
%            Number of variables   :   10 (   3 sgn)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="13"></A>cnf(13,axiom,
    cowlThing(X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="14"></A>cnf(14,axiom,
    ~ cowlNothing(X),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="15"></A>cnf(15,axiom,
    ( ~ xsd_string(X)
    | ~ xsd_integer(X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="16"></A>cnf(16,axiom,
    ( xsd_string(X)
    | xsd_integer(X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="25"></A>cnf(25,axiom,
    ( cEuroMP(X)
    | ~ risEuroMPFrom(X,Y)
    | ~ cowlThing(Y) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="26"></A>cnf(26,plain,
    ( cEuroMP(X)
    | ~ risEuroMPFrom(X,Y) ),
    inference('REWRITE',[status(thm)],[<A HREF="#25">25</A>,<A HREF="#13">13</A>]) ).

<A NAME="29"></A>cnf(29,axiom,
    ( risEuroMPFrom(X,Y)
    | ~ rhasEuroMP(Y,X) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_5) ).

<A NAME="37"></A>cnf(37,axiom,
    rhasEuroMP(iUK,iKinnock),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_13) ).

<A NAME="38"></A>cnf(38,negated_conjecture,
    ( ~ cowlThing('SKOLEMAAAV2')
    | cowlNothing('SKOLEMAAAV2')
    | ~ xsd_string('SKOLEMAAAV3')
    | xsd_integer('SKOLEMAAAV3')
    | ~ cEuroMP(iKinnock) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="39"></A>cnf(39,plain,
    ( ~ xsd_string('SKOLEMAAAV3')
    | xsd_integer('SKOLEMAAAV3')
    | ~ cEuroMP(iKinnock) ),
    inference('REWRITE',[status(thm)],[<A HREF="#38">38</A>,<A HREF="#14">14</A>,<A HREF="#13">13</A>]) ).

<A NAME="40"></A>cnf(40,negated_conjecture,
    ( ~ cowlThing('SKOLEMAAAV2')
    | cowlNothing('SKOLEMAAAV2')
    | xsd_string('SKOLEMAAAV3')
    | ~ xsd_integer('SKOLEMAAAV3')
    | ~ cEuroMP(iKinnock) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="41"></A>cnf(41,plain,
    ( xsd_string('SKOLEMAAAV3')
    | ~ xsd_integer('SKOLEMAAAV3')
    | ~ cEuroMP(iKinnock) ),
    inference('REWRITE',[status(thm)],[<A HREF="#40">40</A>,<A HREF="#14">14</A>,<A HREF="#13">13</A>]) ).

<A NAME="48"></A>cnf(48,plain,
    risEuroMPFrom(iKinnock,iUK),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#29">29</A>,<A HREF="#37">37</A>]) ).

<A NAME="49"></A>cnf(49,plain,
    cEuroMP(iKinnock),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#26">26</A>,<A HREF="#48">48</A>]) ).

<A NAME="50"></A>cnf(50,plain,
    ( ~ xsd_string('SKOLEMAAAV3')
    | xsd_integer('SKOLEMAAAV3') ),
    inference('REWRITE',[status(thm)],[<A HREF="#39">39</A>,<A HREF="#49">49</A>]) ).

<A NAME="51"></A>cnf(51,plain,
    ( xsd_string('SKOLEMAAAV3')
    | ~ xsd_integer('SKOLEMAAAV3') ),
    inference('REWRITE',[status(thm)],[<A HREF="#41">41</A>,<A HREF="#49">49</A>]) ).

<A NAME="52"></A>cnf(52,plain,
    xsd_integer('SKOLEMAAAV3'),
    inference('HYPERRESOLVE',[status(thm)],[<A HREF="#50">50</A>,<A HREF="#16">16</A>]) ).

<A NAME="53"></A>cnf(53,plain,
    xsd_string('SKOLEMAAAV3'),
    inference('REWRITE',[status(thm)],[<A HREF="#51">51</A>,<A HREF="#52">52</A>]) ).

<A NAME="54"></A>cnf(54,plain,
    $false,
    inference('REWRITE',[status(thm)],[inference('UR-RESOLVE',[status(thm)],[<A HREF="#15">15</A>,53]),<A HREF="#52">52</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.12  % Problem  : KRS129+1 : TPTP v8.1.0. Released v3.1.0.
% 0.03/0.13  % Command  : run-snark %s %d
% 0.13/0.34  % Computer : n017.cluster.edu
% 0.13/0.34  % Model    : x86_64 x86_64
% 0.13/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.34  % Memory   : 8042.1875MB
% 0.13/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit : 300
% 0.13/0.34  % WCLimit  : 600
% 0.13/0.34  % DateTime : Tue Jun  7 15:05:47 EDT 2022
% 0.13/0.34  % CPUTime  : 
% 0.19/0.45  /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.19/0.46  * 
% 0.19/0.46  * 
% 0.19/0.47  #<PACKAGE "SNARK-USER">
% 0.19/0.47  * 
% 0.19/0.47  SNARK-TPTP-OPTIONS
% 0.19/0.47  * 
% 0.19/0.47  ((AGENDA-LENGTH-LIMIT NIL) (AGENDA-LENGTH-BEFORE-SIMPLIFICATION-LIMIT NIL)
% 0.19/0.47   (USE-HYPERRESOLUTION T) (USE-UR-RESOLUTION T) (USE-PARAMODULATION T)
% 0.19/0.47   (USE-FACTORING :POS)
% 0.19/0.47   (USE-LITERAL-ORDERING-WITH-HYPERRESOLUTION 'LITERAL-ORDERING-P)
% 0.19/0.47   (USE-LITERAL-ORDERING-WITH-PARAMODULATION 'LITERAL-ORDERING-P)
% 0.19/0.47   (ORDERING-FUNCTIONS>CONSTANTS T) (ASSERT-CONTEXT :CURRENT)
% 0.19/0.47   (RUN-TIME-LIMIT 300) (LISTEN-FOR-COMMANDS NIL)
% 0.19/0.47   (USE-CLOSURE-WHEN-SATISFIABLE T) (PRINT-ROWS-WHEN-GIVEN NIL)
% 0.19/0.47   (PRINT-ROWS-WHEN-DERIVED NIL) (PRINT-UNORIENTABLE-ROWS NIL)
% 0.19/0.47   (PRINT-ROW-WFFS-PRETTILY NIL) (PRINT-FINAL-ROWS :TPTP)
% 0.19/0.47   (PRINT-OPTIONS-WHEN-STARTING NIL) (USE-VARIABLE-NAME-SORTS NIL)
% 0.19/0.47   (USE-PURITY-TEST T) (USE-RELEVANCE-TEST T) (DECLARE-TPTP-SYMBOLS1)
% 0.19/0.47   (DECLARE-TPTP-SYMBOLS2))
% 0.19/0.47  * 
% 0.19/0.47  "."
% 0.19/0.47  * 
% 0.19/0.47  ; Begin refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-07T15:05:47
% 0.19/0.47  ; Running SNARK from /davis/home/graph/tptp/Systems/SNARK---20120808r022/Source/snark-system.lisp in SBCL 1.0.12 on n017.cluster.edu at 2022-06-07T15:05:47
% 0.19/0.51  
% 0.19/0.51  
% 0.19/0.51  #||
% 0.19/0.51  % SZS status Theorem for /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.19/0.51  % SZS output start Refutation
% See solution above
% 0.19/0.51  ||#
% 0.19/0.51  
% 0.19/0.51  ; Summary of computation:
% 0.19/0.51  ;       111 formulas have been input or derived (from 46 formulas).
% 0.19/0.51  ;        54 (49%) were retained.  Of these,
% 0.19/0.51  ;            9 (17%) were simplified or subsumed later,
% 0.19/0.51  ;           45 (83%) are still being kept.
% 0.19/0.51  ; 
% 0.19/0.51  ; Run time in seconds excluding printing time:
% 0.19/0.51  ;     0.004  11%   Read assertion file          (1 call)
% 0.19/0.51  ;     0.001   3%   Assert                       (27 calls)
% 0.19/0.51  ;     0.002   5%   Process new row              (87 calls)
% 0.19/0.51  ;     0.003   8%   Resolution                   (90 calls)
% 0.19/0.51  ;     0.000   0%   Paramodulation               (45 calls)
% 0.19/0.51  ;     0.000   0%   Factoring                    (1 call)
% 0.19/0.51  ;     0.000   0%   Condensing                   (31 calls)
% 0.19/0.51  ;     0.000   0%   Forward subsumption          (31 calls)
% 0.19/0.51  ;     0.000   0%   Backward subsumption         (30 calls)
% 0.19/0.51  ;     0.000   0%   Clause clause subsumption    (5 calls)
% 0.19/0.51  ;     0.000   0%   Forward simplification       (87 calls)
% 0.19/0.51  ;     0.000   0%   Backward simplification      (51 calls)
% 0.19/0.51  ;     0.000   0%   Ordering                     (7 calls)
% 0.19/0.51  ;     0.001   3%   Sortal reasoning             (32 calls)
% 0.19/0.51  ;     0.000   0%   Purity testing               (1 call)
% 0.19/0.51  ;     0.026  70%   Other
% 0.19/0.51  ;     0.037        Total
% 0.19/0.51  ;     0.040        Real time
% 0.19/0.51  ; 
% 0.19/0.51  ; Term-hash-array has 54 terms in all.
% 0.19/0.51  ; Feature-vector-row-index has 24 entries (26 at peak, 30 added, 6 deleted).
% 0.19/0.51  ; Feature-vector-row-index has 51 nodes (65 at peak, 81 added, 30 deleted).
% 0.19/0.51  ;  Retrieved 3 possibly forward subsuming rows in 31 calls.
% 0.19/0.51  ;  Retrieved 2 possibly backward subsumed rows in 30 calls.
% 0.19/0.51  ; Path-index has 61 entries (61 at peak, 67 added, 6 deleted).
% 0.19/0.51  ; Path-index has 68 nodes (68 at peak, 72 added, 4 deleted).
% 0.19/0.51  ; Trie-index has 61 entries (61 at peak, 67 added, 6 deleted).
% 0.19/0.51  ; Trie-index has 65 nodes (65 at peak, 69 added, 4 deleted).
% 0.19/0.51  ; Retrieved 35 generalization terms in 45 calls.
% 0.19/0.51  ; Retrieved 22 instance terms in 20 calls.
% 0.19/0.51  ; Retrieved 800 unifiable terms in 267 calls.
% 0.19/0.51  ; 
% 0.19/0.51  ; The agenda of rows to process has 1 entry:
% 0.19/0.51  ;     1 with value 4
% 0.19/0.51  ; The agenda of rows to give has 2 entries:
% 0.19/0.51  ;     1 with value (4 4)           1 with value (4 5)
% 0.19/0.51  Evaluation took:
% 0.19/0.51    0.041 seconds of real time
% 0.19/0.51    0.034524 seconds of user run time
% 0.19/0.51    0.005674 seconds of system run time
% 0.19/0.51    0 calls to %EVAL
% 0.19/0.51    0 page faults and
% 0.19/0.51    2,759,504 bytes consed.
% 0.19/0.51  :PROOF-FOUND
% 0.19/0.51  ; End refute-file /export/starexec/sandbox2/benchmark/theBenchmark.p 2022-06-07T15:05:47
% 0.19/0.51  :PROOF-FOUND
% 0.19/0.51  * 
%------------------------------------------------------------------------------
