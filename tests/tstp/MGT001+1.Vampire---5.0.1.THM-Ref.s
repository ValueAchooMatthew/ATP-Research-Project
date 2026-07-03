
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : MGT001+1 : TPTP v9.2.1. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n001.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:43:22 PM UTC 2026

% Result   : Theorem 0.50s 0.95s
% Output   : Refutation 0.50s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   25
%            Number of leaves      :   20
% Syntax   : Number of formulae    :  146 (  26 unt;   9 def)
%            Number of atoms       :  694 (   0 equ)
%            Maximal formula atoms :   20 (   4 avg)
%            Number of connectives : 1054 ( 506   ~; 429   |;  92   &)
%                                         (  15 ;  12  =>;   0  )
%            Maximal formula depth :   22 (   8 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   18 (  17 usr;  10 prp; 0-3 aty)
%            Number of functors    :   11 (  11 usr;   8 con; 0-2 aty)
%            Number of variables   :  414 (   0 sgn 381   !;  33   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( organization(X0,X1)
     => ? [X2] : reliability(X0,X2,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp1) ).

fof(f2,axiom,
    ! [X0,X1] :
      ( organization(X0,X1)
     => ? [X2] : accountability(X0,X2,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp2) ).

fof(f3,axiom,
    ! [X0,X1] :
      ( organization(X0,X1)
     => ? [X2] : reproducibility(X0,X2,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',mp3) ).

fof(f4,axiom,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( organization(X0,X8)
        & organization(X1,X9)
        & reliability(X0,X2,X8)
        & reliability(X1,X3,X9)
        & accountability(X0,X4,X8)
        & accountability(X1,X5,X9)
        & survival_chance(X0,X6,X8)
        & survival_chance(X1,X7,X9)
        & greater(X3,X2)
        & greater(X5,X4) )
     => greater(X7,X6) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a1_FOL) ).

fof(f5,axiom,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( organization(X0,X2)
        & organization(X1,X3)
        & reliability(X0,X4,X2)
        & reliability(X1,X5,X3)
        & accountability(X0,X6,X2)
        & accountability(X1,X7,X3)
        & reproducibility(X0,X8,X2)
        & reproducibility(X1,X9,X3) )
     => ( greater(X9,X8)
       ( greater(X5,X4)
          & greater(X7,X6) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a2_FOL) ).

fof(f6,axiom,
    ! [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ( organization(X0,X2)
        & organization(X1,X3)
        & reorganization_free(X0,X2,X2)
        & reorganization_free(X1,X3,X3)
        & reproducibility(X0,X4,X2)
        & reproducibility(X1,X5,X3)
        & inertia(X0,X6,X2)
        & inertia(X1,X7,X3) )
     => ( greater(X5,X4)
       greater(X7,X6) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',a3_FOL) ).

fof(f7,conjecture,
    ! [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ( organization(X0,X2)
        & organization(X1,X3)
        & reorganization_free(X0,X2,X2)
        & reorganization_free(X1,X3,X3)
        & inertia(X0,X4,X2)
        & inertia(X1,X5,X3)
        & survival_chance(X0,X6,X2)
        & survival_chance(X1,X7,X3)
        & greater(X5,X4) )
     => greater(X7,X6) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',t1_FOL) ).

fof(f8,negated_conjecture,
    ~ ! [X0,X1,X2,X3,X4,X5,X6,X7] :
        ( ( organization(X0,X2)
          & organization(X1,X3)
          & reorganization_free(X0,X2,X2)
          & reorganization_free(X1,X3,X3)
          & inertia(X0,X4,X2)
          & inertia(X1,X5,X3)
          & survival_chance(X0,X6,X2)
          & survival_chance(X1,X7,X3)
          & greater(X5,X4) )
       => greater(X7,X6) ),
    inference(negated_conjecture,[status(cth)],[f7]) ).

fof(f9,plain,
    ! [X0,X1] :
      ( ? [X2] : reliability(X0,X2,X1)
      | ~ organization(X0,X1) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f10,plain,
    ! [X0,X1] :
      ( ? [X2] : accountability(X0,X2,X1)
      | ~ organization(X0,X1) ),
    inference(ennf_transformation,[],[f2]) ).

fof(f11,plain,
    ! [X0,X1] :
      ( ? [X2] : reproducibility(X0,X2,X1)
      | ~ organization(X0,X1) ),
    inference(ennf_transformation,[],[f3]) ).

fof(f12,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( greater(X7,X6)
      | ~ organization(X0,X8)
      | ~ organization(X1,X9)
      | ~ reliability(X0,X2,X8)
      | ~ reliability(X1,X3,X9)
      | ~ accountability(X0,X4,X8)
      | ~ accountability(X1,X5,X9)
      | ~ survival_chance(X0,X6,X8)
      | ~ survival_chance(X1,X7,X9)
      | ~ greater(X3,X2)
      | ~ greater(X5,X4) ),
    inference(ennf_transformation,[],[f4]) ).

fof(f13,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( greater(X7,X6)
      | ~ organization(X0,X8)
      | ~ organization(X1,X9)
      | ~ reliability(X0,X2,X8)
      | ~ reliability(X1,X3,X9)
      | ~ accountability(X0,X4,X8)
      | ~ accountability(X1,X5,X9)
      | ~ survival_chance(X0,X6,X8)
      | ~ survival_chance(X1,X7,X9)
      | ~ greater(X3,X2)
      | ~ greater(X5,X4) ),
    inference(flattening,[],[f12]) ).

fof(f14,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( greater(X9,X8)
       ( greater(X5,X4)
          & greater(X7,X6) ) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(ennf_transformation,[],[f5]) ).

fof(f15,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( greater(X9,X8)
       ( greater(X5,X4)
          & greater(X7,X6) ) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(flattening,[],[f14]) ).

fof(f16,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ( greater(X5,X4)
       greater(X7,X6) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X1,X3,X3)
      | ~ reproducibility(X0,X4,X2)
      | ~ reproducibility(X1,X5,X3)
      | ~ inertia(X0,X6,X2)
      | ~ inertia(X1,X7,X3) ),
    inference(ennf_transformation,[],[f6]) ).

fof(f17,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ( greater(X5,X4)
       greater(X7,X6) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X1,X3,X3)
      | ~ reproducibility(X0,X4,X2)
      | ~ reproducibility(X1,X5,X3)
      | ~ inertia(X0,X6,X2)
      | ~ inertia(X1,X7,X3) ),
    inference(flattening,[],[f16]) ).

fof(f18,plain,
    ? [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ~ greater(X7,X6)
      & organization(X0,X2)
      & organization(X1,X3)
      & reorganization_free(X0,X2,X2)
      & reorganization_free(X1,X3,X3)
      & inertia(X0,X4,X2)
      & inertia(X1,X5,X3)
      & survival_chance(X0,X6,X2)
      & survival_chance(X1,X7,X3)
      & greater(X5,X4) ),
    inference(ennf_transformation,[],[f8]) ).

fof(f19,plain,
    ? [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ~ greater(X7,X6)
      & organization(X0,X2)
      & organization(X1,X3)
      & reorganization_free(X0,X2,X2)
      & reorganization_free(X1,X3,X3)
      & inertia(X0,X4,X2)
      & inertia(X1,X5,X3)
      & survival_chance(X0,X6,X2)
      & survival_chance(X1,X7,X3)
      & greater(X5,X4) ),
    inference(flattening,[],[f18]) ).

fof(f20,plain,
    ! [X0,X1] :
      ( ? [X2] : reliability(X0,X2,X1)
     => reliability(X0,sK0(X0,X1),X1) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f21,plain,
    ! [X0,X1] :
      ( reliability(X0,sK0(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[f9,f20]) ).

fof(f22,plain,
    ! [X0,X1] :
      ( ? [X2] : accountability(X0,X2,X1)
     => accountability(X0,sK1(X0,X1),X1) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f23,plain,
    ! [X0,X1] :
      ( accountability(X0,sK1(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1])],[f10,f22]) ).

fof(f24,plain,
    ! [X0,X1] :
      ( ? [X2] : reproducibility(X0,X2,X1)
     => reproducibility(X0,sK2(X0,X1),X1) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f25,plain,
    ! [X0,X1] :
      ( reproducibility(X0,sK2(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK2])],[f11,f24]) ).

fof(f26,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( ( greater(X9,X8)
          | ~ greater(X5,X4)
          | ~ greater(X7,X6) )
        & ( ( greater(X5,X4)
            & greater(X7,X6) )
          | ~ greater(X9,X8) ) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(nnf_transformation,[],[f15]) ).

fof(f27,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7,X8,X9] :
      ( ( ( greater(X9,X8)
          | ~ greater(X5,X4)
          | ~ greater(X7,X6) )
        & ( ( greater(X5,X4)
            & greater(X7,X6) )
          | ~ greater(X9,X8) ) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(flattening,[],[f26]) ).

fof(f28,plain,
    ! [X0,X1,X2,X3,X4,X5,X6,X7] :
      ( ( ( greater(X5,X4)
          | ~ greater(X7,X6) )
        & ( greater(X7,X6)
          | ~ greater(X5,X4) ) )
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X1,X3,X3)
      | ~ reproducibility(X0,X4,X2)
      | ~ reproducibility(X1,X5,X3)
      | ~ inertia(X0,X6,X2)
      | ~ inertia(X1,X7,X3) ),
    inference(nnf_transformation,[],[f17]) ).

fof(f29,plain,
    ( ? [X0,X1,X2,X3,X4,X5,X6,X7] :
        ( ~ greater(X7,X6)
        & organization(X0,X2)
        & organization(X1,X3)
        & reorganization_free(X0,X2,X2)
        & reorganization_free(X1,X3,X3)
        & inertia(X0,X4,X2)
        & inertia(X1,X5,X3)
        & survival_chance(X0,X6,X2)
        & survival_chance(X1,X7,X3)
        & greater(X5,X4) )
   => ( ~ greater(sK10,sK9)
      & organization(sK3,sK5)
      & organization(sK4,sK6)
      & reorganization_free(sK3,sK5,sK5)
      & reorganization_free(sK4,sK6,sK6)
      & inertia(sK3,sK7,sK5)
      & inertia(sK4,sK8,sK6)
      & survival_chance(sK3,sK9,sK5)
      & survival_chance(sK4,sK10,sK6)
      & greater(sK8,sK7) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f30,plain,
    ( ~ greater(sK10,sK9)
    & organization(sK3,sK5)
    & organization(sK4,sK6)
    & reorganization_free(sK3,sK5,sK5)
    & reorganization_free(sK4,sK6,sK6)
    & inertia(sK3,sK7,sK5)
    & inertia(sK4,sK8,sK6)
    & survival_chance(sK3,sK9,sK5)
    & survival_chance(sK4,sK10,sK6)
    & greater(sK8,sK7) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK3,sK4,sK5,sK6,sK7,sK8,sK9,sK10])],[f19,f29]) ).

fof(f31,plain,
    ! [X0,X1] :
      ( reliability(X0,sK0(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(cnf_transformation,[],[f21]) ).

fof(f32,plain,
    ! [X0,X1] :
      ( accountability(X0,sK1(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(cnf_transformation,[],[f23]) ).

fof(f33,plain,
    ! [X0,X1] :
      ( reproducibility(X0,sK2(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(cnf_transformation,[],[f25]) ).

fof(f34,plain,
    ! [X2,X3,X0,X1,X8,X6,X9,X7,X4,X5] :
      ( greater(X7,X6)
      | ~ organization(X0,X8)
      | ~ organization(X1,X9)
      | ~ reliability(X0,X2,X8)
      | ~ reliability(X1,X3,X9)
      | ~ accountability(X0,X4,X8)
      | ~ accountability(X1,X5,X9)
      | ~ survival_chance(X0,X6,X8)
      | ~ survival_chance(X1,X7,X9)
      | ~ greater(X3,X2)
      | ~ greater(X5,X4) ),
    inference(cnf_transformation,[],[f13]) ).

fof(f35,plain,
    ! [X2,X3,X0,X1,X8,X6,X9,X7,X4,X5] :
      ( greater(X7,X6)
      | ~ greater(X9,X8)
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(cnf_transformation,[],[f27]) ).

fof(f36,plain,
    ! [X2,X3,X0,X1,X8,X6,X9,X7,X4,X5] :
      ( greater(X5,X4)
      | ~ greater(X9,X8)
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reliability(X0,X4,X2)
      | ~ reliability(X1,X5,X3)
      | ~ accountability(X0,X6,X2)
      | ~ accountability(X1,X7,X3)
      | ~ reproducibility(X0,X8,X2)
      | ~ reproducibility(X1,X9,X3) ),
    inference(cnf_transformation,[],[f27]) ).

fof(f39,plain,
    ! [X2,X3,X0,X1,X6,X7,X4,X5] :
      ( greater(X5,X4)
      | ~ greater(X7,X6)
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X1,X3,X3)
      | ~ reproducibility(X0,X4,X2)
      | ~ reproducibility(X1,X5,X3)
      | ~ inertia(X0,X6,X2)
      | ~ inertia(X1,X7,X3) ),
    inference(cnf_transformation,[],[f28]) ).

fof(f40,plain,
    greater(sK8,sK7),
    inference(cnf_transformation,[],[f30]) ).

fof(f41,plain,
    survival_chance(sK4,sK10,sK6),
    inference(cnf_transformation,[],[f30]) ).

fof(f42,plain,
    survival_chance(sK3,sK9,sK5),
    inference(cnf_transformation,[],[f30]) ).

fof(f43,plain,
    inertia(sK4,sK8,sK6),
    inference(cnf_transformation,[],[f30]) ).

fof(f44,plain,
    inertia(sK3,sK7,sK5),
    inference(cnf_transformation,[],[f30]) ).

fof(f45,plain,
    reorganization_free(sK4,sK6,sK6),
    inference(cnf_transformation,[],[f30]) ).

fof(f46,plain,
    reorganization_free(sK3,sK5,sK5),
    inference(cnf_transformation,[],[f30]) ).

fof(f47,plain,
    organization(sK4,sK6),
    inference(cnf_transformation,[],[f30]) ).

fof(f48,plain,
    organization(sK3,sK5),
    inference(cnf_transformation,[],[f30]) ).

fof(f49,plain,
    ~ greater(sK10,sK9),
    inference(cnf_transformation,[],[f30]) ).

fof(f54,plain,
    ! [X2,X3,X0,X1,X6,X7,X4,X5] :
      ( ~ survival_chance(X2,sK10,X3)
      | ~ organization(X2,X3)
      | ~ reliability(X0,X4,X1)
      | ~ reliability(X2,X5,X3)
      | ~ accountability(X0,X6,X1)
      | ~ accountability(X2,X7,X3)
      | ~ survival_chance(X0,sK9,X1)
      | ~ organization(X0,X1)
      | ~ greater(X5,X4)
      | ~ greater(X7,X6) ),
    inference(resolution,[],[f34,f49]) ).

fof(f55,plain,
    ! [X2,X3,X0,X1,X4,X5] :
      ( ~ organization(sK4,sK6)
      | ~ reliability(X0,X1,X2)
      | ~ reliability(sK4,X3,sK6)
      | ~ accountability(X0,X4,X2)
      | ~ accountability(sK4,X5,sK6)
      | ~ survival_chance(X0,sK9,X2)
      | ~ organization(X0,X2)
      | ~ greater(X3,X1)
      | ~ greater(X5,X4) ),
    inference(resolution,[],[f54,f41]) ).

fof(f56,plain,
    ! [X2,X3,X0,X1,X4,X5] :
      ( ~ accountability(sK4,X5,sK6)
      | ~ reliability(sK4,X3,sK6)
      | ~ accountability(X0,X4,X2)
      | ~ reliability(X0,X1,X2)
      | ~ survival_chance(X0,sK9,X2)
      | ~ organization(X0,X2)
      | ~ greater(X3,X1)
      | ~ greater(X5,X4) ),
    inference(forward_subsumption_resolution,[],[f55,f47]) ).

fof(f58,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ reliability(sK4,X0,sK6)
      | ~ accountability(X1,X2,X3)
      | ~ reliability(X1,X4,X3)
      | ~ survival_chance(X1,sK9,X3)
      | ~ organization(X1,X3)
      | ~ greater(X0,X4)
      | ~ greater(sK1(sK4,sK6),X2)
      | ~ organization(sK4,sK6) ),
    inference(resolution,[],[f56,f32]) ).

fof(f61,plain,
    ! [X2,X3,X0,X1,X4] :
      ( ~ reliability(sK4,X0,sK6)
      | ~ accountability(X1,X2,X3)
      | ~ reliability(X1,X4,X3)
      | ~ survival_chance(X1,sK9,X3)
      | ~ organization(X1,X3)
      | ~ greater(X0,X4)
      | ~ greater(sK1(sK4,sK6),X2) ),
    inference(forward_subsumption_resolution,[],[f58,f47]) ).

fof(f73,plain,
    ! [X2,X3,X0,X1] :
      ( ~ accountability(X0,X1,X2)
      | ~ reliability(X0,X3,X2)
      | ~ survival_chance(X0,sK9,X2)
      | ~ organization(X0,X2)
      | ~ greater(sK0(sK4,sK6),X3)
      | ~ greater(sK1(sK4,sK6),X1)
      | ~ organization(sK4,sK6) ),
    inference(resolution,[],[f61,f31]) ).

fof(f75,plain,
    ! [X2,X3,X0,X1] :
      ( ~ survival_chance(X0,sK9,X2)
      | ~ reliability(X0,X3,X2)
      | ~ accountability(X0,X1,X2)
      | ~ organization(X0,X2)
      | ~ greater(sK0(sK4,sK6),X3)
      | ~ greater(sK1(sK4,sK6),X1) ),
    inference(forward_subsumption_resolution,[],[f73,f47]) ).

fof(f76,plain,
    ! [X0,X1] :
      ( ~ reliability(sK3,X0,sK5)
      | ~ accountability(sK3,X1,sK5)
      | ~ organization(sK3,sK5)
      | ~ greater(sK0(sK4,sK6),X0)
      | ~ greater(sK1(sK4,sK6),X1) ),
    inference(resolution,[],[f75,f42]) ).

fof(f77,plain,
    ! [X0,X1] :
      ( ~ reliability(sK3,X0,sK5)
      | ~ accountability(sK3,X1,sK5)
      | ~ greater(sK0(sK4,sK6),X0)
      | ~ greater(sK1(sK4,sK6),X1) ),
    inference(forward_subsumption_resolution,[],[f76,f48]) ).

fof(f79,definition,
    ( spl11_4
   ! [X1] :
        ( ~ accountability(sK3,X1,sK5)
        | ~ greater(sK1(sK4,sK6),X1) ) ),
    introduced(definition,[new_symbols(naming,[spl11_4])],[avatar_definition]) ).

fof(f80,plain,
    ( ! [X1] :
        ( ~ accountability(sK3,X1,sK5)
        | ~ greater(sK1(sK4,sK6),X1) )
    | ~ spl11_4 ),
    inference(avatar_component_clause,[],[f79]) ).

fof(f82,definition,
    ( spl11_5
   ! [X0] :
        ( ~ reliability(sK3,X0,sK5)
        | ~ greater(sK0(sK4,sK6),X0) ) ),
    introduced(definition,[new_symbols(naming,[spl11_5])],[avatar_definition]) ).

fof(f83,plain,
    ( ! [X0] :
        ( ~ reliability(sK3,X0,sK5)
        | ~ greater(sK0(sK4,sK6),X0) )
    | ~ spl11_5 ),
    inference(avatar_component_clause,[],[f82]) ).

fof(f84,plain,
    ( spl11_4
    | spl11_5 ),
    inference(avatar_split_clause,[],[f77,f82,f79]) ).

fof(f85,plain,
    ( ~ greater(sK1(sK4,sK6),sK1(sK3,sK5))
    | ~ organization(sK3,sK5)
    | ~ spl11_4 ),
    inference(resolution,[],[f80,f32]) ).

fof(f86,plain,
    ( ~ greater(sK1(sK4,sK6),sK1(sK3,sK5))
    | ~ spl11_4 ),
    inference(forward_subsumption_resolution,[],[f85,f48]) ).

fof(f92,plain,
    ( ! [X2,X3,X0,X1,X6,X7,X4,X5] :
        ( ~ accountability(X4,sK1(sK4,sK6),X5)
        | ~ organization(X2,X3)
        | ~ organization(X4,X5)
        | ~ reliability(X2,X6,X3)
        | ~ reliability(X4,X7,X5)
        | ~ accountability(X2,sK1(sK3,sK5),X3)
        | ~ greater(X0,X1)
        | ~ reproducibility(X2,X1,X3)
        | ~ reproducibility(X4,X0,X5) )
    | ~ spl11_4 ),
    inference(resolution,[],[f86,f35]) ).

fof(f93,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reliability(X0,X2,X1)
        | ~ reliability(sK4,X3,sK6)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ greater(X4,X5)
        | ~ reproducibility(X0,X5,X1)
        | ~ reproducibility(sK4,X4,sK6)
        | ~ organization(sK4,sK6) )
    | ~ spl11_4 ),
    inference(resolution,[],[f92,f32]) ).

fof(f94,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reliability(X0,X2,X1)
        | ~ reliability(sK4,X3,sK6)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ greater(X4,X5)
        | ~ reproducibility(X0,X5,X1)
        | ~ reproducibility(sK4,X4,sK6) )
    | ~ spl11_4 ),
    inference(duplicate_literal_removal,[],[f93]) ).

fof(f95,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ reliability(X0,X2,X1)
        | ~ reliability(sK4,X3,sK6)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ greater(X4,X5)
        | ~ reproducibility(X0,X5,X1)
        | ~ reproducibility(sK4,X4,sK6) )
    | ~ spl11_4 ),
    inference(forward_subsumption_resolution,[],[f94,f47]) ).

fof(f97,definition,
    ( spl11_6
   ! [X3] : ~ reliability(sK4,X3,sK6) ),
    introduced(definition,[new_symbols(naming,[spl11_6])],[avatar_definition]) ).

fof(f98,plain,
    ( ! [X3] : ~ reliability(sK4,X3,sK6)
    | ~ spl11_6 ),
    inference(avatar_component_clause,[],[f97]) ).

fof(f100,definition,
    ( spl11_7
   ! [X2,X4,X0,X5,X1] :
        ( ~ organization(X0,X1)
        | ~ reproducibility(sK4,X4,sK6)
        | ~ reproducibility(X0,X5,X1)
        | ~ greater(X4,X5)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ reliability(X0,X2,X1) ) ),
    introduced(definition,[new_symbols(naming,[spl11_7])],[avatar_definition]) ).

fof(f101,plain,
    ( ! [X2,X0,X1,X4,X5] :
        ( ~ reproducibility(sK4,X4,sK6)
        | ~ organization(X0,X1)
        | ~ reproducibility(X0,X5,X1)
        | ~ greater(X4,X5)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ reliability(X0,X2,X1) )
    | ~ spl11_7 ),
    inference(avatar_component_clause,[],[f100]) ).

fof(f102,plain,
    ( spl11_6
    | spl11_7
    | ~ spl11_4 ),
    inference(avatar_split_clause,[],[f95,f79,f100,f97]) ).

fof(f103,plain,
    ( ~ greater(sK0(sK4,sK6),sK0(sK3,sK5))
    | ~ organization(sK3,sK5)
    | ~ spl11_5 ),
    inference(resolution,[],[f83,f31]) ).

fof(f104,plain,
    ( ~ greater(sK0(sK4,sK6),sK0(sK3,sK5))
    | ~ spl11_5 ),
    inference(forward_subsumption_resolution,[],[f103,f48]) ).

fof(f115,definition,
    ( spl11_8
   ! [X5] : ~ accountability(sK4,X5,sK6) ),
    introduced(definition,[new_symbols(naming,[spl11_8])],[avatar_definition]) ).

fof(f116,plain,
    ( ! [X5] : ~ accountability(sK4,X5,sK6)
    | ~ spl11_8 ),
    inference(avatar_component_clause,[],[f115]) ).

fof(f118,definition,
    ( spl11_9
   ! [X4,X0,X3,X2,X1] :
        ( ~ organization(X0,X1)
        | ~ reproducibility(sK4,X2,sK6)
        | ~ reproducibility(X0,X3,X1)
        | ~ accountability(X0,X4,X1)
        | ~ greater(X2,X3)
        | ~ reliability(X0,sK0(sK3,sK5),X1) ) ),
    introduced(definition,[new_symbols(naming,[spl11_9])],[avatar_definition]) ).

fof(f119,plain,
    ( ! [X2,X3,X0,X1,X4] :
        ( ~ reproducibility(sK4,X2,sK6)
        | ~ organization(X0,X1)
        | ~ reproducibility(X0,X3,X1)
        | ~ accountability(X0,X4,X1)
        | ~ greater(X2,X3)
        | ~ reliability(X0,sK0(sK3,sK5),X1) )
    | ~ spl11_9 ),
    inference(avatar_component_clause,[],[f118]) ).

fof(f121,plain,
    ( ~ organization(sK4,sK6)
    | ~ spl11_6 ),
    inference(resolution,[],[f98,f31]) ).

fof(f122,plain,
    ( $false
    | ~ spl11_6 ),
    inference(forward_subsumption_resolution,[],[f121,f47]) ).

fof(f123,plain,
    ~ spl11_6,
    inference(avatar_contradiction_clause,[],[f122]) ).

fof(f132,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ organization(X0,X1)
        | ~ reproducibility(X0,X2,X1)
        | ~ greater(sK2(sK4,sK6),X2)
        | ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ reliability(X0,X3,X1)
        | ~ organization(sK4,sK6) )
    | ~ spl11_7 ),
    inference(resolution,[],[f101,f33]) ).

fof(f135,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ accountability(X0,sK1(sK3,sK5),X1)
        | ~ reproducibility(X0,X2,X1)
        | ~ greater(sK2(sK4,sK6),X2)
        | ~ organization(X0,X1)
        | ~ reliability(X0,X3,X1) )
    | ~ spl11_7 ),
    inference(forward_subsumption_resolution,[],[f132,f47]) ).

fof(f144,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ greater(sK2(sK4,sK6),X0)
        | ~ organization(sK3,sK5)
        | ~ reliability(sK3,X1,sK5)
        | ~ organization(sK3,sK5) )
    | ~ spl11_7 ),
    inference(resolution,[],[f135,f32]) ).

fof(f148,definition,
    ( spl11_12
   ! [X1] : ~ reliability(sK3,X1,sK5) ),
    introduced(definition,[new_symbols(naming,[spl11_12])],[avatar_definition]) ).

fof(f149,plain,
    ( ! [X1] : ~ reliability(sK3,X1,sK5)
    | ~ spl11_12 ),
    inference(avatar_component_clause,[],[f148]) ).

fof(f151,definition,
    ( spl11_13
   ! [X0] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ greater(sK2(sK4,sK6),X0) ) ),
    introduced(definition,[new_symbols(naming,[spl11_13])],[avatar_definition]) ).

fof(f152,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ greater(sK2(sK4,sK6),X0) )
    | ~ spl11_13 ),
    inference(avatar_component_clause,[],[f151]) ).

fof(f156,plain,
    ( ~ organization(sK4,sK6)
    | ~ spl11_8 ),
    inference(resolution,[],[f116,f32]) ).

fof(f157,plain,
    ( $false
    | ~ spl11_8 ),
    inference(forward_subsumption_resolution,[],[f156,f47]) ).

fof(f158,plain,
    ~ spl11_8,
    inference(avatar_contradiction_clause,[],[f157]) ).

fof(f165,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ organization(X0,X1)
        | ~ reproducibility(X0,X2,X1)
        | ~ accountability(X0,X3,X1)
        | ~ greater(sK2(sK4,sK6),X2)
        | ~ reliability(X0,sK0(sK3,sK5),X1)
        | ~ organization(sK4,sK6) )
    | ~ spl11_9 ),
    inference(resolution,[],[f119,f33]) ).

fof(f168,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ reliability(X0,sK0(sK3,sK5),X1)
        | ~ reproducibility(X0,X2,X1)
        | ~ accountability(X0,X3,X1)
        | ~ greater(sK2(sK4,sK6),X2)
        | ~ organization(X0,X1) )
    | ~ spl11_9 ),
    inference(forward_subsumption_resolution,[],[f165,f47]) ).

fof(f180,definition,
    ( spl11_15
   ! [X1] : ~ accountability(sK3,X1,sK5) ),
    introduced(definition,[new_symbols(naming,[spl11_15])],[avatar_definition]) ).

fof(f181,plain,
    ( ! [X1] : ~ accountability(sK3,X1,sK5)
    | ~ spl11_15 ),
    inference(avatar_component_clause,[],[f180]) ).

fof(f183,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ greater(sK2(sK4,sK6),X0)
        | ~ organization(sK3,sK5)
        | ~ reliability(sK3,X1,sK5) )
    | ~ spl11_7 ),
    inference(duplicate_literal_removal,[],[f144]) ).

fof(f184,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ greater(sK2(sK4,sK6),X0)
        | ~ reliability(sK3,X1,sK5) )
    | ~ spl11_7 ),
    inference(forward_subsumption_resolution,[],[f183,f48]) ).

