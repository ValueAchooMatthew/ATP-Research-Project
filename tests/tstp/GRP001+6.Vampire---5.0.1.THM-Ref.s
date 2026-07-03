
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : GRP001+6 : TPTP v9.2.1. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n020.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 02:35:00 PM UTC 2026

% Result   : Theorem 2.92s 1.11s
% Output   : Refutation 2.92s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   10
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   21 (   9 unt;   0 def)
%            Number of atoms       :  167 (   0 equ)
%            Maximal formula atoms :   32 (   7 avg)
%            Number of connectives :  200 (  54   ~;  42   |;  86   &)
%                                         (   0 ;  18  =>;   0  )
%            Maximal formula depth :   18 (   9 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-3 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :  231 ( 200   !;  31   ?)

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
     => ( ! [X1] : product(X1,X1,X0)
       => ! [X4,X5,X6] :
            ( product(X4,X5,X6)
           => product(X5,X4,X6) ) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',commutativity) ).

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
       => ( ! [X1] : product(X1,X1,X0)
         => ! [X4,X5,X6] :
              ( product(X4,X5,X6)
             => product(X5,X4,X6) ) ) ),
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
       => ( ! [X20] : product(X20,X20,X0)
         => ! [X21,X22,X23] :
              ( product(X21,X22,X23)
             => product(X22,X21,X23) ) ) ),
    inference(rectify,[],[f2]) ).

