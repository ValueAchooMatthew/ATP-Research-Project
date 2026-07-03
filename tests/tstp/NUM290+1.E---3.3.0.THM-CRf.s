
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : NUM290+1 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n029.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 07:58:48 PM UTC 2025

% Result   : Theorem 0.20s 0.52s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    5
%            Number of leaves      :    5
% Syntax   : Number of formulae    :   16 (  11 unt;   0 def)
%            Number of atoms       :   28 (   0 equ)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :   24 (  12   ~;   9   |;   2   &)
%                                         (   0 ;   1  =>;   0  )
%            Maximal formula depth :    9 (   3 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-1 aty)
%            Number of variables   :   15 (   0 sgn   8   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(less_entry_point_pos_pos,axiom,
    ! [X1,X2,X10,X11] :
      ( ( rdn_translate(X1,rdn_pos(X10))
        & rdn_translate(X2,rdn_pos(X11))
        & rdn_positive_less(X10,X11) )
     => less(X1,X2) ),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+1.ax',less_entry_point_pos_pos) ).

fof(rdn_positive_less23,axiom,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+1.ax',rdn_positive_less23) ).

fof(n2_less_n3,conjecture,
    less(n2,n3),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',n2_less_n3) ).

fof(rdn3,axiom,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+0.ax',rdn3) ).

fof(rdn2,axiom,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    file('/export/starexec/sandbox/benchmark/Axioms/NUM005+0.ax',rdn2) ).

fof(c_0_5,plain,
    ! [X33,X34,X35,X36] :
      ( ~ rdn_translate(X33,rdn_pos(X35))
      | ~ rdn_translate(X34,rdn_pos(X36))
      | ~ rdn_positive_less(X35,X36)
      | less(X33,X34) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[less_entry_point_pos_pos])])]) ).

cnf(c_0_6,plain,
    ( less(X1,X3)
    | ~ rdn_translate(X1,rdn_pos(X2))
    | ~ rdn_translate(X3,rdn_pos(X4))
    | ~ rdn_positive_less(X2,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_5]) ).

cnf(c_0_7,plain,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    inference(split_conjunct,[status(thm)],[rdn_positive_less23]) ).

fof(c_0_8,negated_conjecture,
    ~ less(n2,n3),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[n2_less_n3])]) ).

cnf(c_0_9,plain,
    ( less(X1,X2)
    | ~ rdn_translate(X2,rdn_pos(rdnn(n3)))
    | ~ rdn_translate(X1,rdn_pos(rdnn(n2))) ),
    inference(spm,[status(thm)],[c_0_6,c_0_7]) ).

cnf(c_0_10,plain,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    inference(split_conjunct,[status(thm)],[rdn3]) ).

fof(c_0_11,negated_conjecture,
    ~ less(n2,n3),
    inference(fof_nnf,[status(thm)],[c_0_8]) ).

cnf(c_0_12,plain,
    ( less(X1,n3)
    | ~ rdn_translate(X1,rdn_pos(rdnn(n2))) ),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).

cnf(c_0_13,plain,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    inference(split_conjunct,[status(thm)],[rdn2]) ).

cnf(c_0_14,negated_conjecture,
    ~ less(n2,n3),
    inference(split_conjunct,[status(thm)],[c_0_11]) ).

