
%--------------------------------------------------------------------------
% File     : LCL028+2 : TPTP v9.2.1. Released v9.1.0.
% Domain   : Logic Calculi (Implication/Falsehood 2 valued sentential)
% Problem  : C0-CAMeredith depends on the Church system, Tarski/Rezus
% Version  : [RW+23] axioms
% English  : Axiomatisations for the Implication/Falsehood 2 valued
%            sentential calculus are {C0-1,C0-2,C0-3,C0-4}
%            by Tarski-Bernays, {C0-2,C0-5,C0-6} by Church, and the single
%            Meredith axioms. Show that the Meredith axiom can be derived
%            from the Church system.

% Refs     : [MW92]  McCune & Wos (1992), Experiments in Automated Deductio
%          : [McC92] McCune (1992), Email to Geoff Sutcliffe
%          : [Rez20] Rezus (2020), Tarski's Claim Thirty Years Later (2010)
%          : [RW+23] Rawson et al. (2023), Lemmas: Generation, Selection, A
% Source   : [McC92]
% Names    : LCL028-1_basis_to_theorem_std.p [RW+23]

% Status   : Theorem
% Rating   : 0.85 v9.1.0
% Syntax   : Number of formulae    :    3 (   2 unt;   0 def)
%            Number of atoms       :    5 (   0 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :    2 (   0   ~;   0   |;   1   &)
%                                         (   0 ;   1  =>;   0  )
%            Maximal formula depth :   16 (   7 avg)
%            Maximal term depth    :   12 (   3 avg)
%            Number of predicates  :    1 (   1 usr;   0 prp; 1-1 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :   17 (  17   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
fof(condensed_detachment,axiom,
    ! [X,Y] :
      ( ( is_a_theorem(implies(X,Y))
        & is_a_theorem(X) )
     => is_a_theorem(Y) ) ).

fof(f2,axiom,(
    ! [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O] : is_a_theorem(implies(implies(implies(implies(implies(A,implies(B,A)),implies(implies(C,implies(D,implies(E,D))),F)),F),implies(implies(implies(implies(implies(implies(G,implies(H,G)),implies(implies(implies(implies(I,falsehood),falsehood),I),J)),J),implies(implies(implies(K,implies(L,M)),implies(implies(K,L),implies(K,M))),N)),N),O)),O)) )).

fof(f3,conjecture,(
    is_a_theorem(implies(implies(implies(implies(implies(a,b),implies(c,falsehood)),e),falsehood),implies(implies(falsehood,a),implies(c,a)))) )).
%------------------------------------------------------------------------------
