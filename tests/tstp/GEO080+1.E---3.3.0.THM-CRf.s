
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : GEO080+1 : TPTP v9.2.0. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n011.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 04:50:43 PM UTC 2025

% Result   : Theorem 0.22s 0.52s
% Output   : CNFRefutation 0.22s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    2
% Syntax   : Number of formulae    :   10 (   6 unt;   0 def)
%            Number of atoms       :   20 (   0 equ)
%            Maximal formula atoms :    7 (   2 avg)
%            Number of connectives :   17 (   7   ~;   6   |;   2   &)
%                                         (   1 ;   1  =>;   0  )
%            Maximal formula depth :   10 (   3 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   15 (   0 sgn  10   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(prove_reflexivity,conjecture,
    ! [X1] : part_of(X1,X1),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_reflexivity) ).

fof(part_of_defn,axiom,
    ! [X1,X2] :
      ( part_of(X2,X1)
     ! [X3] :
          ( incident_c(X3,X2)
         => incident_c(X3,X1) ) ),
    file('/export/starexec/sandbox2/benchmark/Axioms/GEO004+0.ax',part_of_defn) ).

fof(c_0_2,negated_conjecture,
    ~ ! [X1] : part_of(X1,X1),
    inference(assume_negation,[status(cth)],[prove_reflexivity]) ).

fof(c_0_3,plain,
    ! [X9,X10,X11,X12,X13] :
      ( ( ~ part_of(X10,X9)
        | ~ incident_c(X11,X10)
        | incident_c(X11,X9) )
      & ( incident_c(esk2_2(X12,X13),X13)
        | part_of(X13,X12) )
      & ( ~ incident_c(esk2_2(X12,X13),X12)
        | part_of(X13,X12) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[part_of_defn])])])])])])]) ).

fof(c_0_4,negated_conjecture,
    ~ part_of(esk1_0,esk1_0),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_2])])])]) ).

