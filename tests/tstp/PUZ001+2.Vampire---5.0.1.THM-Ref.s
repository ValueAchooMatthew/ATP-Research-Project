
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : PUZ001+2 : TPTP v9.2.1. Released v4.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n019.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:55:24 PM UTC 2026

% Result   : Theorem 2.81s 1.09s
% Output   : Refutation 2.81s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   18
%            Number of leaves      :   12
% Syntax   : Number of formulae    :   67 (  25 unt;   3 def)
%            Number of atoms       :  341 (  86 equ)
%            Maximal formula atoms :   50 (   5 avg)
%            Number of connectives :  407 ( 133   ~; 106   |; 136   &)
%                                         (   3 ;  29  =>;   0  )
%            Maximal formula depth :   23 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :   10 (   7 usr;   5 prp; 0-4 aty)
%            Number of functors    :   19 (  19 usr;  13 con; 0-2 aty)
%            Number of variables   :  286 (   0 sgn 194   !;  92   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ? [X0,X1,X2] :
      ( $true
      & predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( ( $true
            & predicate1(X4,live,X3)
            & modifier_pp(X4,in,'DreadburyMansion') )
         => ( X3 = 'AuntAgatha'
            | X3 = 'Butler'
            | X3 = 'Charles' ) )
      & ! [X5] :
          ( $true
         => ! [X6,X7] :
              ( ( $true
                & predicate2(X7,kill,X5,X6) )
             => ? [X8] : predicate2(X8,hate,X5,X6) ) )
      & ! [X9] :
          ( $true
         => ~ ? [X10,X11,X12] :
                ( $true
                & predicate2(X11,kill,X9,X10)
                & property2(X12,rich,comp_than,X10)
                & X9 = X12 ) )
      & ! [X13,X14] :
          ( ( $true
            & predicate2(X14,hate,'AuntAgatha',X13) )
         => ~ ? [X15] : predicate2(X15,hate,'Charles',X13) )
      & ~ ? [X16] : predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( ( $true
            & X17 != 'Butler' )
         => ? [X18] : predicate2(X18,hate,'AuntAgatha',X17) )
      & ! [X19] :
          ( ( $true
            & ~ ? [X20] :
                  ( property2(X20,rich,comp_than,'AuntAgatha')
                  & X19 = X20 ) )
         => ? [X21] : predicate2(X21,hate,'Butler',X19) )
      & ! [X22,X23] :
          ( ( $true
            & predicate2(X23,hate,'AuntAgatha',X22) )
         => ? [X24] : predicate2(X24,hate,'Butler',X22) )
      & ! [X25] :
          ( $true
         => ~ ! [X26] :
                ( $true
               => ? [X27] : predicate2(X27,hate,X25,X26) ) )
      & 'AuntAgatha' != 'Butler' ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',background) ).

fof(f2,conjecture,
    ? [X0] : predicate2(X0,kill,'AuntAgatha','AuntAgatha'),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',prove) ).

fof(f3,negated_conjecture,
    ~ ? [X0] : predicate2(X0,kill,'AuntAgatha','AuntAgatha'),
    inference(negated_conjecture,[status(cth)],[f2]) ).

fof(f4,plain,
    ? [X0,X1,X2] :
      ( predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( ( predicate1(X4,live,X3)
            & modifier_pp(X4,in,'DreadburyMansion') )
         => ( X3 = 'AuntAgatha'
            | X3 = 'Butler'
            | X3 = 'Charles' ) )
      & ! [X5,X6,X7] :
          ( predicate2(X7,kill,X5,X6)
         => ? [X8] : predicate2(X8,hate,X5,X6) )
      & ! [X9] :
          ~ ? [X10,X11,X12] :
              ( predicate2(X11,kill,X9,X10)
              & property2(X12,rich,comp_than,X10)
              & X9 = X12 )
      & ! [X13,X14] :
          ( predicate2(X14,hate,'AuntAgatha',X13)
         => ~ ? [X15] : predicate2(X15,hate,'Charles',X13) )
      & ~ ? [X16] : predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( X17 != 'Butler'
         => ? [X18] : predicate2(X18,hate,'AuntAgatha',X17) )
      & ! [X19] :
          ( ~ ? [X20] :
                ( property2(X20,rich,comp_than,'AuntAgatha')
                & X19 = X20 )
         => ? [X21] : predicate2(X21,hate,'Butler',X19) )
      & ! [X22,X23] :
          ( predicate2(X23,hate,'AuntAgatha',X22)
         => ? [X24] : predicate2(X24,hate,'Butler',X22) )
      & ! [X25] :
          ~ ! [X26] :
            ? [X27] : predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ),
    inference(true_and_false_elimination,[],[f1]) ).

fof(f5,plain,
    ? [X0,X1,X2] :
      ( predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( ( predicate1(X4,live,X3)
            & modifier_pp(X4,in,'DreadburyMansion') )
         => ( X3 = 'AuntAgatha'
            | X3 = 'Butler'
            | X3 = 'Charles' ) )
      & ! [X5,X6,X7] :
          ( predicate2(X7,kill,X5,X6)
         => ? [X8] : predicate2(X8,hate,X5,X6) )
      & ! [X9] :
          ~ ? [X10,X11,X12] :
              ( predicate2(X11,kill,X9,X10)
              & property2(X12,rich,comp_than,X10)
              & X9 = X12 )
      & ! [X13,X14] :
          ( predicate2(X14,hate,'AuntAgatha',X13)
         => ~ ? [X15] : predicate2(X15,hate,'Charles',X13) )
      & ~ ? [X16] : predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( X17 != 'Butler'
         => ? [X18] : predicate2(X18,hate,'AuntAgatha',X17) )
      & ! [X19] :
          ( ~ ? [X20] :
                ( property2(X20,rich,comp_than,'AuntAgatha')
                & X19 = X20 )
         => ? [X21] : predicate2(X21,hate,'Butler',X19) )
      & ! [X22,X23] :
          ( predicate2(X23,hate,'AuntAgatha',X22)
         => ? [X24] : predicate2(X24,hate,'Butler',X22) )
      & ! [X25] :
          ~ ! [X26] :
            ? [X27] : predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ),
    inference(flattening,[],[f4]) ).

fof(f6,plain,
    ? [X0,X1,X2] :
      ( predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( X3 = 'AuntAgatha'
          | X3 = 'Butler'
          | X3 = 'Charles'
          | ~ predicate1(X4,live,X3)
          | ~ modifier_pp(X4,in,'DreadburyMansion') )
      & ! [X5,X6,X7] :
          ( ? [X8] : predicate2(X8,hate,X5,X6)
          | ~ predicate2(X7,kill,X5,X6) )
      & ! [X9,X10,X11,X12] :
          ( ~ predicate2(X11,kill,X9,X10)
          | ~ property2(X12,rich,comp_than,X10)
          | X9 != X12 )
      & ! [X13,X14] :
          ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
          | ~ predicate2(X14,hate,'AuntAgatha',X13) )
      & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
          | 'Butler' = X17 )
      & ! [X19] :
          ( ? [X21] : predicate2(X21,hate,'Butler',X19)
          | ? [X20] :
              ( property2(X20,rich,comp_than,'AuntAgatha')
              & X19 = X20 ) )
      & ! [X22,X23] :
          ( ? [X24] : predicate2(X24,hate,'Butler',X22)
          | ~ predicate2(X23,hate,'AuntAgatha',X22) )
      & ! [X25] :
        ? [X26] :
        ! [X27] : ~ predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ),
    inference(ennf_transformation,[],[f5]) ).

fof(f7,plain,
    ? [X0,X1,X2] :
      ( predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( X3 = 'AuntAgatha'
          | X3 = 'Butler'
          | X3 = 'Charles'
          | ~ predicate1(X4,live,X3)
          | ~ modifier_pp(X4,in,'DreadburyMansion') )
      & ! [X5,X6,X7] :
          ( ? [X8] : predicate2(X8,hate,X5,X6)
          | ~ predicate2(X7,kill,X5,X6) )
      & ! [X9,X10,X11,X12] :
          ( ~ predicate2(X11,kill,X9,X10)
          | ~ property2(X12,rich,comp_than,X10)
          | X9 != X12 )
      & ! [X13,X14] :
          ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
          | ~ predicate2(X14,hate,'AuntAgatha',X13) )
      & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
          | 'Butler' = X17 )
      & ! [X19] :
          ( ? [X21] : predicate2(X21,hate,'Butler',X19)
          | ? [X20] :
              ( property2(X20,rich,comp_than,'AuntAgatha')
              & X19 = X20 ) )
      & ! [X22,X23] :
          ( ? [X24] : predicate2(X24,hate,'Butler',X22)
          | ~ predicate2(X23,hate,'AuntAgatha',X22) )
      & ! [X25] :
        ? [X26] :
        ! [X27] : ~ predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ),
    inference(flattening,[],[f6]) ).

