
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : PUZ001+1 : TPTP v9.2.0. Released v2.0.0.
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
% DateTime : Mon Sep 29 08:19:25 PM UTC 2025

% Result   : Theorem 0.21s 0.49s
% Output   : CNFRefutation 0.21s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    8
%            Number of leaves      :   11
% Syntax   : Number of formulae    :   53 (  21 unt;   0 def)
%            Number of atoms       :   94 (  28 equ)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :   78 (  37   ~;  28   |;   2   &)
%                                         (   0 ;  11  =>;   0  )
%            Maximal formula depth :    5 (   3 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    6 (   4 usr;   1 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-1 aty)
%            Number of variables   :   40 (   0 sgn  26   !;   3   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(pel55_4,axiom,
    ! [X1,X2] :
      ( killed(X1,X2)
     => hates(X1,X2) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_4) ).

fof(pel55_1,axiom,
    ? [X1] :
      ( lives(X1)
      & killed(X1,agatha) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_1) ).

fof(pel55_3,axiom,
    ! [X1] :
      ( lives(X1)
     => ( X1 = agatha
        | X1 = butler
        | X1 = charles ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_3) ).

fof(pel55_10,axiom,
    ! [X1] :
    ? [X2] : ~ hates(X1,X2),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_10) ).

fof(pel55_5,axiom,
    ! [X1,X2] :
      ( killed(X1,X2)
     => ~ richer(X1,X2) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_5) ).

fof(pel55_8,axiom,
    ! [X1] :
      ( ~ richer(X1,agatha)
     => hates(butler,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_8) ).

fof(pel55_6,axiom,
    ! [X1] :
      ( hates(agatha,X1)
     => ~ hates(charles,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_6) ).

fof(pel55_9,axiom,
    ! [X1] :
      ( hates(agatha,X1)
     => hates(butler,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_9) ).

fof(pel55_7,axiom,
    ! [X1] :
      ( X1 != butler
     => hates(agatha,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_7) ).

fof(pel55_11,axiom,
    agatha != butler,
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55_11) ).

fof(pel55,conjecture,
    killed(agatha,agatha),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel55) ).

fof(c_0_11,plain,
    ! [X4,X5] :
      ( ~ killed(X4,X5)
      | hates(X4,X5) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_4])])]) ).

fof(c_0_12,plain,
    ( lives(esk1_0)
    & killed(esk1_0,agatha) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[pel55_1])]) ).

fof(c_0_13,plain,
    ! [X8] :
      ( ~ lives(X8)
      | X8 = agatha
      | X8 = butler
      | X8 = charles ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_3])])]) ).

fof(c_0_14,plain,
    ! [X1] :
    ? [X2] : ~ hates(X1,X2),
    inference(fof_simplification,[status(thm)],[pel55_10]) ).

fof(c_0_15,plain,
    ! [X1,X2] :
      ( killed(X1,X2)
     => ~ richer(X1,X2) ),
    inference(fof_simplification,[status(thm)],[pel55_5]) ).

fof(c_0_16,plain,
    ! [X1] :
      ( ~ richer(X1,agatha)
     => hates(butler,X1) ),
    inference(fof_simplification,[status(thm)],[pel55_8]) ).

fof(c_0_17,plain,
    ! [X1] :
      ( hates(agatha,X1)
     => ~ hates(charles,X1) ),
    inference(fof_simplification,[status(thm)],[pel55_6]) ).

cnf(c_0_18,plain,
    ( hates(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_11]) ).

cnf(c_0_19,plain,
    killed(esk1_0,agatha),
    inference(split_conjunct,[status(thm)],[c_0_12]) ).

cnf(c_0_20,plain,
    ( X1 = agatha
    | X1 = butler
    | X1 = charles
    | ~ lives(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_13]) ).

cnf(c_0_21,plain,
    lives(esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_12]) ).

fof(c_0_22,plain,
    ! [X13] : ~ hates(X13,esk2_1(X13)),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[c_0_14])])]) ).

fof(c_0_23,plain,
    ! [X12] :
      ( ~ hates(agatha,X12)
      | hates(butler,X12) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_9])])]) ).

fof(c_0_24,plain,
    ! [X1] :
      ( X1 != butler
     => hates(agatha,X1) ),
    inference(fof_simplification,[status(thm)],[pel55_7]) ).

fof(c_0_25,plain,
    ! [X6,X7] :
      ( ~ killed(X6,X7)
      | ~ richer(X6,X7) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_15])])]) ).

fof(c_0_26,plain,
    ! [X11] :
      ( richer(X11,agatha)
      | hates(butler,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_16])]) ).

fof(c_0_27,plain,
    ! [X9] :
      ( ~ hates(agatha,X9)
      | ~ hates(charles,X9) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_17])])]) ).

