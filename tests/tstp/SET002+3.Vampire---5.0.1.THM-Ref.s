
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : SET002+3 : TPTP v9.2.1. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n014.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:58:20 PM UTC 2026

% Result   : Theorem 0.50s 0.96s
% Output   : Refutation 0.50s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    8
%            Number of leaves      :    5
% Syntax   : Number of formulae    :   18 (  11 unt;   0 def)
%            Number of atoms       :   25 (  11 equ)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   20 (  13   ~;   4   |;   0   &)
%                                         (   1 ;   2  =>;   0  )
%            Maximal formula depth :    5 (   3 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   18 (  16   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( subset(X0,X1)
     => union(X0,X1) = X1 ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',subset_union) ).

fof(f6,axiom,
    ! [X0] : subset(X0,X0),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',reflexivity_of_subset) ).

fof(f8,conjecture,
    ! [X0] : union(X0,X0) = X0,
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',prove_idempotency_of_union) ).

fof(f9,negated_conjecture,
    ~ ! [X0] : union(X0,X0) = X0,
    inference(negated_conjecture,[status(cth)],[f8]) ).

fof(f10,plain,
    ! [X0,X1] :
      ( union(X0,X1) = X1
      | ~ subset(X0,X1) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f12,plain,
    ? [X0] : union(X0,X0) != X0,
    inference(ennf_transformation,[],[f9]) ).

fof(f25,plain,
    ( ? [X0] : union(X0,X0) != X0
   => sK2 != union(sK2,sK2) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f26,plain,
    sK2 != union(sK2,sK2),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK2])],[f12,f25]) ).

fof(f27,plain,
    ! [X0,X1] :
      ( union(X0,X1) = X1
      | ~ subset(X0,X1) ),
    inference(cnf_transformation,[],[f10]) ).

fof(f38,plain,
    ! [X0] : subset(X0,X0),
    inference(cnf_transformation,[],[f6]) ).

fof(f43,plain,
    sK2 != union(sK2,sK2),
    inference(cnf_transformation,[],[f26]) ).

fof(f48,plain,
    ! [X0,X1] :
      ( sQ3_eqProxy(X0,X1)
     X0 = X1 ),
    introduced(definition,[new_symbols(naming,[sQ3_eqProxy])],[equality_proxy_definition]) ).

fof(f49,plain,
    ! [X0,X1] :
      ( sQ3_eqProxy(union(X0,X1),X1)
      | ~ subset(X0,X1) ),
    inference(equality_proxy_replacement,[],[f27,f48]) ).

fof(f54,plain,
    ~ sQ3_eqProxy(sK2,union(sK2,sK2)),
    inference(equality_proxy_replacement,[],[f43,f48]) ).

fof(f56,plain,
    ! [X0,X1] :
      ( sQ3_eqProxy(X1,X0)
      | ~ sQ3_eqProxy(X0,X1) ),
    inference(equality_proxy_axiom,[],[f48]) ).

fof(f57,plain,
    ~ sQ3_eqProxy(union(sK2,sK2),sK2),
    inference(resolution,[],[f56,f54]) ).

fof(f59,plain,
    ~ subset(sK2,sK2),
    inference(resolution,[],[f49,f57]) ).

fof(f63,plain,
    $false,
    inference(resolution,[],[f59,f38]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : SET002+3 : TPTP v9.2.1. Released v2.2.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.33  % Computer   : n014.cluster.edu
% 0.15/0.33  % Model      : x86_64 x86_64
% 0.15/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.33  % Memory     : 8042.1875MB
% 0.15/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.33  % CPULimit   : 300
% 0.15/0.33  % WCLimit    : 300
% 0.15/0.33  % DateTime   : Fri May  1 00:39:21 EDT 2026
% 0.15/0.33  % CPUTime    : 
% 0.15/0.35  This is a FOF_THM_RFO_SEQ problem
% 0.15/0.35  Running first-order theorem proving
% 0.15/0.35  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.48/0.65  % (32278)Detected formulas, will run a generic FOF schedule.
% 0.50/0.81  % (32395)dis-21_1_sil=8000:lcm=predicate:random_seed=2753769340:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.50/0.81  % (32387)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=1817269863:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.50/0.81  % (32395)First to succeed.
% 0.50/0.81  % (32395)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-32278"
% 0.50/0.81  % (32394)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=558501481:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.50/0.81  % (32392)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=1272061613:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.50/0.81  % (32386)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=123849012:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.50/0.81  % (32391)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=773442087:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.50/0.81  % (32393)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=310195962:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.50/0.81  % (32392)Refutation not found, incomplete strategy
% 0.50/0.81  % (32392)------------------------------
% 0.50/0.81  % (32392)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.50/0.81  % (32392)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.50/0.81  % (32392)CaDiCaL version: 2.1.3
% 0.50/0.81  % (32392)Termination reason: Refutation not found, incomplete strategy
% 0.50/0.81  % (32392)Time elapsed: 0.001 s
% 0.50/0.81  % (32392)Peak memory usage: 80 MB
% 0.50/0.81  % (32394)Also succeeded, but the first one will report.
% 0.50/0.81  % (32393)Also succeeded, but the first one will report.
% 0.50/0.94  % (32392)------------------------------
% 0.50/0.94  % (32392)------------------------------
% 0.50/0.96  % (32395)Refutation found. Thanks to Tanya!
% 0.50/0.96  % SZS status Theorem for theBenchmark
% 0.50/0.96  % SZS output start Proof for theBenchmark
% See solution above
% 0.50/0.96  % (32395)------------------------------
% 0.50/0.96  % (32395)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.50/0.96  % (32395)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.50/0.96  % (32395)CaDiCaL version: 2.1.3
% 0.50/0.96  % (32395)Termination reason: Refutation
% 0.50/0.96  % (32395)Time elapsed: 0.001 s
% 0.50/0.96  % (32395)Peak memory usage: 81 MB
% 0.50/0.96  % (32395)Instructions burned: 1 (million)
% 0.50/0.96  % (32395)------------------------------
% 0.50/0.96  % (32395)------------------------------
% 0.50/0.96  % (32278)Success in time 0.316 s
%------------------------------------------------------------------------------
