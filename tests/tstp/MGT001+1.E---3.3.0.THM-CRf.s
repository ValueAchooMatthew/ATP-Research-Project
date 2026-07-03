
%------------------------------------------------------------------------------
% File     : E---3.3.0
% Problem  : MGT001+1 : TPTP v9.2.0. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM

% Computer : n014.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 07:23:02 PM UTC 2025

% Result   : Theorem 0.21s 0.49s
% Output   : CNFRefutation 0.21s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   21
%            Number of leaves      :    7
% Syntax   : Number of formulae    :   56 (  12 unt;   0 def)
%            Number of atoms       :  321 (   0 equ)
%            Maximal formula atoms :   31 (   5 avg)
%            Number of connectives :  476 ( 211   ~; 203   |;  52   &)
%                                         (   2 ;   8  =>;   0  )
%            Maximal formula depth :   24 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    9 (   8 usr;   1 prp; 0-3 aty)
%            Number of functors    :   11 (  11 usr;   8 con; 0-2 aty)
%            Number of variables   :  234 (  31 sgn  84   !;   3   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(t1_FOL,conjecture,
    ! [X1,X6,X13,X14,X17,X18,X11,X12] :
      ( ( organization(X1,X13)
        & organization(X6,X14)
        & reorganization_free(X1,X13,X13)
        & reorganization_free(X6,X14,X14)
        & inertia(X1,X17,X13)
        & inertia(X6,X18,X14)
        & survival_chance(X1,X11,X13)
        & survival_chance(X6,X12,X14)
        & greater(X18,X17) )
     => greater(X12,X11) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',t1_FOL) ).

fof(a3_FOL,hypothesis,
    ! [X1,X6,X13,X14,X15,X16,X17,X18] :
      ( ( organization(X1,X13)
        & organization(X6,X14)
        & reorganization_free(X1,X13,X13)
        & reorganization_free(X6,X14,X14)
        & reproducibility(X1,X15,X13)
        & reproducibility(X6,X16,X14)
        & inertia(X1,X17,X13)
        & inertia(X6,X18,X14) )
     => ( greater(X16,X15)
       greater(X18,X17) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',a3_FOL) ).

fof(mp3,axiom,
    ! [X1,X2] :
      ( organization(X1,X2)
     => ? [X5] : reproducibility(X1,X5,X2) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',mp3) ).

fof(a2_FOL,hypothesis,
    ! [X1,X6,X13,X14,X7,X8,X9,X10,X15,X16] :
      ( ( organization(X1,X13)
        & organization(X6,X14)
        & reliability(X1,X7,X13)
        & reliability(X6,X8,X14)
        & accountability(X1,X9,X13)
        & accountability(X6,X10,X14)
        & reproducibility(X1,X15,X13)
        & reproducibility(X6,X16,X14) )
     => ( greater(X16,X15)
       ( greater(X8,X7)
          & greater(X10,X9) ) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',a2_FOL) ).

fof(mp2,axiom,
    ! [X1,X2] :
      ( organization(X1,X2)
     => ? [X4] : accountability(X1,X4,X2) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',mp2) ).

fof(a1_FOL,hypothesis,
    ! [X1,X6,X7,X8,X9,X10,X11,X12,X13,X14] :
      ( ( organization(X1,X13)
        & organization(X6,X14)
        & reliability(X1,X7,X13)
        & reliability(X6,X8,X14)
        & accountability(X1,X9,X13)
        & accountability(X6,X10,X14)
        & survival_chance(X1,X11,X13)
        & survival_chance(X6,X12,X14)
        & greater(X8,X7)
        & greater(X10,X9) )
     => greater(X12,X11) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',a1_FOL) ).

fof(mp1,axiom,
    ! [X1,X2] :
      ( organization(X1,X2)
     => ? [X3] : reliability(X1,X3,X2) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',mp1) ).

fof(c_0_7,negated_conjecture,
    ~ ! [X1,X6,X13,X14,X17,X18,X11,X12] :
        ( ( organization(X1,X13)
          & organization(X6,X14)
          & reorganization_free(X1,X13,X13)
          & reorganization_free(X6,X14,X14)
          & inertia(X1,X17,X13)
          & inertia(X6,X18,X14)
          & survival_chance(X1,X11,X13)
          & survival_chance(X6,X12,X14)
          & greater(X18,X17) )
       => greater(X12,X11) ),
    inference(assume_negation,[status(cth)],[t1_FOL]) ).

fof(c_0_8,hypothesis,
    ! [X48,X49,X50,X51,X52,X53,X54,X55] :
      ( ( ~ greater(X53,X52)
        | greater(X55,X54)
        | ~ organization(X48,X50)
        | ~ organization(X49,X51)
        | ~ reorganization_free(X48,X50,X50)
        | ~ reorganization_free(X49,X51,X51)
        | ~ reproducibility(X48,X52,X50)
        | ~ reproducibility(X49,X53,X51)
        | ~ inertia(X48,X54,X50)
        | ~ inertia(X49,X55,X51) )
      & ( ~ greater(X55,X54)
        | greater(X53,X52)
        | ~ organization(X48,X50)
        | ~ organization(X49,X51)
        | ~ reorganization_free(X48,X50,X50)
        | ~ reorganization_free(X49,X51,X51)
        | ~ reproducibility(X48,X52,X50)
        | ~ reproducibility(X49,X53,X51)
        | ~ inertia(X48,X54,X50)
        | ~ inertia(X49,X55,X51) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[a3_FOL])])])]) ).

fof(c_0_9,negated_conjecture,
    ( organization(esk4_0,esk6_0)
    & organization(esk5_0,esk7_0)
    & reorganization_free(esk4_0,esk6_0,esk6_0)
    & reorganization_free(esk5_0,esk7_0,esk7_0)
    & inertia(esk4_0,esk8_0,esk6_0)
    & inertia(esk5_0,esk9_0,esk7_0)
    & survival_chance(esk4_0,esk10_0,esk6_0)
    & survival_chance(esk5_0,esk11_0,esk7_0)
    & greater(esk9_0,esk8_0)
    & ~ greater(esk11_0,esk10_0) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_7])])])]) ).

cnf(c_0_10,hypothesis,
    ( greater(X3,X4)
    | ~ greater(X1,X2)
    | ~ organization(X5,X6)
    | ~ organization(X7,X8)
    | ~ reorganization_free(X5,X6,X6)
    | ~ reorganization_free(X7,X8,X8)
    | ~ reproducibility(X5,X4,X6)
    | ~ reproducibility(X7,X3,X8)
    | ~ inertia(X5,X2,X6)
    | ~ inertia(X7,X1,X8) ),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_11,negated_conjecture,
    inertia(esk5_0,esk9_0,esk7_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_12,negated_conjecture,
    reorganization_free(esk5_0,esk7_0,esk7_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_13,negated_conjecture,
    organization(esk5_0,esk7_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

fof(c_0_14,plain,
    ! [X25,X26] :
      ( ~ organization(X25,X26)
      | reproducibility(X25,esk3_2(X25,X26),X26) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[mp3])])])]) ).

fof(c_0_15,hypothesis,
    ! [X38,X39,X40,X41,X42,X43,X44,X45,X46,X47] :
      ( ( greater(X43,X42)
        | ~ greater(X47,X46)
        | ~ organization(X38,X40)
        | ~ organization(X39,X41)
        | ~ reliability(X38,X42,X40)
        | ~ reliability(X39,X43,X41)
        | ~ accountability(X38,X44,X40)
        | ~ accountability(X39,X45,X41)
        | ~ reproducibility(X38,X46,X40)
        | ~ reproducibility(X39,X47,X41) )
      & ( greater(X45,X44)
        | ~ greater(X47,X46)
        | ~ organization(X38,X40)
        | ~ organization(X39,X41)
        | ~ reliability(X38,X42,X40)
        | ~ reliability(X39,X43,X41)
        | ~ accountability(X38,X44,X40)
        | ~ accountability(X39,X45,X41)
        | ~ reproducibility(X38,X46,X40)
        | ~ reproducibility(X39,X47,X41) )
      & ( ~ greater(X43,X42)
        | ~ greater(X45,X44)
        | greater(X47,X46)
        | ~ organization(X38,X40)
        | ~ organization(X39,X41)
        | ~ reliability(X38,X42,X40)
        | ~ reliability(X39,X43,X41)
        | ~ accountability(X38,X44,X40)
        | ~ accountability(X39,X45,X41)
        | ~ reproducibility(X38,X46,X40)
        | ~ reproducibility(X39,X47,X41) ) ),
    inference(distribute,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[a2_FOL])])])]) ).