fof(f186,plain,
    ( spl11_12
    | spl11_13
    | ~ spl11_7 ),
    inference(avatar_split_clause,[],[f184,f100,f151,f148]) ).

fof(f189,plain,
    ( ~ organization(sK3,sK5)
    | ~ spl11_12 ),
    inference(resolution,[],[f149,f31]) ).

fof(f190,plain,
    ( $false
    | ~ spl11_12 ),
    inference(forward_subsumption_resolution,[],[f189,f48]) ).

fof(f191,plain,
    ~ spl11_12,
    inference(avatar_contradiction_clause,[],[f190]) ).

fof(f202,plain,
    ( ! [X2,X3,X0,X1,X6,X7,X4,X5] :
        ( ~ reliability(X4,sK0(sK4,sK6),X5)
        | ~ organization(X2,X3)
        | ~ organization(X4,X5)
        | ~ reliability(X2,sK0(sK3,sK5),X3)
        | ~ greater(X0,X1)
        | ~ accountability(X2,X6,X3)
        | ~ accountability(X4,X7,X5)
        | ~ reproducibility(X2,X1,X3)
        | ~ reproducibility(X4,X0,X5) )
    | ~ spl11_5 ),
    inference(resolution,[],[f104,f36]) ).

fof(f204,plain,
    ( ~ greater(sK2(sK4,sK6),sK2(sK3,sK5))
    | ~ organization(sK3,sK5)
    | ~ spl11_13 ),
    inference(resolution,[],[f152,f33]) ).