fof(f8,plain,
    ! [X0] : ~ predicate2(X0,kill,'AuntAgatha','AuntAgatha'),
    inference(ennf_transformation,[],[f3]) ).

fof(f9,plain,
    ? [X0,X1,X2] :
      ( predicate1(X1,live,X0)
      & modifier_pp(X1,in,'DreadburyMansion')
      & predicate2(X2,kill,X0,'AuntAgatha')
      & ! [X3,X4] :
          ( X3 = 'AuntAgatha'
          | X3 = 'Butler'
          | X3 = 'Charles'
          | ~ predicate1(X4,live,X3)
          | ~ modifier_pp(X4,in,'DreadburyMansion') )
      & ! [X5,X6,X7] :
          ( ? [X8] : predicate2(X8,hate,X5,X6)
          | ~ predicate2(X7,kill,X5,X6) )
      & ! [X9,X10,X11,X12] :
          ( ~ predicate2(X11,kill,X9,X10)
          | ~ property2(X12,rich,comp_than,X10)
          | X9 != X12 )
      & ! [X13,X14] :
          ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
          | ~ predicate2(X14,hate,'AuntAgatha',X13) )
      & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
          | 'Butler' = X17 )
      & ! [X19] :
          ( ? [X20] : predicate2(X20,hate,'Butler',X19)
          | ? [X21] :
              ( property2(X21,rich,comp_than,'AuntAgatha')
              & X19 = X21 ) )
      & ! [X22,X23] :
          ( ? [X24] : predicate2(X24,hate,'Butler',X22)
          | ~ predicate2(X23,hate,'AuntAgatha',X22) )
      & ! [X25] :
        ? [X26] :
        ! [X27] : ~ predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ),
    inference(rectify,[],[f7]) ).

