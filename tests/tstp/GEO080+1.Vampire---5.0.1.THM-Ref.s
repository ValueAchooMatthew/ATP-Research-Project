
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : GEO080+1 : TPTP v9.2.1. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n023.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 02:32:31 PM UTC 2026

% Result   : Theorem 0.50s 0.97s
% Output   : Refutation 0.50s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    7
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   17 (   8 unt;   0 def)
%            Number of atoms       :   42 (   0 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   45 (  20   ~;  12   |;   8   &)
%                                         (   2 ;   3  =>;   0  )
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   28 (  23   !;   5   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( part_of(X1,X0)
     ! [X2] :
          ( incident_c(X2,X1)
         => incident_c(X2,X0) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',part_of_defn) ).

fof(f17,conjecture,
    ! [X0] : part_of(X0,X0),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',prove_reflexivity) ).

fof(f18,negated_conjecture,
    ~ ! [X0] : part_of(X0,X0),
    inference(negated_conjecture,[status(cth)],[f17]) ).

fof(f21,plain,
    ? [X0] : ~ part_of(X0,X0),
    inference(ennf_transformation,[],[f18]) ).

fof(f28,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
     ! [X2] :
          ( incident_c(X2,X0)
          | ~ incident_c(X2,X1) ) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f41,plain,
    ( ? [X0] : ~ part_of(X0,X0)
   => ~ part_of(sK0,sK0) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f42,plain,
    ~ part_of(sK0,sK0),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[f21,f41]) ).

fof(f48,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ? [X2] :
            ( ~ incident_c(X2,X0)
            & incident_c(X2,X1) ) )
      & ( ! [X2] :
            ( incident_c(X2,X0)
            | ~ incident_c(X2,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(nnf_transformation,[],[f28]) ).

fof(f49,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ? [X2] :
            ( ~ incident_c(X2,X0)
            & incident_c(X2,X1) ) )
      & ( ! [X3] :
            ( incident_c(X3,X0)
            | ~ incident_c(X3,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(rectify,[],[f48]) ).

fof(f50,plain,
    ! [X0,X1] :
      ( ? [X2] :
          ( ~ incident_c(X2,X0)
          & incident_c(X2,X1) )
     => ( ~ incident_c(sK3(X0,X1),X0)
        & incident_c(sK3(X0,X1),X1) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f51,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ( ~ incident_c(sK3(X0,X1),X0)
          & incident_c(sK3(X0,X1),X1) ) )
      & ( ! [X3] :
            ( incident_c(X3,X0)
            | ~ incident_c(X3,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK3])],[f49,f50]) ).

fof(f80,plain,
    ~ part_of(sK0,sK0),
    inference(cnf_transformation,[],[f42]) ).

fof(f92,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
      | incident_c(sK3(X0,X1),X1) ),
    inference(cnf_transformation,[],[f51]) ).

fof(f93,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
      | ~ incident_c(sK3(X0,X1),X0) ),
    inference(cnf_transformation,[],[f51]) ).

fof(f141,plain,
    incident_c(sK3(sK0,sK0),sK0),
    inference(resolution,[],[f92,f80]) ).

fof(f142,plain,
    ~ incident_c(sK3(sK0,sK0),sK0),
    inference(resolution,[],[f93,f80]) ).

fof(f143,plain,
    $false,
    inference(resolution,[],[f142,f141]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.11  % Problem    : GEO080+1 : TPTP v9.2.1. Released v2.4.0.
% 0.00/0.11  % Command    : run_vampire %s %d THM
% 0.13/0.32  % Computer   : n023.cluster.edu
% 0.13/0.32  % Model      : x86_64 x86_64
% 0.13/0.32  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.32  % Memory     : 8042.1875MB
% 0.13/0.32  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.13/0.32  % CPULimit   : 300
% 0.13/0.32  % WCLimit    : 300
% 0.13/0.32  % DateTime   : Thu Apr 30 14:47:53 EDT 2026
% 0.13/0.32  % CPUTime    : 
% 0.13/0.34  This is a FOF_THM_RFO_SEQ problem
% 0.13/0.34  Running first-order theorem proving
% 0.13/0.34  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.48/0.64  % (28114)Detected formulas, will run a generic FOF schedule.
% 0.49/0.75  % (28135)dis-21_1_sil=8000:lcm=predicate:random_seed=4232838354:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.49/0.76  % (28135)First to succeed.
% 0.49/0.76  % (28135)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-28114"
% 0.49/0.78  % (28129)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=2448314781:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.49/0.79  % (28134)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=643428507:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.49/0.79  % (28132)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=200989199:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.49/0.79  % (28133)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3337969527:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.49/0.79  % (28130)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=2901041366:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.49/0.79  % (28133)Also succeeded, but the first one will report.
% 0.49/0.79  % (28132)Refutation not found, incomplete strategy
% 0.49/0.79  % (28132)------------------------------
% 0.49/0.79  % (28132)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.79  % (28132)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.79  % (28132)CaDiCaL version: 2.1.3
% 0.49/0.79  % (28132)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.79  % (28132)Time elapsed: 0.001 s
% 0.49/0.79  % (28132)Peak memory usage: 80 MB
% 0.49/0.79  % (28132)Instructions burned: 1 (million)
% 0.49/0.79  % (28134)Also succeeded, but the first one will report.
% 0.49/0.83  % (28131)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=1145727600:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.50/0.97  % (28135)Refutation found. Thanks to Tanya!
% 0.50/0.97  % SZS status Theorem for theBenchmark
% 0.50/0.97  % SZS output start Proof for theBenchmark
% See solution above
% 0.50/0.97  % (28135)------------------------------
% 0.50/0.97  % (28135)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.50/0.97  % (28135)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.50/0.97  % (28135)CaDiCaL version: 2.1.3
% 0.50/0.97  % (28135)Termination reason: Refutation
% 0.50/0.97  % (28135)Time elapsed: 0.003 s
% 0.50/0.97  % (28135)Peak memory usage: 80 MB
% 0.50/0.97  % (28135)Instructions burned: 2 (million)
% 0.50/0.97  % (28135)------------------------------
% 0.50/0.97  % (28135)------------------------------
% 0.50/0.97  % (28114)Success in time 0.331 s
%------------------------------------------------------------------------------
