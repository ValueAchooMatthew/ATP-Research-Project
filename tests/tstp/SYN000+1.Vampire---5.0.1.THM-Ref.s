
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : SYN000+1 : TPTP v9.2.1. Released v4.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n024.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 04:39:05 PM UTC 2026

% Result   : Theorem 0.97s 0.70s
% Output   : Refutation 0.97s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    2
% Syntax   : Number of formulae    :    7 (   7 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    3 (   3   ~;   0   |;   0   &)
%                                         (   0 ;   0  =>;   0  )
%            Maximal formula depth :    3 (   2 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-1 aty)
%            Number of functors    :    1 (   1 usr;   1 con; 0-0 aty)
%            Number of variables   :    4 (   2   !;   2   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f8,axiom,
    p(h),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_hypothesis) ).

fof(f9,conjecture,
    ? [X0] : p(X0),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',role_conjecture) ).

fof(f10,negated_conjecture,
    ~ ? [X0] : p(X0),
    inference(negated_conjecture,[status(cth)],[f9]) ).

fof(f15,plain,
    ! [X0] : ~ p(X0),
    inference(ennf_transformation,[],[f10]) ).

fof(f16,plain,
    p(h),
    inference(cnf_transformation,[],[f8]) ).

fof(f17,plain,
    ! [X0] : ~ p(X0),
    inference(cnf_transformation,[],[f15]) ).

fof(f18,plain,
    $false,
    inference(forward_subsumption_resolution,[],[f16,f17]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.06  % Problem    : SYN000+1 : TPTP v9.2.1. Released v4.0.0.
% 0.00/0.06  % Command    : run_vampire %s %d THM
% 0.06/0.24  % Computer   : n024.cluster.edu
% 0.06/0.24  % Model      : x86_64 x86_64
% 0.06/0.24  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.06/0.24  % Memory     : 8042.1875MB
% 0.06/0.24  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.06/0.24  % CPULimit   : 300
% 0.06/0.24  % WCLimit    : 300
% 0.06/0.24  % DateTime   : Fri May  1 00:39:12 EDT 2026
% 0.06/0.25  % CPUTime    : 
% 0.06/0.25  This is a FOF_THM_RFO_SEQ problem
% 0.06/0.25  Running first-order theorem proving
% 0.06/0.26  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.26/0.45  % (28466)Detected formulas, will run a generic FOF schedule.
% 0.69/0.56  % (28474)dis-21_1_sil=8000:lcm=predicate:random_seed=3310082090:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.69/0.56  % (28468)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3393500555:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.69/0.56  % (28473)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=2092382685:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.69/0.56  % (28472)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=207554353:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.69/0.56  % (28470)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=1285578733:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.69/0.56  % (28471)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=1431406626:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.69/0.57  % (28471)Also succeeded, but the first one will report.
% 0.69/0.57  % (28472)First to succeed.
% 0.69/0.57  % (28472)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-28466"
% 0.69/0.57  % (28473)Also succeeded, but the first one will report.
% 0.69/0.57  % (28474)Also succeeded, but the first one will report.
% 0.69/0.58  % (28469)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=1451918157:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.97/0.70  % (28472)Refutation found. Thanks to Tanya!
% 0.97/0.70  % SZS status Theorem for theBenchmark
% 0.97/0.70  % SZS output start Proof for theBenchmark
% See solution above
% 0.97/0.70  % (28472)------------------------------
% 0.97/0.70  % (28472)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.97/0.70  % (28472)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.97/0.70  % (28472)CaDiCaL version: 2.1.3
% 0.97/0.70  % (28472)Termination reason: Refutation
% 0.97/0.70  % (28472)Time elapsed: 0.0000 s
% 0.97/0.70  % (28472)Peak memory usage: 80 MB
% 0.97/0.70  % (28472)------------------------------
% 0.97/0.70  % (28472)------------------------------
% 0.97/0.70  % (28466)Success in time 0.247 s
%------------------------------------------------------------------------------
