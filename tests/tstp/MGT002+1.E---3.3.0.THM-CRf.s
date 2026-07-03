
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : MGT002+1 : TPTP v9.2.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n028.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 07:23:03 PM UTC 2025

% Result   : Theorem 0.20s 0.49s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   10
%            Number of leaves      :    5
% Syntax   : Number of formulae    :   33 (  10 unt;   0 def)
%            Number of atoms       :  140 (   0 equ)
%            Maximal formula atoms :   20 (   4 avg)
%            Number of connectives :  179 (  72   ~;  69   |;  31   &)
%                                         (   1 ;   6  =>;   0  )
%            Maximal formula depth :   20 (   6 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   1 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :   88 (   2 sgn  46   !;   1   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(t2_FOL,conjecture,
    ! [X1,X9,X10,X4,X5] :
      ( ( organization(X1,X4)
        & organization(X1,X5)
        & reorganization_free(X1,X4,X5)
        & inertia(X1,X9,X4)
        & inertia(X1,X10,X5)
        & greater(X5,X4) )
     => greater(X10,X9) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t2_FOL) ).

fof(mp4,axiom,
    ! [X1,X4,X5] :
      ( reorganization_free(X1,X4,X5)
     => ( reorganization_free(X1,X4,X4)
        & reorganization_free(X1,X5,X5) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp4) ).

fof(a3_FOL,hypothesis,
    ! [X1,X6,X4,X5,X7,X8,X9,X10] :
      ( ( organization(X1,X4)
        & organization(X6,X5)
        & reorganization_free(X1,X4,X4)
        & reorganization_free(X6,X5,X5)
        & reproducibility(X1,X7,X4)
        & reproducibility(X6,X8,X5)
        & inertia(X1,X9,X4)
        & inertia(X6,X10,X5) )
     => ( greater(X8,X7)
       greater(X10,X9) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a3_FOL) ).

fof(a4_FOL,hypothesis,
    ! [X1,X7,X8,X4,X5] :
      ( ( organization(X1,X4)
        & organization(X1,X5)
        & reorganization_free(X1,X4,X5)
        & reproducibility(X1,X7,X4)
        & reproducibility(X1,X8,X5)
        & greater(X5,X4) )
     => greater(X8,X7) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a4_FOL) ).

fof(mp3,axiom,
    ! [X1,X2] :
      ( organization(X1,X2)
     => ? [X3] : reproducibility(X1,X3,X2) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp3) ).

fof(c_0_5,negated_conjecture,
    ~ ! [X1,X9,X10,X4,X5] :
        ( ( organization(X1,X4)
          & organization(X1,X5)
          & reorganization_free(X1,X4,X5)
          & inertia(X1,X9,X4)
          & inertia(X1,X10,X5)
          & greater(X5,X4) )
       => greater(X10,X9) ),
    inference(assume_negation,[status(cth)],[t2_FOL]) ).

fof(c_0_6,plain,
    ! [X14,X15,X16] :
      ( ( reorganization_free(X14,X15,X15)
        | ~ reorganization_free(X14,X15,X16) )
      & ( reorganization_free(X14,X16,X16)
        | ~ reorganization_free(X14,X15,X16) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[mp4])])])]) ).

fof(c_0_7,negated_conjecture,
    ( organization(esk2_0,esk5_0)
    & organization(esk2_0,esk6_0)
    & reorganization_free(esk2_0,esk5_0,esk6_0)
    & inertia(esk2_0,esk3_0,esk5_0)
    & inertia(esk2_0,esk4_0,esk6_0)
    & greater(esk6_0,esk5_0)
    & ~ greater(esk4_0,esk3_0) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])])]) ).

