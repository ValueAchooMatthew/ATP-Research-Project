
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : SET002+3 : TPTP v9.2.0. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n026.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 08:43:41 PM UTC 2025

% Result   : Theorem 0.19s 0.48s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    3
% Syntax   : Number of formulae    :   11 (   8 unt;   0 def)
%            Number of atoms       :   14 (   7 equ)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :    8 (   5   ~;   2   |;   0   &)
%                                         (   0 ;   1  =>;   0  )
%            Maximal formula depth :    5 (   2 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   1 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   11 (   0 sgn   8   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(prove_idempotency_of_union,conjecture,
    ! [X1] : union(X1,X1) = X1,
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',prove_idempotency_of_union) ).

fof(subset_union,axiom,
    ! [X1,X2] :
      ( subset(X1,X2)
     => union(X1,X2) = X2 ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',subset_union) ).

fof(reflexivity_of_subset,axiom,
    ! [X1] : subset(X1,X1),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',reflexivity_of_subset) ).

fof(c_0_3,negated_conjecture,
    ~ ! [X1] : union(X1,X1) = X1,
    inference(assume_negation,[status(cth)],[prove_idempotency_of_union]) ).

fof(c_0_4,negated_conjecture,
    union(esk1_0,esk1_0) != esk1_0,
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_3])])])]) ).

fof(c_0_5,plain,
    ! [X5,X6] :
      ( ~ subset(X5,X6)
      | union(X5,X6) = X6 ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[subset_union])])]) ).

fof(c_0_6,plain,
    ! [X20] : subset(X20,X20),
    inference(variable_rename,[status(thm)],[reflexivity_of_subset]) ).

cnf(c_0_7,negated_conjecture,
    union(esk1_0,esk1_0) != esk1_0,
    inference(split_conjunct,[status(thm)],[c_0_4]) ).

cnf(c_0_8,plain,
    ( union(X1,X2) = X2
    | ~ subset(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_5]) ).

cnf(c_0_9,plain,
    subset(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_10,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_7,c_0_8]),c_0_9])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.12/0.12  % Problem    : SET002+3 : TPTP v9.2.0. Released v2.2.0.