fof(f205,plain,
    ( ~ greater(sK2(sK4,sK6),sK2(sK3,sK5))
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f204,f48]) ).

fof(f208,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ reproducibility(X4,sK2(sK4,sK6),X5)
        | ~ organization(X2,X3)
        | ~ organization(X4,X5)
        | ~ reorganization_free(X2,X3,X3)
        | ~ reorganization_free(X4,X5,X5)
        | ~ reproducibility(X2,sK2(sK3,sK5),X3)
        | ~ greater(X0,X1)
        | ~ inertia(X2,X1,X3)
        | ~ inertia(X4,X0,X5) )
    | ~ spl11_13 ),
    inference(resolution,[],[f205,f39]) ).

fof(f212,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ accountability(sK3,X1,sK5)
        | ~ greater(sK2(sK4,sK6),X0)
        | ~ organization(sK3,sK5)
        | ~ organization(sK3,sK5) )
    | ~ spl11_9 ),
    inference(resolution,[],[f168,f31]) ).

fof(f213,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ accountability(sK3,X1,sK5)
        | ~ greater(sK2(sK4,sK6),X0)
        | ~ organization(sK3,sK5) )
    | ~ spl11_9 ),
    inference(duplicate_literal_removal,[],[f212]) ).

fof(f214,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reliability(X0,sK0(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ accountability(X0,X4,X1)
        | ~ accountability(sK4,X5,sK6)
        | ~ reproducibility(X0,X3,X1)
        | ~ reproducibility(sK4,X2,sK6)
        | ~ organization(sK4,sK6) )
    | ~ spl11_5 ),
    inference(resolution,[],[f202,f31]) ).