fof(c_0_8,hypothesis,
    ! [X17,X18,X19,X20,X21,X22,X23,X24] :
      ( ( ~ greater(X22,X21)
        | greater(X24,X23)
        | ~ organization(X17,X19)
        | ~ organization(X18,X20)
        | ~ reorganization_free(X17,X19,X19)
        | ~ reorganization_free(X18,X20,X20)
        | ~ reproducibility(X17,X21,X19)
        | ~ reproducibility(X18,X22,X20)
        | ~ inertia(X17,X23,X19)
        | ~ inertia(X18,X24,X20) )
      & ( ~ greater(X24,X23)
        | greater(X22,X21)
        | ~ organization(X17,X19)
        | ~ organization(X18,X20)
        | ~ reorganization_free(X17,X19,X19)
        | ~ reorganization_free(X18,X20,X20)
        | ~ reproducibility(X17,X21,X19)
        | ~ reproducibility(X18,X22,X20)
        | ~ inertia(X17,X23,X19)
        | ~ inertia(X18,X24,X20) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[a3_FOL])])])]) ).

cnf(c_0_9,plain,
    ( reorganization_free(X1,X2,X2)
    | ~ reorganization_free(X1,X3,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_10,negated_conjecture,
    reorganization_free(esk2_0,esk5_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

fof(c_0_11,hypothesis,
    ! [X25,X26,X27,X28,X29] :
      ( ~ organization(X25,X28)
      | ~ organization(X25,X29)
      | ~ reorganization_free(X25,X28,X29)
      | ~ reproducibility(X25,X26,X28)
      | ~ reproducibility(X25,X27,X29)
      | ~ greater(X29,X28)
      | greater(X27,X26) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[a4_FOL])])]) ).

cnf(c_0_12,hypothesis,
    ( greater(X3,X4)
    | ~ greater(X1,X2)
    | ~ organization(X5,X6)
    | ~ organization(X7,X8)
    | ~ reorganization_free(X5,X6,X6)
    | ~ reorganization_free(X7,X8,X8)
    | ~ reproducibility(X5,X2,X6)
    | ~ reproducibility(X7,X1,X8)
    | ~ inertia(X5,X4,X6)
    | ~ inertia(X7,X3,X8) ),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_13,negated_conjecture,
    inertia(esk2_0,esk4_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_14,negated_conjecture,
    reorganization_free(esk2_0,esk6_0,esk6_0),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).

cnf(c_0_15,negated_conjecture,
    organization(esk2_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

fof(c_0_16,plain,
    ! [X11,X12] :
      ( ~ organization(X11,X12)
      | reproducibility(X11,esk1_2(X11,X12),X12) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[mp3])])])]) ).

cnf(c_0_17,hypothesis,
    ( greater(X5,X4)
    | ~ organization(X1,X2)
    | ~ organization(X1,X3)
    | ~ reorganization_free(X1,X2,X3)
    | ~ reproducibility(X1,X4,X2)
    | ~ reproducibility(X1,X5,X3)
    | ~ greater(X3,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_11]) ).

cnf(c_0_18,negated_conjecture,
    greater(esk6_0,esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_19,negated_conjecture,
    organization(esk2_0,esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_20,negated_conjecture,
    ( greater(esk4_0,X1)
    | ~ greater(X2,X3)
    | ~ inertia(X4,X1,X5)
    | ~ reorganization_free(X4,X5,X5)
    | ~ reproducibility(esk2_0,X2,esk6_0)
    | ~ reproducibility(X4,X3,X5)
    | ~ organization(X4,X5) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),c_0_15])]) ).

cnf(c_0_21,plain,
    ( reproducibility(X1,esk1_2(X1,X2),X2)
    | ~ organization(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_16]) ).

cnf(c_0_22,negated_conjecture,
    ( greater(X1,X2)
    | ~ reproducibility(esk2_0,X1,esk6_0)
    | ~ reproducibility(esk2_0,X2,esk5_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_17,c_0_10]),c_0_18]),c_0_15]),c_0_19])]) ).

cnf(c_0_23,negated_conjecture,
    ( greater(esk4_0,X1)
    | ~ greater(esk1_2(esk2_0,esk6_0),X2)
    | ~ inertia(X3,X1,X4)
    | ~ reorganization_free(X3,X4,X4)
    | ~ reproducibility(X3,X2,X4)
    | ~ organization(X3,X4) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_20,c_0_21]),c_0_15])]) ).

