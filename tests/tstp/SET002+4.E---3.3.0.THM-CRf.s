
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : SET002+4 : TPTP v9.2.0. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n001.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 08:43:41 PM UTC 2025

% Result   : Theorem 0.20s 0.50s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    6
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   23 (   8 unt;   0 def)
%            Number of atoms       :   59 (   0 equ)
%            Maximal formula atoms :    7 (   2 avg)
%            Number of connectives :   58 (  22   ~;  25   |;   7   &)
%                                         (   3 ;   1  =>;   0  )
%            Maximal formula depth :   10 (   4 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   43 (   2 sgn  20   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(thI14,conjecture,
    ! [X1] : equal_set(union(X1,X1),X1),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',thI14) ).

fof(subset,axiom,
    ! [X1,X2] :
      ( subset(X1,X2)
     ! [X3] :
          ( member(X3,X1)
         => member(X3,X2) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/SET006+0.ax',subset) ).

fof(union,axiom,
    ! [X3,X1,X2] :
      ( member(X3,union(X1,X2))
     ( member(X3,X1)
        | member(X3,X2) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/SET006+0.ax',union) ).

fof(equal_set,axiom,
    ! [X1,X2] :
      ( equal_set(X1,X2)
     ( subset(X1,X2)
        & subset(X2,X1) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/SET006+0.ax',equal_set) ).

fof(c_0_4,negated_conjecture,
    ~ ! [X1] : equal_set(union(X1,X1),X1),
    inference(assume_negation,[status(cth)],[thI14]) ).

fof(c_0_5,plain,
    ! [X12,X13,X14,X15,X16] :
      ( ( ~ subset(X12,X13)
        | ~ member(X14,X12)
        | member(X14,X13) )
      & ( member(esk2_2(X15,X16),X15)
        | subset(X15,X16) )
      & ( ~ member(esk2_2(X15,X16),X16)
        | subset(X15,X16) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[subset])])])])])])]) ).

fof(c_0_6,plain,
    ! [X9,X10,X11] :
      ( ( ~ member(X9,union(X10,X11))
        | member(X9,X10)
        | member(X9,X11) )
      & ( ~ member(X9,X10)
        | member(X9,union(X10,X11)) )
      & ( ~ member(X9,X11)
        | member(X9,union(X10,X11)) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[union])])])]) ).

fof(c_0_7,negated_conjecture,
    ~ equal_set(union(esk1_0,esk1_0),esk1_0),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_4])])])]) ).

fof(c_0_8,plain,
    ! [X7,X8] :
      ( ( subset(X7,X8)
        | ~ equal_set(X7,X8) )
      & ( subset(X8,X7)
        | ~ equal_set(X7,X8) )
      & ( ~ subset(X7,X8)
        | ~ subset(X8,X7)
        | equal_set(X7,X8) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[equal_set])])])]) ).

cnf(c_0_9,plain,
    ( subset(X1,X2)
    | ~ member(esk2_2(X1,X2),X2) ),
    inference(split_conjunct,[status(thm)],[c_0_5]) ).

