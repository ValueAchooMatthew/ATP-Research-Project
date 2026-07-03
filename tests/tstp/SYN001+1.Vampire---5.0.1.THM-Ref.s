
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : SYN001+1 : TPTP v9.2.1. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n022.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 04:39:06 PM UTC 2026

% Result   : Theorem 0.48s 0.89s
% Output   : Refutation 0.48s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    6
%            Number of leaves      :    1
% Syntax   : Number of formulae    :    9 (   3 unt;   0 def)
%            Number of atoms       :   17 (   0 equ)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :   14 (   6   ~;   4   |;   1   &)
%                                         (   2 ;   0  =>;   0  )
%            Maximal formula depth :    4 (   2 avg)
%            Maximal term depth    :    0 (   0 avg)
%            Number of predicates  :    2 (   1 usr;   2 prp; 0-0 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :    0 (   0   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,conjecture,
    ( p
   p ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',pel2) ).

fof(f2,negated_conjecture,
    ~ ( p
     p ),
    inference(negated_conjecture,[status(cth)],[f1]) ).

fof(f3,plain,
    ( p
   p ),
    inference(ennf_transformation,[],[f2]) ).

fof(f4,plain,
    ( ( ~ p
      | ~ p )
    & ( p
      | p ) ),
    inference(nnf_transformation,[],[f3]) ).

fof(f5,plain,
    ( p
    | p ),
    inference(cnf_transformation,[],[f4]) ).

fof(f6,plain,
    ( ~ p
    | ~ p ),
    inference(cnf_transformation,[],[f4]) ).

fof(f7,plain,
    p,
    inference(duplicate_literal_removal,[],[f5]) ).

fof(f8,plain,
    ~ p,
    inference(duplicate_literal_removal,[],[f6]) ).

fof(f9,plain,
    $false,
    inference(resolution,[],[f8,f7]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.11  % Problem    : SYN001+1 : TPTP v9.2.1. Released v2.0.0.
% 0.00/0.11  % Command    : run_vampire %s %d THM
% 0.13/0.32  % Computer   : n022.cluster.edu
% 0.13/0.32  % Model      : x86_64 x86_64
% 0.13/0.32  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.32  % Memory     : 8042.1875MB
% 0.13/0.32  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.13/0.32  % CPULimit   : 300
% 0.13/0.32  % WCLimit    : 300
% 0.13/0.32  % DateTime   : Fri May  1 05:39:36 EDT 2026
% 0.13/0.32  % CPUTime    : 
% 0.13/0.34  This is a FOF_THM_PRP problem
% 0.13/0.34  Running first-order theorem proving
% 0.13/0.34  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.47/0.63  % (10708)Detected formulas, will run a generic FOF schedule.
% 0.48/0.74  % (10716)dis-21_1_sil=8000:lcm=predicate:random_seed=1312828289:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.48/0.74  % (10716)First to succeed.
% 0.48/0.74  % (10716)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-10708"
% 0.48/0.77  % (10713)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=2935091511:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.48/0.77  % (10712)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=837680118:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.48/0.77  % (10714)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=565553406:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.48/0.77  % (10711)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=1562031165:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.48/0.77  % (10715)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=359697349:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.48/0.77  % (10710)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3864591177:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 0.48/0.77  % (10714)Also succeeded, but the first one will report.
% 0.48/0.77  % (10713)Also succeeded, but the first one will report.
% 0.48/0.77  % (10715)Also succeeded, but the first one will report.
% 0.48/0.89  % (10716)Refutation found. Thanks to Tanya!
% 0.48/0.89  % SZS status Theorem for theBenchmark
% 0.48/0.89  % SZS output start Proof for theBenchmark
% See solution above
% 0.48/0.89  % (10716)------------------------------
% 0.48/0.89  % (10716)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.48/0.89  % (10716)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.48/0.89  % (10716)CaDiCaL version: 2.1.3
% 0.48/0.89  % (10716)Termination reason: Refutation
% 0.48/0.89  % (10716)Time elapsed: 0.0000 s
% 0.48/0.89  % (10716)Peak memory usage: 80 MB
% 0.48/0.89  % (10716)------------------------------
% 0.48/0.89  % (10716)------------------------------
% 0.48/0.89  % (10708)Success in time 0.26 s
%------------------------------------------------------------------------------
