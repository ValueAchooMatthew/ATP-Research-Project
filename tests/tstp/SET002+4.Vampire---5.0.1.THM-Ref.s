
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : SET002+4 : TPTP v9.2.1. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n007.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:58:20 PM UTC 2026

% Result   : Theorem 0.45s 0.91s
% Output   : Refutation 0.45s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   10
%            Number of leaves      :    6
% Syntax   : Number of formulae    :   34 (   9 unt;   0 def)
%            Number of atoms       :   82 (   0 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   77 (  29   ~;  29   |;  10   &)
%                                         (   3 ;   6  =>;   0  )
%            Maximal formula depth :    8 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   63 (  59   !;   4   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( subset(X0,X1)
     ! [X2] :
          ( member(X2,X0)
         => member(X2,X1) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',subset) ).

fof(f2,axiom,
    ! [X0,X1] :
      ( equal_set(X0,X1)
     ( subset(X0,X1)
        & subset(X1,X0) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',equal_set) ).

fof(f5,axiom,
    ! [X0,X1,X2] :
      ( member(X0,union(X1,X2))
     ( member(X0,X1)
        | member(X0,X2) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',union) ).

fof(f12,conjecture,
    ! [X0] : equal_set(union(X0,X0),X0),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',thI14) ).

fof(f13,negated_conjecture,
    ~ ! [X0] : equal_set(union(X0,X0),X0),
    inference(negated_conjecture,[status(cth)],[f12]) ).

fof(f14,plain,
    ! [X0,X1] :
      ( ( subset(X0,X1)
        & subset(X1,X0) )
     => equal_set(X0,X1) ),
    inference(unused_predicate_definition_removal,[],[f2]) ).

fof(f15,plain,
    ! [X0,X1] :
      ( ! [X2] :
          ( member(X2,X0)
         => member(X2,X1) )
     => subset(X0,X1) ),
    inference(unused_predicate_definition_removal,[],[f1]) ).

fof(f16,plain,
    ? [X0] : ~ equal_set(union(X0,X0),X0),
    inference(ennf_transformation,[],[f13]) ).

fof(f17,plain,
    ! [X0,X1] :
      ( equal_set(X0,X1)
      | ~ subset(X0,X1)
      | ~ subset(X1,X0) ),
    inference(ennf_transformation,[],[f14]) ).

fof(f18,plain,
    ! [X0,X1] :
      ( equal_set(X0,X1)
      | ~ subset(X0,X1)
      | ~ subset(X1,X0) ),
    inference(flattening,[],[f17]) ).

fof(f19,plain,
    ! [X0,X1] :
      ( subset(X0,X1)
      | ? [X2] :
          ( ~ member(X2,X1)
          & member(X2,X0) ) ),
    inference(ennf_transformation,[],[f15]) ).

fof(f20,plain,
    ( ? [X0] : ~ equal_set(union(X0,X0),X0)
   => ~ equal_set(union(sK0,sK0),sK0) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f21,plain,
    ~ equal_set(union(sK0,sK0),sK0),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[f16,f20]) ).

fof(f22,plain,
    ! [X0,X1,X2] :
      ( ( member(X0,union(X1,X2))
        | ( ~ member(X0,X1)
          & ~ member(X0,X2) ) )
      & ( member(X0,X1)
        | member(X0,X2)
        | ~ member(X0,union(X1,X2)) ) ),
    inference(nnf_transformation,[],[f5]) ).

fof(f23,plain,
    ! [X0,X1,X2] :
      ( ( member(X0,union(X1,X2))
        | ( ~ member(X0,X1)
          & ~ member(X0,X2) ) )
      & ( member(X0,X1)
        | member(X0,X2)
        | ~ member(X0,union(X1,X2)) ) ),
    inference(flattening,[],[f22]) ).

fof(f24,plain,
    ! [X0,X1] :
      ( ? [X2] :
          ( ~ member(X2,X1)
          & member(X2,X0) )
     => ( ~ member(sK1(X0,X1),X1)
        & member(sK1(X0,X1),X0) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f25,plain,
    ! [X0,X1] :
      ( subset(X0,X1)
      | ( ~ member(sK1(X0,X1),X1)
        & member(sK1(X0,X1),X0) ) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1])],[f19,f24]) ).

fof(f26,plain,
    ~ equal_set(union(sK0,sK0),sK0),
    inference(cnf_transformation,[],[f21]) ).

fof(f27,plain,
    ! [X2,X0,X1] :
      ( ~ member(X0,union(X1,X2))
      | member(X0,X2)
      | member(X0,X1) ),
    inference(cnf_transformation,[],[f23]) ).

fof(f29,plain,
    ! [X2,X0,X1] :
      ( member(X0,union(X1,X2))
      | ~ member(X0,X1) ),
    inference(cnf_transformation,[],[f23]) ).

fof(f30,plain,
    ! [X0,X1] :
      ( equal_set(X0,X1)
      | ~ subset(X0,X1)
      | ~ subset(X1,X0) ),
    inference(cnf_transformation,[],[f18]) ).

fof(f31,plain,
    ! [X0,X1] :
      ( member(sK1(X0,X1),X0)
      | subset(X0,X1) ),
    inference(cnf_transformation,[],[f25]) ).

fof(f32,plain,
    ! [X0,X1] :
      ( ~ member(sK1(X0,X1),X1)
      | subset(X0,X1) ),
    inference(cnf_transformation,[],[f25]) ).

fof(f34,plain,
    ! [X2,X0,X1] :
      ( ~ member(sK1(X0,union(X1,X2)),X1)
      | subset(X0,union(X1,X2)) ),
    inference(resolution,[],[f32,f29]) ).

fof(f37,plain,
    ( ~ subset(sK0,union(sK0,sK0))
    | ~ subset(union(sK0,sK0),sK0) ),
    inference(resolution,[],[f30,f26]) ).

fof(f40,plain,
    ! [X2,X0,X1] :
      ( member(sK1(union(X0,X1),X2),X1)
      | member(sK1(union(X0,X1),X2),X0)
      | subset(union(X0,X1),X2) ),
    inference(resolution,[],[f27,f31]) ).

fof(f41,plain,
    ! [X0,X1] :
      ( subset(X0,union(X0,X1))
      | subset(X0,union(X0,X1)) ),
    inference(resolution,[],[f34,f31]) ).

fof(f44,plain,
    ! [X0,X1] : subset(X0,union(X0,X1)),
    inference(duplicate_literal_removal,[],[f41]) ).

fof(f45,plain,
    ~ subset(union(sK0,sK0),sK0),
    inference(resolution,[],[f44,f37]) ).

fof(f50,plain,
    ! [X0,X1] :
      ( member(sK1(union(X0,X1),X1),X0)
      | subset(union(X0,X1),X1)
      | subset(union(X0,X1),X1) ),
    inference(resolution,[],[f40,f32]) ).

fof(f56,plain,
    ! [X0,X1] :
      ( member(sK1(union(X0,X1),X1),X0)
      | subset(union(X0,X1),X1) ),
    inference(duplicate_literal_removal,[],[f50]) ).

fof(f58,plain,
    ! [X0] :
      ( subset(union(X0,X0),X0)
      | subset(union(X0,X0),X0) ),
    inference(resolution,[],[f56,f32]) ).

fof(f64,plain,
    ! [X0] : subset(union(X0,X0),X0),
    inference(duplicate_literal_removal,[],[f58]) ).

fof(f73,plain,
    $false,
    inference(resolution,[],[f64,f45]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : SET002+4 : TPTP v9.2.1. Released v2.2.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.33  % Computer   : n007.cluster.edu
% 0.15/0.33  % Model      : x86_64 x86_64
% 0.15/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory     : 8042.1875MB
% 0.15/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit   : 300
% 0.15/0.33  % WCLimit    : 300
% 0.15/0.33  % DateTime   : Fri May  1 00:38:24 EDT 2026
% 0.15/0.33  % CPUTime    : 
% 0.15/0.34  This is a FOF_THM_RFO_SEQ problem
% 0.15/0.34  Running first-order theorem proving
% 0.15/0.34  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.39/0.60  % (30507)Detected formulas, will run a generic FOF schedule.
% 0.45/0.75  % (30509)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=13590362:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.45/0.75  % (30514)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=75440463:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.45/0.75  % (30511)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3618099331:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.45/0.75  % (30512)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=3614157994:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.45/0.75  % (30513)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3903480643:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.45/0.75  % (30515)dis-21_1_sil=8000:lcm=predicate:random_seed=928962255:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.45/0.75  % (30510)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=2258072381:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.45/0.75  % (30512)Refutation not found, incomplete strategy
% 0.45/0.75  % (30512)------------------------------
% 0.45/0.75  % (30512)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.45/0.75  % (30512)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.45/0.75  % (30512)CaDiCaL version: 2.1.3
% 0.45/0.75  % (30512)Termination reason: Refutation not found, incomplete strategy
% 0.45/0.75  % (30512)Time elapsed: 0.0000 s
% 0.45/0.75  % (30512)Peak memory usage: 80 MB
% 0.45/0.75  % (30513)First to succeed.
% 0.45/0.75  % (30515)Also succeeded, but the first one will report.
% 0.45/0.75  % (30513)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-30507"
% 0.45/0.75  % (30514)Also succeeded, but the first one will report.
% 0.45/0.89  % (30512)------------------------------
% 0.45/0.89  % (30512)------------------------------
% 0.45/0.91  % (30513)Refutation found. Thanks to Tanya!
% 0.45/0.91  % SZS status Theorem for theBenchmark
% 0.45/0.91  % SZS output start Proof for theBenchmark
% See solution above
% 0.45/0.91  % (30513)------------------------------
% 0.45/0.91  % (30513)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.45/0.91  % (30513)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.45/0.91  % (30513)CaDiCaL version: 2.1.3
% 0.45/0.91  % (30513)Termination reason: Refutation
% 0.45/0.91  % (30513)Time elapsed: 0.001 s
% 0.45/0.91  % (30513)Peak memory usage: 80 MB
% 0.45/0.91  % (30513)Instructions burned: 2 (million)
% 0.45/0.91  % (30513)------------------------------
% 0.45/0.91  % (30513)------------------------------
% 0.45/0.91  % (30507)Success in time 0.313 s
%------------------------------------------------------------------------------
