
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : AGT001+2 : TPTP v9.2.1. Bugfixed v3.1.0.
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
% DateTime : Fri May  1 02:10:16 PM UTC 2026

% Result   : Theorem 0.54s 0.98s
% Output   : Refutation 0.54s
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

<A NAME="f923"></A>fof(f923,conjecture,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',query_1) ).

<A NAME="f924"></A>fof(f924,negated_conjecture,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(negated_conjecture,[status(cth)],[<A HREF="#f923">f923</A>]) ).

<A NAME="f925"></A>fof(f925,plain,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(flattening,[],[<A HREF="#f924">f924</A>]) ).

<A NAME="f962"></A>fof(f962,plain,
    ~ accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(cnf_transformation,[],[<A HREF="#f925">f925</A>]) ).

<A NAME="f1096"></A>fof(f1096,plain,
    accept_team(countryamedicalorganization,countryacivilorganization,towna,n6),
    inference(cnf_transformation,[],[<A HREF="#f47">f47</A>]) ).

<A NAME="f1607"></A>fof(f1607,plain,
    $false,
    inference(resolution,[],[<A HREF="#f1096">f1096</A>,<A HREF="#f962">f962</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.12/0.12  % Problem    : AGT001+2 : TPTP v9.2.1. Bugfixed v3.1.0.
% 0.12/0.12  % Command    : run_vampire %s %d THM
% 0.15/0.34  % Computer   : n020.cluster.edu
% 0.15/0.34  % Model      : x86_64 x86_64
% 0.15/0.34  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.15/0.34  % Memory     : 8042.1875MB
% 0.15/0.34  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.15/0.34  % CPULimit   : 300
% 0.15/0.34  % WCLimit    : 300
% 0.15/0.34  % DateTime   : Fri May  1 08:27:49 EDT 2026
% 0.15/0.34  % CPUTime    : 
% 0.20/0.36  This is a FOF_THM_RFO_SEQ problem
% 0.20/0.36  Running first-order theorem proving
% 0.20/0.36  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.52/0.71  % (25573)Detected formulas, will run a generic FOF schedule.
% 0.54/0.82  % (25581)dis-21_1_sil=8000:lcm=predicate:random_seed=1628120733:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.54/0.83  % (25581)First to succeed.
% 0.54/0.83  % (25581)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-25573"
% 0.54/0.85  % (25580)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=3653129382:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.54/0.85  % (25578)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=141773894:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.54/0.85  % (25576)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=3365346576:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.54/0.85  % (25575)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=3743339531:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.54/0.85  % (25577)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3115517102:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.54/0.85  % (25579)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=2467967820:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.54/0.85  % (25578)Also succeeded, but the first one will report.
% 0.54/0.85  % (25579)Also succeeded, but the first one will report.
% 0.54/0.86  % (25580)Also succeeded, but the first one will report.
% 0.54/0.98  % (25581)Refutation found. Thanks to Tanya!
% 0.54/0.98  % SZS status Theorem for theBenchmark
% 0.54/0.98  % SZS output start Proof for theBenchmark
% See solution above
% 0.54/0.98  % (25581)------------------------------
% 0.54/0.98  % (25581)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.54/0.98  % (25581)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.54/0.98  % (25581)CaDiCaL version: 2.1.3
% 0.54/0.98  % (25581)Termination reason: Refutation
% 0.54/0.98  % (25581)Time elapsed: 0.006 s
% 0.54/0.98  % (25581)Peak memory usage: 81 MB
% 0.54/0.98  % (25581)Instructions burned: 18 (million)
% 0.54/0.98  % (25581)------------------------------
% 0.54/0.98  % (25581)------------------------------
% 0.54/0.98  % (25573)Success in time 0.289 s
%------------------------------------------------------------------------------