cnf(c_0_24,negated_conjecture,
    ( greater(esk1_2(esk2_0,esk6_0),X1)
    | ~ reproducibility(esk2_0,X1,esk5_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_21]),c_0_15])]) ).

cnf(c_0_25,negated_conjecture,
    ( greater(esk4_0,X1)
    | ~ inertia(X2,X1,X3)
    | ~ reorganization_free(X2,X3,X3)
    | ~ reproducibility(esk2_0,X4,esk5_0)
    | ~ reproducibility(X2,X4,X3)
    | ~ organization(X2,X3) ),
    inference(spm,[status(thm)],[c_0_23,c_0_24]) ).

cnf(c_0_26,plain,
    ( reorganization_free(X1,X2,X2)
    | ~ reorganization_free(X1,X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_27,negated_conjecture,
    ( greater(esk4_0,X1)
    | ~ inertia(X2,X1,X3)
    | ~ reorganization_free(X2,X3,X3)
    | ~ reproducibility(X2,esk1_2(esk2_0,esk5_0),X3)
    | ~ organization(X2,X3) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_25,c_0_21]),c_0_19])]) ).

cnf(c_0_28,negated_conjecture,
    reorganization_free(esk2_0,esk5_0,esk5_0),
    inference(spm,[status(thm)],[c_0_26,c_0_10]) ).

cnf(c_0_29,negated_conjecture,
    ( greater(esk4_0,X1)
    | ~ inertia(esk2_0,X1,esk5_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_27,c_0_21]),c_0_28]),c_0_19])]) ).

cnf(c_0_30,negated_conjecture,
    inertia(esk2_0,esk3_0,esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_31,negated_conjecture,
    ~ greater(esk4_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_32,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_29,c_0_30]),c_0_31]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.11/0.12  % Problem    : MGT002+1 : TPTP v9.2.0. Released v2.0.0.