cnf(c_0_15,plain,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.04/0.12  % Problem    : NUM290+1 : TPTP v9.2.0. Released v3.1.0.
% 0.04/0.12  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.12/0.34  % Computer : n029.cluster.edu
% 0.12/0.34  % Model    : x86_64 x86_64
% 0.12/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.34  % Memory   : 8042.1875MB
% 0.12/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.34  % CPULimit   : 300
% 0.12/0.34  % WCLimit    : 300
% 0.12/0.34  % DateTime   : Sat Sep 27 00:08:53 EDT 2025
% 0.12/0.34  % CPUTime    : 
% 0.20/0.49  Running first-order theorem proving
% 0.20/0.49  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.20/0.52  # Version: 3.0.0
% 0.20/0.52  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.52  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.52  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.52  # Starting new_bool_1 with 600s (2) cores
% 0.20/0.52  # Starting sh5l with 300s (1) cores
% 0.20/0.52  # new_bool_3 with pid 4910 completed with status 0
% 0.20/0.52  # Result found by new_bool_3
% 0.20/0.52  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.52  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.52  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.52  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.52  # Search class: FGHSF-FFMM21-SFFFFFNN
% 0.20/0.52  # Scheduled 6 strats onto 2 cores with 600 seconds (600 total)
% 0.20/0.52  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with 325s (1) cores
% 0.20/0.52  # Starting new_bool_3 with 61s (1) cores
% 0.20/0.52  # G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with pid 4917 completed with status 0
% 0.20/0.52  # Result found by G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v
% 0.20/0.52  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.52  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.52  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.52  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.52  # Search class: FGHSF-FFMM21-SFFFFFNN
% 0.20/0.52  # Scheduled 6 strats onto 2 cores with 600 seconds (600 total)
% 0.20/0.52  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with 325s (1) cores
% 0.20/0.52  # Preprocessing time       : 0.002 s
% 0.20/0.52  # Presaturation interreduction done
% 0.20/0.52  
% 0.20/0.52  # Proof found!
% 0.20/0.52  # SZS status Theorem
% 0.20/0.52  # SZS output start CNFRefutation
% See solution above
% 0.20/0.52  # Parsed axioms                        : 402
% 0.20/0.52  # Removed by relevancy pruning/SinE    : 276
% 0.20/0.52  # Initial clauses                      : 128
% 0.20/0.52  # Removed in clause preprocessing      : 0
% 0.20/0.52  # Initial clauses in saturation        : 128
% 0.20/0.52  # Processed clauses                    : 183
% 0.20/0.52  # ...of these trivial                  : 0
% 0.20/0.52  # ...subsumed                          : 0
% 0.20/0.52  # ...remaining for further processing  : 183
% 0.20/0.52  # Other redundant clauses eliminated   : 1
% 0.20/0.52  # Clauses deleted for lack of memory   : 0
% 0.20/0.52  # Backward-subsumed                    : 0
% 0.20/0.52  # Backward-rewritten                   : 0
% 0.20/0.52  # Generated clauses                    : 58
% 0.20/0.52  # ...of the previous two non-redundant : 53
% 0.20/0.52  # ...aggressively subsumed             : 0
% 0.20/0.52  # Contextual simplify-reflections      : 0
% 0.20/0.52  # Paramodulations                      : 55
% 0.20/0.52  # Factorizations                       : 2
% 0.20/0.52  # NegExts                              : 0
% 0.20/0.52  # Equation resolutions                 : 1
% 0.20/0.52  # Disequality decompositions           : 0
% 0.20/0.52  # Total rewrite steps                  : 0
% 0.20/0.52  # ...of those cached                   : 0
% 0.20/0.52  # Propositional unsat checks           : 0
% 0.20/0.52  #    Propositional check models        : 0
% 0.20/0.52  #    Propositional check unsatisfiable : 0
% 0.20/0.52  #    Propositional clauses             : 0
% 0.20/0.52  #    Propositional clauses after purity: 0
% 0.20/0.52  #    Propositional unsat core size     : 0
% 0.20/0.52  #    Propositional preprocessing time  : 0.000
% 0.20/0.52  #    Propositional encoding time       : 0.000
% 0.20/0.52  #    Propositional solver time         : 0.000
% 0.20/0.52  #    Success case prop preproc time    : 0.000
% 0.20/0.52  #    Success case prop encoding time   : 0.000
% 0.20/0.52  #    Success case prop solver time     : 0.000
% 0.20/0.52  # Current number of processed clauses  : 54
% 0.20/0.52  #    Positive orientable unit clauses  : 31
% 0.20/0.52  #    Positive unorientable unit clauses: 0
% 0.20/0.52  #    Negative unit clauses             : 2
% 0.20/0.52  #    Non-unit-clauses                  : 21
% 0.20/0.52  # Current number of unprocessed clauses: 126
% 0.20/0.52  # ...number of literals in the above   : 171
% 0.20/0.52  # Current number of archived formulas  : 0
% 0.20/0.52  # Current number of archived clauses   : 128
% 0.20/0.52  # Clause-clause subsumption calls (NU) : 74
% 0.20/0.52  # Rec. Clause-clause subsumption calls : 60
% 0.20/0.52  # Non-unit clause-clause subsumptions  : 0
% 0.20/0.52  # Unit Clause-clause subsumption calls : 2
% 0.20/0.52  # Rewrite failures with RHS unbound    : 0
% 0.20/0.52  # BW rewrite match attempts            : 0
% 0.20/0.52  # BW rewrite match successes           : 0
% 0.20/0.52  # Condensation attempts                : 0
% 0.20/0.52  # Condensation successes               : 0
% 0.20/0.52  # Termbank termtop insertions          : 9275
% 0.20/0.52  # Search garbage collected termcells   : 1548
% 0.20/0.52  
% 0.20/0.52  # -------------------------------------------------
% 0.20/0.52  # User time                : 0.011 s
% 0.20/0.52  # System time              : 0.007 s
% 0.20/0.52  # Total time               : 0.018 s
% 0.20/0.52  # Maximum resident set size: 2680 pages
% 0.20/0.52  
% 0.20/0.52  # -------------------------------------------------
% 0.20/0.52  # User time                : 0.030 s
% 0.20/0.52  # System time              : 0.010 s
% 0.20/0.52  # Total time               : 0.040 s
% 0.20/0.52  # Maximum resident set size: 2080 pages
% 0.20/0.52  % E exiting
% 0.20/0.53  % E exiting
%------------------------------------------------------------------------------