cnf(c_0_5,plain,
    ( part_of(X2,X1)
    | ~ incident_c(esk2_2(X1,X2),X1) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_6,plain,
    ( incident_c(esk2_2(X1,X2),X2)
    | part_of(X2,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_7,negated_conjecture,
    ~ part_of(esk1_0,esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_4]) ).

cnf(c_0_8,plain,
    part_of(X1,X1),
    inference(spm,[status(thm)],[c_0_5,c_0_6]) ).

cnf(c_0_9,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[c_0_7,c_0_8])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.07/0.13  % Problem    : GEO080+1 : TPTP v9.2.0. Released v2.4.0.
% 0.07/0.13  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.14/0.34  % Computer : n011.cluster.edu
% 0.14/0.34  % Model    : x86_64 x86_64
% 0.14/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.34  % Memory   : 8042.1875MB
% 0.14/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.34  % CPULimit   : 300
% 0.14/0.34  % WCLimit    : 300
% 0.14/0.34  % DateTime   : Sat Sep 27 02:53:08 EDT 2025
% 0.14/0.35  % CPUTime    : 
% 0.22/0.50  Running first-order theorem proving
% 0.22/0.51  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.22/0.52  # Version: 3.0.0
% 0.22/0.52  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.22/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.22/0.52  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.22/0.52  # Starting new_bool_3 with 300s (1) cores
% 0.22/0.52  # Starting new_bool_1 with 300s (1) cores
% 0.22/0.52  # Starting sh5l with 300s (1) cores
% 0.22/0.52  # new_bool_3 with pid 5440 completed with status 0
% 0.22/0.52  # Result found by new_bool_3
% 0.22/0.52  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.22/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.22/0.52  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.22/0.52  # Starting new_bool_3 with 300s (1) cores
% 0.22/0.52  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.22/0.52  # Search class: FGHSF-FFMF32-SFFFFFNN
% 0.22/0.52  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.22/0.52  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.22/0.52  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 5443 completed with status 0
% 0.22/0.52  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.22/0.52  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.22/0.52  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.22/0.52  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.22/0.52  # Starting new_bool_3 with 300s (1) cores
% 0.22/0.52  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.22/0.52  # Search class: FGHSF-FFMF32-SFFFFFNN
% 0.22/0.52  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.22/0.52  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 181s (1) cores
% 0.22/0.52  # Preprocessing time       : 0.002 s
% 0.22/0.52  # Presaturation interreduction done
% 0.22/0.52  
% 0.22/0.52  # Proof found!
% 0.22/0.52  # SZS status Theorem
% 0.22/0.52  # SZS output start CNFRefutation
% See solution above
% 0.22/0.53  # Parsed axioms                        : 17
% 0.22/0.53  # Removed by relevancy pruning/SinE    : 6
% 0.22/0.53  # Initial clauses                      : 34
% 0.22/0.53  # Removed in clause preprocessing      : 0
% 0.22/0.53  # Initial clauses in saturation        : 34
% 0.22/0.53  # Processed clauses                    : 46
% 0.22/0.53  # ...of these trivial                  : 0
% 0.22/0.53  # ...subsumed                          : 0
% 0.22/0.53  # ...remaining for further processing  : 46
% 0.22/0.53  # Other redundant clauses eliminated   : 3
% 0.22/0.53  # Clauses deleted for lack of memory   : 0
% 0.22/0.53  # Backward-subsumed                    : 0
% 0.22/0.53  # Backward-rewritten                   : 1
% 0.22/0.53  # Generated clauses                    : 5
% 0.22/0.53  # ...of the previous two non-redundant : 5
% 0.22/0.53  # ...aggressively subsumed             : 0
% 0.22/0.53  # Contextual simplify-reflections      : 0
% 0.22/0.53  # Paramodulations                      : 2
% 0.22/0.53  # Factorizations                       : 0
% 0.22/0.53  # NegExts                              : 0
% 0.22/0.53  # Equation resolutions                 : 3
% 0.22/0.53  # Disequality decompositions           : 0
% 0.22/0.53  # Total rewrite steps                  : 1
% 0.22/0.53  # ...of those cached                   : 0
% 0.22/0.53  # Propositional unsat checks           : 0
% 0.22/0.53  #    Propositional check models        : 0
% 0.22/0.53  #    Propositional check unsatisfiable : 0
% 0.22/0.53  #    Propositional clauses             : 0
% 0.22/0.53  #    Propositional clauses after purity: 0
% 0.22/0.53  #    Propositional unsat core size     : 0
% 0.22/0.53  #    Propositional preprocessing time  : 0.000
% 0.22/0.53  #    Propositional encoding time       : 0.000
% 0.22/0.53  #    Propositional solver time         : 0.000
% 0.22/0.53  #    Success case prop preproc time    : 0.000
% 0.22/0.53  #    Success case prop encoding time   : 0.000
% 0.22/0.53  #    Success case prop solver time     : 0.000
% 0.22/0.53  # Current number of processed clauses  : 8
% 0.22/0.53  #    Positive orientable unit clauses  : 1
% 0.22/0.53  #    Positive unorientable unit clauses: 0
% 0.22/0.53  #    Negative unit clauses             : 0
% 0.22/0.53  #    Non-unit-clauses                  : 7
% 0.22/0.53  # Current number of unprocessed clauses: 27
% 0.22/0.53  # ...number of literals in the above   : 98
% 0.22/0.53  # Current number of archived formulas  : 0
% 0.22/0.53  # Current number of archived clauses   : 35
% 0.22/0.53  # Clause-clause subsumption calls (NU) : 155
% 0.22/0.53  # Rec. Clause-clause subsumption calls : 65
% 0.22/0.53  # Non-unit clause-clause subsumptions  : 0
% 0.22/0.53  # Unit Clause-clause subsumption calls : 2
% 0.22/0.53  # Rewrite failures with RHS unbound    : 0
% 0.22/0.53  # BW rewrite match attempts            : 4
% 0.22/0.53  # BW rewrite match successes           : 1
% 0.22/0.53  # Condensation attempts                : 0
% 0.22/0.53  # Condensation successes               : 0
% 0.22/0.53  # Termbank termtop insertions          : 3047
% 0.22/0.53  # Search garbage collected termcells   : 831
% 0.22/0.53  
% 0.22/0.53  # -------------------------------------------------
% 0.22/0.53  # User time                : 0.007 s
% 0.22/0.53  # System time              : 0.002 s
% 0.22/0.53  # Total time               : 0.010 s
% 0.22/0.53  # Maximum resident set size: 1856 pages
% 0.22/0.53  
% 0.22/0.53  # -------------------------------------------------
% 0.22/0.53  # User time                : 0.008 s
% 0.22/0.53  # System time              : 0.006 s
% 0.22/0.53  # Total time               : 0.014 s
% 0.22/0.53  # Maximum resident set size: 1736 pages
% 0.22/0.53  % E exiting
% 0.22/0.53  % E exiting
%------------------------------------------------------------------------------
