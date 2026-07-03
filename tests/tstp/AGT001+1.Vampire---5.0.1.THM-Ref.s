
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : AGT001+1 : TPTP v9.2.1. Bugfixed v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n005.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 02:10:16 PM UTC 2026

% Result   : Theorem 0.72s 0.91s
% Output   : Refutation 0.72s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    4
%            Number of leaves      :    2
% Syntax   : Number of formulae    :    7 (   7 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    3 (   3   ~;   0   |;   0   &)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    2 (   1 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-4 aty)
%            Number of functors    :    4 (   4 usr;   4 con; 0-0 aty)
%            Number of variables   :    0 (   0   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="f47"></A>fof(f47,axiom,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',event_27) ).

<A NAME="f556"></A>fof(f556,conjecture,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',query_1) ).

<A NAME="f557"></A>fof(f557,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(negated_conjecture,[status(cth)],[<A HREF="#f556">f556</A>]) ).

<A NAME="f558"></A>fof(f558,plain,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(flattening,[],[<A HREF="#f557">f557</A>]) ).

<A NAME="f585"></A>fof(f585,plain,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(cnf_transformation,[],[<A HREF="#f558">f558</A>]) ).

<A NAME="f726"></A>fof(f726,plain,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(cnf_transformation,[],[<A HREF="#f47">f47</A>]) ).

<A NAME="f877"></A>fof(f877,plain,
    $false,
    inference(resolution,[],[<A HREF="#f726">f726</A>,<A HREF="#f585">f585</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : AGT001+1 : TPTP v9.2.1. Bugfixed v3.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.14/0.32  % Computer   : n005.cluster.edu
% 0.14/0.32  % Model      : x86_64 x86_64
% 0.14/0.32  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.32  % Memory     : 8042.1875MB
% 0.14/0.32  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.14/0.32  % CPULimit   : 300
% 0.14/0.32  % WCLimit    : 300
% 0.14/0.32  % DateTime   : Fri May  1 08:27:30 EDT 2026
% 0.14/0.33  % CPUTime    : 
% 0.14/0.34  This is a FOF_THM_RFO_SEQ problem
% 0.14/0.34  Running first-order theorem proving
% 0.14/0.35  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.46/0.64  % (18778)Detected formulas, will run a generic FOF schedule.
% 0.48/0.75  % (18786)dis-21_1_sil=8000:lcm=predicate:random_seed=1417916195:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.48/0.76  % (18786)First to succeed.
% 0.48/0.76  % (18786)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-18778"
% 0.48/0.77  % (18781)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=747492258:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.48/0.77  % (18784)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=205130597:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.48/0.77  % (18783)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=1237296985:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.48/0.77  % (18782)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=2413675175:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.48/0.77  % (18785)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=2102876573:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.48/0.78  % (18783)Also succeeded, but the first one will report.
% 0.48/0.78  % (18784)Also succeeded, but the first one will report.
% 0.48/0.78  % (18785)Also succeeded, but the first one will report.
% 0.48/0.81  % (18780)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=2596889945:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.72/0.91  % (18786)Refutation found. Thanks to Tanya!
% 0.72/0.91  % SZS status Theorem for theBenchmark
% 0.72/0.91  % SZS output start Proof for theBenchmark
% See solution above
% 0.72/0.91  % (18786)------------------------------
% 0.72/0.91  % (18786)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.72/0.91  % (18786)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.72/0.91  % (18786)CaDiCaL version: 2.1.3
% 0.72/0.91  % (18786)Termination reason: Refutation
% 0.72/0.91  % (18786)Time elapsed: 0.004 s
% 0.72/0.91  % (18786)Peak memory usage: 81 MB
% 0.72/0.91  % (18786)Instructions burned: 11 (million)
% 0.72/0.91  % (18786)------------------------------
% 0.72/0.91  % (18786)------------------------------
% 0.72/0.91  % (18778)Success in time 0.273 s
%------------------------------------------------------------------------------
