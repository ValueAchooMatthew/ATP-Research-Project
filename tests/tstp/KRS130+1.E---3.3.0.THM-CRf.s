
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : KRS130+1 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n002.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 06:39:11 PM UTC 2025

% Result   : Theorem 0.19s 0.47s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    7
%            Number of leaves      :    5
% Syntax   : Number of formulae    :   28 (   6 unt;   0 def)
%            Number of atoms       :   91 (   0 equ)
%            Maximal formula atoms :   24 (   3 avg)
%            Number of connectives :  104 (  41   ~;  42   |;  13   &)
%                                         (   6 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    7 (   6 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-1 aty)
%            Number of variables   :   27 (   4 sgn  17   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="the_axiom"></A>fof(the_axiom,conjecture,
    ( ! [X1] :
        ( cowlThing(X1)
        & ~ cowlNothing(X1) )
    & ! [X1] :
        ( xsd_string(X1)
      <=> ~ xsd_integer(X1) )
    & ! [X1] :
        ( cNothing(X1)
      <=> cowlNothing(X1) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="axiom_0"></A>fof(axiom_0,axiom,
    ! [X1] :
      ( cowlThing(X1)
      & ~ cowlNothing(X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="axiom_1"></A>fof(axiom_1,axiom,
    ! [X1] :
      ( xsd_string(X1)
    <=> ~ xsd_integer(X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="axiom_2"></A>fof(axiom_2,axiom,
    ! [X1] :
      ( cNothing(X1)
     => ~ ? [X2] : rp(X1,X2) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_2) ).

<A NAME="axiom_3"></A>fof(axiom_3,axiom,
    ! [X1] :
      ( cNothing(X1)
     => ? [X3] : rp(X1,X3) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="c_0_5"></A>fof(c_0_5,negated_conjecture,
    ~ ( ! [X1] :
          ( cowlThing(X1)
          & ~ cowlNothing(X1) )
      & ! [X1] :
          ( xsd_string(X1)
        <=> ~ xsd_integer(X1) )
      & ! [X1] :
          ( cNothing(X1)
        <=> cowlNothing(X1) ) ),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[the_axiom])]) ).

<A NAME="c_0_6"></A>fof(c_0_6,plain,
    ! [X1] :
      ( cowlThing(X1)
      & ~ cowlNothing(X1) ),
    inference(fof_simplification,[status(thm)],[<A HREF="#axiom_0">axiom_0</A>]) ).

<A NAME="c_0_7"></A>fof(c_0_7,plain,
    ! [X1] :
      ( xsd_string(X1)
    <=> ~ xsd_integer(X1) ),
    inference(fof_simplification,[status(thm)],[<A HREF="#axiom_1">axiom_1</A>]) ).

<A NAME="c_0_8"></A>fof(c_0_8,negated_conjecture,
    ( ( ~ cNothing(esk3_0)
      | ~ cowlNothing(esk3_0)
      | ~ xsd_string(esk2_0)
      | xsd_integer(esk2_0)
      | ~ cowlThing(esk1_0)
      | cowlNothing(esk1_0) )
    & ( cNothing(esk3_0)
      | cowlNothing(esk3_0)
      | ~ xsd_string(esk2_0)
      | xsd_integer(esk2_0)
      | ~ cowlThing(esk1_0)
      | cowlNothing(esk1_0) )
    & ( ~ cNothing(esk3_0)
      | ~ cowlNothing(esk3_0)
      | xsd_string(esk2_0)
      | ~ xsd_integer(esk2_0)
      | ~ cowlThing(esk1_0)
      | cowlNothing(esk1_0) )
    & ( cNothing(esk3_0)
      | cowlNothing(esk3_0)
      | xsd_string(esk2_0)
      | ~ xsd_integer(esk2_0)
      | ~ cowlThing(esk1_0)
      | cowlNothing(esk1_0) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])])])]) ).

<A NAME="c_0_9"></A>fof(c_0_9,plain,
    ! [X7] :
      ( cowlThing(X7)
      & ~ cowlNothing(X7) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[c_0_6])]) ).

<A NAME="c_0_10"></A>fof(c_0_10,plain,
    ! [X12] :
      ( ( ~ xsd_string(X12)
        | ~ xsd_integer(X12) )
      & ( xsd_integer(X12)
        | xsd_string(X12) ) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_7])])]) ).

<A NAME="c_0_11"></A>fof(c_0_11,plain,
    ! [X8,X9] :
      ( ~ cNothing(X8)
      | ~ rp(X8,X9) ),
    inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[axiom_2])])])]) ).

<A NAME="c_0_12"></A>fof(c_0_12,plain,
    ! [X10] :
      ( ~ cNothing(X10)
      | rp(X10,esk4_1(X10)) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[axiom_3])])])]) ).

