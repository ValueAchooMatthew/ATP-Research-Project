
%------------------------------------------------------------------------------
% File     : SET002+3 : TPTP v9.2.1. Released v2.2.0.
% Domain   : Set Theory
% Problem  : Idempotency of union
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [Try90] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [TS89]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (62) [TS89]

% Status   : Theorem
% Rating   : 0.06 v9.1.0, 0.00 v9.0.0, 0.03 v8.1.0, 0.00 v6.4.0, 0.04 v6.3.0, 0.00 v6.1.0, 0.07 v6.0.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.00 v5.0.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    8 (   3 unt;   0 def)
%            Number of atoms       :   17 (   5 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    9 (   0   ~;   1   |;   1   &)
%                                         (   5 ;   2  =>;   0  )
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   17 (  17   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%---- line(boole - th(35),1833266)
fof(subset_union,axiom,
    ! [B,C] :
      ( subset(B,C)
     => union(B,C) = C ) ).

%---- line(boole - df(2),1833042)
fof(union_defn,axiom,
    ! [B,C,D] :
      ( member(D,union(B,C))
     ( member(D,B)
        | member(D,C) ) ) ).

%---- line(boole - df(8),1833103)
fof(equal_defn,axiom,
    ! [B,C] :
      ( B = C
     ( subset(B,C)
        & subset(C,B) ) ) ).

%---- property(commutativity,op(union,2,function))
fof(commutativity_of_union,axiom,
    ! [B,C] : union(B,C) = union(C,B) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
     ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom102,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
     ! [D] :
          ( member(D,B)
         member(D,C) ) ) ).

%---- line(boole - th(62),1833685)
fof(prove_idempotency_of_union,conjecture,
    ! [B] : union(B,B) = B ).

%------------------------------------------------------------------------------