fof(f4,plain,
    ? [X0] :
      ( ? [X21,X22,X23] :
          ( ~ product(X22,X21,X23)
          & product(X21,X22,X23) )
      & ! [X20] : product(X20,X20,X0)
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
      ( ? [X21,X22,X23] :
          ( ~ product(X22,X21,X23)
          & product(X21,X22,X23) )
      & ! [X20] : product(X20,X20,X0)
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
      ( ? [X1,X2,X3] :
          ( ~ product(X2,X1,X3)
          & product(X1,X2,X3) )
      & ! [X4] : product(X4,X4,X0)
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
        ( ? [X1,X2,X3] :
            ( ~ product(X2,X1,X3)
            & product(X1,X2,X3) )
        & ! [X4] : product(X4,X4,X0)
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
   => ( ? [X1,X2,X3] :
          ( ~ product(X2,X1,X3)
          & product(X1,X2,X3) )
      & ! [X4] : product(X4,X4,sK0)
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
    ( ? [X1,X2,X3] :
        ( ~ product(X2,X1,X3)
        & product(X1,X2,X3) )
   => ( ~ product(sK2,sK1,sK3)
      & product(sK1,sK2,sK3) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f9,plain,
    ! [X5,X6] :
      ( ? [X7] : product(X5,X6,X7)
     => product(X5,X6,sK4(X5,X6)) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f10,plain,
    ( ~ product(sK2,sK1,sK3)
    & product(sK1,sK2,sK3)
    & ! [X4] : product(X4,X4,sK0)
    & ! [X5,X6] : product(X5,X6,sK4(X5,X6))
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
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0,sK1,sK2,sK3,sK4])],[f6,f9,f8,f7]) ).

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
    ! [X4] : product(X4,X4,sK0),
    inference(cnf_transformation,[],[f10]) ).

fof(f19,plain,
    product(sK1,sK2,sK3),
    inference(cnf_transformation,[],[f10]) ).

fof(f20,plain,
    ~ product(sK2,sK1,sK3),
    inference(cnf_transformation,[],[f10]) ).

fof(f91,plain,
    product(sK3,sK2,sK1),
    inference(unit_resulting_resolution,[],[f15,f19,f14,f18]) ).

fof(f93,plain,
    ~ product(sK3,sK1,sK2),
    inference(unit_resulting_resolution,[],[f15,f20,f14,f18]) ).

fof(f354,plain,
    product(sK3,sK1,sK2),
    inference(unit_resulting_resolution,[],[f16,f13,f18,f91]) ).

fof(f395,plain,
    $false,
    inference(forward_subsumption_resolution,[],[f354,f93]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : GRP001+6 : TPTP v9.2.1. Released v3.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.33  % Computer   : n020.cluster.edu
% 0.15/0.33  % Model      : x86_64 x86_64
% 0.15/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory     : 8042.1875MB
% 0.15/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit   : 300
% 0.15/0.33  % WCLimit    : 300
% 0.15/0.33  % DateTime   : Thu Apr 30 15:29:49 EDT 2026
% 0.15/0.33  % CPUTime    : 
% 0.21/0.35  This is a FOF_THM_RFO_NEQ problem
% 0.21/0.36  Running first-order theorem proving
% 0.21/0.36  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.48/0.66  % (20934)Detected formulas, will run a generic FOF schedule.
% 0.52/0.77  % (21008)dis-21_1_sil=8000:lcm=predicate:random_seed=2002833994:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.52/0.80  % (21007)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=4176645565:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.52/0.80  % (21005)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=1215238738:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.52/0.80  % (21006)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3540923689:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.52/0.80  % (21003)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=652944523:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.52/0.80  % (21002)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3239672515:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.52/0.80  % (21004)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=276904111:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.52/0.81  % (21008)Instruction limit reached! 
% 0.52/0.81  % (21008)------------------------------
% 0.52/0.81  % (21008)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.52/0.81  % (21008)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.52/0.81  % (21008)CaDiCaL version: 2.1.3
% 0.52/0.81  % (21008)Termination reason: Instruction limit
% 0.52/0.81  % (21008)Termination phase: Saturation
% 0.52/0.81  % (21008)Time elapsed: 0.042 s
% 0.52/0.81  % (21008)Peak memory usage: 81 MB
% 0.52/0.81  % (21008)Instructions burned: 130 (million)
% 0.52/0.84  % (21006)Instruction limit reached! 
% 0.52/0.84  % (21006)------------------------------
% 0.52/0.84  % (21006)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.52/0.84  % (21006)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.52/0.84  % (21006)CaDiCaL version: 2.1.3
% 0.52/0.84  % (21006)Termination reason: Instruction limit
% 0.52/0.84  % (21006)Termination phase: Saturation
% 0.52/0.84  % (21006)Time elapsed: 0.037 s
% 0.52/0.84  % (21006)Peak memory usage: 81 MB
% 0.52/0.84  % (21006)Instructions burned: 119 (million)
% 0.52/0.84  % (21005)Instruction limit reached! 
% 0.52/0.84  % (21005)------------------------------
% 0.52/0.84  % (21005)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.52/0.84  % (21005)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.52/0.84  % (21005)CaDiCaL version: 2.1.3
% 0.52/0.84  % (21005)Termination reason: Instruction limit
% 0.52/0.84  % (21005)Termination phase: Saturation
% 0.52/0.84  % (21005)Time elapsed: 0.039 s
% 0.52/0.84  % (21005)Peak memory usage: 81 MB
% 0.52/0.84  % (21005)Instructions burned: 109 (million)
% 0.52/0.85  % (21007)Instruction limit reached! 
% 0.52/0.85  % (21007)------------------------------
% 0.52/0.85  % (21007)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.52/0.85  % (21007)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.52/0.85  % (21007)CaDiCaL version: 2.1.3
% 0.52/0.85  % (21007)Termination reason: Instruction limit
% 0.52/0.85  % (21007)Termination phase: Saturation
% 0.52/0.85  % (21007)Time elapsed: 0.047 s
% 0.52/0.85  % (21007)Peak memory usage: 81 MB
% 0.52/0.85  % (21007)Instructions burned: 142 (million)
% 1.23/0.93  % (21016)lrs+10_1_sil=8000:sp=occurrence:random_seed=3024581579:i=285:sd=3:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/285Mi)
% 1.23/0.95  % (21017)lrs+10_1_sil=32000:urr=on:br=off:random_seed=2963949733:i=157:sd=1:gtg=position:ss=axioms:sgt=8_2998 on theBenchmark for (2998ds/157Mi)
% 1.23/0.95  % (21018)lrs+1011_1_sil=32000:sp=occurrence:random_seed=2635856374:i=325:sd=1:ss=axioms:sgt=32_2998 on theBenchmark for (2998ds/325Mi)
% 1.23/0.95  % (21017)First to succeed.
% 1.23/0.95  % (21017)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-20934"
% 1.23/0.98  % (21019)dis+10_5:1_slsqr=1,4:sil=8000:fde=unused:erd=off:urr=full:fd=off:s2agt=8:br=off:slsq=on:random_seed=278063544:s2a=on:i=248:s2at=1.23:gtg=position_2998 on theBenchmark for (2998ds/248Mi)
% 1.23/0.98  % (21019)Also succeeded, but the first one will report.
% 2.92/1.03  % (21016)Instruction limit reached! 
% 2.92/1.03  % (21016)------------------------------
% 2.92/1.03  % (21016)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 2.92/1.03  % (21016)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 2.92/1.03  % (21016)CaDiCaL version: 2.1.3
% 2.92/1.03  % (21016)Termination reason: Instruction limit
% 2.92/1.03  % (21016)Termination phase: Saturation
% 2.92/1.03  % (21016)Time elapsed: 0.095 s
% 2.92/1.03  % (21016)Peak memory usage: 83 MB
% 2.92/1.03  % (21016)Instructions burned: 288 (million)
% 2.92/1.05  % (21018)Instruction limit reached! 
% 2.92/1.05  % (21018)------------------------------
% 2.92/1.05  % (21018)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 2.92/1.05  % (21018)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 2.92/1.05  % (21018)CaDiCaL version: 2.1.3
% 2.92/1.05  % (21018)Termination reason: Instruction limit
% 2.92/1.05  % (21018)Termination phase: Saturation
% 2.92/1.05  % (21018)Time elapsed: 0.103 s
% 2.92/1.05  % (21018)Peak memory usage: 82 MB
% 2.92/1.05  % (21018)Instructions burned: 327 (million)
% 2.92/1.11  % (21017)Refutation found. Thanks to Tanya!
% 2.92/1.11  % SZS status Theorem for theBenchmark
% 2.92/1.11  % SZS output start Proof for theBenchmark
% See solution above
% 2.92/1.11  % (21017)------------------------------
% 2.92/1.11  % (21017)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 2.92/1.11  % (21017)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 2.92/1.11  % (21017)CaDiCaL version: 2.1.3
% 2.92/1.11  % (21017)Termination reason: Refutation
% 2.92/1.11  % (21017)Time elapsed: 0.004 s
% 2.92/1.11  % (21017)Peak memory usage: 81 MB
% 2.92/1.11  % (21017)Instructions burned: 10 (million)
% 2.92/1.11  % (21017)------------------------------
% 2.92/1.11  % (21017)------------------------------
% 2.92/1.11  % (20934)Success in time 0.451 s
%------------------------------------------------------------------------------