<A NAME="c_0_13"></A>cnf(c_0_13,negated_conjecture,
    ( cNothing(esk3_0)
    | cowlNothing(esk3_0)
    | xsd_integer(esk2_0)
    | cowlNothing(esk1_0)
    | ~ xsd_string(esk2_0)
    | ~ cowlThing(esk1_0) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_8">c_0_8</A>]) ).

<A NAME="c_0_14"></A>cnf(c_0_14,plain,
    cowlThing(X1),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_9">c_0_9</A>]) ).

<A NAME="c_0_15"></A>cnf(c_0_15,plain,
    ~ cowlNothing(X1),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_9">c_0_9</A>]) ).

<A NAME="c_0_16"></A>cnf(c_0_16,plain,
    ( xsd_integer(X1)
    | xsd_string(X1) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_10">c_0_10</A>]) ).

<A NAME="c_0_17"></A>cnf(c_0_17,plain,
    ( ~ cNothing(X1)
    | ~ rp(X1,X2) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_11">c_0_11</A>]) ).

<A NAME="c_0_18"></A>cnf(c_0_18,plain,
    ( rp(X1,esk4_1(X1))
    | ~ cNothing(X1) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_12">c_0_12</A>]) ).

<A NAME="c_0_19"></A>cnf(c_0_19,negated_conjecture,
    ( cNothing(esk3_0)
    | cowlNothing(esk3_0)
    | xsd_string(esk2_0)
    | cowlNothing(esk1_0)
    | ~ xsd_integer(esk2_0)
    | ~ cowlThing(esk1_0) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_8">c_0_8</A>]) ).

<A NAME="c_0_20"></A>cnf(c_0_20,negated_conjecture,
    ( cNothing(esk3_0)
    | xsd_integer(esk2_0) ),
    inference(csr,[status(thm)],[inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_13">c_0_13</A>,c_0_14])]),c_0_15]),c_0_15]),<A HREF="#c_0_16">c_0_16</A>]) ).

<A NAME="c_0_21"></A>cnf(c_0_21,plain,
    ~ cNothing(X1),
    inference(spm,[status(thm)],[<A HREF="#c_0_17">c_0_17</A>,<A HREF="#c_0_18">c_0_18</A>]) ).

<A NAME="c_0_22"></A>cnf(c_0_22,negated_conjecture,
    ( cNothing(esk3_0)
    | xsd_string(esk2_0)
    | ~ xsd_integer(esk2_0) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_19">c_0_19</A>,c_0_14])]),c_0_15]),<A HREF="#c_0_15">c_0_15</A>]) ).

<A NAME="c_0_23"></A>cnf(c_0_23,plain,
    ( ~ xsd_string(X1)
    | ~ xsd_integer(X1) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_10">c_0_10</A>]) ).

<A NAME="c_0_24"></A>cnf(c_0_24,negated_conjecture,
    xsd_integer(esk2_0),
    inference(sr,[status(thm)],[<A HREF="#c_0_20">c_0_20</A>,<A HREF="#c_0_21">c_0_21</A>]) ).

<A NAME="c_0_25"></A>cnf(c_0_25,negated_conjecture,
    ( cNothing(esk3_0)
    | xsd_string(esk2_0) ),
    inference(csr,[status(thm)],[<A HREF="#c_0_22">c_0_22</A>,<A HREF="#c_0_20">c_0_20</A>]) ).

<A NAME="c_0_26"></A>cnf(c_0_26,negated_conjecture,
    ~ xsd_string(esk2_0),
    inference(spm,[status(thm)],[<A HREF="#c_0_23">c_0_23</A>,<A HREF="#c_0_24">c_0_24</A>]) ).

<A NAME="c_0_27"></A>cnf(c_0_27,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[<A HREF="#c_0_25">c_0_25</A>,c_0_21]),<A HREF="#c_0_26">c_0_26</A>]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.11  % Problem    : KRS130+1 : TPTP v9.2.0. Released v3.1.0.
% 0.06/0.11  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.12/0.32  % Computer : n002.cluster.edu
% 0.12/0.32  % Model    : x86_64 x86_64
% 0.12/0.32  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.32  % Memory   : 8042.1875MB
% 0.12/0.32  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.32  % CPULimit   : 300
% 0.12/0.32  % WCLimit    : 300
% 0.12/0.32  % DateTime   : Fri Sep 26 11:08:53 EDT 2025
% 0.12/0.32  % CPUTime    : 
% 0.19/0.46  Running first-order theorem proving
% 0.19/0.46  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.47  # Version: 3.0.0
% 0.19/0.47  # Preprocessing class: FSSSSMSSSSSNFFN.
% 0.19/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.47  # Starting G-E--_302_C18_F1_URBAN_RG_S04BN with 1500s (5) cores
% 0.19/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.47  # Starting new_bool_1 with 300s (1) cores
% 0.19/0.47  # Starting sh5l with 300s (1) cores
% 0.19/0.47  # new_bool_3 with pid 12576 completed with status 0
% 0.19/0.47  # Result found by new_bool_3
% 0.19/0.47  # Preprocessing class: FSSSSMSSSSSNFFN.
% 0.19/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.47  # Starting G-E--_302_C18_F1_URBAN_RG_S04BN with 1500s (5) cores
% 0.19/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.47  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.47  # Search class: FGHNF-FFSF11-SFFFFFNN
% 0.19/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.47  # SAT001_MinMin_p005000_rr_RG with pid 12579 completed with status 0
% 0.19/0.47  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.19/0.47  # Preprocessing class: FSSSSMSSSSSNFFN.
% 0.19/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.47  # Starting G-E--_302_C18_F1_URBAN_RG_S04BN with 1500s (5) cores
% 0.19/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.47  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.47  # Search class: FGHNF-FFSF11-SFFFFFNN
% 0.19/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.47  # Preprocessing time       : 0.001 s
% 0.19/0.47  # Presaturation interreduction done
% 0.19/0.47  
% 0.19/0.47  # Proof found!
% 0.19/0.47  # SZS status Theorem
% 0.19/0.47  # SZS output start CNFRefutation
% See solution above
% 0.19/0.47  # Parsed axioms                        : 5
% 0.19/0.47  # Removed by relevancy pruning/SinE    : 0
% 0.19/0.47  # Initial clauses                      : 10
% 0.19/0.47  # Removed in clause preprocessing      : 0
% 0.19/0.47  # Initial clauses in saturation        : 10
% 0.19/0.47  # Processed clauses                    : 22
% 0.19/0.47  # ...of these trivial                  : 0
% 0.19/0.47  # ...subsumed                          : 2
% 0.19/0.47  # ...remaining for further processing  : 19
% 0.19/0.47  # Other redundant clauses eliminated   : 0
% 0.19/0.47  # Clauses deleted for lack of memory   : 0
% 0.19/0.47  # Backward-subsumed                    : 2
% 0.19/0.47  # Backward-rewritten                   : 0
% 0.19/0.47  # Generated clauses                    : 5
% 0.19/0.47  # ...of the previous two non-redundant : 4
% 0.19/0.47  # ...aggressively subsumed             : 0
% 0.19/0.47  # Contextual simplify-reflections      : 2
% 0.19/0.47  # Paramodulations                      : 3
% 0.19/0.47  # Factorizations                       : 0
% 0.19/0.47  # NegExts                              : 0
% 0.19/0.47  # Equation resolutions                 : 0
% 0.19/0.47  # Disequality decompositions           : 0
% 0.19/0.47  # Total rewrite steps                  : 4
% 0.19/0.47  # ...of those cached                   : 3
% 0.19/0.47  # Propositional unsat checks           : 0
% 0.19/0.47  #    Propositional check models        : 0
% 0.19/0.47  #    Propositional check unsatisfiable : 0
% 0.19/0.47  #    Propositional clauses             : 0
% 0.19/0.47  #    Propositional clauses after purity: 0
% 0.19/0.47  #    Propositional unsat core size     : 0
% 0.19/0.47  #    Propositional preprocessing time  : 0.000
% 0.19/0.47  #    Propositional encoding time       : 0.000
% 0.19/0.47  #    Propositional solver time         : 0.000
% 0.19/0.47  #    Success case prop preproc time    : 0.000
% 0.19/0.47  #    Success case prop encoding time   : 0.000
% 0.19/0.47  #    Success case prop solver time     : 0.000
% 0.19/0.47  # Current number of processed clauses  : 7
% 0.19/0.47  #    Positive orientable unit clauses  : 2
% 0.19/0.47  #    Positive unorientable unit clauses: 0
% 0.19/0.47  #    Negative unit clauses             : 3
% 0.19/0.47  #    Non-unit-clauses                  : 2
% 0.19/0.47  # Current number of unprocessed clauses: 0
% 0.19/0.47  # ...number of literals in the above   : 0
% 0.19/0.47  # Current number of archived formulas  : 0
% 0.19/0.47  # Current number of archived clauses   : 12
% 0.19/0.47  # Clause-clause subsumption calls (NU) : 5
% 0.19/0.47  # Rec. Clause-clause subsumption calls : 2
% 0.19/0.47  # Non-unit clause-clause subsumptions  : 2
% 0.19/0.47  # Unit Clause-clause subsumption calls : 2
% 0.19/0.47  # Rewrite failures with RHS unbound    : 0
% 0.19/0.47  # BW rewrite match attempts            : 0
% 0.19/0.47  # BW rewrite match successes           : 0
% 0.19/0.47  # Condensation attempts                : 0
% 0.19/0.47  # Condensation successes               : 0
% 0.19/0.47  # Termbank termtop insertions          : 760
% 0.19/0.47  # Search garbage collected termcells   : 161
% 0.19/0.47  
% 0.19/0.47  # -------------------------------------------------
% 0.19/0.47  # User time                : 0.004 s
% 0.19/0.47  # System time              : 0.002 s
% 0.19/0.47  # Total time               : 0.006 s
% 0.19/0.47  # Maximum resident set size: 1736 pages
% 0.19/0.47  
% 0.19/0.47  # -------------------------------------------------
% 0.19/0.47  # User time                : 0.006 s
% 0.19/0.47  # System time              : 0.003 s
% 0.19/0.47  # Total time               : 0.009 s
% 0.19/0.47  # Maximum resident set size: 1696 pages
% 0.19/0.47  % E exiting
% 0.19/0.48  % E exiting
%------------------------------------------------------------------------------