cnf(c_0_16,negated_conjecture,
    ( greater(X1,X2)
    | ~ inertia(X3,X4,X5)
    | ~ reorganization_free(X3,X5,X5)
    | ~ greater(esk9_0,X4)
    | ~ reproducibility(esk5_0,X1,esk7_0)
    | ~ reproducibility(X3,X2,X5)
    | ~ organization(X3,X5) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_10,c_0_11]),c_0_12]),c_0_13])]) ).

cnf(c_0_17,plain,
    ( reproducibility(X1,esk3_2(X1,X2),X2)
    | ~ organization(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_14]) ).

cnf(c_0_18,hypothesis,
    ( greater(X1,X2)
    | ~ greater(X3,X4)
    | ~ organization(X5,X6)
    | ~ organization(X7,X8)
    | ~ reliability(X5,X9,X6)
    | ~ reliability(X7,X10,X8)
    | ~ accountability(X5,X2,X6)
    | ~ accountability(X7,X1,X8)
    | ~ reproducibility(X5,X4,X6)
    | ~ reproducibility(X7,X3,X8) ),
    inference(split_conjunct,[status(thm)],[c_0_15]) ).

cnf(c_0_19,negated_conjecture,
    ( greater(esk3_2(esk5_0,esk7_0),X1)
    | ~ inertia(X2,X3,X4)
    | ~ reorganization_free(X2,X4,X4)
    | ~ greater(esk9_0,X3)
    | ~ reproducibility(X2,X1,X4)
    | ~ organization(X2,X4) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_16,c_0_17]),c_0_13])]) ).

