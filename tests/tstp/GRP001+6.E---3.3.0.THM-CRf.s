
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : GRP001+6 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n016.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 05:08:33 PM UTC 2025

% Result   : Theorem 0.19s 0.50s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   12
%            Number of leaves      :    1
% Syntax   : Number of formulae    :   28 (  14 unt;   0 def)
%            Number of atoms       :   91 (   0 equ)
%            Maximal formula atoms :   16 (   3 avg)
%            Number of connectives :   90 (  27   ~;  24   |;  29   &)
%                                         (   0 ;  10  =>;   0  )
%            Maximal formula depth :   30 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :  109 (   0 sgn  65   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(commutativity,conjecture,
    ! [X1] :
      ( ( ! [X2,X3] :
          ? [X4] : product(X2,X3,X4)
        & ! [X2,X3,X4,X5,X6,X7] :
            ( ( product(X2,X3,X5)
              & product(X3,X4,X6)
              & product(X5,X4,X7) )
           => product(X2,X6,X7) )
        & ! [X2,X3,X4,X5,X6,X7] :
            ( ( product(X2,X3,X5)
              & product(X3,X4,X6)
              & product(X2,X6,X7) )
           => product(X5,X4,X7) )
        & ! [X2] : product(X2,X1,X2)
        & ! [X2] : product(X1,X2,X2)
        & ! [X2] : product(X2,inverse(X2),X1)
        & ! [X2] : product(inverse(X2),X2,X1) )
     => ( ! [X2] : product(X2,X2,X1)
       => ! [X5,X6,X7] :
            ( product(X5,X6,X7)
           => product(X6,X5,X7) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',commutativity) ).

fof(c_0_1,negated_conjecture,
    ~ ! [X1] :
        ( ( ! [X2,X3] :
            ? [X4] : product(X2,X3,X4)
          & ! [X2,X3,X4,X5,X6,X7] :
              ( ( product(X2,X3,X5)
                & product(X3,X4,X6)
                & product(X5,X4,X7) )
             => product(X2,X6,X7) )
          & ! [X2,X3,X4,X5,X6,X7] :
              ( ( product(X2,X3,X5)
                & product(X3,X4,X6)
                & product(X2,X6,X7) )
             => product(X5,X4,X7) )
          & ! [X2] : product(X2,X1,X2)
          & ! [X2] : product(X1,X2,X2)
          & ! [X2] : product(X2,inverse(X2),X1)
          & ! [X2] : product(inverse(X2),X2,X1) )
       => ( ! [X2] : product(X2,X2,X1)
         => ! [X5,X6,X7] :
              ( product(X5,X6,X7)
             => product(X6,X5,X7) ) ) ),
    inference(assume_negation,[status(cth)],[commutativity]) ).

fof(c_0_2,negated_conjecture,
    ! [X9,X10,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28] :
      ( product(X9,X10,esk2_2(X9,X10))
      & ( ~ product(X12,X13,X15)
        | ~ product(X13,X14,X16)
        | ~ product(X15,X14,X17)
        | product(X12,X16,X17) )
      & ( ~ product(X18,X19,X21)
        | ~ product(X19,X20,X22)
        | ~ product(X18,X22,X23)
        | product(X21,X20,X23) )
      & product(X24,esk1_0,X24)
      & product(esk1_0,X25,X25)
      & product(X26,inverse(X26),esk1_0)
      & product(inverse(X27),X27,esk1_0)
      & product(X28,X28,esk1_0)
      & product(esk3_0,esk4_0,esk5_0)
      & ~ product(esk4_0,esk3_0,esk5_0) ),
    inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_1])])])])]) ).

