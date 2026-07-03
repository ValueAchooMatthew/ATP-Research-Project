
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : MGT002+1 : TPTP v9.2.1. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n026.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:43:22 PM UTC 2026

% Result   : Theorem 0.51s 0.92s
% Output   : Refutation 0.51s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   16
%            Number of leaves      :   18
% Syntax   : Number of formulae    :  104 (  26 unt;  11 def)
%            Number of atoms       :  361 (   0 equ)
%            Maximal formula atoms :   14 (   3 avg)
%            Number of connectives :  460 ( 203   ~; 180   |;  55   &)
%                                         (  14 ;   8  =>;   0  )
%            Maximal formula depth :   19 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   17 (  16 usr;  12 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   5 con; 0-2 aty)
%            Number of variables   :  146 (   0 sgn 128   !;  18   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( organization(X0,X1)
     => ? [X2] : reproducibility(X0,X2,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',mp3) ).

fof(f2,axiom,
    ! [X0,X1,X2] :
      ( reorganization_free(X0,X1,X2)
     => ( reorganization_free(X0,X1,X1)
        & reorganization_free(X0,X2,X2) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',mp4) ).

fof(f3,axiom,
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
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',a3_FOL) ).

fof(f4,axiom,
    ! [X0,X1,X2,X3,X4] :
      ( ( organization(X0,X3)
        & organization(X0,X4)
        & reorganization_free(X0,X3,X4)
        & reproducibility(X0,X1,X3)
        & reproducibility(X0,X2,X4)
        & greater(X4,X3) )
     => greater(X2,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',a4_FOL) ).

fof(f5,conjecture,
    ! [X0,X1,X2,X3,X4] :
      ( ( organization(X0,X3)
        & organization(X0,X4)
        & reorganization_free(X0,X3,X4)
        & inertia(X0,X1,X3)
        & inertia(X0,X2,X4)
        & greater(X4,X3) )
     => greater(X2,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',t2_FOL) ).

fof(f6,negated_conjecture,
    ~ ! [X0,X1,X2,X3,X4] :
        ( ( organization(X0,X3)
          & organization(X0,X4)
          & reorganization_free(X0,X3,X4)
          & inertia(X0,X1,X3)
          & inertia(X0,X2,X4)
          & greater(X4,X3) )
       => greater(X2,X1) ),
    inference(negated_conjecture,[status(cth)],[f5]) ).

fof(f7,plain,
    ! [X0,X1] :
      ( ? [X2] : reproducibility(X0,X2,X1)
      | ~ organization(X0,X1) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f8,plain,
    ! [X0,X1,X2] :
      ( ( reorganization_free(X0,X1,X1)
        & reorganization_free(X0,X2,X2) )
      | ~ reorganization_free(X0,X1,X2) ),
    inference(ennf_transformation,[],[f2]) ).

fof(f9,plain,
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
    inference(ennf_transformation,[],[f3]) ).

fof(f10,plain,
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
    inference(flattening,[],[f9]) ).

fof(f11,plain,
    ! [X0,X1,X2,X3,X4] :
      ( greater(X2,X1)
      | ~ organization(X0,X3)
      | ~ organization(X0,X4)
      | ~ reorganization_free(X0,X3,X4)
      | ~ reproducibility(X0,X1,X3)
      | ~ reproducibility(X0,X2,X4)
      | ~ greater(X4,X3) ),
    inference(ennf_transformation,[],[f4]) ).

fof(f12,plain,
    ! [X0,X1,X2,X3,X4] :
      ( greater(X2,X1)
      | ~ organization(X0,X3)
      | ~ organization(X0,X4)
      | ~ reorganization_free(X0,X3,X4)
      | ~ reproducibility(X0,X1,X3)
      | ~ reproducibility(X0,X2,X4)
      | ~ greater(X4,X3) ),
    inference(flattening,[],[f11]) ).

fof(f13,plain,
    ? [X0,X1,X2,X3,X4] :
      ( ~ greater(X2,X1)
      & organization(X0,X3)
      & organization(X0,X4)
      & reorganization_free(X0,X3,X4)
      & inertia(X0,X1,X3)
      & inertia(X0,X2,X4)
      & greater(X4,X3) ),
    inference(ennf_transformation,[],[f6]) ).

fof(f14,plain,
    ? [X0,X1,X2,X3,X4] :
      ( ~ greater(X2,X1)
      & organization(X0,X3)
      & organization(X0,X4)
      & reorganization_free(X0,X3,X4)
      & inertia(X0,X1,X3)
      & inertia(X0,X2,X4)
      & greater(X4,X3) ),
    inference(flattening,[],[f13]) ).

fof(f15,plain,
    ! [X0,X1] :
      ( ? [X2] : reproducibility(X0,X2,X1)
     => reproducibility(X0,sK0(X0,X1),X1) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f16,plain,
    ! [X0,X1] :
      ( reproducibility(X0,sK0(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[f7,f15]) ).

fof(f17,plain,
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
    inference(nnf_transformation,[],[f10]) ).

fof(f18,plain,
    ( ? [X0,X1,X2,X3,X4] :
        ( ~ greater(X2,X1)
        & organization(X0,X3)
        & organization(X0,X4)
        & reorganization_free(X0,X3,X4)
        & inertia(X0,X1,X3)
        & inertia(X0,X2,X4)
        & greater(X4,X3) )
   => ( ~ greater(sK3,sK2)
      & organization(sK1,sK4)
      & organization(sK1,sK5)
      & reorganization_free(sK1,sK4,sK5)
      & inertia(sK1,sK2,sK4)
      & inertia(sK1,sK3,sK5)
      & greater(sK5,sK4) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f19,plain,
    ( ~ greater(sK3,sK2)
    & organization(sK1,sK4)
    & organization(sK1,sK5)
    & reorganization_free(sK1,sK4,sK5)
    & inertia(sK1,sK2,sK4)
    & inertia(sK1,sK3,sK5)
    & greater(sK5,sK4) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1,sK2,sK3,sK4,sK5])],[f14,f18]) ).

fof(f20,plain,
    ! [X0,X1] :
      ( reproducibility(X0,sK0(X0,X1),X1)
      | ~ organization(X0,X1) ),
    inference(cnf_transformation,[],[f16]) ).

fof(f21,plain,
    ! [X2,X0,X1] :
      ( reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X0,X1,X2) ),
    inference(cnf_transformation,[],[f8]) ).

fof(f22,plain,
    ! [X2,X0,X1] :
      ( reorganization_free(X0,X1,X1)
      | ~ reorganization_free(X0,X1,X2) ),
    inference(cnf_transformation,[],[f8]) ).

fof(f23,plain,
    ! [X2,X3,X0,X1,X6,X7,X4,X5] :
      ( greater(X7,X6)
      | ~ greater(X5,X4)
      | ~ organization(X0,X2)
      | ~ organization(X1,X3)
      | ~ reorganization_free(X0,X2,X2)
      | ~ reorganization_free(X1,X3,X3)
      | ~ reproducibility(X0,X4,X2)
      | ~ reproducibility(X1,X5,X3)
      | ~ inertia(X0,X6,X2)
      | ~ inertia(X1,X7,X3) ),
    inference(cnf_transformation,[],[f17]) ).

fof(f25,plain,
    ! [X2,X3,X0,X1,X4] :
      ( greater(X2,X1)
      | ~ organization(X0,X3)
      | ~ organization(X0,X4)
      | ~ reorganization_free(X0,X3,X4)
      | ~ reproducibility(X0,X1,X3)
      | ~ reproducibility(X0,X2,X4)
      | ~ greater(X4,X3) ),
    inference(cnf_transformation,[],[f12]) ).

fof(f26,plain,
    greater(sK5,sK4),
    inference(cnf_transformation,[],[f19]) ).

fof(f27,plain,
    inertia(sK1,sK3,sK5),
    inference(cnf_transformation,[],[f19]) ).

fof(f28,plain,
    inertia(sK1,sK2,sK4),
    inference(cnf_transformation,[],[f19]) ).

fof(f29,plain,
    reorganization_free(sK1,sK4,sK5),
    inference(cnf_transformation,[],[f19]) ).

fof(f30,plain,
    organization(sK1,sK5),
    inference(cnf_transformation,[],[f19]) ).

fof(f31,plain,
    organization(sK1,sK4),
    inference(cnf_transformation,[],[f19]) ).

fof(f32,plain,
    ~ greater(sK3,sK2),
    inference(cnf_transformation,[],[f19]) ).

fof(f34,plain,
    ! [X2,X3,X0,X1,X4,X5] :
      ( ~ inertia(X2,sK2,X3)
      | ~ inertia(X4,sK3,X5)
      | ~ organization(X4,X5)
      | ~ reorganization_free(X2,X3,X3)
      | ~ reorganization_free(X4,X5,X5)
      | ~ reproducibility(X2,X1,X3)
      | ~ reproducibility(X4,X0,X5)
      | ~ greater(X0,X1)
      | ~ organization(X2,X3) ),
    inference(resolution,[],[f23,f32]) ).

fof(f37,plain,
    ! [X2,X3,X0,X1] :
      ( ~ inertia(X0,sK2,X1)
      | ~ organization(sK1,sK5)
      | ~ reorganization_free(X0,X1,X1)
      | ~ reorganization_free(sK1,sK5,sK5)
      | ~ reproducibility(X0,X2,X1)
      | ~ reproducibility(sK1,X3,sK5)
      | ~ greater(X3,X2)
      | ~ organization(X0,X1) ),
    inference(resolution,[],[f34,f27]) ).

fof(f39,definition,
    ( spl6_1
   reorganization_free(sK1,sK5,sK5) ),
    introduced(definition,[new_symbols(naming,[spl6_1])],[avatar_definition]) ).

fof(f40,plain,
    ( ~ reorganization_free(sK1,sK5,sK5)
    | spl6_1 ),
    inference(avatar_component_clause,[],[f39]) ).

fof(f42,definition,
    ( spl6_2
   organization(sK1,sK5) ),
    introduced(definition,[new_symbols(naming,[spl6_2])],[avatar_definition]) ).

fof(f43,plain,
    ( ~ organization(sK1,sK5)
    | spl6_2 ),
    inference(avatar_component_clause,[],[f42]) ).

fof(f45,definition,
    ( spl6_3
   ! [X0,X3,X2,X1] :
        ( ~ inertia(X0,sK2,X1)
        | ~ organization(X0,X1)
        | ~ reproducibility(sK1,X3,sK5)
        | ~ greater(X3,X2)
        | ~ reproducibility(X0,X2,X1)
        | ~ reorganization_free(X0,X1,X1) ) ),
    introduced(definition,[new_symbols(naming,[spl6_3])],[avatar_definition]) ).

fof(f46,plain,
    ( ! [X2,X3,X0,X1] :
        ( ~ inertia(X0,sK2,X1)
        | ~ organization(X0,X1)
        | ~ reproducibility(sK1,X3,sK5)
        | ~ greater(X3,X2)
        | ~ reproducibility(X0,X2,X1)
        | ~ reorganization_free(X0,X1,X1) )
    | ~ spl6_3 ),
    inference(avatar_component_clause,[],[f45]) ).

fof(f47,plain,
    ( ~ spl6_1
    | ~ spl6_2
    | spl6_3 ),
    inference(avatar_split_clause,[],[f37,f45,f42,f39]) ).

fof(f49,definition,
    ( spl6_4
   organization(sK1,sK4) ),
    introduced(definition,[new_symbols(naming,[spl6_4])],[avatar_definition]) ).

fof(f50,plain,
    ( ~ organization(sK1,sK4)
    | spl6_4 ),
    inference(avatar_component_clause,[],[f49]) ).

fof(f52,definition,
    ( spl6_5
   reorganization_free(sK1,sK4,sK4) ),
    introduced(definition,[new_symbols(naming,[spl6_5])],[avatar_definition]) ).

fof(f53,plain,
    ( ~ reorganization_free(sK1,sK4,sK4)
    | spl6_5 ),
    inference(avatar_component_clause,[],[f52]) ).

fof(f59,plain,
    ( ! [X0] : ~ reorganization_free(sK1,X0,sK5)
    | spl6_1 ),
    inference(resolution,[],[f40,f21]) ).

fof(f60,plain,
    ( ! [X0] : ~ reorganization_free(sK1,sK4,X0)
    | spl6_5 ),
    inference(resolution,[],[f53,f22]) ).

fof(f70,plain,
    ( $false
    | spl6_1 ),
    inference(resolution,[],[f59,f29]) ).

fof(f73,plain,
    spl6_1,
    inference(avatar_contradiction_clause,[],[f70]) ).

fof(f88,plain,
    ( $false
    | spl6_2 ),
    inference(resolution,[],[f43,f30]) ).

fof(f89,plain,
    spl6_2,
    inference(avatar_contradiction_clause,[],[f88]) ).

fof(f90,plain,
    ( ! [X0,X1] :
        ( ~ organization(sK1,sK4)
        | ~ reproducibility(sK1,X0,sK5)
        | ~ greater(X0,X1)
        | ~ reproducibility(sK1,X1,sK4)
        | ~ reorganization_free(sK1,sK4,sK4) )
    | ~ spl6_3 ),
    inference(resolution,[],[f46,f28]) ).

fof(f91,plain,
    ( $false
    | spl6_5 ),
    inference(resolution,[],[f60,f29]) ).

fof(f94,plain,
    spl6_5,
    inference(avatar_contradiction_clause,[],[f91]) ).

fof(f110,definition,
    ( spl6_15
   ! [X0,X1] :
        ( ~ reproducibility(sK1,X0,sK5)
        | ~ reproducibility(sK1,X1,sK4)
        | ~ greater(X0,X1) ) ),
    introduced(definition,[new_symbols(naming,[spl6_15])],[avatar_definition]) ).

fof(f111,plain,
    ( ! [X0,X1] :
        ( ~ reproducibility(sK1,X0,sK5)
        | ~ reproducibility(sK1,X1,sK4)
        | ~ greater(X0,X1) )
    | ~ spl6_15 ),
    inference(avatar_component_clause,[],[f110]) ).

fof(f112,plain,
    ( ~ spl6_5
    | spl6_15
    | ~ spl6_4
    | ~ spl6_3 ),
    inference(avatar_split_clause,[],[f90,f45,f49,f110,f52]) ).

fof(f113,plain,
    ( $false
    | spl6_4 ),
    inference(resolution,[],[f50,f31]) ).

fof(f114,plain,
    spl6_4,
    inference(avatar_contradiction_clause,[],[f113]) ).

fof(f116,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK1,X0,sK5)
        | ~ greater(X0,sK0(sK1,sK4))
        | ~ organization(sK1,sK4) )
    | ~ spl6_15 ),
    inference(resolution,[],[f111,f20]) ).

fof(f118,definition,
    ( spl6_16
   ! [X0] :
        ( ~ reproducibility(sK1,X0,sK5)
        | ~ greater(X0,sK0(sK1,sK4)) ) ),
    introduced(definition,[new_symbols(naming,[spl6_16])],[avatar_definition]) ).

fof(f119,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK1,X0,sK5)
        | ~ greater(X0,sK0(sK1,sK4)) )
    | ~ spl6_16 ),
    inference(avatar_component_clause,[],[f118]) ).

fof(f120,plain,
    ( ~ spl6_4
    | spl6_16
    | ~ spl6_15 ),
    inference(avatar_split_clause,[],[f116,f110,f118,f49]) ).

fof(f126,plain,
    ( ~ greater(sK0(sK1,sK5),sK0(sK1,sK4))
    | ~ organization(sK1,sK5)
    | ~ spl6_16 ),
    inference(resolution,[],[f119,f20]) ).

fof(f128,definition,
    ( spl6_18
   greater(sK0(sK1,sK5),sK0(sK1,sK4)) ),
    introduced(definition,[new_symbols(naming,[spl6_18])],[avatar_definition]) ).

fof(f129,plain,
    ( ~ greater(sK0(sK1,sK5),sK0(sK1,sK4))
    | spl6_18 ),
    inference(avatar_component_clause,[],[f128]) ).

fof(f130,plain,
    ( ~ spl6_2
    | ~ spl6_18
    | ~ spl6_16 ),
    inference(avatar_split_clause,[],[f126,f118,f128,f42]) ).

fof(f135,plain,
    ( ! [X2,X0,X1] :
        ( ~ reproducibility(X0,sK0(sK1,sK4),X1)
        | ~ reproducibility(X0,sK0(sK1,sK5),X2)
        | ~ reorganization_free(X0,X1,X2)
        | ~ organization(X0,X1)
        | ~ organization(X0,X2)
        | ~ greater(X2,X1) )
    | spl6_18 ),
    inference(resolution,[],[f129,f25]) ).

fof(f136,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK1,sK0(sK1,sK4),X0)
        | ~ reorganization_free(sK1,X0,sK5)
        | ~ organization(sK1,X0)
        | ~ organization(sK1,sK5)
        | ~ greater(sK5,X0)
        | ~ organization(sK1,sK5) )
    | spl6_18 ),
    inference(resolution,[],[f135,f20]) ).

fof(f137,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK1,sK0(sK1,sK4),X0)
        | ~ reorganization_free(sK1,X0,sK5)
        | ~ organization(sK1,X0)
        | ~ organization(sK1,sK5)
        | ~ greater(sK5,X0) )
    | spl6_18 ),
    inference(duplicate_literal_removal,[],[f136]) ).

fof(f139,definition,
    ( spl6_19
   ! [X0] :
        ( ~ reproducibility(sK1,sK0(sK1,sK4),X0)
        | ~ greater(sK5,X0)
        | ~ organization(sK1,X0)
        | ~ reorganization_free(sK1,X0,sK5) ) ),
    introduced(definition,[new_symbols(naming,[spl6_19])],[avatar_definition]) ).

fof(f140,plain,
    ( ! [X0] :
        ( ~ reproducibility(sK1,sK0(sK1,sK4),X0)
        | ~ greater(sK5,X0)
        | ~ organization(sK1,X0)
        | ~ reorganization_free(sK1,X0,sK5) )
    | ~ spl6_19 ),
    inference(avatar_component_clause,[],[f139]) ).

fof(f141,plain,
    ( ~ spl6_2
    | spl6_19
    | spl6_18 ),
    inference(avatar_split_clause,[],[f137,f128,f139,f42]) ).

fof(f144,plain,
    ( ~ greater(sK5,sK4)
    | ~ organization(sK1,sK4)
    | ~ reorganization_free(sK1,sK4,sK5)
    | ~ organization(sK1,sK4)
    | ~ spl6_19 ),
    inference(resolution,[],[f140,f20]) ).

fof(f145,plain,
    ( ~ greater(sK5,sK4)
    | ~ organization(sK1,sK4)
    | ~ reorganization_free(sK1,sK4,sK5)
    | ~ spl6_19 ),
    inference(duplicate_literal_removal,[],[f144]) ).

fof(f147,definition,
    ( spl6_20
   reorganization_free(sK1,sK4,sK5) ),
    introduced(definition,[new_symbols(naming,[spl6_20])],[avatar_definition]) ).

fof(f148,plain,
    ( ~ reorganization_free(sK1,sK4,sK5)
    | spl6_20 ),
    inference(avatar_component_clause,[],[f147]) ).

fof(f150,definition,
    ( spl6_21
   greater(sK5,sK4) ),
    introduced(definition,[new_symbols(naming,[spl6_21])],[avatar_definition]) ).

fof(f151,plain,
    ( ~ greater(sK5,sK4)
    | spl6_21 ),
    inference(avatar_component_clause,[],[f150]) ).

fof(f152,plain,
    ( ~ spl6_20
    | ~ spl6_4
    | ~ spl6_21
    | ~ spl6_19 ),
    inference(avatar_split_clause,[],[f145,f139,f150,f49,f147]) ).

fof(f187,plain,
    ( $false
    | spl6_20 ),
    inference(resolution,[],[f148,f29]) ).

fof(f188,plain,
    spl6_20,
    inference(avatar_contradiction_clause,[],[f187]) ).

fof(f189,plain,
    ( $false
    | spl6_21 ),
    inference(resolution,[],[f151,f26]) ).

fof(f193,plain,
    spl6_21,
    inference(avatar_contradiction_clause,[],[f189]) ).

cnf(s1,plain,
    ( ~ spl6_1
    | ~ spl6_2
    | spl6_3 ),
    inference(sat_conversion,[],[f47]) ).

cnf(s3,plain,
    spl6_1,
    inference(sat_conversion,[],[f73]) ).

cnf(s6,plain,
    spl6_2,
    inference(sat_conversion,[],[f89]) ).

cnf(s7,plain,
    spl6_5,
    inference(sat_conversion,[],[f94]) ).

cnf(s10,plain,
    ( ~ spl6_3
    | ~ spl6_4
    | ~ spl6_5
    | spl6_15 ),
    inference(sat_conversion,[],[f112]) ).

cnf(s11,plain,
    spl6_4,
    inference(sat_conversion,[],[f114]) ).

cnf(s12,plain,
    ( ~ spl6_4
    | ~ spl6_15
    | spl6_16 ),
    inference(sat_conversion,[],[f120]) ).

cnf(s14,plain,
    ( ~ spl6_2
    | ~ spl6_16
    | ~ spl6_18 ),
    inference(sat_conversion,[],[f130]) ).

cnf(s16,plain,
    ( ~ spl6_2
    | spl6_18
    | spl6_19 ),
    inference(sat_conversion,[],[f141]) ).

cnf(s17,plain,
    ( ~ spl6_4
    | ~ spl6_19
    | ~ spl6_20
    | ~ spl6_21 ),
    inference(sat_conversion,[],[f152]) ).

cnf(s22,plain,
    spl6_20,
    inference(sat_conversion,[],[f188]) ).

cnf(s23,plain,
    spl6_21,
    inference(sat_conversion,[],[f193]) ).

cnf(s24,plain,
    ( ~ spl6_4
    | ~ spl6_19 ),
    inference(rat,[],[s17,s23,s22]) ).

cnf(s25,plain,
    ~ spl6_19,
    inference(rat,[],[s24,s11]) ).

cnf(s26,plain,
    ( ~ spl6_3
    | ~ spl6_5
    | spl6_15 ),
    inference(rat,[],[s10,s11]) ).

cnf(s29,plain,
    spl6_18,
    inference(rat,[],[s16,s25,s6]) ).

cnf(s30,plain,
    ~ spl6_16,
    inference(rat,[],[s14,s29,s6]) ).

cnf(s32,plain,
    ~ spl6_15,
    inference(rat,[],[s12,s11,s30]) ).

cnf(s33,plain,
    ~ spl6_3,
    inference(rat,[],[s26,s7,s32]) ).

cnf(s37,plain,
    $false,
    inference(rat,[],[s1,s33,s6,s3]) ).

fof(f194,plain,
    $false,
    inference(avatar_sat_refutation,[],[s37]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.13  % Problem    : MGT002+1 : TPTP v9.2.1. Released v2.0.0.
% 0.00/0.13  % Command    : run_vampire %s %d THM
% 0.16/0.34  % Computer   : n026.cluster.edu
% 0.16/0.34  % Model      : x86_64 x86_64
% 0.16/0.34  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.16/0.34  % Memory     : 8042.1875MB
% 0.16/0.34  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.16/0.34  % CPULimit   : 300
% 0.16/0.34  % WCLimit    : 300
% 0.16/0.34  % DateTime   : Thu Apr 30 21:11:38 EDT 2026
% 0.16/0.34  % CPUTime    : 
% 0.22/0.36  This is a FOF_THM_RFO_NEQ problem
% 0.22/0.36  Running first-order theorem proving
% 0.22/0.36  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.48/0.65  % (25721)Detected formulas, will run a generic FOF schedule.
% 0.51/0.77  % (25729)dis-21_1_sil=8000:lcm=predicate:random_seed=74773613:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.51/0.78  % (25729)First to succeed.
% 0.51/0.78  % (25729)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-25721"
% 0.51/0.80  % (25725)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3326691117:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.51/0.80  % (25728)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=3398584817:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.51/0.80  % (25724)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=1555850577:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.51/0.80  % (25726)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=574841213:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.51/0.80  % (25723)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=1988957761:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.51/0.80  % (25727)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=2352181289:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.51/0.81  % (25726)Also succeeded, but the first one will report.
% 0.51/0.81  % (25728)Also succeeded, but the first one will report.
% 0.51/0.81  % (25727)Also succeeded, but the first one will report.
% 0.51/0.92  % (25729)Refutation found. Thanks to Tanya!
% 0.51/0.92  % SZS status Theorem for theBenchmark
% 0.51/0.92  % SZS output start Proof for theBenchmark
% See solution above
% 0.51/0.92  % (25729)------------------------------
% 0.51/0.92  % (25729)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.51/0.92  % (25729)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.51/0.92  % (25729)CaDiCaL version: 2.1.3
% 0.51/0.92  % (25729)Termination reason: Refutation
% 0.51/0.92  % (25729)Time elapsed: 0.003 s
% 0.51/0.92  % (25729)Peak memory usage: 81 MB
% 0.51/0.92  % (25729)Instructions burned: 6 (million)
% 0.51/0.92  % (25729)------------------------------
% 0.51/0.92  % (25729)------------------------------
% 0.51/0.92  % (25721)Success in time 0.27 s
%------------------------------------------------------------------------------
