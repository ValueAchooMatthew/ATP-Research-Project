
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : AGT001+2 : TPTP v9.2.0. Bugfixed v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n020.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 02:32:17 PM UTC 2025

% Result   : Theorem 0.14s 0.43s
% Output   : CNFRefutation 0.14s
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
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query_1) ).

<A NAME="event_27"></A>fof(event_27,axiom,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox2/benchmark/Axioms/AGT001+1.ax',event_27) ).

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
% 0.02/0.09  % Problem    : AGT001+2 : TPTP v9.2.0. Bugfixed v3.1.0.
% 0.02/0.09  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.09/0.29  % Computer : n020.cluster.edu
% 0.09/0.29  % Model    : x86_64 x86_64
% 0.09/0.29  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.09/0.29  % Memory   : 8042.1875MB
% 0.09/0.29  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.09/0.29  % CPULimit   : 300
% 0.09/0.29  % WCLimit    : 300
% 0.09/0.29  % DateTime   : Fri Sep 26 09:51:08 EDT 2025
% 0.09/0.29  % CPUTime    : 
% 0.14/0.40  Running first-order theorem proving
% 0.14/0.40  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.14/0.43  # Version: 3.0.0
% 0.14/0.43  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.14/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.14/0.43  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.14/0.43  # Starting new_bool_3 with 600s (2) cores
% 0.14/0.43  # Starting new_bool_1 with 600s (2) cores
% 0.14/0.43  # Starting sh5l with 300s (1) cores
% 0.14/0.43  # new_bool_1 with pid 19042 completed with status 0
% 0.14/0.43  # Result found by new_bool_1
% 0.14/0.43  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.14/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.14/0.43  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.14/0.43  # Starting new_bool_3 with 600s (2) cores
% 0.14/0.43  # Starting new_bool_1 with 600s (2) cores
% 0.14/0.43  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.14/0.43  # Search class: FHUNF-FSLM11-SFFFFFNN
% 0.14/0.43  # partial match(2): FGUNF-FSLF11-SFFFFFNN
% 0.14/0.43  # Scheduled 5 strats onto 2 cores with 600 seconds (600 total)
% 0.14/0.43  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S5PRR_S2S with 225s (1) cores
% 0.14/0.43  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2S with 94s (1) cores
% 0.14/0.43  # G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2S with pid 19046 completed with status 0
% 0.14/0.43  # Result found by G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2S
% 0.14/0.43  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.14/0.43  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.14/0.43  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.14/0.43  # Starting new_bool_3 with 600s (2) cores
% 0.14/0.43  # Starting new_bool_1 with 600s (2) cores
% 0.14/0.43  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.14/0.43  # Search class: FHUNF-FSLM11-SFFFFFNN
% 0.14/0.43  # partial match(2): FGUNF-FSLF11-SFFFFFNN
% 0.14/0.43  # Scheduled 5 strats onto 2 cores with 600 seconds (600 total)
% 0.14/0.43  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S5PRR_S2S with 225s (1) cores
% 0.14/0.43  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2S with 94s (1) cores
% 0.14/0.43  # Preprocessing time       : 0.003 s
% 0.14/0.43  # Presaturation interreduction done
% 0.14/0.43  
% 0.14/0.43  # Proof found!
% 0.14/0.43  # SZS status Theorem
% 0.14/0.43  # SZS output start CNFRefutation
% See solution above
% 0.14/0.43  # Parsed axioms                        : 923
% 0.14/0.43  # Removed by relevancy pruning/SinE    : 442
% 0.14/0.43  # Initial clauses                      : 484
% 0.14/0.43  # Removed in clause preprocessing      : 0
% 0.14/0.43  # Initial clauses in saturation        : 484
% 0.14/0.43  # Processed clauses                    : 3
% 0.14/0.43  # ...of these trivial                  : 0
% 0.14/0.43  # ...subsumed                          : 0
% 0.14/0.43  # ...remaining for further processing  : 2
% 0.14/0.43  # Other redundant clauses eliminated   : 0
% 0.14/0.43  # Clauses deleted for lack of memory   : 0
% 0.14/0.43  # Backward-subsumed                    : 0
% 0.14/0.43  # Backward-rewritten                   : 0
% 0.14/0.43  # Generated clauses                    : 0
% 0.14/0.43  # ...of the previous two non-redundant : 0
% 0.14/0.43  # ...aggressively subsumed             : 0
% 0.14/0.43  # Contextual simplify-reflections      : 0
% 0.14/0.43  # Paramodulations                      : 0
% 0.14/0.43  # Factorizations                       : 0
% 0.14/0.43  # NegExts                              : 0
% 0.14/0.43  # Equation resolutions                 : 0
% 0.14/0.43  # Disequality decompositions           : 0
% 0.14/0.43  # Total rewrite steps                  : 0
% 0.14/0.43  # ...of those cached                   : 0
% 0.14/0.43  # Propositional unsat checks           : 0
% 0.14/0.43  #    Propositional check models        : 0
% 0.14/0.43  #    Propositional check unsatisfiable : 0
% 0.14/0.43  #    Propositional clauses             : 0
% 0.14/0.43  #    Propositional clauses after purity: 0
% 0.14/0.43  #    Propositional unsat core size     : 0
% 0.14/0.43  #    Propositional preprocessing time  : 0.000
% 0.14/0.43  #    Propositional encoding time       : 0.000
% 0.14/0.43  #    Propositional solver time         : 0.000
% 0.14/0.43  #    Success case prop preproc time    : 0.000
% 0.14/0.43  #    Success case prop encoding time   : 0.000
% 0.14/0.43  #    Success case prop solver time     : 0.000
% 0.14/0.43  # Current number of processed clauses  : 2
% 0.14/0.43  #    Positive orientable unit clauses  : 1
% 0.14/0.43  #    Positive unorientable unit clauses: 0
% 0.14/0.43  #    Negative unit clauses             : 1
% 0.14/0.43  #    Non-unit-clauses                  : 0
% 0.14/0.43  # Current number of unprocessed clauses: 481
% 0.14/0.43  # ...number of literals in the above   : 487
% 0.14/0.43  # Current number of archived formulas  : 0
% 0.14/0.43  # Current number of archived clauses   : 0
% 0.14/0.43  # Clause-clause subsumption calls (NU) : 0
% 0.14/0.43  # Rec. Clause-clause subsumption calls : 0
% 0.14/0.43  # Non-unit clause-clause subsumptions  : 0
% 0.14/0.43  # Unit Clause-clause subsumption calls : 0
% 0.14/0.43  # Rewrite failures with RHS unbound    : 0
% 0.14/0.43  # BW rewrite match attempts            : 0
% 0.14/0.43  # BW rewrite match successes           : 0
% 0.14/0.43  # Condensation attempts                : 0
% 0.14/0.43  # Condensation successes               : 0
% 0.14/0.43  # Termbank termtop insertions          : 14532
% 0.14/0.43  # Search garbage collected termcells   : 1856
% 0.14/0.43  
% 0.14/0.43  # -------------------------------------------------
% 0.14/0.43  # User time                : 0.009 s
% 0.14/0.43  # System time              : 0.003 s
% 0.14/0.43  # Total time               : 0.012 s
% 0.14/0.43  # Maximum resident set size: 3396 pages
% 0.14/0.43  
% 0.14/0.43  # -------------------------------------------------
% 0.14/0.43  # User time                : 0.019 s
% 0.14/0.43  # System time              : 0.008 s
% 0.14/0.43  # Total time               : 0.028 s
% 0.14/0.43  # Maximum resident set size: 2328 pages
% 0.14/0.43  % E exiting
% 0.14/0.43  % E exiting
%------------------------------------------------------------------------------