cnf(c_0_20,negated_conjecture,
    inertia(esk4_0,esk8_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_21,negated_conjecture,
    reorganization_free(esk4_0,esk6_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_22,negated_conjecture,
    greater(esk9_0,esk8_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_23,negated_conjecture,
    organization(esk4_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_24,hypothesis,
    ( greater(X1,X2)
    | ~ greater(esk3_2(X3,X4),X5)
    | ~ reproducibility(X6,X5,X7)
    | ~ accountability(X3,X1,X4)
    | ~ accountability(X6,X2,X7)
    | ~ reliability(X3,X8,X4)
    | ~ reliability(X6,X9,X7)
    | ~ organization(X3,X4)
    | ~ organization(X6,X7) ),
    inference(spm,[status(thm)],[c_0_18,c_0_17]) ).

cnf(c_0_25,negated_conjecture,
    ( greater(esk3_2(esk5_0,esk7_0),X1)
    | ~ reproducibility(esk4_0,X1,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_19,c_0_20]),c_0_21]),c_0_22]),c_0_23])]) ).

cnf(c_0_26,negated_conjecture,
    ( greater(X1,X2)
    | ~ reproducibility(esk4_0,X3,esk6_0)
    | ~ reproducibility(X4,X3,X5)
    | ~ accountability(esk5_0,X1,esk7_0)
    | ~ accountability(X4,X2,X5)
    | ~ reliability(esk5_0,X6,esk7_0)
    | ~ reliability(X4,X7,X5)
    | ~ organization(X4,X5) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_24,c_0_25]),c_0_13])]) ).

