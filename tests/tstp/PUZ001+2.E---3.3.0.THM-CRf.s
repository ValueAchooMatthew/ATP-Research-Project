
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : PUZ001+2 : TPTP v9.2.0. Released v4.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM

% Computer : n002.cluster.edu
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
%            Derivation depth      :   13
%            Number of leaves      :    2
% Syntax   : Number of formulae    :   46 (  18 unt;   0 def)
%            Number of atoms       :  205 (  50 equ)
%            Maximal formula atoms :   40 (   4 avg)
%            Number of connectives :  233 (  74   ~;  76   |;  63   &)
%                                         (   0 ;  20  =>;   0  )
%            Maximal formula depth :   37 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    7 (   4 usr;   2 prp; 0-4 aty)
%            Number of functors    :   19 (  19 usr;  13 con; 0-3 aty)
%            Number of variables   :  133 (  19 sgn  48   !;  30   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(background,axiom,
    ? [X1,X2,X3] :
      ( $true
      & predicate1(X2,live,X1)
      & modifier_pp(X2,in,'DreadburyMansion')
      & predicate2(X3,kill,X1,'AuntAgatha')
      & ! [X4,X5] :
          ( ( $true
            & predicate1(X5,live,X4)
            & modifier_pp(X5,in,'DreadburyMansion') )
         => ( X4 = 'AuntAgatha'
            | X4 = 'Butler'
            | X4 = 'Charles' ) )
      & ! [X6] :
          ( $true
         => ! [X7,X8] :
              ( ( $true
                & predicate2(X8,kill,X6,X7) )
             => ? [X9] : predicate2(X9,hate,X6,X7) ) )
      & ! [X10] :
          ( $true
         => ~ ? [X11,X12,X13] :
                ( $true
                & predicate2(X12,kill,X10,X11)
                & property2(X13,rich,comp_than,X11)
                & X10 = X13 ) )
      & ! [X14,X15] :
          ( ( $true
            & predicate2(X15,hate,'AuntAgatha',X14) )
         => ~ ? [X16] : predicate2(X16,hate,'Charles',X14) )
      & ~ ? [X17] : predicate2(X17,hate,'AuntAgatha','Butler')
      & ! [X18] :
          ( ( $true
            & X18 != 'Butler' )
         => ? [X19] : predicate2(X19,hate,'AuntAgatha',X18) )
      & ! [X20] :
          ( ( $true
            & ~ ? [X21] :
                  ( property2(X21,rich,comp_than,'AuntAgatha')
                  & X20 = X21 ) )
         => ? [X22] : predicate2(X22,hate,'Butler',X20) )
      & ! [X23,X24] :
          ( ( $true
            & predicate2(X24,hate,'AuntAgatha',X23) )
         => ? [X25] : predicate2(X25,hate,'Butler',X23) )
      & ! [X26] :
          ( $true
         => ~ ! [X27] :
                ( $true
               => ? [X28] : predicate2(X28,hate,X26,X27) ) )
      & 'AuntAgatha' != 'Butler' ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',background) ).

fof(prove,conjecture,
    ? [X1] : predicate2(X1,kill,'AuntAgatha','AuntAgatha'),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove) ).

fof(c_0_2,plain,
    ? [X1,X2,X3] :
      ( $true
      & predicate1(X2,live,X1)
      & modifier_pp(X2,in,'DreadburyMansion')
      & predicate2(X3,kill,X1,'AuntAgatha')
      & ! [X4,X5] :
          ( ( $true
            & predicate1(X5,live,X4)
            & modifier_pp(X5,in,'DreadburyMansion') )
         => ( X4 = 'AuntAgatha'
            | X4 = 'Butler'
            | X4 = 'Charles' ) )
      & ! [X6] :
          ( $true
         => ! [X7,X8] :
              ( ( $true
                & predicate2(X8,kill,X6,X7) )
             => ? [X9] : predicate2(X9,hate,X6,X7) ) )
      & ! [X10] :
          ( $true
         => ~ ? [X11,X12,X13] :
                ( $true
                & predicate2(X12,kill,X10,X11)
                & property2(X13,rich,comp_than,X11)
                & X10 = X13 ) )
      & ! [X14,X15] :
          ( ( $true
            & predicate2(X15,hate,'AuntAgatha',X14) )
         => ~ ? [X16] : predicate2(X16,hate,'Charles',X14) )
      & ~ ? [X17] : predicate2(X17,hate,'AuntAgatha','Butler')
      & ! [X18] :
          ( ( $true
            & X18 != 'Butler' )
         => ? [X19] : predicate2(X19,hate,'AuntAgatha',X18) )
      & ! [X20] :
          ( ( $true
            & ~ ? [X21] :
                  ( property2(X21,rich,comp_than,'AuntAgatha')
                  & X20 = X21 ) )
         => ? [X22] : predicate2(X22,hate,'Butler',X20) )
      & ! [X23,X24] :
          ( ( $true
            & predicate2(X24,hate,'AuntAgatha',X23) )
         => ? [X25] : predicate2(X25,hate,'Butler',X23) )
      & ! [X26] :
          ( $true
         => ~ ! [X27] :
                ( $true
               => ? [X28] : predicate2(X28,hate,X26,X27) ) )
      & 'AuntAgatha' != 'Butler' ),
    inference(fof_simplification,[status(thm)],[background]) ).

fof(c_0_3,plain,
    ! [X33,X34,X35,X36,X37,X39,X40,X41,X42,X43,X44,X45,X46,X47,X49,X52,X53,X55,X57] :
      ( $true
      & predicate1(esk2_0,live,esk1_0)
      & modifier_pp(esk2_0,in,'DreadburyMansion')
      & predicate2(esk3_0,kill,esk1_0,'AuntAgatha')
      & ( ~ $true
        | ~ predicate1(X34,live,X33)
        | ~ modifier_pp(X34,in,'DreadburyMansion')
        | X33 = 'AuntAgatha'
        | X33 = 'Butler'
        | X33 = 'Charles' )
      & ( ~ $true
        | ~ $true
        | ~ predicate2(X37,kill,X35,X36)
        | predicate2(esk4_3(X35,X36,X37),hate,X35,X36) )
      & ( ~ $true
        | ~ $true
        | ~ predicate2(X41,kill,X39,X40)
        | ~ property2(X42,rich,comp_than,X40)
        | X39 != X42 )
      & ( ~ $true
        | ~ predicate2(X44,hate,'AuntAgatha',X43)
        | ~ predicate2(X45,hate,'Charles',X43) )
      & ~ predicate2(X46,hate,'AuntAgatha','Butler')
      & ( ~ $true
        | X47 = 'Butler'
        | predicate2(esk5_1(X47),hate,'AuntAgatha',X47) )
      & ( property2(esk6_1(X49),rich,comp_than,'AuntAgatha')
        | ~ $true
        | predicate2(esk7_1(X49),hate,'Butler',X49) )
      & ( X49 = esk6_1(X49)
        | ~ $true
        | predicate2(esk7_1(X49),hate,'Butler',X49) )
      & ( ~ $true
        | ~ predicate2(X53,hate,'AuntAgatha',X52)
        | predicate2(esk8_2(X52,X53),hate,'Butler',X52) )
      & ( $true
        | ~ $true )
      & ( ~ predicate2(X57,hate,X55,esk9_1(X55))
        | ~ $true )
      & 'AuntAgatha' != 'Butler' ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_2])])])])])]) ).

