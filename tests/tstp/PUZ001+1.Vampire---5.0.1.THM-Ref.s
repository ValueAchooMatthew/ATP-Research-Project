
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : PUZ001+1 : TPTP v9.2.1. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n016.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:55:24 PM UTC 2026

% Result   : Theorem 0.73s 0.93s
% Output   : Refutation 0.73s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   10
%            Number of leaves      :   16
% Syntax   : Number of formulae    :   68 (  23 unt;   3 def)
%            Number of atoms       :  126 (  28 equ)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  111 (  53   ~;  42   |;   4   &)
%                                         (   3 ;   9  =>;   0  )
%            Maximal formula depth :    6 (   3 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    9 (   7 usr;   4 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-1 aty)
%            Number of variables   :   38 (   0 sgn  34   !;   4   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ? [X0] :
      ( lives(X0)
      & killed(X0,agatha) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_1) ).

fof(f5,axiom,
    ! [X0] :
      ( lives(X0)
     => ( X0 = agatha
        | X0 = butler
        | X0 = charles ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_3) ).

fof(f6,axiom,
    ! [X0,X1] :
      ( killed(X0,X1)
     => hates(X0,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_4) ).

fof(f7,axiom,
    ! [X0,X1] :
      ( killed(X0,X1)
     => ~ richer(X0,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_5) ).

fof(f8,axiom,
    ! [X0] :
      ( hates(agatha,X0)
     => ~ hates(charles,X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_6) ).

fof(f9,axiom,
    ! [X0] :
      ( X0 != butler
     => hates(agatha,X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_7) ).

fof(f10,axiom,
    ! [X0] :
      ( ~ richer(X0,agatha)
     => hates(butler,X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_8) ).

fof(f11,axiom,
    ! [X0] :
      ( hates(agatha,X0)
     => hates(butler,X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_9) ).

fof(f12,axiom,
    ! [X0] :
    ? [X1] : ~ hates(X0,X1),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_10) ).

fof(f13,axiom,
    agatha != butler,
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55_11) ).

fof(f14,conjecture,
    killed(agatha,agatha),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',pel55) ).

fof(f15,negated_conjecture,
    ~ killed(agatha,agatha),
    inference(negated_conjecture,[status(cth)],[f14]) ).

fof(f16,plain,
    ~ killed(agatha,agatha),
    inference(flattening,[],[f15]) ).

fof(f17,plain,
    ! [X0] :
      ( X0 = agatha
      | X0 = butler
      | X0 = charles
      | ~ lives(X0) ),
    inference(ennf_transformation,[],[f5]) ).

fof(f18,plain,
    ! [X0] :
      ( X0 = agatha
      | X0 = butler
      | X0 = charles
      | ~ lives(X0) ),
    inference(flattening,[],[f17]) ).

fof(f19,plain,
    ! [X0,X1] :
      ( hates(X0,X1)
      | ~ killed(X0,X1) ),
    inference(ennf_transformation,[],[f6]) ).

fof(f20,plain,
    ! [X0,X1] :
      ( ~ richer(X0,X1)
      | ~ killed(X0,X1) ),
    inference(ennf_transformation,[],[f7]) ).

fof(f21,plain,
    ! [X0] :
      ( ~ hates(charles,X0)
      | ~ hates(agatha,X0) ),
    inference(ennf_transformation,[],[f8]) ).

fof(f22,plain,
    ! [X0] :
      ( hates(agatha,X0)
      | butler = X0 ),
    inference(ennf_transformation,[],[f9]) ).

fof(f23,plain,
    ! [X0] :
      ( hates(butler,X0)
      | richer(X0,agatha) ),
    inference(ennf_transformation,[],[f10]) ).

fof(f24,plain,
    ! [X0] :
      ( hates(butler,X0)
      | ~ hates(agatha,X0) ),
    inference(ennf_transformation,[],[f11]) ).

fof(f25,plain,
    ( ? [X0] :
        ( lives(X0)
        & killed(X0,agatha) )
   => ( lives(sK0)
      & killed(sK0,agatha) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f26,plain,
    ( lives(sK0)
    & killed(sK0,agatha) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[f1,f25]) ).

fof(f27,plain,
    ! [X0] :
      ( ? [X1] : ~ hates(X0,X1)
     => ~ hates(X0,sK1(X0)) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f28,plain,
    ! [X0] : ~ hates(X0,sK1(X0)),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1])],[f12,f27]) ).

fof(f29,plain,
    killed(sK0,agatha),
    inference(cnf_transformation,[],[f26]) ).

fof(f30,plain,
    lives(sK0),
    inference(cnf_transformation,[],[f26]) ).

fof(f34,plain,
    ! [X0] :
      ( ~ lives(X0)
      | butler = X0
      | charles = X0
      | agatha = X0 ),
    inference(cnf_transformation,[],[f18]) ).

fof(f35,plain,
    ! [X0,X1] :
      ( hates(X0,X1)
      | ~ killed(X0,X1) ),
    inference(cnf_transformation,[],[f19]) ).

fof(f36,plain,
    ! [X0,X1] :
      ( ~ richer(X0,X1)
      | ~ killed(X0,X1) ),
    inference(cnf_transformation,[],[f20]) ).

fof(f37,plain,
    ! [X0] :
      ( ~ hates(charles,X0)
      | ~ hates(agatha,X0) ),
    inference(cnf_transformation,[],[f21]) ).

fof(f38,plain,
    ! [X0] :
      ( hates(agatha,X0)
      | butler = X0 ),
    inference(cnf_transformation,[],[f22]) ).

fof(f39,plain,
    ! [X0] :
      ( richer(X0,agatha)
      | hates(butler,X0) ),
    inference(cnf_transformation,[],[f23]) ).

fof(f40,plain,
    ! [X0] :
      ( hates(butler,X0)
      | ~ hates(agatha,X0) ),
    inference(cnf_transformation,[],[f24]) ).

fof(f41,plain,
    ! [X0] : ~ hates(X0,sK1(X0)),
    inference(cnf_transformation,[],[f28]) ).

fof(f42,plain,
    agatha != butler,
    inference(cnf_transformation,[],[f13]) ).

fof(f43,plain,
    ~ killed(agatha,agatha),
    inference(cnf_transformation,[],[f16]) ).

fof(f45,plain,
    ! [X0] :
      ( ~ killed(charles,X0)
      | ~ hates(agatha,X0) ),
    inference(resolution,[],[f37,f35]) ).

fof(f47,plain,
    ! [X0] :
      ( hates(butler,X0)
      | ~ killed(X0,agatha) ),
    inference(resolution,[],[f39,f36]) ).

fof(f50,plain,
    ~ hates(agatha,sK1(butler)),
    inference(resolution,[],[f40,f41]) ).

fof(f54,plain,
    ( butler = sK0
    | charles = sK0
    | agatha = sK0 ),
    inference(resolution,[],[f34,f30]) ).

fof(f56,definition,
    ( spl2_1
   agatha = sK0 ),
    introduced(definition,[new_symbols(naming,[spl2_1])],[avatar_definition]) ).

fof(f58,plain,
    ( agatha = sK0
    | ~ spl2_1 ),
    inference(avatar_component_clause,[],[f56]) ).

fof(f60,definition,
    ( spl2_2
   charles = sK0 ),
    introduced(definition,[new_symbols(naming,[spl2_2])],[avatar_definition]) ).

fof(f62,plain,
    ( charles = sK0
    | ~ spl2_2 ),
    inference(avatar_component_clause,[],[f60]) ).

fof(f64,definition,
    ( spl2_3
   butler = sK0 ),
    introduced(definition,[new_symbols(naming,[spl2_3])],[avatar_definition]) ).

fof(f66,plain,
    ( butler = sK0
    | ~ spl2_3 ),
    inference(avatar_component_clause,[],[f64]) ).

fof(f67,plain,
    ( spl2_1
    | spl2_2
    | spl2_3 ),
    inference(avatar_split_clause,[],[f54,f64,f60,f56]) ).

fof(f68,plain,
    ( killed(charles,agatha)
    | ~ spl2_2 ),
    inference(superposition,[],[f29,f62]) ).

fof(f70,plain,
    ( ~ hates(agatha,agatha)
    | ~ spl2_2 ),
    inference(resolution,[],[f68,f45]) ).

fof(f71,plain,
    ~ killed(sK1(butler),agatha),
    inference(resolution,[],[f47,f41]) ).

fof(f74,plain,
    butler = sK1(butler),
    inference(resolution,[],[f50,f38]) ).

fof(f76,plain,
    ( agatha = butler
    | ~ spl2_2 ),
    inference(resolution,[],[f70,f38]) ).

fof(f78,plain,
    ( $false
    | ~ spl2_2 ),
    inference(forward_subsumption_resolution,[],[f76,f42]) ).

fof(f79,plain,
    ~ spl2_2,
    inference(avatar_contradiction_clause,[],[f78]) ).

fof(f81,plain,
    ( killed(butler,agatha)
    | ~ spl2_3 ),
    inference(superposition,[],[f29,f66]) ).

fof(f83,plain,
    ~ killed(butler,agatha),
    inference(superposition,[],[f71,f74]) ).

fof(f87,plain,
    ( $false
    | ~ spl2_3 ),
    inference(forward_subsumption_resolution,[],[f83,f81]) ).

fof(f88,plain,
    ~ spl2_3,
    inference(avatar_contradiction_clause,[],[f87]) ).

fof(f90,plain,
    ( killed(agatha,agatha)
    | ~ spl2_1 ),
    inference(superposition,[],[f29,f58]) ).

fof(f92,plain,
    ( $false
    | ~ spl2_1 ),
    inference(forward_subsumption_resolution,[],[f90,f43]) ).

fof(f93,plain,
    ~ spl2_1,
    inference(avatar_contradiction_clause,[],[f92]) ).

cnf(s1,plain,
    ( spl2_1
    | spl2_2
    | spl2_3 ),
    inference(sat_conversion,[],[f67]) ).

cnf(s2,plain,
    ~ spl2_2,
    inference(sat_conversion,[],[f79]) ).

cnf(s3,plain,
    ~ spl2_3,
    inference(sat_conversion,[],[f88]) ).

cnf(s4,plain,
    ~ spl2_1,
    inference(sat_conversion,[],[f93]) ).

cnf(s5,plain,
    $false,
    inference(rat,[],[s1,s3,s2,s4]) ).

fof(f94,plain,
    $false,
    inference(avatar_sat_refutation,[],[s5]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : PUZ001+1 : TPTP v9.2.1. Released v2.0.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.33  % Computer   : n016.cluster.edu
% 0.15/0.33  % Model      : x86_64 x86_64
% 0.15/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory     : 8042.1875MB
% 0.15/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit   : 300
% 0.15/0.33  % WCLimit    : 300
% 0.15/0.33  % DateTime   : Fri May  1 00:01:21 EDT 2026
% 0.15/0.33  % CPUTime    : 
% 0.15/0.35  This is a FOF_THM_RFO_SEQ problem
% 0.20/0.35  Running first-order theorem proving
% 0.20/0.35  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.47/0.64  % (12530)Detected formulas, will run a generic FOF schedule.
% 0.49/0.76  % (12538)dis-21_1_sil=8000:lcm=predicate:random_seed=3769344027:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.49/0.76  % (12538)Refutation not found, incomplete strategy
% 0.49/0.76  % (12538)------------------------------
% 0.49/0.76  % (12538)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.76  % (12538)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.76  % (12538)CaDiCaL version: 2.1.3
% 0.49/0.76  % (12538)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.76  % (12538)Time elapsed: 0.001 s
% 0.49/0.76  % (12538)Peak memory usage: 80 MB
% 0.49/0.79  % (12532)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=4103764613:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.49/0.79  % (12533)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=2730666500:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.49/0.79  % (12536)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=859075525:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.49/0.79  % (12537)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=932730690:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.49/0.79  % (12534)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=2481613201:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.49/0.79  % (12535)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=3150477323:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.49/0.79  % (12535)Refutation not found, incomplete strategy
% 0.49/0.79  % (12535)------------------------------
% 0.49/0.79  % (12535)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.79  % (12535)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.79  % (12535)CaDiCaL version: 2.1.3
% 0.49/0.79  % (12535)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.79  % (12535)Time elapsed: 0.0000 s
% 0.49/0.79  % (12535)Peak memory usage: 80 MB
% 0.49/0.79  % (12536)Refutation not found, incomplete strategy
% 0.49/0.79  % (12536)------------------------------
% 0.49/0.79  % (12536)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.79  % (12536)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.79  % (12536)CaDiCaL version: 2.1.3
% 0.49/0.79  % (12536)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.79  % (12536)Time elapsed: 0.0000 s
% 0.49/0.79  % (12536)Peak memory usage: 80 MB
% 0.49/0.79  % (12537)First to succeed.
% 0.49/0.79  % (12537)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-12530"
% 0.49/0.89  % (12538)------------------------------
% 0.49/0.89  % (12538)------------------------------
% 0.73/0.92  % (12535)------------------------------
% 0.73/0.92  % (12535)------------------------------
% 0.73/0.92  % (12536)------------------------------
% 0.73/0.92  % (12536)------------------------------
% 0.73/0.93  % (12537)Refutation found. Thanks to Tanya!
% 0.73/0.93  % SZS status Theorem for theBenchmark
% 0.73/0.93  % SZS output start Proof for theBenchmark
% See solution above
% 0.73/0.93  % (12537)------------------------------
% 0.73/0.93  % (12537)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.73/0.93  % (12537)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.73/0.93  % (12537)CaDiCaL version: 2.1.3
% 0.73/0.93  % (12537)Termination reason: Refutation
% 0.73/0.93  % (12537)Time elapsed: 0.002 s
% 0.73/0.93  % (12537)Peak memory usage: 81 MB
% 0.73/0.93  % (12537)Instructions burned: 3 (million)
% 0.73/0.93  % (12537)------------------------------
% 0.73/0.93  % (12537)------------------------------
% 0.73/0.93  % (12530)Success in time 0.293 s
%------------------------------------------------------------------------------