cnf(c_0_28,plain,
    hates(esk1_0,agatha),
    inference(spm,[status(thm)],[c_0_18,c_0_19]) ).

cnf(c_0_29,plain,
    ( esk1_0 = charles
    | esk1_0 = butler
    | esk1_0 = agatha ),
    inference(spm,[status(thm)],[c_0_20,c_0_21]) ).

fof(c_0_30,plain,
    agatha != butler,
    inference(fof_simplification,[status(thm)],[pel55_11]) ).

cnf(c_0_31,plain,
    ~ hates(X1,esk2_1(X1)),
    inference(split_conjunct,[status(thm)],[c_0_22]) ).

cnf(c_0_32,plain,
    ( hates(butler,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_23]) ).

fof(c_0_33,plain,
    ! [X10] :
      ( X10 = butler
      | hates(agatha,X10) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_24])]) ).

cnf(c_0_34,plain,
    ( ~ killed(X1,X2)
    | ~ richer(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_25]) ).

cnf(c_0_35,plain,
    ( richer(X1,agatha)
    | hates(butler,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_26]) ).

cnf(c_0_36,plain,
    ( ~ hates(agatha,X1)
    | ~ hates(charles,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_27]) ).

cnf(c_0_37,plain,
    ( esk1_0 = agatha
    | esk1_0 = butler
    | hates(charles,agatha) ),
    inference(spm,[status(thm)],[c_0_28,c_0_29]) ).

fof(c_0_38,plain,
    agatha != butler,
    inference(fof_nnf,[status(thm)],[c_0_30]) ).

cnf(c_0_39,plain,
    ~ hates(agatha,esk2_1(butler)),
    inference(spm,[status(thm)],[c_0_31,c_0_32]) ).

cnf(c_0_40,plain,
    ( X1 = butler
    | hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_33]) ).

cnf(c_0_41,plain,
    ( hates(butler,X1)
    | ~ killed(X1,agatha) ),
    inference(spm,[status(thm)],[c_0_34,c_0_35]) ).

cnf(c_0_42,plain,
    ( esk1_0 = butler
    | esk1_0 = agatha
    | ~ hates(agatha,agatha) ),
    inference(spm,[status(thm)],[c_0_36,c_0_37]) ).

cnf(c_0_43,plain,
    agatha != butler,
    inference(split_conjunct,[status(thm)],[c_0_38]) ).

cnf(c_0_44,plain,
    esk2_1(butler) = butler,
    inference(spm,[status(thm)],[c_0_39,c_0_40]) ).

fof(c_0_45,negated_conjecture,
    ~ killed(agatha,agatha),
    inference(fof_simplification,[status(thm)],[inference(assume_negation,[status(cth)],[pel55])]) ).

cnf(c_0_46,plain,
    hates(butler,esk1_0),
    inference(spm,[status(thm)],[c_0_41,c_0_19]) ).

cnf(c_0_47,plain,
    ( esk1_0 = agatha
    | esk1_0 = butler ),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_42,c_0_40]),c_0_43]) ).

cnf(c_0_48,plain,
    ~ hates(butler,butler),
    inference(spm,[status(thm)],[c_0_31,c_0_44]) ).

fof(c_0_49,negated_conjecture,
    ~ killed(agatha,agatha),
    inference(fof_nnf,[status(thm)],[c_0_45]) ).

cnf(c_0_50,plain,
    esk1_0 = agatha,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_46,c_0_47]),c_0_48]) ).

cnf(c_0_51,negated_conjecture,
    ~ killed(agatha,agatha),
    inference(split_conjunct,[status(thm)],[c_0_49]) ).

