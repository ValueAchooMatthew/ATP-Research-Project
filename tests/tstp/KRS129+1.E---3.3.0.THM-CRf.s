
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : KRS129+1 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n009.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 06:39:11 PM UTC 2025

% Result   : Theorem 0.20s 0.51s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    8
%            Number of leaves      :    6
% Syntax   : Number of formulae    :   33 (   8 unt;   0 def)
%            Number of atoms       :   93 (   0 equ)
%            Maximal formula atoms :   10 (   2 avg)
%            Number of connectives :  108 (  48   ~;  39   |;  15   &)
%                                         (   6 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    8 (   7 usr;   1 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-1 aty)
%            Number of variables   :   31 (   4 sgn  18   !;   1   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="axiom_0"></A>fof(axiom_0,axiom,
    ! [X4] :
      ( cowlThing(X4)
      & ~ cowlNothing(X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="the_axiom"></A>fof(the_axiom,conjecture,
    ( ! [X4] :
        ( cowlThing(X4)
        & ~ cowlNothing(X4) )
    & ! [X4] :
        ( xsd_string(X4)
      <=> ~ xsd_integer(X4) )
    & cEuroMP(iKinnock) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="axiom_3"></A>fof(axiom_3,axiom,
    ! [X4] :
      ( cEuroMP(X4)
    <=> ? [X5] :
          ( risEuroMPFrom(X4,X5)
          & cowlThing(X5) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="axiom_1"></A>fof(axiom_1,axiom,
    ! [X4] :
      ( xsd_string(X4)
    <=> ~ xsd_integer(X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="axiom_5"></A>fof(axiom_5,axiom,
    ! [X4,X5] :
      ( risEuroMPFrom(X4,X5)
    <=> rhasEuroMP(X5,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_5) ).

<A NAME="axiom_13"></A>fof(axiom_13,axiom,
    rhasEuroMP(iUK,iKinnock),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_13) ).

<A NAME="c_0_6"></A>fof(c_0_6,plain,
    ! [X4] :
      ( cowlThing(X4)
      & ~ cowlNothing(X4) ),
    inference(fof_simplification,[status(thm)],[<A HREF="#axiom_0">axiom_0</A>]) ).

<A NAME="c_0_7"></A>fof(c_0_7,negated_conjecture,
    ~ ( ! [X4] :
          ( cowlThing(X4)
          & ~ cowlNothing(X4) )
      & ! [X4] :
          ( xsd_string(X4)
        <=> ~ xsd_integer(X4) )
      & cEuroMP(iKinnock) ),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[the_axiom])]) ).

<A NAME="c_0_8"></A>fof(c_0_8,plain,
    ! [X37,X39,X40] :
      ( ( risEuroMPFrom(X37,esk1_1(X37))
        | ~ cEuroMP(X37) )
      & ( cowlThing(esk1_1(X37))
        | ~ cEuroMP(X37) )
      & ( ~ risEuroMPFrom(X39,X40)
        | ~ cowlThing(X40)
        | cEuroMP(X39) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[axiom_3])])])])])])]) ).

<A NAME="c_0_9"></A>fof(c_0_9,plain,
    ! [X34] :
      ( cowlThing(X34)
      & ~ cowlNothing(X34) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[c_0_6])]) ).

<A NAME="c_0_10"></A>fof(c_0_10,negated_conjecture,
    ( ( ~ xsd_string(esk3_0)
      | xsd_integer(esk3_0)
      | ~ cowlThing(esk2_0)
      | cowlNothing(esk2_0)
      | ~ cEuroMP(iKinnock) )
    & ( xsd_string(esk3_0)
      | ~ xsd_integer(esk3_0)
      | ~ cowlThing(esk2_0)
      | cowlNothing(esk2_0)
      | ~ cEuroMP(iKinnock) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_7])])])])]) ).

<A NAME="c_0_11"></A>fof(c_0_11,plain,
    ! [X4] :
      ( xsd_string(X4)
    <=> ~ xsd_integer(X4) ),
    inference(fof_simplification,[status(thm)],[<A HREF="#axiom_1">axiom_1</A>]) ).