% 0.11/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.12/0.32  % Computer : n028.cluster.edu
% 0.12/0.32  % Model    : x86_64 x86_64
% 0.12/0.32  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.32  % Memory   : 8042.1875MB
% 0.12/0.32  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.32  % CPULimit   : 300
% 0.12/0.32  % WCLimit    : 300
% 0.12/0.32  % DateTime   : Sat Sep 27 04:31:53 EDT 2025
% 0.12/0.33  % CPUTime    : 
% 0.20/0.47  Running first-order theorem proving
% 0.20/0.47  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.48  # Version: 3.0.0
% 0.20/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.48  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.48  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.48  # Starting sh5l with 300s (1) cores
% 0.20/0.48  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 20198 completed with status 0
% 0.20/0.48  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.20/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.48  # No SInE strategy applied
% 0.20/0.48  # Search class: FHUNF-FFSM22-SFFFFFNN
% 0.20/0.48  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.20/0.48  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.20/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 151s (1) cores
% 0.20/0.48  # Starting new_bool_3 with 136s (1) cores
% 0.20/0.48  # Starting new_bool_1 with 136s (1) cores
% 0.20/0.48  # Starting sh5l with 136s (1) cores
% 0.20/0.49  # SAT001_MinMin_p005000_rr_RG with pid 20203 completed with status 0
% 0.20/0.49  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.20/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.49  # No SInE strategy applied
% 0.20/0.49  # Search class: FHUNF-FFSM22-SFFFFFNN
% 0.20/0.49  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.20/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.20/0.49  # Preprocessing time       : 0.001 s
% 0.20/0.49  # Presaturation interreduction done
% 0.20/0.49  
% 0.20/0.49  # Proof found!
% 0.20/0.49  # SZS status Theorem
% 0.20/0.49  # SZS output start CNFRefutation
% See solution above
% 0.20/0.49  # Parsed axioms                        : 5
% 0.20/0.49  # Removed by relevancy pruning/SinE    : 0
% 0.20/0.49  # Initial clauses                      : 13
% 0.20/0.49  # Removed in clause preprocessing      : 0
% 0.20/0.49  # Initial clauses in saturation        : 13
% 0.20/0.49  # Processed clauses                    : 40
% 0.20/0.49  # ...of these trivial                  : 0
% 0.20/0.49  # ...subsumed                          : 0
% 0.20/0.49  # ...remaining for further processing  : 40
% 0.20/0.49  # Other redundant clauses eliminated   : 0
% 0.20/0.49  # Clauses deleted for lack of memory   : 0
% 0.20/0.49  # Backward-subsumed                    : 0
% 0.20/0.49  # Backward-rewritten                   : 0
% 0.20/0.49  # Generated clauses                    : 23
% 0.20/0.49  # ...of the previous two non-redundant : 18
% 0.20/0.49  # ...aggressively subsumed             : 0
% 0.20/0.49  # Contextual simplify-reflections      : 0
% 0.20/0.49  # Paramodulations                      : 23
% 0.20/0.49  # Factorizations                       : 0
% 0.20/0.49  # NegExts                              : 0
% 0.20/0.49  # Equation resolutions                 : 0
% 0.20/0.49  # Disequality decompositions           : 0
% 0.20/0.49  # Total rewrite steps                  : 25
% 0.20/0.49  # ...of those cached                   : 20
% 0.20/0.49  # Propositional unsat checks           : 0
% 0.20/0.49  #    Propositional check models        : 0
% 0.20/0.49  #    Propositional check unsatisfiable : 0
% 0.20/0.49  #    Propositional clauses             : 0
% 0.20/0.49  #    Propositional clauses after purity: 0
% 0.20/0.49  #    Propositional unsat core size     : 0
% 0.20/0.49  #    Propositional preprocessing time  : 0.000
% 0.20/0.49  #    Propositional encoding time       : 0.000
% 0.20/0.49  #    Propositional solver time         : 0.000
% 0.20/0.49  #    Success case prop preproc time    : 0.000
% 0.20/0.49  #    Success case prop encoding time   : 0.000
% 0.20/0.49  #    Success case prop solver time     : 0.000
% 0.20/0.49  # Current number of processed clauses  : 27
% 0.20/0.49  #    Positive orientable unit clauses  : 8
% 0.20/0.49  #    Positive unorientable unit clauses: 0
% 0.20/0.49  #    Negative unit clauses             : 1
% 0.20/0.49  #    Non-unit-clauses                  : 18
% 0.20/0.49  # Current number of unprocessed clauses: 4
% 0.20/0.49  # ...number of literals in the above   : 27
% 0.20/0.49  # Current number of archived formulas  : 0
% 0.20/0.49  # Current number of archived clauses   : 13
% 0.20/0.49  # Clause-clause subsumption calls (NU) : 165
% 0.20/0.49  # Rec. Clause-clause subsumption calls : 50
% 0.20/0.49  # Non-unit clause-clause subsumptions  : 0
% 0.20/0.49  # Unit Clause-clause subsumption calls : 0
% 0.20/0.49  # Rewrite failures with RHS unbound    : 0
% 0.20/0.49  # BW rewrite match attempts            : 1
% 0.20/0.49  # BW rewrite match successes           : 0
% 0.20/0.49  # Condensation attempts                : 0
% 0.20/0.49  # Condensation successes               : 0
% 0.20/0.49  # Termbank termtop insertions          : 1854
% 0.20/0.49  # Search garbage collected termcells   : 291
% 0.20/0.49  
% 0.20/0.49  # -------------------------------------------------
% 0.20/0.49  # User time                : 0.006 s
% 0.20/0.49  # System time              : 0.002 s
% 0.20/0.49  # Total time               : 0.008 s
% 0.20/0.49  # Maximum resident set size: 1788 pages
% 0.20/0.49  
% 0.20/0.49  # -------------------------------------------------
% 0.20/0.49  # User time                : 0.025 s
% 0.20/0.49  # System time              : 0.007 s
% 0.20/0.49  # Total time               : 0.032 s
% 0.20/0.49  # Maximum resident set size: 1708 pages
% 0.20/0.49  % E exiting
% 0.20/0.49  % E exiting
%------------------------------------------------------------------------------
