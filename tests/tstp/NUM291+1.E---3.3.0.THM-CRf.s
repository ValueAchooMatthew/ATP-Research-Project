
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : NUM291+1 : TPTP v9.2.0. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n006.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 07:58:48 PM UTC 2025

% Result   : Theorem 0.20s 0.51s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    5
%            Number of leaves      :    6
% Syntax   : Number of formulae    :   20 (  11 unt;   0 def)
%            Number of atoms       :   43 (   4 equ)
%            Maximal formula atoms :    7 (   2 avg)
%            Number of connectives :   44 (  21   ~;  14   |;   6   &)
%                                         (   2 ;   1  =>;   0  )
%            Maximal formula depth :    9 (   3 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    5 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-1 aty)
%            Number of variables   :   23 (   0 sgn  14   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(less_entry_point_pos_pos,axiom,
    ! [X1,X2,X10,X11] :
      ( ( rdn_translate(X1,rdn_pos(X10))
        & rdn_translate(X2,rdn_pos(X11))
        & rdn_positive_less(X10,X11) )
     => less(X1,X2) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',less_entry_point_pos_pos) ).

fof(less_property,axiom,
    ! [X1,X2] :
      ( less(X1,X2)
     ( ~ less(X2,X1)
        & X2 != X1 ) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',less_property) ).

fof(rdn_positive_less23,axiom,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+1.ax',rdn_positive_less23) ).

fof(n3_not_less_n2,conjecture,
    ~ less(n3,n2),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',n3_not_less_n2) ).

fof(rdn3,axiom,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+0.ax',rdn3) ).

fof(rdn2,axiom,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    file('/export/starexec/sandbox2/benchmark/Axioms/NUM005+0.ax',rdn2) ).

fof(c_0_6,plain,
    ! [X33,X34,X35,X36] :
      ( ~ rdn_translate(X33,rdn_pos(X35))
      | ~ rdn_translate(X34,rdn_pos(X36))
      | ~ rdn_positive_less(X35,X36)
      | less(X33,X34) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[less_entry_point_pos_pos])])]) ).

fof(c_0_7,plain,
    ! [X1,X2] :
      ( less(X1,X2)
     ( ~ less(X2,X1)
        & X2 != X1 ) ),
    inference(fof_simplification,[status(thm)],[less_property]) ).

cnf(c_0_8,plain,
    ( less(X1,X3)
    | ~ rdn_translate(X1,rdn_pos(X2))
    | ~ rdn_translate(X3,rdn_pos(X4))
    | ~ rdn_positive_less(X2,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_9,plain,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    inference(split_conjunct,[status(thm)],[rdn_positive_less23]) ).

fof(c_0_10,plain,
    ! [X45,X46] :
      ( ( ~ less(X46,X45)
        | ~ less(X45,X46) )
      & ( X46 != X45
        | ~ less(X45,X46) )
      & ( less(X46,X45)
        | X46 = X45
        | less(X45,X46) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_7])])])]) ).

fof(c_0_11,negated_conjecture,
    less(n3,n2),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[n3_not_less_n2])]) ).

