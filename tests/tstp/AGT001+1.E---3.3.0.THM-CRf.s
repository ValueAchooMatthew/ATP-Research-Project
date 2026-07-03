
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : AGT001+1 : TPTP v9.2.0. Bugfixed v3.1.0.
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
% DateTime : Mon Sep 29 02:32:16 PM UTC 2025

% Result   : Theorem 0.19s 0.53s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    2
% Syntax   : Number of formulae    :    7 (   7 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    3 (   3   ~;   0   |;   0   &)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    2 (   1 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-4 aty)
%            Number of functors    :    4 (   4 usr;   4 con; 0-0 aty)
%            Number of variables   :    0 (   0 sgn   0   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="query_1"></A>fof(query_1,conjecture,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',query_1) ).

<A NAME="event_27"></A>fof(event_27,axiom,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/Axioms/AGT001+1.ax',event_27) ).

<A NAME="c_0_2"></A>fof(c_0_2,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[query_1])]) ).

<A NAME="c_0_3"></A>fof(c_0_3,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(fof_nnf,[status(thm)],[<A HREF="#c_0_2">c_0_2</A>]) ).

<A NAME="c_0_4"></A>cnf(c_0_4,plain,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(split_conjunct,[status(thm)],[<A HREF="#event_27">event_27</A>]) ).

<A NAME="c_0_5"></A>cnf(c_0_5,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(split_conjunct,[status(thm)],[<A HREF="#c_0_3">c_0_3</A>]) ).

<A NAME="c_0_6"></A>cnf(c_0_6,plain,
    $false,
    inference(sr,[status(thm)],[<A HREF="#c_0_4">c_0_4</A>,<A HREF="#c_0_5">c_0_5</A>]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.08/0.12  % Problem    : AGT001+1 : TPTP v9.2.0. Bugfixed v3.1.0.
% 0.08/0.12  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.12/0.32  % Computer : n001.cluster.edu
% 0.12/0.32  % Model    : x86_64 x86_64
% 0.12/0.32  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.32  % Memory   : 8042.1875MB
% 0.12/0.32  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.32  % CPULimit   : 300
% 0.12/0.32  % WCLimit    : 300
% 0.12/0.32  % DateTime   : Fri Sep 26 09:50:53 EDT 2025
% 0.12/0.32  % CPUTime    : 
% 0.19/0.48  Running first-order theorem proving
% 0.19/0.48  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.53  # Version: 3.0.0
% 0.19/0.53  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.19/0.53  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.53  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.19/0.53  # Starting new_bool_3 with 600s (2) cores
% 0.19/0.53  # Starting new_bool_1 with 600s (2) cores
% 0.19/0.53  # Starting sh5l with 300s (1) cores
% 0.19/0.53  # new_bool_1 with pid 27181 completed with status 0
% 0.19/0.53  # Result found by new_bool_1
% 0.19/0.53  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.19/0.53  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.53  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.19/0.53  # Starting new_bool_3 with 600s (2) cores
% 0.19/0.53  # Starting new_bool_1 with 600s (2) cores
% 0.19/0.53  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.53  # Search class: FUUNF-FFMM11-SFFFFFNN
% 0.19/0.53  # partial match(1): FHUNF-FFMM11-SFFFFFNN
% 0.19/0.53  # Scheduled 5 strats onto 2 cores with 600 seconds (600 total)
% 0.19/0.53  # Starting SAT001_MinMin_p005000_rr_RG with 361s (1) cores
% 0.19/0.53  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S0Y with 61s (1) cores
% 0.19/0.53  # G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S0Y with pid 27184 completed with status 0
% 0.19/0.53  # Result found by G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S0Y
% 0.19/0.53  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.19/0.53  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.53  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.19/0.53  # Starting new_bool_3 with 600s (2) cores
% 0.19/0.53  # Starting new_bool_1 with 600s (2) cores
% 0.19/0.53  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.19/0.53  # Search class: FUUNF-FFMM11-SFFFFFNN
% 0.19/0.53  # partial match(1): FHUNF-FFMM11-SFFFFFNN
% 0.19/0.53  # Scheduled 5 strats onto 2 cores with 600 seconds (600 total)
% 0.19/0.53  # Starting SAT001_MinMin_p005000_rr_RG with 361s (1) cores
% 0.19/0.53  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S0Y with 61s (1) cores
% 0.19/0.53  # Preprocessing time       : 0.003 s
% 0.19/0.53  # Presaturation interreduction done
% 0.19/0.53  
% 0.19/0.53  # Proof found!
% 0.19/0.53  # SZS status Theorem
% 0.19/0.53  # SZS output start CNFRefutation
% See solution above
% 0.19/0.53  # Parsed axioms                        : 556
% 0.19/0.53  # Removed by relevancy pruning/SinE    : 303
% 0.19/0.53  # Initial clauses                      : 253
% 0.19/0.53  # Removed in clause preprocessing      : 0
% 0.19/0.53  # Initial clauses in saturation        : 253
% 0.19/0.53  # Processed clauses                    : 3
% 0.19/0.53  # ...of these trivial                  : 0
% 0.19/0.53  # ...subsumed                          : 0
% 0.19/0.53  # ...remaining for further processing  : 2
% 0.19/0.53  # Other redundant clauses eliminated   : 0
% 0.19/0.53  # Clauses deleted for lack of memory   : 0
% 0.19/0.53  # Backward-subsumed                    : 0
% 0.19/0.53  # Backward-rewritten                   : 0
% 0.19/0.53  # Generated clauses                    : 0
% 0.19/0.53  # ...of the previous two non-redundant : 0
% 0.19/0.53  # ...aggressively subsumed             : 0
% 0.19/0.53  # Contextual simplify-reflections      : 0
% 0.19/0.53  # Paramodulations                      : 0
% 0.19/0.53  # Factorizations                       : 0
% 0.19/0.53  # NegExts                              : 0
% 0.19/0.53  # Equation resolutions                 : 0
% 0.19/0.53  # Disequality decompositions           : 0
% 0.19/0.53  # Total rewrite steps                  : 0
% 0.19/0.53  # ...of those cached                   : 0
% 0.19/0.53  # Propositional unsat checks           : 0
% 0.19/0.53  #    Propositional check models        : 0
% 0.19/0.53  #    Propositional check unsatisfiable : 0
% 0.19/0.53  #    Propositional clauses             : 0
% 0.19/0.53  #    Propositional clauses after purity: 0
% 0.19/0.53  #    Propositional unsat core size     : 0
% 0.19/0.53  #    Propositional preprocessing time  : 0.000
% 0.19/0.53  #    Propositional encoding time       : 0.000
% 0.19/0.53  #    Propositional solver time         : 0.000
% 0.19/0.53  #    Success case prop preproc time    : 0.000
% 0.19/0.53  #    Success case prop encoding time   : 0.000
% 0.19/0.53  #    Success case prop solver time     : 0.000
% 0.19/0.53  # Current number of processed clauses  : 2
% 0.19/0.53  #    Positive orientable unit clauses  : 1
% 0.19/0.53  #    Positive unorientable unit clauses: 0
% 0.19/0.53  #    Negative unit clauses             : 1
% 0.19/0.53  #    Non-unit-clauses                  : 0
% 0.19/0.53  # Current number of unprocessed clauses: 250
% 0.19/0.53  # ...number of literals in the above   : 250
% 0.19/0.53  # Current number of archived formulas  : 0
% 0.19/0.53  # Current number of archived clauses   : 0
% 0.19/0.53  # Clause-clause subsumption calls (NU) : 0
% 0.19/0.53  # Rec. Clause-clause subsumption calls : 0
% 0.19/0.53  # Non-unit clause-clause subsumptions  : 0
% 0.19/0.53  # Unit Clause-clause subsumption calls : 0
% 0.19/0.53  # Rewrite failures with RHS unbound    : 0
% 0.19/0.53  # BW rewrite match attempts            : 0
% 0.19/0.53  # BW rewrite match successes           : 0
% 0.19/0.53  # Condensation attempts                : 0
% 0.19/0.53  # Condensation successes               : 0
% 0.19/0.53  # Termbank termtop insertions          : 9396
% 0.19/0.53  # Search garbage collected termcells   : 1549
% 0.19/0.53  
% 0.19/0.53  # -------------------------------------------------
% 0.19/0.53  # User time                : 0.009 s
% 0.19/0.53  # System time              : 0.007 s
% 0.19/0.53  # Total time               : 0.016 s
% 0.19/0.53  # Maximum resident set size: 3056 pages
% 0.19/0.53  
% 0.19/0.53  # -------------------------------------------------
% 0.19/0.53  # User time                : 0.026 s
% 0.19/0.53  # System time              : 0.014 s
% 0.19/0.53  # Total time               : 0.039 s
% 0.19/0.53  # Maximum resident set size: 2176 pages
% 0.19/0.53  % E exiting
% 0.19/0.53  % E exiting
%------------------------------------------------------------------------------