cnf(c_0_27,negated_conjecture,
    ( greater(X1,X2)
    | ~ reproducibility(X3,esk3_2(esk4_0,esk6_0),X4)
    | ~ accountability(esk5_0,X1,esk7_0)
    | ~ accountability(X3,X2,X4)
    | ~ reliability(esk5_0,X5,esk7_0)
    | ~ reliability(X3,X6,X4)
    | ~ organization(X3,X4) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_26,c_0_17]),c_0_23])]) ).

fof(c_0_28,plain,
    ! [X22,X23] :
      ( ~ organization(X22,X23)
      | accountability(X22,esk2_2(X22,X23),X23) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[mp2])])])]) ).

fof(c_0_29,hypothesis,
    ! [X28,X29,X30,X31,X32,X33,X34,X35,X36,X37] :
      ( ~ organization(X28,X36)
      | ~ organization(X29,X37)
      | ~ reliability(X28,X30,X36)
      | ~ reliability(X29,X31,X37)
      | ~ accountability(X28,X32,X36)
      | ~ accountability(X29,X33,X37)
      | ~ survival_chance(X28,X34,X36)
      | ~ survival_chance(X29,X35,X37)
      | ~ greater(X31,X30)
      | ~ greater(X33,X32)
      | greater(X35,X34) ),
    inference(fof_nnf,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[a1_FOL])])]) ).

cnf(c_0_30,negated_conjecture,
    ( greater(X1,X2)
    | ~ accountability(esk5_0,X1,esk7_0)
    | ~ accountability(esk4_0,X2,esk6_0)
    | ~ reliability(esk5_0,X3,esk7_0)
    | ~ reliability(esk4_0,X4,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_27,c_0_17]),c_0_23])]) ).

cnf(c_0_31,plain,
    ( accountability(X1,esk2_2(X1,X2),X2)
    | ~ organization(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_28]) ).

fof(c_0_32,plain,
    ! [X19,X20] :
      ( ~ organization(X19,X20)
      | reliability(X19,esk1_2(X19,X20),X20) ),
    inference(fof_nnf,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[mp1])])])]) ).

cnf(c_0_33,hypothesis,
    ( greater(X10,X9)
    | ~ organization(X1,X2)
    | ~ organization(X3,X4)
    | ~ reliability(X1,X5,X2)
    | ~ reliability(X3,X6,X4)
    | ~ accountability(X1,X7,X2)
    | ~ accountability(X3,X8,X4)
    | ~ survival_chance(X1,X9,X2)
    | ~ survival_chance(X3,X10,X4)
    | ~ greater(X6,X5)
    | ~ greater(X8,X7) ),
    inference(split_conjunct,[status(thm)],[c_0_29]) ).

cnf(c_0_34,negated_conjecture,
    survival_chance(esk5_0,esk11_0,esk7_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_35,negated_conjecture,
    ( greater(esk2_2(esk5_0,esk7_0),X1)
    | ~ accountability(esk4_0,X1,esk6_0)
    | ~ reliability(esk5_0,X2,esk7_0)
    | ~ reliability(esk4_0,X3,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_30,c_0_31]),c_0_13])]) ).

cnf(c_0_36,plain,
    ( reliability(X1,esk1_2(X1,X2),X2)
    | ~ organization(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_32]) ).

cnf(c_0_37,negated_conjecture,
    ( greater(esk11_0,X1)
    | ~ greater(X2,X3)
    | ~ greater(X4,X5)
    | ~ survival_chance(X6,X1,X7)
    | ~ accountability(esk5_0,X2,esk7_0)
    | ~ accountability(X6,X3,X7)
    | ~ reliability(esk5_0,X4,esk7_0)
    | ~ reliability(X6,X5,X7)
    | ~ organization(X6,X7) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_33,c_0_34]),c_0_13])]) ).