cnf(c_0_3,negated_conjecture,
    ( product(X3,X4,X6)
    | ~ product(X1,X2,X3)
    | ~ product(X2,X4,X5)
    | ~ product(X1,X5,X6) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_4,negated_conjecture,
    product(esk3_0,esk4_0,esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_5,negated_conjecture,
    product(X1,X1,esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_6,negated_conjecture,
    ( product(X1,esk4_0,X2)
    | ~ product(X3,esk5_0,X2)
    | ~ product(X3,esk3_0,X1) ),
    inference(spm,[status(thm)],[c_0_3,c_0_4]) ).

cnf(c_0_7,negated_conjecture,
    product(X1,esk1_0,X1),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_8,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X4,esk1_0,X3)
    | ~ product(X4,X2,X1) ),
    inference(spm,[status(thm)],[c_0_3,c_0_5]) ).

cnf(c_0_9,negated_conjecture,
    ( product(X1,esk4_0,esk1_0)
    | ~ product(esk5_0,esk3_0,X1) ),
    inference(spm,[status(thm)],[c_0_6,c_0_5]) ).

cnf(c_0_10,negated_conjecture,
    product(X1,X2,esk2_2(X1,X2)),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_11,negated_conjecture,
    product(inverse(X1),X1,esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_12,negated_conjecture,
    ( product(X1,esk1_0,X2)
    | ~ product(X3,X4,X2)
    | ~ product(X3,X4,X1) ),
    inference(spm,[status(thm)],[c_0_3,c_0_7]) ).

cnf(c_0_13,negated_conjecture,
    product(esk1_0,X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_14,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X3,X2,X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_7]) ).

cnf(c_0_15,negated_conjecture,
    product(esk2_2(esk5_0,esk3_0),esk4_0,esk1_0),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).

cnf(c_0_16,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X4,inverse(X2),X1)
    | ~ product(X4,esk1_0,X3) ),
    inference(spm,[status(thm)],[c_0_3,c_0_11]) ).

cnf(c_0_17,negated_conjecture,
    product(X1,inverse(X1),esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_18,negated_conjecture,
    ( product(X1,esk1_0,X2)
    | ~ product(esk1_0,X2,X1) ),
    inference(spm,[status(thm)],[c_0_12,c_0_13]) ).

cnf(c_0_19,negated_conjecture,
    product(esk1_0,esk4_0,esk2_2(esk5_0,esk3_0)),
    inference(spm,[status(thm)],[c_0_14,c_0_15]) ).

cnf(c_0_20,negated_conjecture,
    ( product(esk1_0,X1,X2)
    | ~ product(X1,esk1_0,X2) ),
    inference(spm,[status(thm)],[c_0_16,c_0_17]) ).

cnf(c_0_21,negated_conjecture,
    product(esk2_2(esk5_0,esk3_0),esk1_0,esk4_0),
    inference(spm,[status(thm)],[c_0_18,c_0_19]) ).

cnf(c_0_22,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X4,esk2_2(X5,X2),X3)
    | ~ product(X4,X5,X1) ),
    inference(spm,[status(thm)],[c_0_3,c_0_10]) ).

cnf(c_0_23,negated_conjecture,
    product(esk1_0,esk2_2(esk5_0,esk3_0),esk4_0),
    inference(spm,[status(thm)],[c_0_20,c_0_21]) ).

cnf(c_0_24,negated_conjecture,
    ( product(X1,esk3_0,esk4_0)
    | ~ product(esk1_0,esk5_0,X1) ),
    inference(spm,[status(thm)],[c_0_22,c_0_23]) ).

cnf(c_0_25,negated_conjecture,
    product(esk5_0,esk3_0,esk4_0),
    inference(spm,[status(thm)],[c_0_24,c_0_13]) ).

cnf(c_0_26,negated_conjecture,
    ~ product(esk4_0,esk3_0,esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_27,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_14,c_0_25]),c_0_26]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.12  % Problem    : GRP001+6 : TPTP v9.2.0. Released v3.1.0.
