
%--------------------------------------------------------------------------
% File     : AGT001+2 : TPTP v9.2.1. Bugfixed v3.1.0.
% Domain   : Agents
% Problem  : Problem for the CPlanT system
% Version  : [Bar03] axioms : Especial.
% English  :

% Refs     : [Bar03] Barta, J. (2003), Email to G. Sutcliffe
%          : [<a href=SeeTPTP?Category=BibTeX&File=BT+03>BT+03</a>] Barta et al. (2003), Meta-Reasoning in CPlanT Multi-Ag
%          : [<a href=SeeTPTP?Category=BibTeX&File=TBP03>TBP03</a>] Tozicka et al. (2003), Meta-reasoning for Agents' Priv
% Source   : [Bar03]
% Names    :

% Status   : Theorem
% Rating   : 0.06 v9.1.0, 0.03 v8.1.0
% Syntax   : Number of formulae    :  923 ( 891 unt;   0 def)
%            Number of atoms       : 1023 (   2 equ)
%            Maximal formula atoms :    6 (   1 avg)
%            Number of connectives :  148 (  48   ~;   1   |;  67   &)
%                                         (  16 <=>;  16  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :   17 (  16 usr;   0 prp; 1-4 aty)
%            Number of functors    :  290 ( 290 usr; 286 con; 0-2 aty)
%            Number of variables   :   70 (  70   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v3.0.0 - Bugfixes in NUM005+1.ax
%          : v3.1.0 - Changes to NUM005 axioms
%--------------------------------------------------------------------------
%----Include axioms of CPlanT
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=AGT001+0.ax>AGT001+0.ax</a>').
%----Include events of CPlanT
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=AGT001+1.ax>AGT001+1.ax</a>').
%----Include lemmas of CPlanT
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=AGT001+2.ax>AGT001+2.ax</a>').
%----Include axioms for RDN and RDN less
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=NUM005+0.ax>NUM005+0.ax</a>').
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=NUM005+1.ax>NUM005+1.ax</a>').
%--------------------------------------------------------------------------
<A NAME="query_1"></A>fof(query_1,conjecture,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6) ).

%--------------------------------------------------------------------------