cnf(c_0_38,negated_conjecture,
    ( greater(esk2_2(esk5_0,esk7_0),X1)
    | ~ accountability(esk4_0,X1,esk6_0)
    | ~ reliability(esk4_0,X2,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_35,c_0_36]),c_0_13])]) ).

cnf(c_0_39,negated_conjecture,
    ( greater(esk11_0,X1)
    | ~ greater(esk2_2(esk5_0,esk7_0),X2)
    | ~ greater(X3,X4)
    | ~ survival_chance(X5,X1,X6)
    | ~ accountability(X5,X2,X6)
    | ~ reliability(esk5_0,X3,esk7_0)
    | ~ reliability(X5,X4,X6)
    | ~ organization(X5,X6) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_37,c_0_31]),c_0_13])]) ).

cnf(c_0_40,negated_conjecture,
    ( greater(esk2_2(esk5_0,esk7_0),X1)
    | ~ accountability(esk4_0,X1,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_38,c_0_36]),c_0_23])]) ).

cnf(c_0_41,hypothesis,
    ( greater(X1,X2)
    | ~ greater(X3,X4)
    | ~ organization(X5,X6)
    | ~ organization(X7,X8)
    | ~ reliability(X5,X2,X6)
    | ~ reliability(X7,X1,X8)
    | ~ accountability(X5,X9,X6)
    | ~ accountability(X7,X10,X8)
    | ~ reproducibility(X5,X4,X6)
    | ~ reproducibility(X7,X3,X8) ),
    inference(split_conjunct,[status(thm)],[c_0_15]) ).

cnf(c_0_42,negated_conjecture,
    ( greater(esk11_0,X1)
    | ~ greater(X2,X3)
    | ~ survival_chance(X4,X1,X5)
    | ~ accountability(esk4_0,X6,esk6_0)
    | ~ accountability(X4,X6,X5)
    | ~ reliability(esk5_0,X2,esk7_0)
    | ~ reliability(X4,X3,X5)
    | ~ organization(X4,X5) ),
    inference(spm,[status(thm)],[c_0_39,c_0_40]) ).

cnf(c_0_43,hypothesis,
    ( greater(X1,X2)
    | ~ greater(esk3_2(X3,X4),X5)
    | ~ reproducibility(X6,X5,X7)
    | ~ accountability(X3,X8,X4)
    | ~ accountability(X6,X9,X7)
    | ~ reliability(X3,X1,X4)
    | ~ reliability(X6,X2,X7)
    | ~ organization(X3,X4)
    | ~ organization(X6,X7) ),
    inference(spm,[status(thm)],[c_0_41,c_0_17]) ).

cnf(c_0_44,negated_conjecture,
    ( greater(esk11_0,X1)
    | ~ greater(X2,X3)
    | ~ survival_chance(X4,X1,X5)
    | ~ accountability(X4,esk2_2(esk4_0,esk6_0),X5)
    | ~ reliability(esk5_0,X2,esk7_0)
    | ~ reliability(X4,X3,X5)
    | ~ organization(X4,X5) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_42,c_0_31]),c_0_23])]) ).

cnf(c_0_45,negated_conjecture,
    ( greater(X1,X2)
    | ~ reproducibility(esk4_0,X3,esk6_0)
    | ~ reproducibility(X4,X3,X5)
    | ~ accountability(esk5_0,X6,esk7_0)
    | ~ accountability(X4,X7,X5)
    | ~ reliability(esk5_0,X1,esk7_0)
    | ~ reliability(X4,X2,X5)
    | ~ organization(X4,X5) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_43,c_0_25]),c_0_13])]) ).

cnf(c_0_46,negated_conjecture,
    ( greater(esk11_0,X1)
    | ~ greater(X2,X3)
    | ~ survival_chance(esk4_0,X1,esk6_0)
    | ~ reliability(esk5_0,X2,esk7_0)
    | ~ reliability(esk4_0,X3,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_44,c_0_31]),c_0_23])]) ).