% 0.06/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.11/0.33  % Computer : n016.cluster.edu
% 0.11/0.33  % Model    : x86_64 x86_64
% 0.11/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.11/0.33  % Memory   : 8042.1875MB
% 0.11/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.11/0.33  % CPULimit   : 300
% 0.11/0.33  % WCLimit    : 300
% 0.11/0.33  % DateTime   : Fri Sep 26 16:39:08 EDT 2025
% 0.11/0.33  % CPUTime    : 
% 0.19/0.48  Running first-order theorem proving
% 0.19/0.48  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.19/0.50  # Version: 3.0.0
% 0.19/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.50  # Starting new_bool_1 with 300s (1) cores
% 0.19/0.50  # Starting sh5l with 300s (1) cores
% 0.19/0.50  # new_bool_3 with pid 28856 completed with status 0
% 0.19/0.50  # Result found by new_bool_3
% 0.19/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.50  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.50  # Search class: FHUNM-FFSF21-SFFFFFNN
% 0.19/0.50  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.50  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.50  # SAT001_MinMin_p005000_rr_RG with pid 28862 completed with status 0
% 0.19/0.50  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.19/0.50  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.50  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.50  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.50  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.50  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.50  # Search class: FHUNM-FFSF21-SFFFFFNN
% 0.19/0.50  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.50  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.50  # Preprocessing time       : 0.001 s
% 0.19/0.50  # Presaturation interreduction done
% 0.19/0.50  
% 0.19/0.50  # Proof found!
% 0.19/0.50  # SZS status Theorem
% 0.19/0.50  # SZS output start CNFRefutation
% See solution above
% 0.19/0.50  # Parsed axioms                        : 1
% 0.19/0.50  # Removed by relevancy pruning/SinE    : 0
% 0.19/0.50  # Initial clauses                      : 10
% 0.19/0.50  # Removed in clause preprocessing      : 0
% 0.19/0.50  # Initial clauses in saturation        : 10
% 0.19/0.50  # Processed clauses                    : 76
% 0.19/0.50  # ...of these trivial                  : 2
% 0.19/0.50  # ...subsumed                          : 3
% 0.19/0.50  # ...remaining for further processing  : 71
% 0.19/0.50  # Other redundant clauses eliminated   : 0
% 0.19/0.50  # Clauses deleted for lack of memory   : 0
% 0.19/0.50  # Backward-subsumed                    : 0
% 0.19/0.50  # Backward-rewritten                   : 1
% 0.19/0.50  # Generated clauses                    : 324
% 0.19/0.50  # ...of the previous two non-redundant : 262
% 0.19/0.50  # ...aggressively subsumed             : 0
% 0.19/0.50  # Contextual simplify-reflections      : 0
% 0.19/0.50  # Paramodulations                      : 324
% 0.19/0.50  # Factorizations                       : 0
% 0.19/0.50  # NegExts                              : 0
% 0.19/0.50  # Equation resolutions                 : 0
% 0.19/0.50  # Disequality decompositions           : 0
% 0.19/0.50  # Total rewrite steps                  : 58
% 0.19/0.50  # ...of those cached                   : 27
% 0.19/0.50  # Propositional unsat checks           : 0
% 0.19/0.50  #    Propositional check models        : 0
% 0.19/0.50  #    Propositional check unsatisfiable : 0
% 0.19/0.50  #    Propositional clauses             : 0
% 0.19/0.50  #    Propositional clauses after purity: 0
% 0.19/0.50  #    Propositional unsat core size     : 0
% 0.19/0.50  #    Propositional preprocessing time  : 0.000
% 0.19/0.50  #    Propositional encoding time       : 0.000
% 0.19/0.50  #    Propositional solver time         : 0.000
% 0.19/0.50  #    Success case prop preproc time    : 0.000
% 0.19/0.50  #    Success case prop encoding time   : 0.000
% 0.19/0.50  #    Success case prop solver time     : 0.000
% 0.19/0.50  # Current number of processed clauses  : 60
% 0.19/0.50  #    Positive orientable unit clauses  : 35
% 0.19/0.50  #    Positive unorientable unit clauses: 0
% 0.19/0.50  #    Negative unit clauses             : 1
% 0.19/0.50  #    Non-unit-clauses                  : 24
% 0.19/0.50  # Current number of unprocessed clauses: 204
% 0.19/0.50  # ...number of literals in the above   : 468
% 0.19/0.50  # Current number of archived formulas  : 0
% 0.19/0.50  # Current number of archived clauses   : 11
% 0.19/0.50  # Clause-clause subsumption calls (NU) : 147
% 0.19/0.50  # Rec. Clause-clause subsumption calls : 126
% 0.19/0.50  # Non-unit clause-clause subsumptions  : 3
% 0.19/0.50  # Unit Clause-clause subsumption calls : 8
% 0.19/0.50  # Rewrite failures with RHS unbound    : 0
% 0.19/0.50  # BW rewrite match attempts            : 117
% 0.19/0.50  # BW rewrite match successes           : 1
% 0.19/0.50  # Condensation attempts                : 0
% 0.19/0.50  # Condensation successes               : 0
% 0.19/0.50  # Termbank termtop insertions          : 4361
% 0.19/0.50  # Search garbage collected termcells   : 356
% 0.19/0.50  
% 0.19/0.50  # -------------------------------------------------
% 0.19/0.50  # User time                : 0.005 s
% 0.19/0.50  # System time              : 0.003 s
% 0.19/0.50  # Total time               : 0.008 s
% 0.19/0.50  # Maximum resident set size: 1736 pages
% 0.19/0.50  
% 0.19/0.50  # -------------------------------------------------
% 0.19/0.50  # User time                : 0.006 s
% 0.19/0.50  # System time              : 0.005 s
% 0.19/0.50  # Total time               : 0.011 s
% 0.19/0.50  # Maximum resident set size: 1704 pages
% 0.19/0.50  % E exiting
% 0.19/0.50  % E exiting
%------------------------------------------------------------------------------