fof(f10,plain,
    ( ? [X0,X1,X2] :
        ( predicate1(X1,live,X0)
        & modifier_pp(X1,in,'DreadburyMansion')
        & predicate2(X2,kill,X0,'AuntAgatha')
        & ! [X3,X4] :
            ( X3 = 'AuntAgatha'
            | X3 = 'Butler'
            | X3 = 'Charles'
            | ~ predicate1(X4,live,X3)
            | ~ modifier_pp(X4,in,'DreadburyMansion') )
        & ! [X5,X6,X7] :
            ( ? [X8] : predicate2(X8,hate,X5,X6)
            | ~ predicate2(X7,kill,X5,X6) )
        & ! [X9,X10,X11,X12] :
            ( ~ predicate2(X11,kill,X9,X10)
            | ~ property2(X12,rich,comp_than,X10)
            | X9 != X12 )
        & ! [X13,X14] :
            ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
            | ~ predicate2(X14,hate,'AuntAgatha',X13) )
        & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
        & ! [X17] :
            ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
            | 'Butler' = X17 )
        & ! [X19] :
            ( ? [X20] : predicate2(X20,hate,'Butler',X19)
            | ? [X21] :
                ( property2(X21,rich,comp_than,'AuntAgatha')
                & X19 = X21 ) )
        & ! [X22,X23] :
            ( ? [X24] : predicate2(X24,hate,'Butler',X22)
            | ~ predicate2(X23,hate,'AuntAgatha',X22) )
        & ! [X25] :
          ? [X26] :
          ! [X27] : ~ predicate2(X27,hate,X25,X26)
        & 'AuntAgatha' != 'Butler' )
   => ( predicate1(sK1,live,sK0)
      & modifier_pp(sK1,in,'DreadburyMansion')
      & predicate2(sK2,kill,sK0,'AuntAgatha')
      & ! [X3,X4] :
          ( X3 = 'AuntAgatha'
          | X3 = 'Butler'
          | X3 = 'Charles'
          | ~ predicate1(X4,live,X3)
          | ~ modifier_pp(X4,in,'DreadburyMansion') )
      & ! [X5,X6,X7] :
          ( ? [X8] : predicate2(X8,hate,X5,X6)
          | ~ predicate2(X7,kill,X5,X6) )
      & ! [X9,X10,X11,X12] :
          ( ~ predicate2(X11,kill,X9,X10)
          | ~ property2(X12,rich,comp_than,X10)
          | X9 != X12 )
      & ! [X13,X14] :
          ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
          | ~ predicate2(X14,hate,'AuntAgatha',X13) )
      & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
      & ! [X17] :
          ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
          | 'Butler' = X17 )
      & ! [X19] :
          ( ? [X20] : predicate2(X20,hate,'Butler',X19)
          | ? [X21] :
              ( property2(X21,rich,comp_than,'AuntAgatha')
              & X19 = X21 ) )
      & ! [X22,X23] :
          ( ? [X24] : predicate2(X24,hate,'Butler',X22)
          | ~ predicate2(X23,hate,'AuntAgatha',X22) )
      & ! [X25] :
        ? [X26] :
        ! [X27] : ~ predicate2(X27,hate,X25,X26)
      & 'AuntAgatha' != 'Butler' ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f11,plain,
    ! [X5,X6] :
      ( ? [X8] : predicate2(X8,hate,X5,X6)
     => predicate2(sK3(X5,X6),hate,X5,X6) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f12,plain,
    ! [X17] :
      ( ? [X18] : predicate2(X18,hate,'AuntAgatha',X17)
     => predicate2(sK4(X17),hate,'AuntAgatha',X17) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f13,plain,
    ! [X19] :
      ( ? [X20] : predicate2(X20,hate,'Butler',X19)
     => predicate2(sK5(X19),hate,'Butler',X19) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f14,plain,
    ! [X19] :
      ( ? [X21] :
          ( property2(X21,rich,comp_than,'AuntAgatha')
          & X19 = X21 )
     => ( property2(sK6(X19),rich,comp_than,'AuntAgatha')
        & sK6(X19) = X19 ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f15,plain,
    ! [X22] :
      ( ? [X24] : predicate2(X24,hate,'Butler',X22)
     => predicate2(sK7(X22),hate,'Butler',X22) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f16,plain,
    ! [X25] :
      ( ? [X26] :
        ! [X27] : ~ predicate2(X27,hate,X25,X26)
     => ! [X27] : ~ predicate2(X27,hate,X25,sK8(X25)) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f17,plain,
    ( predicate1(sK1,live,sK0)
    & modifier_pp(sK1,in,'DreadburyMansion')
    & predicate2(sK2,kill,sK0,'AuntAgatha')
    & ! [X3,X4] :
        ( X3 = 'AuntAgatha'
        | X3 = 'Butler'
        | X3 = 'Charles'
        | ~ predicate1(X4,live,X3)
        | ~ modifier_pp(X4,in,'DreadburyMansion') )
    & ! [X5,X6,X7] :
        ( predicate2(sK3(X5,X6),hate,X5,X6)
        | ~ predicate2(X7,kill,X5,X6) )
    & ! [X9,X10,X11,X12] :
        ( ~ predicate2(X11,kill,X9,X10)
        | ~ property2(X12,rich,comp_than,X10)
        | X9 != X12 )
    & ! [X13,X14] :
        ( ! [X15] : ~ predicate2(X15,hate,'Charles',X13)
        | ~ predicate2(X14,hate,'AuntAgatha',X13) )
    & ! [X16] : ~ predicate2(X16,hate,'AuntAgatha','Butler')
    & ! [X17] :
        ( predicate2(sK4(X17),hate,'AuntAgatha',X17)
        | 'Butler' = X17 )
    & ! [X19] :
        ( predicate2(sK5(X19),hate,'Butler',X19)
        | ( property2(sK6(X19),rich,comp_than,'AuntAgatha')
          & sK6(X19) = X19 ) )
    & ! [X22,X23] :
        ( predicate2(sK7(X22),hate,'Butler',X22)
        | ~ predicate2(X23,hate,'AuntAgatha',X22) )
    & ! [X25,X27] : ~ predicate2(X27,hate,X25,sK8(X25))
    & 'AuntAgatha' != 'Butler' ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0,sK1,sK2,sK3,sK4,sK5,sK6,sK7,sK8])],[f9,f16,f15,f14,f13,f12,f11,f10]) ).

fof(f18,plain,
    'AuntAgatha' != 'Butler',
    inference(cnf_transformation,[],[f17]) ).

fof(f19,plain,
    ! [X27,X25] : ~ predicate2(X27,hate,X25,sK8(X25)),
    inference(cnf_transformation,[],[f17]) ).

fof(f20,plain,
    ! [X22,X23] :
      ( predicate2(sK7(X22),hate,'Butler',X22)
      | ~ predicate2(X23,hate,'AuntAgatha',X22) ),
    inference(cnf_transformation,[],[f17]) ).

fof(f21,plain,
    ! [X19] :
      ( sK6(X19) = X19
      | predicate2(sK5(X19),hate,'Butler',X19) ),
    inference(cnf_transformation,[],[f17]) ).

fof(f22,plain,
    ! [X19] :
      ( predicate2(sK5(X19),hate,'Butler',X19)
      | property2(sK6(X19),rich,comp_than,'AuntAgatha') ),
    inference(cnf_transformation,[],[f17]) ).

fof(f23,plain,
    ! [X17] :
      ( predicate2(sK4(X17),hate,'AuntAgatha',X17)
      | 'Butler' = X17 ),
    inference(cnf_transformation,[],[f17]) ).

fof(f25,plain,
    ! [X14,X15,X13] :
      ( ~ predicate2(X15,hate,'Charles',X13)
      | ~ predicate2(X14,hate,'AuntAgatha',X13) ),
    inference(cnf_transformation,[],[f17]) ).

fof(f26,plain,
    ! [X10,X11,X9,X12] :
      ( ~ predicate2(X11,kill,X9,X10)
      | ~ property2(X12,rich,comp_than,X10)
      | X9 != X12 ),
    inference(cnf_transformation,[],[f17]) ).

fof(f27,plain,
    ! [X6,X7,X5] :
      ( ~ predicate2(X7,kill,X5,X6)
      | predicate2(sK3(X5,X6),hate,X5,X6) ),
    inference(cnf_transformation,[],[f17]) ).

fof(f28,plain,
    ! [X3,X4] :
      ( ~ modifier_pp(X4,in,'DreadburyMansion')
      | 'Butler' = X3
      | 'Charles' = X3
      | ~ predicate1(X4,live,X3)
      | 'AuntAgatha' = X3 ),
    inference(cnf_transformation,[],[f17]) ).

fof(f29,plain,
    predicate2(sK2,kill,sK0,'AuntAgatha'),
    inference(cnf_transformation,[],[f17]) ).

fof(f30,plain,
    modifier_pp(sK1,in,'DreadburyMansion'),
    inference(cnf_transformation,[],[f17]) ).

fof(f31,plain,
    predicate1(sK1,live,sK0),
    inference(cnf_transformation,[],[f17]) ).

fof(f32,plain,
    ! [X0] : ~ predicate2(X0,kill,'AuntAgatha','AuntAgatha'),
    inference(cnf_transformation,[],[f8]) ).

fof(f33,plain,
    ! [X10,X11,X12] :
      ( ~ property2(X12,rich,comp_than,X10)
      | ~ predicate2(X11,kill,X12,X10) ),
    inference(equality_resolution,[],[f26]) ).

fof(f37,plain,
    ! [X0] : ~ predicate2(X0,hate,'AuntAgatha',sK8('Butler')),
    inference(resolution,[],[f20,f19]) ).

fof(f38,plain,
    property2(sK6(sK8('Butler')),rich,comp_than,'AuntAgatha'),
    inference(resolution,[],[f22,f19]) ).

fof(f39,plain,
    'Butler' = sK8('Butler'),
    inference(resolution,[],[f37,f23]) ).

fof(f40,plain,
    predicate2(sK3(sK0,'AuntAgatha'),hate,sK0,'AuntAgatha'),
    inference(resolution,[],[f27,f29]) ).

fof(f42,plain,
    ! [X0] : ~ predicate2(X0,hate,'Butler','Butler'),
    inference(superposition,[],[f19,f39]) ).

fof(f43,plain,
    ! [X0] :
      ( ~ predicate1(sK1,live,X0)
      | 'Charles' = X0
      | 'Butler' = X0
      | 'AuntAgatha' = X0 ),
    inference(resolution,[],[f28,f30]) ).

fof(f46,plain,
    property2(sK6('Butler'),rich,comp_than,'AuntAgatha'),
    inference(forward_demodulation,[],[f38,f39]) ).

fof(f48,plain,
    ( property2('Butler',rich,comp_than,'AuntAgatha')
    | predicate2(sK5('Butler'),hate,'Butler','Butler') ),
    inference(superposition,[],[f46,f21]) ).

fof(f49,plain,
    property2('Butler',rich,comp_than,'AuntAgatha'),
    inference(forward_subsumption_resolution,[],[f48,f42]) ).

fof(f50,plain,
    ! [X0] : ~ predicate2(X0,kill,'Butler','AuntAgatha'),
    inference(resolution,[],[f49,f33]) ).

fof(f51,plain,
    ( 'Charles' = sK0
    | 'Butler' = sK0
    | 'AuntAgatha' = sK0 ),
    inference(resolution,[],[f43,f31]) ).

fof(f53,definition,
    ( spl9_1
   'AuntAgatha' = sK0 ),
    introduced(definition,[new_symbols(naming,[spl9_1])],[avatar_definition]) ).

fof(f55,plain,
    ( 'AuntAgatha' = sK0
    | ~ spl9_1 ),
    inference(avatar_component_clause,[],[f53]) ).

fof(f57,definition,
    ( spl9_2
   'Butler' = sK0 ),
    introduced(definition,[new_symbols(naming,[spl9_2])],[avatar_definition]) ).

fof(f59,plain,
    ( 'Butler' = sK0
    | ~ spl9_2 ),
    inference(avatar_component_clause,[],[f57]) ).

fof(f61,definition,
    ( spl9_3
   'Charles' = sK0 ),
    introduced(definition,[new_symbols(naming,[spl9_3])],[avatar_definition]) ).

fof(f63,plain,
    ( 'Charles' = sK0
    | ~ spl9_3 ),
    inference(avatar_component_clause,[],[f61]) ).

fof(f64,plain,
    ( spl9_1
    | spl9_2
    | spl9_3 ),
    inference(avatar_split_clause,[],[f51,f61,f57,f53]) ).

fof(f66,plain,
    ( predicate2(sK2,kill,'Butler','AuntAgatha')
    | ~ spl9_2 ),
    inference(superposition,[],[f29,f59]) ).

fof(f71,plain,
    ( $false
    | ~ spl9_2 ),
    inference(forward_subsumption_resolution,[],[f66,f50]) ).

fof(f72,plain,
    ~ spl9_2,
    inference(avatar_contradiction_clause,[],[f71]) ).

fof(f74,plain,
    ( predicate2(sK3('Charles','AuntAgatha'),hate,'Charles','AuntAgatha')
    | ~ spl9_3 ),
    inference(superposition,[],[f40,f63]) ).

fof(f79,plain,
    ( ! [X0] : ~ predicate2(X0,hate,'AuntAgatha','AuntAgatha')
    | ~ spl9_3 ),
    inference(resolution,[],[f74,f25]) ).

fof(f80,plain,
    ( 'AuntAgatha' = 'Butler'
    | ~ spl9_3 ),
    inference(resolution,[],[f79,f23]) ).

fof(f81,plain,
    ( $false
    | ~ spl9_3 ),
    inference(forward_subsumption_resolution,[],[f80,f18]) ).

fof(f82,plain,
    ~ spl9_3,
    inference(avatar_contradiction_clause,[],[f81]) ).

fof(f85,plain,
    ( predicate2(sK2,kill,'AuntAgatha','AuntAgatha')
    | ~ spl9_1 ),
    inference(superposition,[],[f29,f55]) ).

fof(f87,plain,
    ( $false
    | ~ spl9_1 ),
    inference(forward_subsumption_resolution,[],[f85,f32]) ).

fof(f88,plain,
    ~ spl9_1,
    inference(avatar_contradiction_clause,[],[f87]) ).

cnf(s1,plain,
    ( spl9_1
    | spl9_2
    | spl9_3 ),
    inference(sat_conversion,[],[f64]) ).

cnf(s2,plain,
    ~ spl9_2,
    inference(sat_conversion,[],[f72]) ).

cnf(s3,plain,
    ~ spl9_3,
    inference(sat_conversion,[],[f82]) ).

cnf(s4,plain,
    ~ spl9_1,
    inference(sat_conversion,[],[f88]) ).

cnf(s5,plain,
    $false,
    inference(rat,[],[s1,s3,s2,s4]) ).

fof(f89,plain,
    $false,
    inference(avatar_sat_refutation,[],[s5]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.09  % Problem    : PUZ001+2 : TPTP v9.2.1. Released v4.0.0.
% 0.00/0.09  % Command    : run_vampire %s %d THM
% 0.10/0.29  % Computer   : n019.cluster.edu
% 0.10/0.29  % Model      : x86_64 x86_64
% 0.10/0.29  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.10/0.29  % Memory     : 8042.1875MB
% 0.10/0.29  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.10/0.29  % CPULimit   : 300
% 0.10/0.29  % WCLimit    : 300
% 0.10/0.29  % DateTime   : Fri May  1 00:01:14 EDT 2026
% 0.10/0.29  % CPUTime    : 
% 0.10/0.31  This is a FOF_THM_RFO_SEQ problem
% 0.10/0.31  Running first-order theorem proving
% 0.10/0.31  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.46/0.69  % (4622)Detected formulas, will run a generic FOF schedule.
% 0.53/0.88  % (4630)dis-21_1_sil=8000:lcm=predicate:random_seed=3785445603:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.53/0.88  % (4626)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3515606238:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.53/0.88  % (4627)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=2202477235:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.53/0.88  % (4629)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=3804737002:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.53/0.88  % (4624)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=1358781157:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.53/0.88  % (4625)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=379922622:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.53/0.88  % (4628)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3535018802:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.53/0.88  % (4628)Refutation not found, incomplete strategy
% 0.53/0.88  % (4628)------------------------------
% 0.53/0.88  % (4628)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.53/0.88  % (4627)Refutation not found, incomplete strategy
% 0.53/0.88  % (4627)------------------------------
% 0.53/0.88  % (4627)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.53/0.88  % (4627)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.53/0.88  % (4627)CaDiCaL version: 2.1.3
% 0.53/0.88  % (4627)Termination reason: Refutation not found, incomplete strategy
% 0.53/0.88  % (4627)Time elapsed: 0.0000 s
% 0.53/0.88  % (4627)Peak memory usage: 80 MB
% 0.53/0.88  % (4628)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.53/0.88  % (4628)CaDiCaL version: 2.1.3
% 0.53/0.88  % (4628)Termination reason: Refutation not found, incomplete strategy
% 0.53/0.88  % (4628)Time elapsed: 0.0000 s
% 0.53/0.88  % (4628)Peak memory usage: 80 MB
% 0.53/0.88  % (4630)Refutation not found, incomplete strategy
% 0.53/0.88  % (4630)------------------------------
% 0.53/0.88  % (4630)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.53/0.88  % (4630)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.53/0.88  % (4630)CaDiCaL version: 2.1.3
% 0.53/0.88  % (4630)Termination reason: Refutation not found, incomplete strategy
% 0.53/0.88  % (4630)Time elapsed: 0.002 s
% 0.53/0.88  % (4630)Peak memory usage: 80 MB
% 0.53/0.88  % (4630)Instructions burned: 1 (million)
% 0.53/0.88  % (4629)First to succeed.
% 0.53/0.88  % (4629)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-4622"
% 2.81/1.07  % (4628)------------------------------
% 2.81/1.07  % (4628)------------------------------
% 2.81/1.07  % (4627)------------------------------
% 2.81/1.07  % (4627)------------------------------
% 2.81/1.09  % (4629)Refutation found. Thanks to Tanya!
% 2.81/1.09  % SZS status Theorem for theBenchmark
% 2.81/1.09  % SZS output start Proof for theBenchmark
% See solution above
% 2.81/1.09  % (4629)------------------------------
% 2.81/1.09  % (4629)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 2.81/1.09  % (4629)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 2.81/1.09  % (4629)CaDiCaL version: 2.1.3
% 2.81/1.09  % (4629)Termination reason: Refutation
% 2.81/1.09  % (4629)Time elapsed: 0.005 s
% 2.81/1.09  % (4629)Peak memory usage: 81 MB
% 2.81/1.09  % (4629)Instructions burned: 6 (million)
% 2.81/1.09  % (4629)------------------------------
% 2.81/1.09  % (4629)------------------------------
% 2.81/1.09  % (4622)Success in time 0.4 s
%------------------------------------------------------------------------------