fof(f215,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reliability(X0,sK0(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ accountability(X0,X4,X1)
        | ~ accountability(sK4,X5,sK6)
        | ~ reproducibility(X0,X3,X1)
        | ~ reproducibility(sK4,X2,sK6) )
    | ~ spl11_5 ),
    inference(duplicate_literal_removal,[],[f214]) ).

fof(f216,plain,
    ( ! [X2,X3,X0,X1,X4,X5] :
        ( ~ organization(X0,X1)
        | ~ reliability(X0,sK0(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ accountability(X0,X4,X1)
        | ~ accountability(sK4,X5,sK6)
        | ~ reproducibility(X0,X3,X1)
        | ~ reproducibility(sK4,X2,sK6) )
    | ~ spl11_5 ),
    inference(forward_subsumption_resolution,[],[f215,f47]) ).

fof(f217,plain,
    ( spl11_8
    | spl11_9
    | ~ spl11_5 ),
    inference(avatar_split_clause,[],[f216,f82,f118,f115]) ).

fof(f220,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reorganization_free(X0,X1,X1)
        | ~ reorganization_free(sK4,sK6,sK6)
        | ~ reproducibility(X0,sK2(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ inertia(X0,X3,X1)
        | ~ inertia(sK4,X2,sK6)
        | ~ organization(sK4,sK6) )
    | ~ spl11_13 ),
    inference(resolution,[],[f208,f33]) ).

fof(f221,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ organization(X0,X1)
        | ~ organization(sK4,sK6)
        | ~ reorganization_free(X0,X1,X1)
        | ~ reorganization_free(sK4,sK6,sK6)
        | ~ reproducibility(X0,sK2(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ inertia(X0,X3,X1)
        | ~ inertia(sK4,X2,sK6) )
    | ~ spl11_13 ),
    inference(duplicate_literal_removal,[],[f220]) ).

fof(f222,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ organization(X0,X1)
        | ~ reorganization_free(X0,X1,X1)
        | ~ reorganization_free(sK4,sK6,sK6)
        | ~ reproducibility(X0,sK2(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ inertia(X0,X3,X1)
        | ~ inertia(sK4,X2,sK6) )
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f221,f47]) ).

fof(f223,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ inertia(sK4,X2,sK6)
        | ~ reorganization_free(X0,X1,X1)
        | ~ reproducibility(X0,sK2(sK3,sK5),X1)
        | ~ greater(X2,X3)
        | ~ inertia(X0,X3,X1)
        | ~ organization(X0,X1) )
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f222,f45]) ).

