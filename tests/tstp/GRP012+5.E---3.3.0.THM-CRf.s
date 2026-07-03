
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : GRP012+5 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n026.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 05:08:36 PM UTC 2025

% Result   : Theorem 0.15s 0.44s
% Output   : CNFRefutation 0.15s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   13
%            Number of leaves      :    1
% Syntax   : Number of formulae    :   32 (  14 unt;   0 def)
%            Number of atoms       :  101 (   0 equ)
%            Maximal formula atoms :   16 (   3 avg)
%            Number of connectives :  102 (  33   ~;  30   |;  31   &)
%                                         (   0 ;   8  =>;   0  )
%            Maximal formula depth :   29 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    7 (   7 usr;   5 con; 0-2 aty)
%            Number of variables   :  117 (   0 sgn  64   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(prove_distribution,conjecture,
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
     => ! [X5,X6,X7,X2] :
          ( ( product(inverse(X5),inverse(X6),X7)
            & product(X6,X5,X2) )
         => product(inverse(X7),inverse(X2),X1) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

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
       => ! [X5,X6,X7,X2] :
            ( ( product(inverse(X5),inverse(X6),X7)
              & product(X6,X5,X2) )
           => product(inverse(X7),inverse(X2),X1) ) ),
    inference(assume_negation,[status(cth)],[prove_distribution]) ).

fof(c_0_2,negated_conjecture,
    ! [X9,X10,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27] :
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
      & product(inverse(esk3_0),inverse(esk4_0),esk5_0)
      & product(esk4_0,esk3_0,esk6_0)
      & ~ product(inverse(esk5_0),inverse(esk6_0),esk1_0) ),
    inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_1])])])])]) ).

cnf(c_0_3,negated_conjecture,
    ( product(X3,X4,X6)
    | ~ product(X1,X2,X3)
    | ~ product(X2,X4,X5)
    | ~ product(X1,X5,X6) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_4,negated_conjecture,
    product(X1,esk1_0,X1),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_5,negated_conjecture,
    product(inverse(X1),X1,esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_6,negated_conjecture,
    ( product(X1,esk1_0,X2)
    | ~ product(X3,X4,X2)
    | ~ product(X3,X4,X1) ),
    inference(spm,[status(thm)],[c_0_3,c_0_4]) ).

cnf(c_0_7,negated_conjecture,
    product(esk4_0,esk3_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_8,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X4,inverse(X2),X1)
    | ~ product(X4,esk1_0,X3) ),
    inference(spm,[status(thm)],[c_0_3,c_0_5]) ).

cnf(c_0_9,negated_conjecture,
    product(inverse(esk3_0),inverse(esk4_0),esk5_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_10,negated_conjecture,
    ( product(X1,X5,X6)
    | ~ product(X1,X2,X3)
    | ~ product(X2,X4,X5)
    | ~ product(X3,X4,X6) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_11,negated_conjecture,
    ( product(X1,esk1_0,esk6_0)
    | ~ product(esk4_0,esk3_0,X1) ),
    inference(spm,[status(thm)],[c_0_6,c_0_7]) ).

cnf(c_0_12,negated_conjecture,
    product(X1,X2,esk2_2(X1,X2)),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_13,negated_conjecture,
    ( product(esk5_0,esk4_0,X1)
    | ~ product(inverse(esk3_0),esk1_0,X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).

cnf(c_0_14,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X4,esk1_0,X2)
    | ~ product(X1,X4,X3) ),
    inference(spm,[status(thm)],[c_0_10,c_0_4]) ).

cnf(c_0_15,negated_conjecture,
    product(esk2_2(esk4_0,esk3_0),esk1_0,esk6_0),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).

cnf(c_0_16,negated_conjecture,
    ( product(X1,X2,esk1_0)
    | ~ product(X1,X3,inverse(X4))
    | ~ product(X3,X4,X2) ),
    inference(spm,[status(thm)],[c_0_10,c_0_5]) ).

cnf(c_0_17,negated_conjecture,
    product(esk5_0,esk4_0,inverse(esk3_0)),
    inference(spm,[status(thm)],[c_0_13,c_0_4]) ).

cnf(c_0_18,negated_conjecture,
    product(esk1_0,X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_19,negated_conjecture,
    ( product(X1,esk6_0,X2)
    | ~ product(X1,esk2_2(esk4_0,esk3_0),X2) ),
    inference(spm,[status(thm)],[c_0_14,c_0_15]) ).

cnf(c_0_20,negated_conjecture,
    ( product(esk5_0,X1,esk1_0)
    | ~ product(esk4_0,esk3_0,X1) ),
    inference(spm,[status(thm)],[c_0_16,c_0_17]) ).

cnf(c_0_21,negated_conjecture,
    ( product(X1,X2,X3)
    | ~ product(X1,X4,esk1_0)
    | ~ product(X4,X3,X2) ),
    inference(spm,[status(thm)],[c_0_10,c_0_18]) ).

cnf(c_0_22,negated_conjecture,
    product(esk5_0,esk6_0,esk1_0),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_19,c_0_20]),c_0_12])]) ).

