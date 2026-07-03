
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : GEO081+1 : TPTP v9.2.0. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n031.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 04:50:44 PM UTC 2025

% Result   : Theorem 0.17s 0.43s
% Output   : CNFRefutation 0.17s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    7
%            Number of leaves      :    2
% Syntax   : Number of formulae    :   16 (   4 unt;   0 def)
%            Number of atoms       :   40 (   0 equ)
%            Maximal formula atoms :    7 (   2 avg)
%            Number of connectives :   35 (  11   ~;  14   |;   6   &)
%                                         (   1 ;   3  =>;   0  )
%            Maximal formula depth :   10 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :   28 (   0 sgn  14   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(part_of_defn,axiom,
    ! [X1,X2] :
      ( part_of(X2,X1)
     ! [X3] :
          ( incident_c(X3,X2)
         => incident_c(X3,X1) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

fof(part_of_transitivity,conjecture,
    ! [X2,X4,X6] :
      ( ( part_of(X2,X4)
        & part_of(X4,X6) )
     => part_of(X2,X6) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',part_of_transitivity) ).

fof(c_0_2,plain,
    ! [X11,X12,X13,X14,X15] :
      ( ( ~ part_of(X12,X11)
        | ~ incident_c(X13,X12)
        | incident_c(X13,X11) )
      & ( incident_c(esk4_2(X14,X15),X15)
        | part_of(X15,X14) )
      & ( ~ incident_c(esk4_2(X14,X15),X14)
        | part_of(X15,X14) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[part_of_defn])])])])])])]) ).

fof(c_0_3,negated_conjecture,
    ~ ! [X2,X4,X6] :
        ( ( part_of(X2,X4)
          & part_of(X4,X6) )
       => part_of(X2,X6) ),
    inference(assume_negation,[status(cth)],[part_of_transitivity]) ).

cnf(c_0_4,plain,
    ( incident_c(X3,X2)
    | ~ part_of(X1,X2)
    | ~ incident_c(X3,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_5,plain,
    ( incident_c(esk4_2(X1,X2),X2)
    | part_of(X2,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

fof(c_0_6,negated_conjecture,
    ( part_of(esk1_0,esk2_0)
    & part_of(esk2_0,esk3_0)
    & ~ part_of(esk1_0,esk3_0) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_3])])])]) ).

cnf(c_0_7,plain,
    ( incident_c(esk4_2(X1,X2),X3)
    | part_of(X2,X1)
    | ~ part_of(X2,X3) ),
    inference(spm,[status(thm)],[c_0_4,c_0_5]) ).

