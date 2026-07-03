
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : GEO081+1 : TPTP v9.2.1. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n017.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 02:32:31 PM UTC 2026

% Result   : Theorem 1.50s 0.90s
% Output   : Refutation 1.50s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    9
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   25 (   8 unt;   0 def)
%            Number of atoms       :   68 (   0 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   70 (  27   ~;  16   |;  20   &)
%                                         (   2 ;   5  =>;   0  )
%            Maximal formula depth :    8 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :   44 (  32   !;  12   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [X0,X1] :
      ( part_of(X1,X0)
     ! [X2] :
          ( incident_c(X2,X1)
         => incident_c(X2,X0) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',part_of_defn) ).

fof(f17,conjecture,
    ! [X0,X1,X2] :
      ( ( part_of(X0,X1)
        & part_of(X1,X2) )
     => part_of(X0,X2) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',part_of_transitivity) ).

fof(f18,negated_conjecture,
    ~ ! [X0,X1,X2] :
        ( ( part_of(X0,X1)
          & part_of(X1,X2) )
       => part_of(X0,X2) ),
    inference(negated_conjecture,[status(cth)],[f17]) ).

fof(f21,plain,
    ? [X0,X1,X2] :
      ( ~ part_of(X0,X2)
      & part_of(X0,X1)
      & part_of(X1,X2) ),
    inference(ennf_transformation,[],[f18]) ).

fof(f22,plain,
    ? [X0,X1,X2] :
      ( ~ part_of(X0,X2)
      & part_of(X0,X1)
      & part_of(X1,X2) ),
    inference(flattening,[],[f21]) ).

fof(f29,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
     ! [X2] :
          ( incident_c(X2,X0)
          | ~ incident_c(X2,X1) ) ),
    inference(ennf_transformation,[],[f1]) ).

fof(f42,plain,
    ( ? [X0,X1,X2] :
        ( ~ part_of(X0,X2)
        & part_of(X0,X1)
        & part_of(X1,X2) )
   => ( ~ part_of(sK0,sK2)
      & part_of(sK0,sK1)
      & part_of(sK1,sK2) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f43,plain,
    ( ~ part_of(sK0,sK2)
    & part_of(sK0,sK1)
    & part_of(sK1,sK2) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0,sK1,sK2])],[f22,f42]) ).

fof(f49,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ? [X2] :
            ( ~ incident_c(X2,X0)
            & incident_c(X2,X1) ) )
      & ( ! [X2] :
            ( incident_c(X2,X0)
            | ~ incident_c(X2,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(nnf_transformation,[],[f29]) ).

fof(f50,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ? [X2] :
            ( ~ incident_c(X2,X0)
            & incident_c(X2,X1) ) )
      & ( ! [X3] :
            ( incident_c(X3,X0)
            | ~ incident_c(X3,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(rectify,[],[f49]) ).

fof(f51,plain,
    ! [X0,X1] :
      ( ? [X2] :
          ( ~ incident_c(X2,X0)
          & incident_c(X2,X1) )
     => ( ~ incident_c(sK5(X0,X1),X0)
        & incident_c(sK5(X0,X1),X1) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

fof(f52,plain,
    ! [X0,X1] :
      ( ( part_of(X1,X0)
        | ( ~ incident_c(sK5(X0,X1),X0)
          & incident_c(sK5(X0,X1),X1) ) )
      & ( ! [X3] :
            ( incident_c(X3,X0)
            | ~ incident_c(X3,X1) )
        | ~ part_of(X1,X0) ) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK5])],[f50,f51]) ).

fof(f81,plain,
    part_of(sK1,sK2),
    inference(cnf_transformation,[],[f43]) ).

fof(f82,plain,
    part_of(sK0,sK1),
    inference(cnf_transformation,[],[f43]) ).

fof(f83,plain,
    ~ part_of(sK0,sK2),
    inference(cnf_transformation,[],[f43]) ).

fof(f94,plain,
    ! [X3,X0,X1] :
      ( ~ part_of(X1,X0)
      | ~ incident_c(X3,X1)
      | incident_c(X3,X0) ),
    inference(cnf_transformation,[],[f52]) ).

fof(f95,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
      | incident_c(sK5(X0,X1),X1) ),
    inference(cnf_transformation,[],[f52]) ).

fof(f96,plain,
    ! [X0,X1] :
      ( part_of(X1,X0)
      | ~ incident_c(sK5(X0,X1),X0) ),
    inference(cnf_transformation,[],[f52]) ).

fof(f144,plain,
    incident_c(sK5(sK2,sK0),sK0),
    inference(resolution,[],[f95,f83]) ).

fof(f145,plain,
    ~ incident_c(sK5(sK2,sK0),sK2),
    inference(resolution,[],[f96,f83]) ).

fof(f150,plain,
    ! [X0] :
      ( incident_c(X0,sK2)
      | ~ incident_c(X0,sK1) ),
    inference(resolution,[],[f94,f81]) ).

fof(f151,plain,
    ! [X0] :
      ( incident_c(X0,sK1)
      | ~ incident_c(X0,sK0) ),
    inference(resolution,[],[f94,f82]) ).

fof(f154,plain,
    ~ incident_c(sK5(sK2,sK0),sK1),
    inference(resolution,[],[f150,f145]) ).

fof(f160,plain,
    ~ incident_c(sK5(sK2,sK0),sK0),
    inference(resolution,[],[f151,f154]) ).

fof(f164,plain,
    $false,
    inference(resolution,[],[f160,f144]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : GEO081+1 : TPTP v9.2.1. Released v2.4.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.16/0.33  % Computer   : n017.cluster.edu
% 0.16/0.33  % Model      : x86_64 x86_64
% 0.16/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.16/0.33  % Memory     : 8042.1875MB
% 0.16/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.16/0.33  % CPULimit   : 300
% 0.16/0.33  % WCLimit    : 300
% 0.16/0.33  % DateTime   : Thu Apr 30 14:45:27 EDT 2026
% 0.16/0.33  % CPUTime    : 
% 0.16/0.35  This is a FOF_THM_RFO_SEQ problem
% 0.16/0.35  Running first-order theorem proving
% 0.16/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.48/0.63  % (29748)Detected formulas, will run a generic FOF schedule.
% 0.49/0.75  % (29756)dis-21_1_sil=8000:lcm=predicate:random_seed=964234175:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.49/0.75  % (29756)First to succeed.
% 0.49/0.75  % (29756)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-29748"
% 0.49/0.78  % (29752)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=704871948:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.49/0.78  % (29755)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=3446266291:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.49/0.78  % (29750)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=344728254:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.49/0.78  % (29753)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=2017094961:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.49/0.78  % (29754)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=3481302799:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.49/0.78  % (29751)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=264479709:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.49/0.78  % (29753)Refutation not found, incomplete strategy
% 0.49/0.78  % (29753)------------------------------
% 0.49/0.78  % (29753)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.78  % (29753)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.78  % (29753)CaDiCaL version: 2.1.3
% 0.49/0.78  % (29753)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.78  % (29753)Time elapsed: 0.001 s
% 0.49/0.78  % (29753)Peak memory usage: 80 MB
% 0.49/0.78  % (29753)Instructions burned: 1 (million)
% 0.49/0.78  % (29754)Also succeeded, but the first one will report.
% 0.49/0.78  % (29755)Also succeeded, but the first one will report.
% 1.50/0.90  % (29756)Refutation found. Thanks to Tanya!
% 1.50/0.90  % SZS status Theorem for theBenchmark
% 1.50/0.90  % SZS output start Proof for theBenchmark
% See solution above
% 1.50/0.90  % (29756)------------------------------
% 1.50/0.90  % (29756)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 1.50/0.90  % (29756)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 1.50/0.90  % (29756)CaDiCaL version: 2.1.3
% 1.50/0.90  % (29756)Termination reason: Refutation
% 1.50/0.90  % (29756)Time elapsed: 0.002 s
% 1.50/0.90  % (29756)Peak memory usage: 80 MB
% 1.50/0.90  % (29756)Instructions burned: 3 (million)
% 1.50/0.90  % (29756)------------------------------
% 1.50/0.90  % (29756)------------------------------
% 1.50/0.90  % (29748)Success in time 0.266 s
%------------------------------------------------------------------------------