cnf(c_0_10,plain,
    ( member(X1,union(X3,X2))
    | ~ member(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_11,plain,
    ( member(X1,X2)
    | member(X1,X3)
    | ~ member(X1,union(X2,X3)) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_12,plain,
    ( member(esk2_2(X1,X2),X1)
    | subset(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_5]) ).

cnf(c_0_13,negated_conjecture,
    ~ equal_set(union(esk1_0,esk1_0),esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_14,plain,
    ( equal_set(X1,X2)
    | ~ subset(X1,X2)
    | ~ subset(X2,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_15,plain,
    ( subset(X1,union(X2,X3))
    | ~ member(esk2_2(X1,union(X2,X3)),X3) ),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).

cnf(c_0_16,plain,
    ( member(esk2_2(union(X1,X2),X3),X1)
    | member(esk2_2(union(X1,X2),X3),X2)
    | subset(union(X1,X2),X3) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).

cnf(c_0_17,negated_conjecture,
    ( ~ subset(esk1_0,union(esk1_0,esk1_0))
    | ~ subset(union(esk1_0,esk1_0),esk1_0) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]) ).

cnf(c_0_18,plain,
    subset(X1,union(X2,X1)),
    inference(spm,[status(thm)],[c_0_15,c_0_12]) ).

cnf(c_0_19,plain,
    ( member(esk2_2(union(X1,X1),X2),X1)
    | subset(union(X1,X1),X2) ),
    inference(ef,[status(thm)],[c_0_16]) ).

cnf(c_0_20,negated_conjecture,
    ~ subset(union(esk1_0,esk1_0),esk1_0),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[c_0_17,c_0_18])]) ).

cnf(c_0_21,plain,
    subset(union(X1,X1),X1),
    inference(spm,[status(thm)],[c_0_9,c_0_19]) ).

cnf(c_0_22,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[c_0_20,c_0_21])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.04/0.13  % Problem    : SET002+4 : TPTP v9.2.0. Released v2.2.0.
% 0.04/0.13  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.13/0.33  % Computer : n001.cluster.edu
% 0.13/0.33  % Model    : x86_64 x86_64
% 0.13/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.33  % Memory   : 8042.1875MB
% 0.13/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit   : 300
% 0.13/0.34  % WCLimit    : 300
% 0.13/0.34  % DateTime   : Fri Sep 26 14:10:38 EDT 2025
% 0.13/0.34  % CPUTime    : 
% 0.20/0.49  Running first-order theorem proving
% 0.20/0.49  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.20/0.50  # Version: 3.0.0
% 0.20/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.50  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.50  # Starting sh5l with 300s (1) cores
% 0.20/0.50  # new_bool_3 with pid 6609 completed with status 0
% 0.20/0.50  # Result found by new_bool_3
% 0.20/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.50  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.50  # Search class: FGUNF-FFSF22-SFFFFFNN
% 0.20/0.50  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.50  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.50  # SAT001_MinMin_p005000_rr_RG with pid 6613 completed with status 0
% 0.20/0.50  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.20/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.50  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.50  # Search class: FGUNF-FFSF22-SFFFFFNN
% 0.20/0.50  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.50  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.50  # Preprocessing time       : 0.001 s
% 0.20/0.50  # Presaturation interreduction done
% 0.20/0.50  
% 0.20/0.50  # Proof found!
% 0.20/0.50  # SZS status Theorem
% 0.20/0.50  # SZS output start CNFRefutation
% See solution above
% 0.20/0.50  # Parsed axioms                        : 12
% 0.20/0.50  # Removed by relevancy pruning/SinE    : 8
% 0.20/0.50  # Initial clauses                      : 10
% 0.20/0.50  # Removed in clause preprocessing      : 0
% 0.20/0.50  # Initial clauses in saturation        : 10
% 0.20/0.50  # Processed clauses                    : 51
% 0.20/0.50  # ...of these trivial                  : 0
% 0.20/0.50  # ...subsumed                          : 9
% 0.20/0.50  # ...remaining for further processing  : 42
% 0.20/0.50  # Other redundant clauses eliminated   : 0
% 0.20/0.50  # Clauses deleted for lack of memory   : 0
% 0.20/0.50  # Backward-subsumed                    : 0
% 0.20/0.50  # Backward-rewritten                   : 2
% 0.20/0.50  # Generated clauses                    : 93
% 0.20/0.50  # ...of the previous two non-redundant : 88
% 0.20/0.50  # ...aggressively subsumed             : 0
% 0.20/0.50  # Contextual simplify-reflections      : 0
% 0.20/0.50  # Paramodulations                      : 91
% 0.20/0.50  # Factorizations                       : 2
% 0.20/0.50  # NegExts                              : 0
% 0.20/0.50  # Equation resolutions                 : 0
% 0.20/0.50  # Disequality decompositions           : 0
% 0.20/0.50  # Total rewrite steps                  : 2
% 0.20/0.50  # ...of those cached                   : 0
% 0.20/0.50  # Propositional unsat checks           : 0
% 0.20/0.50  #    Propositional check models        : 0
% 0.20/0.50  #    Propositional check unsatisfiable : 0
% 0.20/0.50  #    Propositional clauses             : 0
% 0.20/0.50  #    Propositional clauses after purity: 0
% 0.20/0.50  #    Propositional unsat core size     : 0
% 0.20/0.50  #    Propositional preprocessing time  : 0.000
% 0.20/0.50  #    Propositional encoding time       : 0.000
% 0.20/0.50  #    Propositional solver time         : 0.000
% 0.20/0.50  #    Success case prop preproc time    : 0.000
% 0.20/0.50  #    Success case prop encoding time   : 0.000
% 0.20/0.50  #    Success case prop solver time     : 0.000
% 0.20/0.50  # Current number of processed clauses  : 30
% 0.20/0.50  #    Positive orientable unit clauses  : 8
% 0.20/0.50  #    Positive unorientable unit clauses: 0
% 0.20/0.50  #    Negative unit clauses             : 1
% 0.20/0.50  #    Non-unit-clauses                  : 21
% 0.20/0.50  # Current number of unprocessed clauses: 57
% 0.20/0.50  # ...number of literals in the above   : 113
% 0.20/0.50  # Current number of archived formulas  : 0
% 0.20/0.50  # Current number of archived clauses   : 12
% 0.20/0.50  # Clause-clause subsumption calls (NU) : 109
% 0.20/0.50  # Rec. Clause-clause subsumption calls : 107
% 0.20/0.50  # Non-unit clause-clause subsumptions  : 9
% 0.20/0.50  # Unit Clause-clause subsumption calls : 30
% 0.20/0.50  # Rewrite failures with RHS unbound    : 0
% 0.20/0.50  # BW rewrite match attempts            : 17
% 0.20/0.50  # BW rewrite match successes           : 2
% 0.20/0.50  # Condensation attempts                : 0
% 0.20/0.50  # Condensation successes               : 0
% 0.20/0.50  # Termbank termtop insertions          : 2016
% 0.20/0.50  # Search garbage collected termcells   : 224
% 0.20/0.50  
% 0.20/0.50  # -------------------------------------------------
% 0.20/0.50  # User time                : 0.005 s
% 0.20/0.50  # System time              : 0.001 s
% 0.20/0.50  # Total time               : 0.006 s
% 0.20/0.50  # Maximum resident set size: 1748 pages
% 0.20/0.50  
% 0.20/0.50  # -------------------------------------------------
% 0.20/0.50  # User time                : 0.008 s
% 0.20/0.50  # System time              : 0.001 s
% 0.20/0.50  # Total time               : 0.009 s
% 0.20/0.50  # Maximum resident set size: 1724 pages
% 0.20/0.50  % E exiting
% 0.20/0.51  % E exiting
%------------------------------------------------------------------------------