cnf(c_0_8,negated_conjecture,
    part_of(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_9,negated_conjecture,
    ( incident_c(esk4_2(X1,esk1_0),esk2_0)
    | part_of(esk1_0,X1) ),
    inference(spm,[status(thm)],[c_0_7,c_0_8]) ).

cnf(c_0_10,negated_conjecture,
    ( incident_c(esk4_2(X1,esk1_0),X2)
    | part_of(esk1_0,X1)
    | ~ part_of(esk2_0,X2) ),
    inference(spm,[status(thm)],[c_0_4,c_0_9]) ).

cnf(c_0_11,negated_conjecture,
    part_of(esk2_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_12,plain,
    ( part_of(X2,X1)
    | ~ incident_c(esk4_2(X1,X2),X1) ),
    inference(split_conjunct,[status(thm)],[c_0_2]) ).

cnf(c_0_13,negated_conjecture,
    ( incident_c(esk4_2(X1,esk1_0),esk3_0)
    | part_of(esk1_0,X1) ),
    inference(spm,[status(thm)],[c_0_10,c_0_11]) ).

cnf(c_0_14,negated_conjecture,
    ~ part_of(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_15,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.10  % Problem    : GEO081+1 : TPTP v9.2.0. Released v2.4.0.
% 0.00/0.10  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.09/0.31  % Computer : n031.cluster.edu
% 0.09/0.31  % Model    : x86_64 x86_64
% 0.09/0.31  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.09/0.31  % Memory   : 8042.1875MB
% 0.09/0.31  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.09/0.31  % CPULimit   : 300
% 0.09/0.31  % WCLimit    : 300
% 0.09/0.31  % DateTime   : Sat Sep 27 02:56:53 EDT 2025
% 0.09/0.31  % CPUTime    : 
% 0.17/0.42  Running first-order theorem proving
% 0.17/0.42  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.17/0.43  # Version: 3.0.0
% 0.17/0.43  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.17/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.17/0.43  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.17/0.43  # Starting new_bool_3 with 300s (1) cores
% 0.17/0.43  # Starting new_bool_1 with 300s (1) cores
% 0.17/0.43  # Starting sh5l with 300s (1) cores
% 0.17/0.43  # new_bool_3 with pid 3442 completed with status 0
% 0.17/0.43  # Result found by new_bool_3
% 0.17/0.43  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.17/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.17/0.43  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.17/0.43  # Starting new_bool_3 with 300s (1) cores
% 0.17/0.43  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.17/0.43  # Search class: FGHSF-FFMF32-SFFFFFNN
% 0.17/0.43  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.17/0.43  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.17/0.43  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 3446 completed with status 0
% 0.17/0.43  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.17/0.43  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.17/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.17/0.43  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.17/0.43  # Starting new_bool_3 with 300s (1) cores
% 0.17/0.43  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.17/0.43  # Search class: FGHSF-FFMF32-SFFFFFNN
% 0.17/0.43  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.17/0.43  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.17/0.43  # Preprocessing time       : 0.001 s
% 0.17/0.43  # Presaturation interreduction done
% 0.17/0.43  
% 0.17/0.43  # Proof found!
% 0.17/0.43  # SZS status Theorem
% 0.17/0.43  # SZS output start CNFRefutation
% See solution above
% 0.17/0.43  # Parsed axioms                        : 17
% 0.17/0.43  # Removed by relevancy pruning/SinE    : 6
% 0.17/0.43  # Initial clauses                      : 36
% 0.17/0.43  # Removed in clause preprocessing      : 0
% 0.17/0.43  # Initial clauses in saturation        : 36
% 0.17/0.43  # Processed clauses                    : 73
% 0.17/0.43  # ...of these trivial                  : 0
% 0.17/0.43  # ...subsumed                          : 2
% 0.17/0.43  # ...remaining for further processing  : 71
% 0.17/0.43  # Other redundant clauses eliminated   : 3
% 0.17/0.43  # Clauses deleted for lack of memory   : 0
% 0.17/0.43  # Backward-subsumed                    : 0
% 0.17/0.43  # Backward-rewritten                   : 0
% 0.17/0.43  # Generated clauses                    : 47
% 0.17/0.43  # ...of the previous two non-redundant : 42
% 0.17/0.43  # ...aggressively subsumed             : 0
% 0.17/0.43  # Contextual simplify-reflections      : 0
% 0.17/0.43  # Paramodulations                      : 44
% 0.17/0.44  # Factorizations                       : 0
% 0.17/0.44  # NegExts                              : 0
% 0.17/0.44  # Equation resolutions                 : 3
% 0.17/0.44  # Disequality decompositions           : 0
% 0.17/0.44  # Total rewrite steps                  : 2
% 0.17/0.44  # ...of those cached                   : 0
% 0.17/0.44  # Propositional unsat checks           : 0
% 0.17/0.44  #    Propositional check models        : 0
% 0.17/0.44  #    Propositional check unsatisfiable : 0
% 0.17/0.44  #    Propositional clauses             : 0
% 0.17/0.44  #    Propositional clauses after purity: 0
% 0.17/0.44  #    Propositional unsat core size     : 0
% 0.17/0.44  #    Propositional preprocessing time  : 0.000
% 0.17/0.44  #    Propositional encoding time       : 0.000
% 0.17/0.44  #    Propositional solver time         : 0.000
% 0.17/0.44  #    Success case prop preproc time    : 0.000
% 0.17/0.44  #    Success case prop encoding time   : 0.000
% 0.17/0.44  #    Success case prop solver time     : 0.000
% 0.17/0.44  # Current number of processed clauses  : 32
% 0.17/0.44  #    Positive orientable unit clauses  : 3
% 0.17/0.44  #    Positive unorientable unit clauses: 0
% 0.17/0.44  #    Negative unit clauses             : 1
% 0.17/0.44  #    Non-unit-clauses                  : 28
% 0.17/0.44  # Current number of unprocessed clauses: 37
% 0.17/0.44  # ...number of literals in the above   : 124
% 0.17/0.44  # Current number of archived formulas  : 0
% 0.17/0.44  # Current number of archived clauses   : 36
% 0.17/0.44  # Clause-clause subsumption calls (NU) : 229
% 0.17/0.44  # Rec. Clause-clause subsumption calls : 136
% 0.17/0.44  # Non-unit clause-clause subsumptions  : 2
% 0.17/0.44  # Unit Clause-clause subsumption calls : 3
% 0.17/0.44  # Rewrite failures with RHS unbound    : 0
% 0.17/0.44  # BW rewrite match attempts            : 5
% 0.17/0.44  # BW rewrite match successes           : 0
% 0.17/0.44  # Condensation attempts                : 0
% 0.17/0.44  # Condensation successes               : 0
% 0.17/0.44  # Termbank termtop insertions          : 3801
% 0.17/0.44  # Search garbage collected termcells   : 863
% 0.17/0.44  
% 0.17/0.44  # -------------------------------------------------
% 0.17/0.44  # User time                : 0.008 s
% 0.17/0.44  # System time              : 0.001 s
% 0.17/0.44  # Total time               : 0.009 s
% 0.17/0.44  # Maximum resident set size: 1852 pages
% 0.17/0.44  
% 0.17/0.44  # -------------------------------------------------
% 0.17/0.44  # User time                : 0.009 s
% 0.17/0.44  # System time              : 0.002 s
% 0.17/0.44  # Total time               : 0.012 s
% 0.17/0.44  # Maximum resident set size: 1732 pages
% 0.17/0.44  % E exiting
% 0.17/0.44  % E exiting
%------------------------------------------------------------------------------