<A NAME="c_0_12"></A>cnf(c_0_12,plain,
    ( cEuroMP(X1)
    | ~ risEuroMPFrom(X1,X2)
    | ~ cowlThing(X2) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_8">c_0_8</A>]) ).

<A NAME="c_0_13"></A>cnf(c_0_13,plain,
    cowlThing(X1),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_9">c_0_9</A>]) ).

<A NAME="c_0_14"></A>fof(c_0_14,plain,
    ! [X43,X44] :
      ( ( ~ risEuroMPFrom(X43,X44)
        | rhasEuroMP(X44,X43) )
      & ( ~ rhasEuroMP(X44,X43)
        | risEuroMPFrom(X43,X44) ) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[axiom_5])])]) ).

<A NAME="c_0_15"></A>cnf(c_0_15,negated_conjecture,
    ( xsd_integer(esk3_0)
    | cowlNothing(esk2_0)
    | ~ xsd_string(esk3_0)
    | ~ cowlThing(esk2_0)
    | ~ cEuroMP(iKinnock) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_10">c_0_10</A>]) ).

<A NAME="c_0_16"></A>fof(c_0_16,plain,
    ! [X35] :
      ( ( ~ xsd_string(X35)
        | ~ xsd_integer(X35) )
      & ( xsd_integer(X35)
        | xsd_string(X35) ) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_11])])]) ).

