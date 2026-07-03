
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : SYN000+1 : TPTP v9.2.0. Released v4.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n020.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 11:22:35 PM UTC 2025

% Result   : Theorem 0.19s 0.49s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    2
% Syntax   : Number of formulae    :    7 (   7 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    3 (   3   ~;   0   |;   0   &)
%                                         (   0 ;   0  =>;   0  )
%            Maximal formula depth :    3 (   2 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-1 aty)
%            Number of functors    :    1 (   1 usr;   1 con; 0-0 aty)
%            Number of variables   :    4 (   1 sgn   1   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(role_conjecture,conjecture,
    ? [X1] : p(X1),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_conjecture) ).

fof(role_hypothesis,hypothesis,
    p(h),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_hypothesis) ).

fof(c_0_2,negated_conjecture,
    ~ ? [X1] : p(X1),
    inference(assume_negation,[status(cth)],[role_conjecture]) ).

fof(c_0_3,negated_conjecture,
    ! [X4] : ~ p(X4),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_2])])]) ).

cnf(c_0_4,hypothesis,
    p(h),
    inference(split_conjunct,[status(thm)],[role_hypothesis]) ).

cnf(c_0_5,negated_conjecture,
    ~ p(X1),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_6,hypothesis,
    $false,
    inference(sr,[status(thm)],[c_0_4,c_0_5]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.06/0.12  % Problem    : SYN000+1 : TPTP v9.2.0. Released v4.0.0.
% 0.06/0.12  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.12/0.33  % Computer : n020.cluster.edu
% 0.12/0.33  % Model    : x86_64 x86_64
% 0.12/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.33  % Memory   : 8042.1875MB
% 0.12/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.33  % CPULimit   : 300
% 0.12/0.33  % WCLimit    : 300
% 0.12/0.33  % DateTime   : Fri Sep 26 14:34:53 EDT 2025
% 0.12/0.33  % CPUTime    : 
% 0.19/0.48  Running first-order theorem proving
% 0.19/0.48  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.49  # Version: 3.0.0
% 0.19/0.49  # Preprocessing class: FSMSSLSSSSSNFFN.
% 0.19/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.49  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_RG_S04AI with 1500s (5) cores
% 0.19/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.19/0.49  # Starting sh5l with 300s (1) cores
% 0.19/0.49  # new_bool_3 with pid 32108 completed with status 0
% 0.19/0.49  # Result found by new_bool_3
% 0.19/0.49  # Preprocessing class: FSMSSLSSSSSNFFN.
% 0.19/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.49  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_RG_S04AI with 1500s (5) cores
% 0.19/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.49  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.49  # Search class: FUUNF-FFSF00-SFFFFFNN
% 0.19/0.49  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.49  # SAT001_MinMin_p005000_rr_RG with pid 32111 completed with status 0
% 0.19/0.49  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.19/0.49  # Preprocessing class: FSMSSLSSSSSNFFN.
% 0.19/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.49  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_RG_S04AI with 1500s (5) cores
% 0.19/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.49  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.49  # Search class: FUUNF-FFSF00-SFFFFFNN
% 0.19/0.49  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.19/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.19/0.49  # Preprocessing time       : 0.001 s
% 0.19/0.49  # Presaturation interreduction done
% 0.19/0.49  
% 0.19/0.49  # Proof found!
% 0.19/0.49  # SZS status Theorem
% 0.19/0.49  # SZS output start CNFRefutation
% See solution above
% 0.19/0.49  # Parsed axioms                        : 12
% 0.19/0.49  # Removed by relevancy pruning/SinE    : 10
% 0.19/0.49  # Initial clauses                      : 2
% 0.19/0.49  # Removed in clause preprocessing      : 0
% 0.19/0.49  # Initial clauses in saturation        : 2
% 0.19/0.49  # Processed clauses                    : 2
% 0.19/0.49  # ...of these trivial                  : 0
% 0.19/0.49  # ...subsumed                          : 0
% 0.19/0.49  # ...remaining for further processing  : 2
% 0.19/0.49  # Other redundant clauses eliminated   : 0
% 0.19/0.49  # Clauses deleted for lack of memory   : 0
% 0.19/0.49  # Backward-subsumed                    : 0
% 0.19/0.49  # Backward-rewritten                   : 0
% 0.19/0.49  # Generated clauses                    : 1
% 0.19/0.49  # ...of the previous two non-redundant : 0
% 0.19/0.49  # ...aggressively subsumed             : 0
% 0.19/0.49  # Contextual simplify-reflections      : 0
% 0.19/0.50  # Paramodulations                      : 0
% 0.19/0.50  # Factorizations                       : 0
% 0.19/0.50  # NegExts                              : 0
% 0.19/0.50  # Equation resolutions                 : 0
% 0.19/0.50  # Disequality decompositions           : 0
% 0.19/0.50  # Total rewrite steps                  : 0
% 0.19/0.50  # ...of those cached                   : 0
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
% 0.19/0.50  # Current number of processed clauses  : 1
% 0.19/0.50  #    Positive orientable unit clauses  : 0
% 0.19/0.50  #    Positive unorientable unit clauses: 0
% 0.19/0.50  #    Negative unit clauses             : 1
% 0.19/0.50  #    Non-unit-clauses                  : 0
% 0.19/0.50  # Current number of unprocessed clauses: 0
% 0.19/0.50  # ...number of literals in the above   : 0
% 0.19/0.50  # Current number of archived formulas  : 0
% 0.19/0.50  # Current number of archived clauses   : 1
% 0.19/0.50  # Clause-clause subsumption calls (NU) : 0
% 0.19/0.50  # Rec. Clause-clause subsumption calls : 0
% 0.19/0.50  # Non-unit clause-clause subsumptions  : 0
% 0.19/0.50  # Unit Clause-clause subsumption calls : 0
% 0.19/0.50  # Rewrite failures with RHS unbound    : 0
% 0.19/0.50  # BW rewrite match attempts            : 0
% 0.19/0.50  # BW rewrite match successes           : 0
% 0.19/0.50  # Condensation attempts                : 0
% 0.19/0.50  # Condensation successes               : 0
% 0.19/0.50  # Termbank termtop insertions          : 182
% 0.19/0.50  # Search garbage collected termcells   : 81
% 0.19/0.50  
% 0.19/0.50  # -------------------------------------------------
% 0.19/0.50  # User time                : 0.000 s
% 0.19/0.50  # System time              : 0.004 s
% 0.19/0.50  # Total time               : 0.004 s
% 0.19/0.50  # Maximum resident set size: 1780 pages
% 0.19/0.50  
% 0.19/0.50  # -------------------------------------------------
% 0.19/0.50  # User time                : 0.000 s
% 0.19/0.50  # System time              : 0.007 s
% 0.19/0.50  # Total time               : 0.007 s
% 0.19/0.50  # Maximum resident set size: 1732 pages
% 0.19/0.50  % E exiting
% 0.19/0.50  % E exiting
%------------------------------------------------------------------------------
