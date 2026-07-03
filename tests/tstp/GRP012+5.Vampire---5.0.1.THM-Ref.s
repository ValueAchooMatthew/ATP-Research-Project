
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : GRP012+5 : TPTP v9.2.1. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n018.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 02:35:04 PM UTC 2026

% Result   : Theorem 2.92s 1.08s
% Output   : Refutation 2.92s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   12
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   33 (  11 unt;   0 def)
%            Number of atoms       :  195 (   0 equ)
%            Maximal formula atoms :   32 (   5 avg)
%            Number of connectives :  231 (  69   ~;  56   |;  91   &)
%                                         (   0 ;  15  =>;   0  )
%            Maximal formula depth :   17 (   7 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    7 (   7 usr;   5 con; 0-2 aty)
%            Number of variables   :  259 ( 222   !;  37   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,conjecture,
    ! [X0] :
      ( ( ! [X1,X2] :
          ? [X3] : product(X1,X2,X3)
        & ! [X1,X2,X3,X4,X5,X6] :
            ( ( product(X1,X2,X4)
              & product(X2,X3,X5)
              & product(X4,X3,X6) )
           => product(X1,X5,X6) )
        & ! [X1,X2,X3,X4,X5,X6] :
            ( ( product(X1,X2,X4)
              & product(X2,X3,X5)
              & product(X1,X5,X6) )
           => product(X4,X3,X6) )
        & ! [X1] : product(X1,X0,X1)
        & ! [X1] : product(X0,X1,X1)
        & ! [X1] : product(X1,inverse(X1),X0)
        & ! [X1] : product(inverse(X1),X1,X0) )
     => ! [X4,X5,X6,X1] :
          ( ( product(inverse(X4),inverse(X5),X6)
            & product(X5,X4,X1) )
         => product(inverse(X6),inverse(X1),X0) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',prove_distribution) ).

fof(f2,negated_conjecture,
    ~ ! [X0] :
        ( ( ! [X1,X2] :
            ? [X3] : product(X1,X2,X3)
          & ! [X1,X2,X3,X4,X5,X6] :
              ( ( product(X1,X2,X4)
                & product(X2,X3,X5)
                & product(X4,X3,X6) )
             => product(X1,X5,X6) )
          & ! [X1,X2,X3,X4,X5,X6] :
              ( ( product(X1,X2,X4)
                & product(X2,X3,X5)
                & product(X1,X5,X6) )
             => product(X4,X3,X6) )
          & ! [X1] : product(X1,X0,X1)
          & ! [X1] : product(X0,X1,X1)
          & ! [X1] : product(X1,inverse(X1),X0)
          & ! [X1] : product(inverse(X1),X1,X0) )
       => ! [X4,X5,X6,X1] :
            ( ( product(inverse(X4),inverse(X5),X6)
              & product(X5,X4,X1) )
           => product(inverse(X6),inverse(X1),X0) ) ),
    inference(negated_conjecture,[status(cth)],[f1]) ).

fof(f3,plain,
    ~ ! [X0] :
        ( ( ! [X1,X2] :
            ? [X3] : product(X1,X2,X3)
          & ! [X4,X5,X6,X7,X8,X9] :
              ( ( product(X4,X5,X7)
                & product(X5,X6,X8)
                & product(X7,X6,X9) )
             => product(X4,X8,X9) )
          & ! [X10,X11,X12,X13,X14,X15] :
              ( ( product(X10,X11,X13)
                & product(X11,X12,X14)
                & product(X10,X14,X15) )
             => product(X13,X12,X15) )
          & ! [X16] : product(X16,X0,X16)
          & ! [X17] : product(X0,X17,X17)
          & ! [X18] : product(X18,inverse(X18),X0)
          & ! [X19] : product(inverse(X19),X19,X0) )
       => ! [X20,X21,X22,X23] :
            ( ( product(inverse(X20),inverse(X21),X22)
              & product(X21,X20,X23) )
           => product(inverse(X22),inverse(X23),X0) ) ),
    inference(rectify,[],[f2]) ).

fof(f4,plain,
    ? [X0] :
      ( ? [X20,X21,X22,X23] :
          ( ~ product(inverse(X22),inverse(X23),X0)
          & product(inverse(X20),inverse(X21),X22)
          & product(X21,X20,X23) )
      & ! [X1,X2] :
        ? [X3] : product(X1,X2,X3)
      & ! [X4,X5,X6,X7,X8,X9] :
          ( product(X4,X8,X9)
          | ~ product(X4,X5,X7)
          | ~ product(X5,X6,X8)
          | ~ product(X7,X6,X9) )
      & ! [X10,X11,X12,X13,X14,X15] :
          ( product(X13,X12,X15)
          | ~ product(X10,X11,X13)
          | ~ product(X11,X12,X14)
          | ~ product(X10,X14,X15) )
      & ! [X16] : product(X16,X0,X16)
      & ! [X17] : product(X0,X17,X17)
      & ! [X18] : product(X18,inverse(X18),X0)
      & ! [X19] : product(inverse(X19),X19,X0) ),
    inference(ennf_transformation,[],[f3]) ).

fof(f5,plain,
    ? [X0] :
      ( ? [X20,X21,X22,X23] :
          ( ~ product(inverse(X22),inverse(X23),X0)
          & product(inverse(X20),inverse(X21),X22)
          & product(X21,X20,X23) )
      & ! [X1,X2] :
        ? [X3] : product(X1,X2,X3)
      & ! [X4,X5,X6,X7,X8,X9] :
          ( product(X4,X8,X9)
          | ~ product(X4,X5,X7)
          | ~ product(X5,X6,X8)
          | ~ product(X7,X6,X9) )
      & ! [X10,X11,X12,X13,X14,X15] :
          ( product(X13,X12,X15)
          | ~ product(X10,X11,X13)
          | ~ product(X11,X12,X14)
          | ~ product(X10,X14,X15) )
      & ! [X16] : product(X16,X0,X16)
      & ! [X17] : product(X0,X17,X17)
      & ! [X18] : product(X18,inverse(X18),X0)
      & ! [X19] : product(inverse(X19),X19,X0) ),
    inference(flattening,[],[f4]) ).

fof(f6,plain,
    ? [X0] :
      ( ? [X1,X2,X3,X4] :
          ( ~ product(inverse(X3),inverse(X4),X0)
          & product(inverse(X1),inverse(X2),X3)
          & product(X2,X1,X4) )
      & ! [X5,X6] :
        ? [X7] : product(X5,X6,X7)
      & ! [X8,X9,X10,X11,X12,X13] :
          ( product(X8,X12,X13)
          | ~ product(X8,X9,X11)
          | ~ product(X9,X10,X12)
          | ~ product(X11,X10,X13) )
      & ! [X14,X15,X16,X17,X18,X19] :
          ( product(X17,X16,X19)
          | ~ product(X14,X15,X17)
          | ~ product(X15,X16,X18)
          | ~ product(X14,X18,X19) )
      & ! [X20] : product(X20,X0,X20)
      & ! [X21] : product(X0,X21,X21)
      & ! [X22] : product(X22,inverse(X22),X0)
      & ! [X23] : product(inverse(X23),X23,X0) ),
    inference(rectify,[],[f5]) ).

fof(f7,plain,
    ( ? [X0] :
        ( ? [X1,X2,X3,X4] :
            ( ~ product(inverse(X3),inverse(X4),X0)
            & product(inverse(X1),inverse(X2),X3)
            & product(X2,X1,X4) )
        & ! [X5,X6] :
          ? [X7] : product(X5,X6,X7)
        & ! [X8,X9,X10,X11,X12,X13] :
            ( product(X8,X12,X13)
            | ~ product(X8,X9,X11)
            | ~ product(X9,X10,X12)
            | ~ product(X11,X10,X13) )
        & ! [X14,X15,X16,X17,X18,X19] :
            ( product(X17,X16,X19)
            | ~ product(X14,X15,X17)
            | ~ product(X15,X16,X18)
            | ~ product(X14,X18,X19) )
        & ! [X20] : product(X20,X0,X20)
        & ! [X21] : product(X0,X21,X21)
        & ! [X22] : product(X22,inverse(X22),X0)
        & ! [X23] : product(inverse(X23),X23,X0) )
   => ( ? [X4,X3,X2,X1] :
          ( ~ product(inverse(X3),inverse(X4),sK0)
          & product(inverse(X1),inverse(X2),X3)
          & product(X2,X1,X4) )
      & ! [X5,X6] :
        ? [X7] : product(X5,X6,X7)
      & ! [X8,X9,X10,X11,X12,X13] :
          ( product(X8,X12,X13)
          | ~ product(X8,X9,X11)
          | ~ product(X9,X10,X12)
          | ~ product(X11,X10,X13) )
      & ! [X14,X15,X16,X17,X18,X19] :
          ( product(X17,X16,X19)
          | ~ product(X14,X15,X17)
          | ~ product(X15,X16,X18)
          | ~ product(X14,X18,X19) )
      & ! [X20] : product(X20,sK0,X20)
      & ! [X21] : product(sK0,X21,X21)
      & ! [X22] : product(X22,inverse(X22),sK0)
      & ! [X23] : product(inverse(X23),X23,sK0) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f8,plain,
    ( ? [X4,X3,X2,X1] :
        ( ~ product(inverse(X3),inverse(X4),sK0)
        & product(inverse(X1),inverse(X2),X3)
        & product(X2,X1,X4) )
   => ( ~ product(inverse(sK3),inverse(sK4),sK0)
      & product(inverse(sK1),inverse(sK2),sK3)
      & product(sK2,sK1,sK4) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f9,plain,
    ! [X5,X6] :
      ( ? [X7] : product(X5,X6,X7)
     => product(X5,X6,sK5(X5,X6)) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f10,plain,
    ( ~ product(inverse(sK3),inverse(sK4),sK0)
    & product(inverse(sK1),inverse(sK2),sK3)
    & product(sK2,sK1,sK4)
    & ! [X5,X6] : product(X5,X6,sK5(X5,X6))
    & ! [X8,X9,X10,X11,X12,X13] :
        ( product(X8,X12,X13)
        | ~ product(X8,X9,X11)
        | ~ product(X9,X10,X12)
        | ~ product(X11,X10,X13) )
    & ! [X14,X15,X16,X17,X18,X19] :
        ( product(X17,X16,X19)
        | ~ product(X14,X15,X17)
        | ~ product(X15,X16,X18)
        | ~ product(X14,X18,X19) )
    & ! [X20] : product(X20,sK0,X20)
    & ! [X21] : product(sK0,X21,X21)
    & ! [X22] : product(X22,inverse(X22),sK0)
    & ! [X23] : product(inverse(X23),X23,sK0) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0,sK1,sK2,sK3,sK4,sK5])],[f6,f9,f8,f7]) ).

fof(f11,plain,
    ! [X23] : product(inverse(X23),X23,sK0),
    inference(cnf_transformation,[],[f10]) ).

fof(f12,plain,
    ! [X22] : product(X22,inverse(X22),sK0),
    inference(cnf_transformation,[],[f10]) ).

fof(f13,plain,
    ! [X21] : product(sK0,X21,X21),
    inference(cnf_transformation,[],[f10]) ).

fof(f14,plain,
    ! [X20] : product(X20,sK0,X20),
    inference(cnf_transformation,[],[f10]) ).

fof(f15,plain,
    ! [X18,X19,X16,X14,X17,X15] :
      ( ~ product(X15,X16,X18)
      | ~ product(X14,X15,X17)
      | product(X17,X16,X19)
      | ~ product(X14,X18,X19) ),
    inference(cnf_transformation,[],[f10]) ).

fof(f16,plain,
    ! [X10,X11,X8,X9,X12,X13] :
      ( ~ product(X11,X10,X13)
      | ~ product(X8,X9,X11)
      | ~ product(X9,X10,X12)
      | product(X8,X12,X13) ),
    inference(cnf_transformation,[],[f10]) ).

fof(f18,plain,
    product(sK2,sK1,sK4),
    inference(cnf_transformation,[],[f10]) ).

fof(f19,plain,
    product(inverse(sK1),inverse(sK2),sK3),
    inference(cnf_transformation,[],[f10]) ).

fof(f20,plain,
    ~ product(inverse(sK3),inverse(sK4),sK0),
    inference(cnf_transformation,[],[f10]) ).

fof(f23,plain,
    ! [X2,X3,X0,X1] :
      ( ~ product(X0,inverse(X1),X2)
      | product(X2,X1,X3)
      | ~ product(X0,sK0,X3) ),
    inference(resolution,[],[f15,f11]) ).

fof(f24,plain,
    ! [X2,X3,X0,X1] :
      ( ~ product(X0,sK0,X3)
      | product(X2,inverse(X1),X3)
      | ~ product(X0,X1,X2) ),
    inference(resolution,[],[f15,f12]) ).

fof(f28,plain,
    ! [X2,X3,X0,X1] :
      ( ~ product(X1,X2,X3)
      | ~ product(X0,X1,sK0)
      | product(X0,X3,X2) ),
    inference(resolution,[],[f16,f13]) ).

fof(f31,plain,
    ! [X2,X3,X0,X1] :
      ( ~ product(X1,inverse(X2),X3)
      | ~ product(X0,X1,X2)
      | product(X0,X3,sK0) ),
    inference(resolution,[],[f16,f12]) ).

fof(f62,plain,
    ! [X0,X1] :
      ( product(X0,sK0,inverse(X1))
      | ~ product(X0,X1,sK0) ),
    inference(resolution,[],[f28,f12]) ).

fof(f96,plain,
    ! [X0,X1] :
      ( ~ product(X0,sK0,X1)
      | product(sK0,X0,X1) ),
    inference(resolution,[],[f23,f12]) ).

fof(f108,plain,
    ! [X2,X0,X1] :
      ( product(X0,inverse(X1),X2)
      | ~ product(X2,X1,X0) ),
    inference(resolution,[],[f24,f14]) ).

fof(f133,plain,
    ! [X0] :
      ( ~ product(X0,inverse(sK1),sK2)
      | product(X0,sK3,sK0) ),
    inference(resolution,[],[f31,f19]) ).

fof(f352,plain,
    ! [X0,X1] :
      ( product(sK0,X0,inverse(X1))
      | ~ product(X0,X1,sK0) ),
    inference(resolution,[],[f62,f96]) ).

fof(f482,plain,
    ~ product(sK0,sK4,inverse(sK3)),
    inference(resolution,[],[f108,f20]) ).

fof(f581,plain,
    ! [X0] :
      ( ~ product(sK2,sK1,X0)
      | product(X0,sK3,sK0) ),
    inference(resolution,[],[f133,f108]) ).

fof(f1432,plain,
    product(sK4,sK3,sK0),
    inference(resolution,[],[f581,f18]) ).

fof(f1531,plain,
    ~ product(sK4,sK3,sK0),
    inference(resolution,[],[f352,f482]) ).

fof(f1560,plain,
    $false,
    inference(forward_subsumption_resolution,[],[f1531,f1432]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : GRP012+5 : TPTP v9.2.1. Released v3.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.33  % Computer   : n018.cluster.edu
% 0.15/0.33  % Model      : x86_64 x86_64
% 0.15/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory     : 8042.1875MB
% 0.15/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit   : 300
% 0.15/0.33  % WCLimit    : 300
% 0.15/0.33  % DateTime   : Thu Apr 30 15:29:47 EDT 2026
% 0.15/0.33  % CPUTime    : 
% 0.15/0.35  This is a FOF_THM_RFO_NEQ problem
% 0.15/0.35  Running first-order theorem proving
% 0.15/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.47/0.64  % (24026)Detected formulas, will run a generic FOF schedule.
% 0.49/0.76  % (24034)dis-21_1_sil=8000:lcm=predicate:random_seed=2814149426:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.49/0.79  % (24033)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=2784143983:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.49/0.79  % (24031)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=558244004:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.49/0.79  % (24028)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=2844872584:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.49/0.79  % (24032)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=2266143431:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.49/0.79  % (24030)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3957068798:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.49/0.79  % (24029)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=3616172827:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.49/0.80  % (24034)Instruction limit reached! 
% 0.49/0.80  % (24034)------------------------------
% 0.49/0.80  % (24034)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.80  % (24034)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.80  % (24034)CaDiCaL version: 2.1.3
% 0.49/0.80  % (24034)Termination reason: Instruction limit
% 0.49/0.80  % (24034)Termination phase: Saturation
% 0.49/0.80  % (24034)Time elapsed: 0.042 s
% 0.49/0.80  % (24034)Peak memory usage: 81 MB
% 0.49/0.80  % (24034)Instructions burned: 132 (million)
% 0.49/0.83  % (24032)Instruction limit reached! 
% 0.49/0.83  % (24032)------------------------------
% 0.49/0.83  % (24032)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.83  % (24032)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.83  % (24032)CaDiCaL version: 2.1.3
% 0.49/0.83  % (24032)Termination reason: Instruction limit
% 0.49/0.83  % (24032)Termination phase: Saturation
% 0.49/0.83  % (24032)Time elapsed: 0.039 s
% 0.49/0.83  % (24032)Peak memory usage: 81 MB
% 0.49/0.83  % (24032)Instructions burned: 120 (million)
% 0.49/0.83  % (24031)Instruction limit reached! 
% 0.49/0.83  % (24031)------------------------------
% 0.49/0.83  % (24031)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.83  % (24031)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.83  % (24031)CaDiCaL version: 2.1.3
% 0.49/0.83  % (24031)Termination reason: Instruction limit
% 0.49/0.83  % (24031)Termination phase: Saturation
% 0.49/0.83  % (24031)Time elapsed: 0.041 s
% 0.49/0.83  % (24031)Peak memory usage: 81 MB
% 0.49/0.83  % (24031)Instructions burned: 111 (million)
% 0.49/0.84  % (24033)Instruction limit reached! 
% 0.49/0.84  % (24033)------------------------------
% 0.49/0.84  % (24033)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.84  % (24033)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.84  % (24033)CaDiCaL version: 2.1.3
% 0.49/0.84  % (24033)Termination reason: Instruction limit
% 0.49/0.84  % (24033)Termination phase: Saturation
% 0.49/0.84  % (24033)Time elapsed: 0.048 s
% 0.49/0.84  % (24033)Peak memory usage: 81 MB
% 0.49/0.84  % (24033)Instructions burned: 139 (million)
% 1.19/0.91  % (24042)lrs+10_1_sil=8000:sp=occurrence:random_seed=1410128358:i=285:sd=3:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/285Mi)
% 1.19/0.94  % (24042)First to succeed.
% 1.19/0.94  % (24042)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-24026"
% 1.19/0.94  % (24043)lrs+10_1_sil=32000:urr=on:br=off:random_seed=3023379798:i=157:sd=1:gtg=position:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/157Mi)
% 1.19/0.95  % (24043)Also succeeded, but the first one will report.
% 1.19/0.95  % (24044)lrs+1011_1_sil=32000:sp=occurrence:random_seed=1247589077:i=325:sd=1:ss=axioms:sgt=32_2998 on theBenchmark for (2998ds/325Mi)
% 1.19/0.96  % (24045)dis+10_5:1_slsqr=1,4:sil=8000:fde=unused:erd=off:urr=full:fd=off:s2agt=8:br=off:slsq=on:random_seed=918382826:s2a=on:i=248:s2at=1.23:gtg=position_2998 on theBenchmark for (2998ds/248Mi)
% 1.19/0.97  % (24045)Also succeeded, but the first one will report.
% 2.92/1.08  % (24042)Refutation found. Thanks to Tanya!
% 2.92/1.08  % SZS status Theorem for theBenchmark
% 2.92/1.08  % SZS output start Proof for theBenchmark
% See solution above
% 2.92/1.08  % (24042)------------------------------
% 2.92/1.08  % (24042)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 2.92/1.08  % (24042)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 2.92/1.08  % (24042)CaDiCaL version: 2.1.3
% 2.92/1.08  % (24042)Termination reason: Refutation
% 2.92/1.08  % (24042)Time elapsed: 0.024 s
% 2.92/1.08  % (24042)Peak memory usage: 82 MB
% 2.92/1.08  % (24042)Instructions burned: 68 (million)
% 2.92/1.08  % (24042)------------------------------
% 2.92/1.08  % (24042)------------------------------
% 2.92/1.08  % (24026)Success in time 0.436 s
%------------------------------------------------------------------------------