% 0.12/0.12  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.12/0.32  % Computer : n026.cluster.edu
% 0.12/0.32  % Model    : x86_64 x86_64
% 0.12/0.32  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.32  % Memory   : 8042.1875MB
% 0.12/0.32  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.32  % CPULimit   : 300
% 0.12/0.32  % WCLimit    : 300
% 0.12/0.32  % DateTime   : Fri Sep 26 14:20:08 EDT 2025
% 0.12/0.32  % CPUTime    : 
% 0.19/0.46  Running first-order theorem proving
% 0.19/0.47  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.48  # Version: 3.0.0
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.48  # Starting new_bool_1 with 300s (1) cores
% 0.19/0.48  # Starting sh5l with 300s (1) cores
% 0.19/0.48  # new_bool_3 with pid 25216 completed with status 0
% 0.19/0.48  # Result found by new_bool_3
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.48  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.48  # Search class: FGUSS-FFSF22-SFFFFFNN
% 0.19/0.48  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.48  # Starting U----_206c_00_C07_23_F1_SE_PI_CS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.19/0.48  # U----_206c_00_C07_23_F1_SE_PI_CS_SP_PS_S5PRR_RG_S04AN with pid 25222 completed with status 0
% 0.19/0.48  # Result found by U----_206c_00_C07_23_F1_SE_PI_CS_SP_PS_S5PRR_RG_S04AN
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.48  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.48  # Search class: FGUSS-FFSF22-SFFFFFNN
% 0.19/0.48  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.48  # Starting U----_206c_00_C07_23_F1_SE_PI_CS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.19/0.48  # Preprocessing time       : 0.001 s
% 0.19/0.48  # Presaturation interreduction done
% 0.19/0.48  
% 0.19/0.48  # Proof found!
% 0.19/0.48  # SZS status Theorem
% 0.19/0.48  # SZS output start CNFRefutation
% See solution above
% 0.19/0.48  # Parsed axioms                        : 8
% 0.19/0.48  # Removed by relevancy pruning/SinE    : 0
% 0.19/0.48  # Initial clauses                      : 17
% 0.19/0.48  # Removed in clause preprocessing      : 2
% 0.19/0.48  # Initial clauses in saturation        : 15
% 0.19/0.48  # Processed clauses                    : 19
% 0.19/0.48  # ...of these trivial                  : 0
% 0.19/0.48  # ...subsumed                          : 0
% 0.19/0.48  # ...remaining for further processing  : 19
% 0.19/0.48  # Other redundant clauses eliminated   : 2
% 0.19/0.48  # Clauses deleted for lack of memory   : 0
% 0.19/0.48  # Backward-subsumed                    : 0
% 0.19/0.48  # Backward-rewritten                   : 0
% 0.19/0.48  # Generated clauses                    : 7
% 0.19/0.48  # ...of the previous two non-redundant : 2
% 0.19/0.48  # ...aggressively subsumed             : 0
% 0.19/0.48  # Contextual simplify-reflections      : 0
% 0.19/0.48  # Paramodulations                      : 5
% 0.19/0.48  # Factorizations                       : 0
% 0.19/0.48  # NegExts                              : 0
% 0.19/0.48  # Equation resolutions                 : 2
% 0.19/0.48  # Disequality decompositions           : 0
% 0.19/0.48  # Total rewrite steps                  : 3
% 0.19/0.48  # ...of those cached                   : 1
% 0.19/0.48  # Propositional unsat checks           : 0
% 0.19/0.48  #    Propositional check models        : 0
% 0.19/0.48  #    Propositional check unsatisfiable : 0
% 0.19/0.48  #    Propositional clauses             : 0
% 0.19/0.48  #    Propositional clauses after purity: 0
% 0.19/0.48  #    Propositional unsat core size     : 0
% 0.19/0.48  #    Propositional preprocessing time  : 0.000
% 0.19/0.48  #    Propositional encoding time       : 0.000
% 0.19/0.48  #    Propositional solver time         : 0.000
% 0.19/0.48  #    Success case prop preproc time    : 0.000
% 0.19/0.48  #    Success case prop encoding time   : 0.000
% 0.19/0.48  #    Success case prop solver time     : 0.000
% 0.19/0.48  # Current number of processed clauses  : 4
% 0.19/0.48  #    Positive orientable unit clauses  : 1
% 0.19/0.48  #    Positive unorientable unit clauses: 1
% 0.19/0.48  #    Negative unit clauses             : 1
% 0.19/0.48  #    Non-unit-clauses                  : 1
% 0.19/0.48  # Current number of unprocessed clauses: 11
% 0.19/0.48  # ...number of literals in the above   : 25
% 0.19/0.48  # Current number of archived formulas  : 0
% 0.19/0.48  # Current number of archived clauses   : 13
% 0.19/0.48  # Clause-clause subsumption calls (NU) : 3
% 0.19/0.48  # Rec. Clause-clause subsumption calls : 3
% 0.19/0.48  # Non-unit clause-clause subsumptions  : 0
% 0.19/0.48  # Unit Clause-clause subsumption calls : 0
% 0.19/0.48  # Rewrite failures with RHS unbound    : 0
% 0.19/0.48  # BW rewrite match attempts            : 4
% 0.19/0.48  # BW rewrite match successes           : 4
% 0.19/0.48  # Condensation attempts                : 0
% 0.19/0.48  # Condensation successes               : 0
% 0.19/0.48  # Termbank termtop insertions          : 1016
% 0.19/0.48  # Search garbage collected termcells   : 276
% 0.19/0.48  
% 0.19/0.48  # -------------------------------------------------
% 0.19/0.48  # User time                : 0.004 s
% 0.19/0.48  # System time              : 0.001 s
% 0.19/0.48  # Total time               : 0.005 s
% 0.19/0.48  # Maximum resident set size: 1728 pages
% 0.19/0.48  
% 0.19/0.48  # -------------------------------------------------
% 0.19/0.48  # User time                : 0.005 s
% 0.19/0.48  # System time              : 0.003 s
% 0.19/0.48  # Total time               : 0.008 s
% 0.19/0.48  # Maximum resident set size: 1700 pages
% 0.19/0.48  % E exiting
% 0.19/0.48  % E exiting
%------------------------------------------------------------------------------