fof(f224,plain,
    ( ! [X2,X0,X1] :
        ( ~ reproducibility(X0,sK2(sK3,sK5),X1)
        | ~ reorganization_free(X0,X1,X1)
        | ~ greater(sK8,X2)
        | ~ inertia(X0,X2,X1)
        | ~ organization(X0,X1) )
    | ~ spl11_13 ),
    inference(resolution,[],[f223,f43]) ).

fof(f236,plain,
    ( ! [X0] :
        ( ~ reorganization_free(sK3,sK5,sK5)
        | ~ greater(sK8,X0)
        | ~ inertia(sK3,X0,sK5)
        | ~ organization(sK3,sK5)
        | ~ organization(sK3,sK5) )
    | ~ spl11_13 ),
    inference(resolution,[],[f224,f33]) ).

fof(f237,plain,
    ( ! [X0] :
        ( ~ reorganization_free(sK3,sK5,sK5)
        | ~ greater(sK8,X0)
        | ~ inertia(sK3,X0,sK5)
        | ~ organization(sK3,sK5) )
    | ~ spl11_13 ),
    inference(duplicate_literal_removal,[],[f236]) ).

fof(f238,plain,
    ( ! [X0] :
        ( ~ greater(sK8,X0)
        | ~ inertia(sK3,X0,sK5)
        | ~ organization(sK3,sK5) )
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f237,f46]) ).