cnf(c_0_23,negated_conjecture,
    ( product(X1,esk1_0,X2)
    | ~ product(X2,esk1_0,X1) ),
    inference(spm,[status(thm)],[c_0_6,c_0_4]) ).

cnf(c_0_24,negated_conjecture,
    ( product(esk5_0,X1,X2)
    | ~ product(esk6_0,X2,X1) ),
    inference(spm,[status(thm)],[c_0_21,c_0_22]) ).

cnf(c_0_25,negated_conjecture,
    ( product(X1,esk1_0,esk5_0)
    | ~ product(esk6_0,X1,esk1_0) ),
    inference(spm,[status(thm)],[c_0_23,c_0_24]) ).

cnf(c_0_26,negated_conjecture,
    product(X1,inverse(X1),esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_27,negated_conjecture,
    product(inverse(esk6_0),esk1_0,esk5_0),
    inference(spm,[status(thm)],[c_0_25,c_0_26]) ).

cnf(c_0_28,negated_conjecture,
    ~ product(inverse(esk5_0),inverse(esk6_0),esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_29,negated_conjecture,
    ( product(inverse(X1),X2,X3)
    | ~ product(X1,X3,X2) ),
    inference(spm,[status(thm)],[c_0_21,c_0_5]) ).

cnf(c_0_30,negated_conjecture,
    product(esk5_0,esk1_0,inverse(esk6_0)),
    inference(spm,[status(thm)],[c_0_23,c_0_27]) ).

cnf(c_0_31,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_28,c_0_29]),c_0_30])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.05/0.09  % Problem    : GRP012+5 : TPTP v9.2.0. Released v3.1.0.
% 0.05/0.09  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.09/0.29  % Computer : n026.cluster.edu
% 0.09/0.29  % Model    : x86_64 x86_64
% 0.09/0.29  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.09/0.29  % Memory   : 8042.1875MB
% 0.09/0.29  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.09/0.29  % CPULimit   : 300
% 0.09/0.29  % WCLimit    : 300
% 0.09/0.29  % DateTime   : Fri Sep 26 16:43:38 EDT 2025
% 0.09/0.29  % CPUTime    : 
% 0.15/0.40  Running first-order theorem proving
% 0.15/0.40  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.15/0.44  # Version: 3.0.0
% 0.15/0.44  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.15/0.44  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.15/0.44  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.15/0.44  # Starting new_bool_3 with 300s (1) cores
% 0.15/0.44  # Starting new_bool_1 with 300s (1) cores
% 0.15/0.44  # Starting sh5l with 300s (1) cores
% 0.15/0.44  # new_bool_3 with pid 27101 completed with status 0
% 0.15/0.44  # Result found by new_bool_3
% 0.15/0.44  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.15/0.44  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.15/0.44  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.15/0.44  # Starting new_bool_3 with 300s (1) cores
% 0.15/0.44  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.15/0.44  # Search class: FHUNM-FFSF21-SFFFFFNN
% 0.15/0.44  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.15/0.44  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.15/0.44  # SAT001_MinMin_p005000_rr_RG with pid 27105 completed with status 0
% 0.15/0.44  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.15/0.44  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.15/0.44  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.15/0.44  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.15/0.44  # Starting new_bool_3 with 300s (1) cores
% 0.15/0.44  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.15/0.44  # Search class: FHUNM-FFSF21-SFFFFFNN
% 0.15/0.44  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.15/0.44  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.15/0.44  # Preprocessing time       : 0.001 s
% 0.15/0.44  # Presaturation interreduction done
% 0.15/0.44  
% 0.15/0.44  # Proof found!
% 0.15/0.44  # SZS status Theorem
% 0.15/0.44  # SZS output start CNFRefutation
% See solution above
% 0.15/0.44  # Parsed axioms                        : 1
% 0.15/0.44  # Removed by relevancy pruning/SinE    : 0
% 0.15/0.44  # Initial clauses                      : 10
% 0.15/0.44  # Removed in clause preprocessing      : 0
% 0.15/0.44  # Initial clauses in saturation        : 10
% 0.15/0.44  # Processed clauses                    : 347
% 0.15/0.44  # ...of these trivial                  : 33
% 0.15/0.44  # ...subsumed                          : 47
% 0.15/0.44  # ...remaining for further processing  : 267
% 0.15/0.44  # Other redundant clauses eliminated   : 0
% 0.15/0.44  # Clauses deleted for lack of memory   : 0
% 0.15/0.44  # Backward-subsumed                    : 1
% 0.15/0.44  # Backward-rewritten                   : 1
% 0.15/0.44  # Generated clauses                    : 2135
% 0.15/0.44  # ...of the previous two non-redundant : 1742
% 0.15/0.44  # ...aggressively subsumed             : 0
% 0.15/0.44  # Contextual simplify-reflections      : 0
% 0.15/0.44  # Paramodulations                      : 2135
% 0.15/0.44  # Factorizations                       : 0
% 0.15/0.44  # NegExts                              : 0
% 0.15/0.44  # Equation resolutions                 : 0
% 0.15/0.44  # Disequality decompositions           : 0
% 0.15/0.44  # Total rewrite steps                  : 435
% 0.15/0.44  # ...of those cached                   : 335
% 0.15/0.44  # Propositional unsat checks           : 0
% 0.15/0.44  #    Propositional check models        : 0
% 0.15/0.44  #    Propositional check unsatisfiable : 0
% 0.15/0.44  #    Propositional clauses             : 0
% 0.15/0.44  #    Propositional clauses after purity: 0
% 0.15/0.44  #    Propositional unsat core size     : 0
% 0.15/0.44  #    Propositional preprocessing time  : 0.000
% 0.15/0.44  #    Propositional encoding time       : 0.000
% 0.15/0.44  #    Propositional solver time         : 0.000
% 0.15/0.44  #    Success case prop preproc time    : 0.000
% 0.15/0.44  #    Success case prop encoding time   : 0.000
% 0.15/0.44  #    Success case prop solver time     : 0.000
% 0.15/0.44  # Current number of processed clauses  : 255
% 0.15/0.44  #    Positive orientable unit clauses  : 106
% 0.15/0.44  #    Positive unorientable unit clauses: 0
% 0.15/0.44  #    Negative unit clauses             : 1
% 0.15/0.44  #    Non-unit-clauses                  : 148
% 0.15/0.44  # Current number of unprocessed clauses: 1357
% 0.15/0.44  # ...number of literals in the above   : 3050
% 0.15/0.44  # Current number of archived formulas  : 0
% 0.15/0.44  # Current number of archived clauses   : 12
% 0.15/0.44  # Clause-clause subsumption calls (NU) : 2332
% 0.15/0.44  # Rec. Clause-clause subsumption calls : 2215
% 0.15/0.44  # Non-unit clause-clause subsumptions  : 48
% 0.15/0.44  # Unit Clause-clause subsumption calls : 8
% 0.15/0.44  # Rewrite failures with RHS unbound    : 0
% 0.15/0.44  # BW rewrite match attempts            : 221
% 0.15/0.44  # BW rewrite match successes           : 1
% 0.15/0.44  # Condensation attempts                : 0
% 0.15/0.44  # Condensation successes               : 0
% 0.15/0.44  # Termbank termtop insertions          : 24556
% 0.15/0.44  # Search garbage collected termcells   : 355
% 0.15/0.44  
% 0.15/0.44  # -------------------------------------------------
% 0.15/0.44  # User time                : 0.031 s
% 0.15/0.44  # System time              : 0.001 s
% 0.15/0.44  # Total time               : 0.032 s
% 0.15/0.44  # Maximum resident set size: 1728 pages
% 0.15/0.44  
% 0.15/0.44  # -------------------------------------------------
% 0.15/0.44  # User time                : 0.033 s
% 0.15/0.44  # System time              : 0.002 s
% 0.15/0.44  # Total time               : 0.035 s
% 0.15/0.44  # Maximum resident set size: 1704 pages
% 0.15/0.44  % E exiting
% 0.15/0.45  % E exiting
%------------------------------------------------------------------------------
