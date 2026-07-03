
%--------------------------------------------------------------------------
% File     : LCL028+1 : TPTP v9.2.1. Released v9.1.0.
% Domain   : Logic Calculi (Implication/Falsehood 2 valued sentential)
% Problem  : C0-CAMeredith depends on the Church system
% Version  : [McC92] axioms.
% English  : Axiomatisations for the Implication/Falsehood 2 valued
%            sentential calculus are {C0-1,C0-2,C0-3,C0-4}
%            by Tarski-Bernays, {C0-2,C0-5,C0-6} by Church, and the single
%            Meredith axioms. Show that the Meredith axiom can be derived
%            from the Church system.

% Refs     : [MW92]  McCune & Wos (1992), Experiments in Automated Deductio
%          : [McC92] McCune (1992), Email to Geoff Sutcliffe
%          : [RW+23] Rawson et al. (2023), Lemmas: Generation, Selection, A
% Source   : [McC92]
% Names    : C0-40 [MW92]

% Status   : Theorem
% Rating   : 0.90 v9.1.0
% Syntax   : Number of formulae    :    5 (   4 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :    2 (   0   ~;   0   |;   1   &)
%                                         (   0 ;   1  =>;   0  )
%            Maximal formula depth :    5 (   3 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   1 usr;   0 prp; 1-1 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :    8 (   8   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
fof(condensed_detachment,axiom,
    ! [X,Y] :
      ( ( is_a_theorem(implies(X,Y))
        & is_a_theorem(X) )
     => is_a_theorem(Y) ) ).

fof(c0_2,axiom,
    ! [X,Y] : is_a_theorem(implies(X,implies(Y,X))) ).

fof(c0_5,axiom,
    ! [X] : is_a_theorem(implies(implies(implies(X,falsehood),falsehood),X)) ).

fof(c0_6,axiom,
    ! [X,Y,Z] : is_a_theorem(implies(implies(X,implies(Y,Z)),implies(implies(X,Y),implies(X,Z)))) ).

fof(prove_c0_CAMeredith,conjecture,
    is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))) ).

%--------------------------------------------------------------------------