fof(f239,plain,
    ( ! [X0] :
        ( ~ inertia(sK3,X0,sK5)
        | ~ greater(sK8,X0) )
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f238,f48]) ).

fof(f240,plain,
    ( ~ greater(sK8,sK7)
    | ~ spl11_13 ),
    inference(resolution,[],[f239,f44]) ).

fof(f241,plain,
    ( $false
    | ~ spl11_13 ),
    inference(forward_subsumption_resolution,[],[f240,f40]) ).

fof(f242,plain,
    ~ spl11_13,
    inference(avatar_contradiction_clause,[],[f241]) ).

fof(f243,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK3,X0,sK5)
        | ~ accountability(sK3,X1,sK5)
        | ~ greater(sK2(sK4,sK6),X0) )
    | ~ spl11_9 ),
    inference(forward_subsumption_resolution,[],[f213,f48]) ).

fof(f244,plain,
    ( spl11_15
    | spl11_13
    | ~ spl11_9 ),
    inference(avatar_split_clause,[],[f243,f118,f151,f180]) ).

fof(f245,plain,
    ( ~ organization(sK3,sK5)
    | ~ spl11_15 ),
    inference(resolution,[],[f181,f32]) ).

fof(f246,plain,
    ( $false
    | ~ spl11_15 ),
    inference(forward_subsumption_resolution,[],[f245,f48]) ).