cnf(c_0_47,negated_conjecture,
    survival_chance(esk4_0,esk10_0,esk6_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_48,negated_conjecture,
    ~ greater(esk11_0,esk10_0),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_49,negated_conjecture,
    ( greater(X1,X2)
    | ~ reproducibility(X3,esk3_2(esk4_0,esk6_0),X4)
    | ~ accountability(esk5_0,X5,esk7_0)
    | ~ accountability(X3,X6,X4)
    | ~ reliability(esk5_0,X1,esk7_0)
    | ~ reliability(X3,X2,X4)
    | ~ organization(X3,X4) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_45,c_0_17]),c_0_23])]) ).

cnf(c_0_50,negated_conjecture,
    ( ~ greater(X1,X2)
    | ~ reliability(esk5_0,X1,esk7_0)
    | ~ reliability(esk4_0,X2,esk6_0) ),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_46,c_0_47]),c_0_48]) ).

cnf(c_0_51,negated_conjecture,
    ( ~ accountability(esk5_0,X1,esk7_0)
    | ~ accountability(esk4_0,X2,esk6_0)
    | ~ reliability(esk5_0,X3,esk7_0)
    | ~ reliability(esk4_0,X4,esk6_0) ),
    inference(csr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_49,c_0_17]),c_0_23])]),c_0_50]) ).

cnf(c_0_52,negated_conjecture,
    ( ~ accountability(esk4_0,X1,esk6_0)
    | ~ reliability(esk5_0,X2,esk7_0)
    | ~ reliability(esk4_0,X3,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_51,c_0_31]),c_0_13])]) ).

cnf(c_0_53,negated_conjecture,
    ( ~ reliability(esk5_0,X1,esk7_0)
    | ~ reliability(esk4_0,X2,esk6_0) ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_52,c_0_31]),c_0_23])]) ).

cnf(c_0_54,negated_conjecture,
    ~ reliability(esk4_0,X1,esk6_0),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_53,c_0_36]),c_0_13])]) ).