cnf(c_0_12,plain,
    ( less(X1,X2)
    | ~ rdn_translate(X2,rdn_pos(rdnn(n3)))
    | ~ rdn_translate(X1,rdn_pos(rdnn(n2))) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).

cnf(c_0_13,plain,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    inference(split_conjunct,[status(thm)],[rdn3]) ).

cnf(c_0_14,plain,
    ( ~ less(X1,X2)
    | ~ less(X2,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

cnf(c_0_15,negated_conjecture,
    less(n3,n2),
    inference(split_conjunct,[status(thm)],[c_0_11]) ).

cnf(c_0_16,plain,
    ( less(X1,n3)
    | ~ rdn_translate(X1,rdn_pos(rdnn(n2))) ),
    inference(spm,[status(thm)],[c_0_12,c_0_13]) ).

cnf(c_0_17,plain,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    inference(split_conjunct,[status(thm)],[rdn2]) ).

cnf(c_0_18,negated_conjecture,
    ~ less(n2,n3),
    inference(spm,[status(thm)],[c_0_14,c_0_15]) ).

cnf(c_0_19,plain,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_16,c_0_17]),c_0_18]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.11/0.12  % Problem    : NUM291+1 : TPTP v9.2.0. Released v3.1.0.
% 0.11/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.13/0.33  % Computer : n006.cluster.edu
% 0.13/0.33  % Model    : x86_64 x86_64
% 0.13/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.33  % Memory   : 8042.1875MB
% 0.13/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.33  % CPULimit   : 300
% 0.13/0.33  % WCLimit    : 300
% 0.13/0.33  % DateTime   : Sat Sep 27 00:45:38 EDT 2025
% 0.13/0.33  % CPUTime    : 
% 0.20/0.47  Running first-order theorem proving
% 0.20/0.47  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.51  # Version: 3.0.0
% 0.20/0.51  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.51  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.51  # Starting new_bool_1 with 600s (2) cores
% 0.20/0.51  # Starting sh5l with 300s (1) cores
% 0.20/0.51  # new_bool_1 with pid 10138 completed with status 0
% 0.20/0.51  # Result found by new_bool_1
% 0.20/0.51  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.51  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.51  # Starting new_bool_1 with 600s (2) cores
% 0.20/0.51  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.51  # Search class: FGHSF-FFMM21-SFFFFFNN
% 0.20/0.51  # Scheduled 6 strats onto 2 cores with 600 seconds (600 total)
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with 325s (1) cores
% 0.20/0.51  # Starting new_bool_1 with 61s (1) cores
% 0.20/0.51  # G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with pid 10142 completed with status 0
% 0.20/0.51  # Result found by G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v
% 0.20/0.51  # Preprocessing class: FSLMSMSLSSSNFFN.
% 0.20/0.51  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.51  # Starting G-E--_008_C45_F1_PI_SE_Q4_CS_SP_S4SI with 900s (3) cores
% 0.20/0.51  # Starting new_bool_3 with 600s (2) cores
% 0.20/0.51  # Starting new_bool_1 with 600s (2) cores
% 0.20/0.51  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.51  # Search class: FGHSF-FFMM21-SFFFFFNN
% 0.20/0.51  # Scheduled 6 strats onto 2 cores with 600 seconds (600 total)
% 0.20/0.51  # Starting G-E--_208_C18_F1_SE_CS_SP_PS_S5PRR_S2v with 325s (1) cores
% 0.20/0.51  # Preprocessing time       : 0.002 s
% 0.20/0.51  # Presaturation interreduction done
% 0.20/0.51  
% 0.20/0.51  # Proof found!
% 0.20/0.51  # SZS status Theorem
% 0.20/0.51  # SZS output start CNFRefutation
% See solution above
% 0.20/0.51  # Parsed axioms                        : 402
% 0.20/0.51  # Removed by relevancy pruning/SinE    : 276
% 0.20/0.51  # Initial clauses                      : 128
% 0.20/0.51  # Removed in clause preprocessing      : 0
% 0.20/0.51  # Initial clauses in saturation        : 128
% 0.20/0.51  # Processed clauses                    : 183
% 0.20/0.51  # ...of these trivial                  : 0
% 0.20/0.51  # ...subsumed                          : 0
% 0.20/0.51  # ...remaining for further processing  : 183
% 0.20/0.51  # Other redundant clauses eliminated   : 1
% 0.20/0.51  # Clauses deleted for lack of memory   : 0
% 0.20/0.51  # Backward-subsumed                    : 0
% 0.20/0.51  # Backward-rewritten                   : 0
% 0.20/0.51  # Generated clauses                    : 59
% 0.20/0.51  # ...of the previous two non-redundant : 54
% 0.20/0.51  # ...aggressively subsumed             : 0
% 0.20/0.51  # Contextual simplify-reflections      : 0
% 0.20/0.51  # Paramodulations                      : 56
% 0.20/0.51  # Factorizations                       : 2
% 0.20/0.51  # NegExts                              : 0
% 0.20/0.51  # Equation resolutions                 : 1
% 0.20/0.51  # Disequality decompositions           : 0
% 0.20/0.51  # Total rewrite steps                  : 0
% 0.20/0.51  # ...of those cached                   : 0
% 0.20/0.51  # Propositional unsat checks           : 0
% 0.20/0.51  #    Propositional check models        : 0
% 0.20/0.51  #    Propositional check unsatisfiable : 0
% 0.20/0.51  #    Propositional clauses             : 0
% 0.20/0.51  #    Propositional clauses after purity: 0
% 0.20/0.51  #    Propositional unsat core size     : 0
% 0.20/0.51  #    Propositional preprocessing time  : 0.000
% 0.20/0.51  #    Propositional encoding time       : 0.000
% 0.20/0.51  #    Propositional solver time         : 0.000
% 0.20/0.51  #    Success case prop preproc time    : 0.000
% 0.20/0.51  #    Success case prop encoding time   : 0.000
% 0.20/0.51  #    Success case prop solver time     : 0.000
% 0.20/0.51  # Current number of processed clauses  : 54
% 0.20/0.51  #    Positive orientable unit clauses  : 31
% 0.20/0.51  #    Positive unorientable unit clauses: 0
% 0.20/0.51  #    Negative unit clauses             : 2
% 0.20/0.51  #    Non-unit-clauses                  : 21
% 0.20/0.51  # Current number of unprocessed clauses: 127
% 0.20/0.51  # ...number of literals in the above   : 172
% 0.20/0.51  # Current number of archived formulas  : 0
% 0.20/0.51  # Current number of archived clauses   : 128
% 0.20/0.51  # Clause-clause subsumption calls (NU) : 77
% 0.20/0.51  # Rec. Clause-clause subsumption calls : 63
% 0.20/0.51  # Non-unit clause-clause subsumptions  : 0
% 0.20/0.51  # Unit Clause-clause subsumption calls : 2
% 0.20/0.51  # Rewrite failures with RHS unbound    : 0
% 0.20/0.51  # BW rewrite match attempts            : 0
% 0.20/0.51  # BW rewrite match successes           : 0
% 0.20/0.51  # Condensation attempts                : 0
% 0.20/0.51  # Condensation successes               : 0
% 0.20/0.51  # Termbank termtop insertions          : 9282
% 0.20/0.51  # Search garbage collected termcells   : 1549
% 0.20/0.51  
% 0.20/0.51  # -------------------------------------------------
% 0.20/0.51  # User time                : 0.013 s
% 0.20/0.51  # System time              : 0.004 s
% 0.20/0.51  # Total time               : 0.017 s
% 0.20/0.51  # Maximum resident set size: 2676 pages
% 0.20/0.51  
% 0.20/0.51  # -------------------------------------------------
% 0.20/0.51  # User time                : 0.030 s
% 0.20/0.51  # System time              : 0.008 s
% 0.20/0.51  # Total time               : 0.038 s
% 0.20/0.51  # Maximum resident set size: 2080 pages
% 0.20/0.51  % E exiting
% 0.20/0.51  % E exiting
%------------------------------------------------------------------------------