cnf(c_0_4,plain,
    ( ~ predicate2(X1,hate,X2,esk9_1(X2))
    | $false ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_5,plain,
    ( predicate2(esk8_2(X2,X1),hate,'Butler',X2)
    | $false
    | ~ predicate2(X1,hate,'AuntAgatha',X2) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_6,plain,
    ~ predicate2(X1,hate,X2,esk9_1(X2)),
    inference(cn,[status(thm)],[c_0_4]) ).

cnf(c_0_7,plain,
    ( predicate2(esk8_2(X2,X1),hate,'Butler',X2)
    | ~ predicate2(X1,hate,'AuntAgatha',X2) ),
    inference(cn,[status(thm)],[c_0_5]) ).

cnf(c_0_8,plain,
    ( X1 = 'Butler'
    | predicate2(esk5_1(X1),hate,'AuntAgatha',X1)
    | $false ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_9,plain,
    ( $false
    | ~ predicate2(X1,hate,'AuntAgatha',X2)
    | ~ predicate2(X3,hate,'Charles',X2) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_10,plain,
    ( predicate2(esk4_3(X2,X3,X1),hate,X2,X3)
    | $false
    | $false
    | ~ predicate2(X1,kill,X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_11,plain,
    ( X2 = 'AuntAgatha'
    | X2 = 'Butler'
    | X2 = 'Charles'
    | $false
    | ~ predicate1(X1,live,X2)
    | ~ modifier_pp(X1,in,'DreadburyMansion') ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_12,plain,
    ( X1 = esk6_1(X1)
    | predicate2(esk7_1(X1),hate,'Butler',X1)
    | $false ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_13,plain,
    ~ predicate2(X1,hate,'AuntAgatha',esk9_1('Butler')),
    inference(spm,[status(thm)],[c_0_6,c_0_7]) ).

cnf(c_0_14,plain,
    ( X1 = 'Butler'
    | predicate2(esk5_1(X1),hate,'AuntAgatha',X1) ),
    inference(cn,[status(thm)],[c_0_8]) ).

cnf(c_0_15,plain,
    ( ~ predicate2(X3,hate,'Charles',X2)
    | ~ predicate2(X1,hate,'AuntAgatha',X2) ),
    inference(cn,[status(thm)],[c_0_9]) ).

cnf(c_0_16,plain,
    ( predicate2(esk4_3(X2,X3,X1),hate,X2,X3)
    | ~ predicate2(X1,kill,X2,X3) ),
    inference(cn,[status(thm)],[c_0_10]) ).

cnf(c_0_17,plain,
    ( X2 = 'AuntAgatha'
    | X2 = 'Butler'
    | X2 = 'Charles'
    | ~ predicate1(X1,live,X2)
    | ~ modifier_pp(X1,in,'DreadburyMansion') ),
    inference(cn,[status(thm)],[c_0_11]) ).

cnf(c_0_18,plain,
    modifier_pp(esk2_0,in,'DreadburyMansion'),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_19,plain,
    ( $false
    | $false
    | ~ predicate2(X1,kill,X2,X3)
    | ~ property2(X4,rich,comp_than,X3)
    | X2 != X4 ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_20,plain,
    ( property2(esk6_1(X1),rich,comp_than,'AuntAgatha')
    | predicate2(esk7_1(X1),hate,'Butler',X1)
    | $false ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_21,plain,
    ( X1 = esk6_1(X1)
    | predicate2(esk7_1(X1),hate,'Butler',X1) ),
    inference(cn,[status(thm)],[c_0_12]) ).

cnf(c_0_22,plain,
    esk9_1('Butler') = 'Butler',
    inference(spm,[status(thm)],[c_0_13,c_0_14]) ).

cnf(c_0_23,plain,
    ( ~ predicate2(X1,hate,'AuntAgatha',X2)
    | ~ predicate2(X3,kill,'Charles',X2) ),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

cnf(c_0_24,plain,
    ( X1 = 'AuntAgatha'
    | X1 = 'Butler'
    | X1 = 'Charles'
    | ~ predicate1(esk2_0,live,X1) ),
    inference(spm,[status(thm)],[c_0_17,c_0_18]) ).

cnf(c_0_25,plain,
    predicate1(esk2_0,live,esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_26,plain,
    ( X2 != X4
    | ~ predicate2(X1,kill,X2,X3)
    | ~ property2(X4,rich,comp_than,X3) ),
    inference(cn,[status(thm)],[c_0_19]) ).

cnf(c_0_27,plain,
    ( predicate2(esk7_1(X1),hate,'Butler',X1)
    | property2(esk6_1(X1),rich,comp_than,'AuntAgatha') ),
    inference(cn,[status(thm)],[c_0_20]) ).

cnf(c_0_28,plain,
    esk6_1('Butler') = 'Butler',
    inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_6,c_0_21]),c_0_22]),c_0_22]) ).

cnf(c_0_29,plain,
    ~ predicate2(X1,hate,'Butler','Butler'),
    inference(spm,[status(thm)],[c_0_6,c_0_22]) ).

cnf(c_0_30,plain,
    ( X1 = 'Butler'
    | ~ predicate2(X2,kill,'Charles',X1) ),
    inference(spm,[status(thm)],[c_0_23,c_0_14]) ).

cnf(c_0_31,plain,
    ( 'Charles' = esk1_0
    | 'Butler' = esk1_0
    | 'AuntAgatha' = esk1_0 ),
    inference(spm,[status(thm)],[c_0_24,c_0_25]) ).

cnf(c_0_32,plain,
    ( ~ property2(X1,rich,comp_than,X2)
    | ~ predicate2(X3,kill,X1,X2) ),
    inference(er,[status(thm)],[c_0_26]) ).

cnf(c_0_33,plain,
    property2('Butler',rich,comp_than,'AuntAgatha'),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_27,c_0_28]),c_0_29]) ).

cnf(c_0_34,plain,
    ( 'AuntAgatha' = esk1_0
    | 'Butler' = esk1_0
    | X1 = 'Butler'
    | ~ predicate2(X2,kill,esk1_0,X1) ),
    inference(spm,[status(thm)],[c_0_30,c_0_31]) ).

cnf(c_0_35,plain,
    predicate2(esk3_0,kill,esk1_0,'AuntAgatha'),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_36,plain,
    'AuntAgatha' != 'Butler',
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

fof(c_0_37,negated_conjecture,
    ~ ? [X1] : predicate2(X1,kill,'AuntAgatha','AuntAgatha'),
    inference(assume_negation,[status(cth)],[prove]) ).

cnf(c_0_38,plain,
    ~ predicate2(X1,kill,'Butler','AuntAgatha'),
    inference(spm,[status(thm)],[c_0_32,c_0_33]) ).

cnf(c_0_39,plain,
    ( 'Butler' = esk1_0
    | 'AuntAgatha' = esk1_0 ),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_34,c_0_35]),c_0_36]) ).