cnf(c_0_52,plain,
    $false,
    inference(sr,[status(thm)],[inference(rw,[status(thm)],[c_0_19,c_0_50]),c_0_51]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.12  % Problem    : PUZ001+1 : TPTP v9.2.0. Released v2.0.0.
% 0.03/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.12/0.33  % Computer : n011.cluster.edu
% 0.12/0.33  % Model    : x86_64 x86_64
% 0.12/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.12/0.33  % Memory   : 8042.1875MB
% 0.12/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.12/0.33  % CPULimit   : 300
% 0.12/0.33  % WCLimit    : 300
% 0.12/0.33  % DateTime   : Fri Sep 26 18:26:08 EDT 2025
% 0.12/0.33  % CPUTime    : 
% 0.21/0.47  Running first-order theorem proving
% 0.21/0.47  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.49  # Version: 3.0.0
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # sh5l with pid 22493 completed with status 0
% 0.21/0.49  # Result found by sh5l
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.21/0.49  # Search class: FGHSF-FFSS11-SFFFFFNN
% 0.21/0.49  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.21/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.21/0.49  # SAT001_MinMin_p005000_rr_RG with pid 22495 completed with status 0
% 0.21/0.49  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.21/0.49  # Search class: FGHSF-FFSS11-SFFFFFNN
% 0.21/0.49  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.21/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.21/0.49  # Preprocessing time       : 0.001 s
% 0.21/0.49  # Presaturation interreduction done
% 0.21/0.49  
% 0.21/0.49  # Proof found!
% 0.21/0.49  # SZS status Theorem
% 0.21/0.49  # SZS output start CNFRefutation
% See solution above
% 0.21/0.49  # Parsed axioms                        : 14
% 0.21/0.49  # Removed by relevancy pruning/SinE    : 0
% 0.21/0.49  # Initial clauses                      : 15
% 0.21/0.49  # Removed in clause preprocessing      : 0
% 0.21/0.49  # Initial clauses in saturation        : 15
% 0.21/0.49  # Processed clauses                    : 53
% 0.21/0.49  # ...of these trivial                  : 0
% 0.21/0.49  # ...subsumed                          : 2
% 0.21/0.49  # ...remaining for further processing  : 51
% 0.21/0.49  # Other redundant clauses eliminated   : 0
% 0.21/0.49  # Clauses deleted for lack of memory   : 0
% 0.21/0.49  # Backward-subsumed                    : 9
% 0.21/0.49  # Backward-rewritten                   : 6
% 0.21/0.49  # Generated clauses                    : 43
% 0.21/0.49  # ...of the previous two non-redundant : 40
% 0.21/0.49  # ...aggressively subsumed             : 0
% 0.21/0.49  # Contextual simplify-reflections      : 0
% 0.21/0.49  # Paramodulations                      : 38
% 0.21/0.49  # Factorizations                       : 5
% 0.21/0.49  # NegExts                              : 0
% 0.21/0.49  # Equation resolutions                 : 0
% 0.21/0.49  # Disequality decompositions           : 0
% 0.21/0.49  # Total rewrite steps                  : 13
% 0.21/0.49  # ...of those cached                   : 8
% 0.21/0.49  # Propositional unsat checks           : 0
% 0.21/0.49  #    Propositional check models        : 0
% 0.21/0.49  #    Propositional check unsatisfiable : 0
% 0.21/0.49  #    Propositional clauses             : 0
% 0.21/0.49  #    Propositional clauses after purity: 0
% 0.21/0.49  #    Propositional unsat core size     : 0
% 0.21/0.49  #    Propositional preprocessing time  : 0.000
% 0.21/0.49  #    Propositional encoding time       : 0.000
% 0.21/0.49  #    Propositional solver time         : 0.000
% 0.21/0.49  #    Success case prop preproc time    : 0.000
% 0.21/0.49  #    Success case prop encoding time   : 0.000
% 0.21/0.49  #    Success case prop solver time     : 0.000
% 0.21/0.49  # Current number of processed clauses  : 21
% 0.21/0.49  #    Positive orientable unit clauses  : 6
% 0.21/0.49  #    Positive unorientable unit clauses: 0
% 0.21/0.49  #    Negative unit clauses             : 7
% 0.21/0.49  #    Non-unit-clauses                  : 8
% 0.21/0.49  # Current number of unprocessed clauses: 7
% 0.21/0.49  # ...number of literals in the above   : 18
% 0.21/0.49  # Current number of archived formulas  : 0
% 0.21/0.49  # Current number of archived clauses   : 30
% 0.21/0.49  # Clause-clause subsumption calls (NU) : 23
% 0.21/0.49  # Rec. Clause-clause subsumption calls : 21
% 0.21/0.49  # Non-unit clause-clause subsumptions  : 7
% 0.21/0.49  # Unit Clause-clause subsumption calls : 13
% 0.21/0.49  # Rewrite failures with RHS unbound    : 0
% 0.21/0.49  # BW rewrite match attempts            : 2
% 0.21/0.49  # BW rewrite match successes           : 2
% 0.21/0.49  # Condensation attempts                : 0
% 0.21/0.49  # Condensation successes               : 0
% 0.21/0.49  # Termbank termtop insertions          : 951
% 0.21/0.49  # Search garbage collected termcells   : 83
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.004 s
% 0.21/0.49  # System time              : 0.002 s
% 0.21/0.49  # Total time               : 0.006 s
% 0.21/0.49  # Maximum resident set size: 1756 pages
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.004 s
% 0.21/0.49  # System time              : 0.005 s
% 0.21/0.49  # Total time               : 0.009 s
% 0.21/0.49  # Maximum resident set size: 1700 pages
% 0.21/0.49  % E exiting
% 0.21/0.49  % E exiting
%------------------------------------------------------------------------------