cnf(c_0_55,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_54,c_0_36]),c_0_23])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.11/0.12  % Problem    : MGT001+1 : TPTP v9.2.0. Released v2.0.0.
% 0.11/0.12  % Command    : run_E /export/starexec/sandbox/benchmark/theBenchmark.p 300 THM
% 0.11/0.33  % Computer : n014.cluster.edu
% 0.11/0.33  % Model    : x86_64 x86_64
% 0.11/0.33  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.11/0.33  % Memory   : 8042.1875MB
% 0.11/0.33  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.11/0.33  % CPULimit   : 300
% 0.11/0.33  % WCLimit    : 300
% 0.11/0.33  % DateTime   : Sat Sep 27 04:34:08 EDT 2025
% 0.19/0.33  % CPUTime    : 
% 0.21/0.47  Running first-order theorem proving
% 0.21/0.47  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.21/0.49  # Version: 3.0.0
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # Starting new_bool_3 with 300s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 300s (1) cores
% 0.21/0.49  # Starting sh5l with 300s (1) cores
% 0.21/0.49  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 2031 completed with status 0
% 0.21/0.49  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # No SInE strategy applied
% 0.21/0.49  # Search class: FHUNF-FFMM22-SFFFFFNN
% 0.21/0.49  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.21/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 151s (1) cores
% 0.21/0.49  # Starting new_bool_3 with 136s (1) cores
% 0.21/0.49  # Starting new_bool_1 with 136s (1) cores
% 0.21/0.49  # Starting sh5l with 136s (1) cores
% 0.21/0.49  # SAT001_MinMin_p005000_rr_RG with pid 2040 completed with status 0
% 0.21/0.49  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.21/0.49  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.21/0.49  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.21/0.49  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.21/0.49  # No SInE strategy applied
% 0.21/0.49  # Search class: FHUNF-FFMM22-SFFFFFNN
% 0.21/0.49  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.21/0.49  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.21/0.49  # Preprocessing time       : 0.001 s
% 0.21/0.49  # Presaturation interreduction done
% 0.21/0.49  
% 0.21/0.49  # Proof found!
% 0.21/0.49  # SZS status Theorem
% 0.21/0.49  # SZS output start CNFRefutation
% See solution above
% 0.21/0.49  # Parsed axioms                        : 7
% 0.21/0.49  # Removed by relevancy pruning/SinE    : 0
% 0.21/0.49  # Initial clauses                      : 19
% 0.21/0.49  # Removed in clause preprocessing      : 0
% 0.21/0.49  # Initial clauses in saturation        : 19
% 0.21/0.49  # Processed clauses                    : 87
% 0.21/0.49  # ...of these trivial                  : 0
% 0.21/0.49  # ...subsumed                          : 0
% 0.21/0.49  # ...remaining for further processing  : 87
% 0.21/0.49  # Other redundant clauses eliminated   : 0
% 0.21/0.49  # Clauses deleted for lack of memory   : 0
% 0.21/0.49  # Backward-subsumed                    : 11
% 0.21/0.49  # Backward-rewritten                   : 0
% 0.21/0.49  # Generated clauses                    : 61
% 0.21/0.49  # ...of the previous two non-redundant : 56
% 0.21/0.49  # ...aggressively subsumed             : 0
% 0.21/0.49  # Contextual simplify-reflections      : 1
% 0.21/0.49  # Paramodulations                      : 61
% 0.21/0.49  # Factorizations                       : 0
% 0.21/0.49  # NegExts                              : 0
% 0.21/0.49  # Equation resolutions                 : 0
% 0.21/0.49  # Disequality decompositions           : 0
% 0.21/0.49  # Total rewrite steps                  : 61
% 0.21/0.49  # ...of those cached                   : 56
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
% 0.21/0.49  # Current number of processed clauses  : 57
% 0.21/0.49  #    Positive orientable unit clauses  : 9
% 0.21/0.49  #    Positive unorientable unit clauses: 0
% 0.21/0.49  #    Negative unit clauses             : 2
% 0.21/0.49  #    Non-unit-clauses                  : 46
% 0.21/0.49  # Current number of unprocessed clauses: 7
% 0.21/0.49  # ...number of literals in the above   : 62
% 0.21/0.49  # Current number of archived formulas  : 0
% 0.21/0.49  # Current number of archived clauses   : 30
% 0.21/0.49  # Clause-clause subsumption calls (NU) : 1575
% 0.21/0.49  # Rec. Clause-clause subsumption calls : 64
% 0.21/0.49  # Non-unit clause-clause subsumptions  : 8
% 0.21/0.49  # Unit Clause-clause subsumption calls : 21
% 0.21/0.49  # Rewrite failures with RHS unbound    : 0
% 0.21/0.49  # BW rewrite match attempts            : 0
% 0.21/0.49  # BW rewrite match successes           : 0
% 0.21/0.49  # Condensation attempts                : 0
% 0.21/0.49  # Condensation successes               : 0
% 0.21/0.49  # Termbank termtop insertions          : 4630
% 0.21/0.49  # Search garbage collected termcells   : 516
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.009 s
% 0.21/0.49  # System time              : 0.003 s
% 0.21/0.49  # Total time               : 0.012 s
% 0.21/0.49  # Maximum resident set size: 1788 pages
% 0.21/0.49  
% 0.21/0.49  # -------------------------------------------------
% 0.21/0.49  # User time                : 0.033 s
% 0.21/0.49  # System time              : 0.008 s
% 0.21/0.49  # Total time               : 0.042 s
% 0.21/0.49  # Maximum resident set size: 1724 pages
% 0.21/0.49  % E exiting
% 0.21/0.49  % E exiting
%------------------------------------------------------------------------------
