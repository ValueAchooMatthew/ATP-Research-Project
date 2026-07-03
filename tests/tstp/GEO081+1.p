
%--------------------------------------------------------------------------
% File     : GEO081+1 : TPTP v9.2.1. Released v2.4.0.
% Domain   : Geometry (Oriented curves)
% Problem  : Transitivity of part_of
% Version  : [EHK99] axioms.
% English  :

% Refs     : [KE99]  Kulik & Eschenbach (1999), A Geometry of Oriented Curv
%          : [EHK99] Eschenbach et al. (1999), Representing Simple Trajecto
% Source   : [KE99]
% Names    : Theorem 2.5 [KE99]

% Status   : Theorem
% Rating   : 0.15 v9.1.0, 0.09 v9.0.0, 0.11 v8.1.0, 0.06 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.09 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.08 v6.2.0, 0.04 v6.1.0, 0.17 v6.0.0, 0.22 v5.5.0, 0.15 v5.4.0, 0.14 v5.3.0, 0.15 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0, 0.22 v2.7.0, 0.17 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of formulae    :   17 (   1 unt;   0 def)
%            Number of atoms       :   70 (  10 equ)
%            Maximal formula atoms :   12 (   4 avg)
%            Number of connectives :   57 (   4   ~;   9   |;  22   &)
%                                         (   9 ;  13  =>;   0  )
%            Maximal formula depth :   12 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    8 (   7 usr;   0 prp; 1-3 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   56 (  47   !;   9   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include simple curve axioms
include('Axioms/GEO004+0.ax').
%--------------------------------------------------------------------------
fof(part_of_transitivity,conjecture,
    ! [C1,C2,C3] :
      ( ( part_of(C1,C2)
        & part_of(C2,C3) )
     => part_of(C1,C3) ) ).

%--------------------------------------------------------------------------