<A NAME="c_0_17"></A>cnf(c_0_17,plain,
    ( cEuroMP(X1)
    | ~ risEuroMPFrom(X1,X2) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_12">c_0_12</A>,c_0_13])]) ).

<A NAME="c_0_18"></A>cnf(c_0_18,plain,
    ( risEuroMPFrom(X2,X1)
    | ~ rhasEuroMP(X1,X2) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_14">c_0_14</A>]) ).

<A NAME="c_0_19"></A>cnf(c_0_19,negated_conjecture,
    ( xsd_string(esk3_0)
    | cowlNothing(esk2_0)
    | ~ xsd_integer(esk3_0)
    | ~ cowlThing(esk2_0)
    | ~ cEuroMP(iKinnock) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_10">c_0_10</A>]) ).

<A NAME="c_0_20"></A>cnf(c_0_20,negated_conjecture,
    ( cowlNothing(esk2_0)
    | xsd_integer(esk3_0)
    | ~ cEuroMP(iKinnock)
    | ~ xsd_string(esk3_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_15">c_0_15</A>,c_0_13])]) ).

<A NAME="c_0_21"></A>cnf(c_0_21,plain,
    ~ cowlNothing(X1),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_9">c_0_9</A>]) ).

<A NAME="c_0_22"></A>cnf(c_0_22,plain,
    ( ~ xsd_string(X1)
    | ~ xsd_integer(X1) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_16">c_0_16</A>]) ).

<A NAME="c_0_23"></A>cnf(c_0_23,plain,
    ( cEuroMP(X1)
    | ~ rhasEuroMP(X2,X1) ),
    inference(spm,[status(thm)],[<A HREF="#c_0_17">c_0_17</A>,<A HREF="#c_0_18">c_0_18</A>]) ).

<A NAME="c_0_24"></A>cnf(c_0_24,plain,
    rhasEuroMP(iUK,iKinnock),
    inference(split_conjunct,[status(thm)],[<A HREF="#axiom_13">axiom_13</A>]) ).

<A NAME="c_0_25"></A>cnf(c_0_25,negated_conjecture,
    ( cowlNothing(esk2_0)
    | xsd_string(esk3_0)
    | ~ cEuroMP(iKinnock)
    | ~ xsd_integer(esk3_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_19">c_0_19</A>,c_0_13])]) ).

<A NAME="c_0_26"></A>cnf(c_0_26,negated_conjecture,
    ( ~ xsd_string(esk3_0)
    | ~ cEuroMP(iKinnock) ),
    inference(csr,[status(thm)],[inference(sr,[status(thm)],[<A HREF="#c_0_20">c_0_20</A>,c_0_21]),<A HREF="#c_0_22">c_0_22</A>]) ).

<A NAME="c_0_27"></A>cnf(c_0_27,plain,
    cEuroMP(iKinnock),
    inference(spm,[status(thm)],[<A HREF="#c_0_23">c_0_23</A>,<A HREF="#c_0_24">c_0_24</A>]) ).

<A NAME="c_0_28"></A>cnf(c_0_28,negated_conjecture,
    ( ~ xsd_integer(esk3_0)
    | ~ cEuroMP(iKinnock) ),
    inference(csr,[status(thm)],[inference(sr,[status(thm)],[<A HREF="#c_0_25">c_0_25</A>,c_0_21]),<A HREF="#c_0_22">c_0_22</A>]) ).

<A NAME="c_0_29"></A>cnf(c_0_29,negated_conjecture,
    ~ xsd_string(esk3_0),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_26">c_0_26</A>,c_0_27])]) ).

<A NAME="c_0_30"></A>cnf(c_0_30,plain,
    ( xsd_integer(X1)
    | xsd_string(X1) ),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_16">c_0_16</A>]) ).

<A NAME="c_0_31"></A>cnf(c_0_31,negated_conjecture,
    ~ xsd_integer(esk3_0),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[<A HREF="#c_0_28">c_0_28</A>,c_0_27])]) ).

<A NAME="c_0_32"></A>cnf(c_0_32,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[<A HREF="#c_0_29">c_0_29</A>,c_0_30]),<A HREF="#c_0_31">c_0_31</A>]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.12  % Problem    : KRS129+1 : TPTP v9.2.0. Released v3.1.0.
% 0.06/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.13/0.34  % Computer : n009.cluster.edu
% 0.13/0.34  % Model    : x86_64 x86_64
% 0.13/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.34  % Memory   : 8042.1875MB
% 0.13/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit   : 300
% 0.13/0.34  % WCLimit    : 300
% 0.13/0.34  % DateTime   : Fri Sep 26 11:14:53 EDT 2025
% 0.13/0.34  % CPUTime    : 
% 0.20/0.49  Running first-order theorem proving
% 0.20/0.49  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.51  # Version: 3.0.0
% 0.20/0.51  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.51  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.51  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.51  # Starting sh5l with 300s (1) cores
% 0.20/0.51  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 1729 completed with status 0
% 0.20/0.51  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.20/0.51  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.51  # No SInE strategy applied
% 0.20/0.51  # Search class: FGHSF-FFSM11-SFFFFFNN
% 0.20/0.51  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.20/0.51  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 151s (1) cores
% 0.20/0.51  # Starting new_bool_3 with 136s (1) cores
% 0.20/0.51  # Starting new_bool_1 with 136s (1) cores
% 0.20/0.51  # Starting sh5l with 136s (1) cores
% 0.20/0.51  # SAT001_MinMin_p005000_rr_RG with pid 1734 completed with status 0
% 0.20/0.51  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.20/0.51  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.51  # No SInE strategy applied
% 0.20/0.51  # Search class: FGHSF-FFSM11-SFFFFFNN
% 0.20/0.51  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.20/0.51  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.20/0.51  # Preprocessing time       : 0.001 s
% 0.20/0.51  # Presaturation interreduction done
% 0.20/0.51  
% 0.20/0.51  # Proof found!
% 0.20/0.51  # SZS status Theorem
% 0.20/0.51  # SZS output start CNFRefutation
% See solution above
% 0.20/0.51  # Parsed axioms                        : 27
% 0.20/0.51  # Removed by relevancy pruning/SinE    : 0
% 0.20/0.51  # Initial clauses                      : 39
% 0.20/0.51  # Removed in clause preprocessing      : 14
% 0.20/0.51  # Initial clauses in saturation        : 25
% 0.20/0.51  # Processed clauses                    : 60
% 0.20/0.51  # ...of these trivial                  : 0
% 0.20/0.51  # ...subsumed                          : 0
% 0.20/0.51  # ...remaining for further processing  : 60
% 0.20/0.51  # Other redundant clauses eliminated   : 6
% 0.20/0.51  # Clauses deleted for lack of memory   : 0
% 0.20/0.51  # Backward-subsumed                    : 0
% 0.20/0.51  # Backward-rewritten                   : 2
% 0.20/0.51  # Generated clauses                    : 14
% 0.20/0.51  # ...of the previous two non-redundant : 11
% 0.20/0.51  # ...aggressively subsumed             : 0
% 0.20/0.51  # Contextual simplify-reflections      : 2
% 0.20/0.51  # Paramodulations                      : 8
% 0.20/0.51  # Factorizations                       : 0
% 0.20/0.51  # NegExts                              : 0
% 0.20/0.51  # Equation resolutions                 : 6
% 0.20/0.51  # Disequality decompositions           : 0
% 0.20/0.51  # Total rewrite steps                  : 3
% 0.20/0.51  # ...of those cached                   : 1
% 0.20/0.51  # Propositional unsat checks           : 0
% 0.20/0.51  #    Propositional check models        : 0
% 0.20/0.51  #    Propositional check unsatisfiable : 0
% 0.20/0.51  #    Propositional clauses             : 0
% 0.20/0.51  #    Propositional clauses after purity: 0
% 0.20/0.51  #    Propositional unsat core size     : 0
% 0.20/0.51  #    Propositional preprocessing time  : 0.000
% 0.20/0.51  #    Propositional encoding time       : 0.000
% 0.20/0.51  #    Propositional solver time         : 0.000
% 0.20/0.51  #    Success case prop preproc time    : 0.000
% 0.20/0.51  #    Success case prop encoding time   : 0.000
% 0.20/0.51  #    Success case prop solver time     : 0.000
% 0.20/0.51  # Current number of processed clauses  : 27
% 0.20/0.51  #    Positive orientable unit clauses  : 15
% 0.20/0.51  #    Positive unorientable unit clauses: 0
% 0.20/0.51  #    Negative unit clauses             : 3
% 0.20/0.51  #    Non-unit-clauses                  : 9
% 0.20/0.51  # Current number of unprocessed clauses: 1
% 0.20/0.51  # ...number of literals in the above   : 2
% 0.20/0.51  # Current number of archived formulas  : 0
% 0.20/0.51  # Current number of archived clauses   : 28
% 0.20/0.51  # Clause-clause subsumption calls (NU) : 39
% 0.20/0.51  # Rec. Clause-clause subsumption calls : 31
% 0.20/0.51  # Non-unit clause-clause subsumptions  : 2
% 0.20/0.51  # Unit Clause-clause subsumption calls : 25
% 0.20/0.51  # Rewrite failures with RHS unbound    : 0
% 0.20/0.51  # BW rewrite match attempts            : 1
% 0.20/0.51  # BW rewrite match successes           : 1
% 0.20/0.51  # Condensation attempts                : 0
% 0.20/0.51  # Condensation successes               : 0
% 0.20/0.51  # Termbank termtop insertions          : 2209
% 0.20/0.51  # Search garbage collected termcells   : 467
% 0.20/0.51  
% 0.20/0.51  # -------------------------------------------------
% 0.20/0.51  # User time                : 0.008 s
% 0.20/0.51  # System time              : 0.001 s
% 0.20/0.51  # Total time               : 0.009 s
% 0.20/0.51  # Maximum resident set size: 1808 pages
% 0.20/0.51  
% 0.20/0.51  # -------------------------------------------------
% 0.20/0.51  # User time                : 0.021 s
% 0.20/0.51  # System time              : 0.007 s
% 0.20/0.51  # Total time               : 0.027 s
% 0.20/0.51  # Maximum resident set size: 1724 pages
% 0.20/0.51  % E exiting
% 0.20/0.51  % E exiting
%------------------------------------------------------------------------------