fof(c_0_40,negated_conjecture,
    ! [X29] : ~ predicate2(X29,kill,'AuntAgatha','AuntAgatha'),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_37])])]) ).

cnf(c_0_41,plain,
    ( 'AuntAgatha' = esk1_0
    | ~ predicate2(X1,kill,esk1_0,'AuntAgatha') ),
    inference(spm,[status(thm)],[c_0_38,c_0_39]) ).

cnf(c_0_42,negated_conjecture,
    ~ predicate2(X1,kill,'AuntAgatha','AuntAgatha'),
    inference(split_conjunct,[status(thm)],[c_0_40]) ).

cnf(c_0_43,plain,
    'AuntAgatha' = esk1_0,
    inference(spm,[status(thm)],[c_0_41,c_0_35]) ).

cnf(c_0_44,negated_conjecture,
    ~ predicate2(X1,kill,esk1_0,esk1_0),
    inference(rw,[status(thm)],[inference(rw,[status(thm)],[c_0_42,c_0_43]),c_0_43]) ).

cnf(c_0_45,plain,
    $false,
    inference(sr,[status(thm)],[inference(rw,[status(thm)],[c_0_35,c_0_43]),c_0_44]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.02/0.12  % Problem    : PUZ001+2 : TPTP v9.2.0. Released v4.0.0.
% 0.02/0.12  % Command    : run_E /export/starexec/sandbox2/benchmark/theBenchmark.p 300 THM
% 0.11/0.33  % Computer : n002.cluster.edu
% 0.11/0.33  % Model    : x86_64 x86_64
% 0.11/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.11/0.33  % Memory   : 8042.1875MB
% 0.11/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.11/0.33  % CPULimit   : 300
% 0.11/0.33  % WCLimit    : 300
% 0.11/0.33  % DateTime   : Fri Sep 26 18:24:53 EDT 2025
% 0.11/0.33  % CPUTime    : 
% 0.21/0.48  Running first-order theorem proving
% 0.21/0.48  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.21/0.49  # Version: 3.0.0
% 0.21/0.49  # Preprocessing class: FSMSSMSMSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2SI with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # sh5l with pid 14536 completed with status 0
% 0.21/0.49  # Result found by sh5l
% 0.21/0.49  # Preprocessing class: FSMSSMSMSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2SI with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.21/0.49  # Search class: FGHSF-FFSS31-SFFFFFNN
% 0.21/0.49  # partial match(1): FGHSF-FFMS31-SFFFFFNN
% 0.21/0.49  # Scheduled 6 strats onto 1 cores with 300 seconds (300 total)
% 0.21/0.49  # Starting G-E--_207_C01_F1_SE_CS_SP_PI_S5PRR_S0Y with 148s (1) cores
% 0.21/0.49  # G-E--_207_C01_F1_SE_CS_SP_PI_S5PRR_S0Y with pid 14541 completed with status 0
% 0.21/0.49  # Result found by G-E--_207_C01_F1_SE_CS_SP_PI_S5PRR_S0Y
% 0.21/0.49  # Preprocessing class: FSMSSMSMSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_207_C18_F1_SE_CS_SP_PI_PS_S2SI with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.21/0.49  # Search class: FGHSF-FFSS31-SFFFFFNN
% 0.21/0.49  # partial match(1): FGHSF-FFMS31-SFFFFFNN
% 0.21/0.49  # Scheduled 6 strats onto 1 cores with 300 seconds (300 total)
% 0.21/0.49  # Starting G-E--_207_C01_F1_SE_CS_SP_PI_S5PRR_S0Y with 148s (1) cores
% 0.21/0.49  # Preprocessing time       : 0.001 s
% 0.21/0.49  
% 0.21/0.49  # Proof found!
% 0.21/0.49  # SZS status Theorem
% 0.21/0.49  # SZS output start CNFRefutation
% See solution above
% 0.21/0.49  # Parsed axioms                        : 2
% 0.21/0.49  # Removed by relevancy pruning/SinE    : 0
% 0.21/0.49  # Initial clauses                      : 17
% 0.21/0.49  # Removed in clause preprocessing      : 2
% 0.21/0.49  # Initial clauses in saturation        : 15
% 0.21/0.49  # Processed clauses                    : 56
% 0.21/0.49  # ...of these trivial                  : 1
% 0.21/0.49  # ...subsumed                          : 8
% 0.21/0.49  # ...remaining for further processing  : 46
% 0.21/0.49  # Other redundant clauses eliminated   : 1
% 0.21/0.49  # Clauses deleted for lack of memory   : 0
% 0.21/0.49  # Backward-subsumed                    : 2
% 0.21/0.49  # Backward-rewritten                   : 23
% 0.21/0.49  # Generated clauses                    : 48
% 0.21/0.49  # ...of the previous two non-redundant : 65
% 0.21/0.49  # ...aggressively subsumed             : 0
% 0.21/0.49  # Contextual simplify-reflections      : 0
% 0.21/0.49  # Paramodulations                      : 47
% 0.21/0.49  # Factorizations                       : 0
% 0.21/0.49  # NegExts                              : 0
% 0.21/0.49  # Equation resolutions                 : 1
% 0.21/0.49  # Disequality decompositions           : 0
% 0.21/0.49  # Total rewrite steps                  : 30
% 0.21/0.49  # ...of those cached                   : 27
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
% 0.21/0.49  # Current number of processed clauses  : 20
% 0.21/0.49  #    Positive orientable unit clauses  : 6
% 0.21/0.49  #    Positive unorientable unit clauses: 0
% 0.21/0.49  #    Negative unit clauses             : 9
% 0.21/0.49  #    Non-unit-clauses                  : 5
% 0.21/0.49  # Current number of unprocessed clauses: 21
% 0.21/0.49  # ...number of literals in the above   : 53
% 0.21/0.49  # Current number of archived formulas  : 0
% 0.21/0.49  # Current number of archived clauses   : 25
% 0.21/0.49  # Clause-clause subsumption calls (NU) : 20
% 0.21/0.49  # Rec. Clause-clause subsumption calls : 16
% 0.21/0.49  # Non-unit clause-clause subsumptions  : 3
% 0.21/0.49  # Unit Clause-clause subsumption calls : 51
% 0.21/0.49  # Rewrite failures with RHS unbound    : 0
% 0.21/0.49  # BW rewrite match attempts            : 2
% 0.21/0.49  # BW rewrite match successes           : 2
% 0.21/0.49  # Condensation attempts                : 0
% 0.21/0.49  # Condensation successes               : 0
% 0.21/0.49  # Termbank termtop insertions          : 2034
% 0.21/0.49  # Search garbage collected termcells   : 370
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.006 s
% 0.21/0.49  # System time              : 0.001 s
% 0.21/0.49  # Total time               : 0.008 s
% 0.21/0.49  # Maximum resident set size: 1892 pages
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.006 s
% 0.21/0.49  # System time              : 0.005 s
% 0.21/0.49  # Total time               : 0.011 s
% 0.21/0.49  # Maximum resident set size: 1732 pages
% 0.21/0.49  % E exiting
% 0.21/0.50  % E exiting
%------------------------------------------------------------------------------