fof(f247,plain,
    ~ spl11_15,
    inference(avatar_contradiction_clause,[],[f246]) ).

cnf(s2,plain,
    ( spl11_4
    | spl11_5 ),
    inference(sat_conversion,[],[f84]) ).

cnf(s3,plain,
    ( ~ spl11_4
    | spl11_6
    | spl11_7 ),
    inference(sat_conversion,[],[f102]) ).

cnf(s5,plain,
    ~ spl11_6,
    inference(sat_conversion,[],[f123]) ).

cnf(s8,plain,
    ~ spl11_8,
    inference(sat_conversion,[],[f158]) ).

cnf(s12,plain,
    ( ~ spl11_7
    | spl11_12
    | spl11_13 ),
    inference(sat_conversion,[],[f186]) ).

cnf(s13,plain,
    ~ spl11_12,
    inference(sat_conversion,[],[f191]) ).

cnf(s16,plain,
    ( ~ spl11_5
    | spl11_8
    | spl11_9 ),
    inference(sat_conversion,[],[f217]) ).

cnf(s18,plain,
    ~ spl11_13,
    inference(sat_conversion,[],[f242]) ).

cnf(s19,plain,
    ( ~ spl11_9
    | spl11_13
    | spl11_15 ),
    inference(sat_conversion,[],[f244]) ).

cnf(s20,plain,
    ~ spl11_15,
    inference(sat_conversion,[],[f247]) ).

cnf(s21,plain,
    ( ~ spl11_9
    | spl11_13 ),
    inference(rat,[],[s19,s20]) ).

cnf(s22,plain,
    ~ spl11_9,
    inference(rat,[],[s21,s18]) ).

cnf(s23,plain,
    ( ~ spl11_5
    | spl11_8 ),
    inference(rat,[],[s16,s22]) ).

cnf(s24,plain,
    ~ spl11_7,
    inference(rat,[],[s12,s18,s13]) ).

cnf(s25,plain,
    ~ spl11_5,
    inference(rat,[],[s23,s8]) ).

cnf(s26,plain,
    ~ spl11_4,
    inference(rat,[],[s3,s24,s5]) ).

cnf(s27,plain,
    $false,
    inference(rat,[],[s2,s25,s26]) ).

fof(f248,plain,
    $false,
    inference(avatar_sat_refutation,[],[s27]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : MGT001+1 : TPTP v9.2.1. Released v2.0.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.16/0.33  % Computer   : n001.cluster.edu
% 0.16/0.33  % Model      : x86_64 x86_64
% 0.16/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.16/0.33  % Memory     : 8042.1875MB
% 0.16/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.16/0.33  % CPULimit   : 300
% 0.16/0.33  % WCLimit    : 300
% 0.16/0.33  % DateTime   : Thu Apr 30 21:11:49 EDT 2026
% 0.16/0.33  % CPUTime    : 
% 0.21/0.35  This is a FOF_THM_RFO_NEQ problem
% 0.21/0.36  Running first-order theorem proving
% 0.21/0.36  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.48/0.64  % (19488)Detected formulas, will run a generic FOF schedule.
% 0.50/0.79  % (19492)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3696581616:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.50/0.79  % (19496)dis-21_1_sil=8000:lcm=predicate:random_seed=3515764382:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.50/0.79  % (19494)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3036381158:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.50/0.79  % (19495)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=191241462:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.50/0.79  % (19490)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3101344956:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.50/0.79  % (19491)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=1735110568:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.50/0.79  % (19493)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=3969866412:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.50/0.80  % (19495)First to succeed.
% 0.50/0.80  % (19496)Also succeeded, but the first one will report.
% 0.50/0.80  % (19495)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-19488"
% 0.50/0.80  % (19493)Also succeeded, but the first one will report.
% 0.50/0.81  % (19494)Also succeeded, but the first one will report.
% 0.50/0.95  % (19495)Refutation found. Thanks to Tanya!
% 0.50/0.95  % SZS status Theorem for theBenchmark
% 0.50/0.95  % SZS output start Proof for theBenchmark
% See solution above
% 0.50/0.96  % (19495)------------------------------
% 0.50/0.96  % (19495)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.50/0.96  % (19495)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.50/0.96  % (19495)CaDiCaL version: 2.1.3
% 0.50/0.96  % (19495)Termination reason: Refutation
% 0.50/0.96  % (19495)Time elapsed: 0.007 s
% 0.50/0.96  % (19495)Peak memory usage: 81 MB
% 0.50/0.96  % (19495)Instructions burned: 18 (million)
% 0.50/0.96  % (19495)------------------------------
% 0.50/0.96  % (19495)------------------------------
% 0.50/0.96  % (19488)Success in time 0.313 s
%------------------------------------------------------------------------------
