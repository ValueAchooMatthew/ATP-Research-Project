
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : NUM291+1 : TPTP v9.2.1. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n006.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:47:01 PM UTC 2026

% Result   : Theorem 0.49s 0.92s
% Output   : Refutation 0.49s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   10
%            Number of leaves      :    8
% Syntax   : Number of formulae    :   35 (  17 unt;   2 def)
%            Number of atoms       :   71 (   5 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   70 (  34   ~;  25   |;   7   &)
%                                         (   3 ;   1  =>;   0  )
%            Maximal formula depth :    9 (   3 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    7 (   5 usr;   3 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-1 aty)
%            Number of variables   :   26 (   0 sgn  26   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f3,axiom,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',rdn2) ).

fof(f4,axiom,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',rdn3) ).

fof(f268,axiom,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',rdn_positive_less23) ).

fof(f281,axiom,
    ! [X0,X1,X2,X3] :
      ( ( rdn_translate(X0,rdn_pos(X2))
        & rdn_translate(X1,rdn_pos(X3))
        & rdn_positive_less(X2,X3) )
     => less(X0,X1) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',less_entry_point_pos_pos) ).

fof(f284,axiom,
    ! [X0,X1] :
      ( less(X0,X1)
     ( ~ less(X1,X0)
        & X1 != X0 ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',less_property) ).

fof(f402,conjecture,
    ~ less(n3,n2),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',n3_not_less_n2) ).

fof(f403,negated_conjecture,
    ~ ~ less(n3,n2),
    inference(negated_conjecture,[status(cth)],[f402]) ).

fof(f404,plain,
    less(n3,n2),
    inference(flattening,[],[f403]) ).

fof(f415,plain,
    ! [X0,X1,X2,X3] :
      ( less(X0,X1)
      | ~ rdn_translate(X0,rdn_pos(X2))
      | ~ rdn_translate(X1,rdn_pos(X3))
      | ~ rdn_positive_less(X2,X3) ),
    inference(ennf_transformation,[],[f281]) ).

fof(f416,plain,
    ! [X0,X1,X2,X3] :
      ( less(X0,X1)
      | ~ rdn_translate(X0,rdn_pos(X2))
      | ~ rdn_translate(X1,rdn_pos(X3))
      | ~ rdn_positive_less(X2,X3) ),
    inference(flattening,[],[f415]) ).

fof(f451,plain,
    ! [X0,X1] :
      ( ( less(X0,X1)
        | less(X1,X0)
        | X0 = X1 )
      & ( ( ~ less(X1,X0)
          & X1 != X0 )
        | ~ less(X0,X1) ) ),
    inference(nnf_transformation,[],[f284]) ).

fof(f452,plain,
    ! [X0,X1] :
      ( ( less(X0,X1)
        | less(X1,X0)
        | X0 = X1 )
      & ( ( ~ less(X1,X0)
          & X1 != X0 )
        | ~ less(X0,X1) ) ),
    inference(flattening,[],[f451]) ).

fof(f453,plain,
    less(n3,n2),
    inference(cnf_transformation,[],[f404]) ).

fof(f481,plain,
    rdn_translate(n2,rdn_pos(rdnn(n2))),
    inference(cnf_transformation,[],[f3]) ).

fof(f485,plain,
    ! [X0,X1] :
      ( ~ less(X1,X0)
      | ~ less(X0,X1) ),
    inference(cnf_transformation,[],[f452]) ).

fof(f489,plain,
    ! [X2,X3,X0,X1] :
      ( less(X0,X1)
      | ~ rdn_translate(X0,rdn_pos(X2))
      | ~ rdn_translate(X1,rdn_pos(X3))
      | ~ rdn_positive_less(X2,X3) ),
    inference(cnf_transformation,[],[f416]) ).

fof(f512,plain,
    rdn_positive_less(rdnn(n2),rdnn(n3)),
    inference(cnf_transformation,[],[f268]) ).

fof(f513,plain,
    rdn_translate(n3,rdn_pos(rdnn(n3))),
    inference(cnf_transformation,[],[f4]) ).

fof(f609,plain,
    ~ less(n2,n3),
    inference(resolution,[],[f485,f453]) ).

fof(f641,plain,
    ! [X0,X1] :
      ( ~ rdn_positive_less(X0,X1)
      | ~ rdn_translate(n3,rdn_pos(X1))
      | ~ rdn_translate(n2,rdn_pos(X0)) ),
    inference(resolution,[],[f489,f609]) ).

fof(f644,plain,
    ( ~ rdn_translate(n3,rdn_pos(rdnn(n3)))
    | ~ rdn_translate(n2,rdn_pos(rdnn(n2))) ),
    inference(resolution,[],[f641,f512]) ).

fof(f695,definition,
    ( spl1_15
   rdn_translate(n2,rdn_pos(rdnn(n2))) ),
    introduced(definition,[new_symbols(naming,[spl1_15])],[avatar_definition]) ).

fof(f696,plain,
    ( ~ rdn_translate(n2,rdn_pos(rdnn(n2)))
    | spl1_15 ),
    inference(avatar_component_clause,[],[f695]) ).

fof(f698,definition,
    ( spl1_16
   rdn_translate(n3,rdn_pos(rdnn(n3))) ),
    introduced(definition,[new_symbols(naming,[spl1_16])],[avatar_definition]) ).

fof(f699,plain,
    ( ~ rdn_translate(n3,rdn_pos(rdnn(n3)))
    | spl1_16 ),
    inference(avatar_component_clause,[],[f698]) ).

fof(f700,plain,
    ( ~ spl1_15
    | ~ spl1_16 ),
    inference(avatar_split_clause,[],[f644,f698,f695]) ).

fof(f716,plain,
    ( $false
    | spl1_15 ),
    inference(resolution,[],[f696,f481]) ).

fof(f717,plain,
    spl1_15,
    inference(avatar_contradiction_clause,[],[f716]) ).

fof(f718,plain,
    ( $false
    | spl1_16 ),
    inference(resolution,[],[f699,f513]) ).

fof(f719,plain,
    spl1_16,
    inference(avatar_contradiction_clause,[],[f718]) ).

cnf(s8,plain,
    ( ~ spl1_15
    | ~ spl1_16 ),
    inference(sat_conversion,[],[f700]) ).

cnf(s11,plain,
    spl1_15,
    inference(sat_conversion,[],[f717]) ).

cnf(s12,plain,
    spl1_16,
    inference(sat_conversion,[],[f719]) ).

cnf(s13,plain,
    $false,
    inference(rat,[],[s8,s12,s11]) ).

fof(f720,plain,
    $false,
    inference(avatar_sat_refutation,[],[s13]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : NUM291+1 : TPTP v9.2.1. Released v3.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.16/0.33  % Computer   : n006.cluster.edu
% 0.16/0.33  % Model      : x86_64 x86_64
% 0.16/0.33  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.16/0.33  % Memory     : 8042.1875MB
% 0.16/0.33  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.16/0.33  % CPULimit   : 300
% 0.16/0.33  % WCLimit    : 300
% 0.16/0.33  % DateTime   : Thu Apr 30 22:11:46 EDT 2026
% 0.16/0.33  % CPUTime    : 
% 0.16/0.35  This is a FOF_THM_RFO_SEQ problem
% 0.16/0.35  Running first-order theorem proving
% 0.16/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.47/0.64  % (30751)Detected formulas, will run a generic FOF schedule.
% 0.49/0.75  % (30759)dis-21_1_sil=8000:lcm=predicate:random_seed=3947331653:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.49/0.76  % (30759)First to succeed.
% 0.49/0.76  % (30759)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-30751"
% 0.49/0.78  % (30757)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=4168379795:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.49/0.78  % (30756)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=583029079:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.49/0.78  % (30755)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=1188271400:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.49/0.78  % (30753)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=4134321593:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.49/0.78  % (30758)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=1758695524:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.49/0.78  % (30754)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=4086848956:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.49/0.78  % (30756)Refutation not found, incomplete strategy
% 0.49/0.78  % (30756)------------------------------
% 0.49/0.78  % (30756)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.78  % (30756)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.78  % (30756)CaDiCaL version: 2.1.3
% 0.49/0.78  % (30756)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.78  % (30756)Time elapsed: 0.001 s
% 0.49/0.78  % (30756)Peak memory usage: 81 MB
% 0.49/0.78  % (30756)Instructions burned: 1 (million)
% 0.49/0.78  % (30757)Refutation not found, incomplete strategy
% 0.49/0.78  % (30757)------------------------------
% 0.49/0.78  % (30757)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.78  % (30757)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.78  % (30757)CaDiCaL version: 2.1.3
% 0.49/0.78  % (30757)Termination reason: Refutation not found, incomplete strategy
% 0.49/0.78  % (30757)Time elapsed: 0.001 s
% 0.49/0.78  % (30757)Peak memory usage: 81 MB
% 0.49/0.78  % (30757)Instructions burned: 2 (million)
% 0.49/0.79  % (30758)Also succeeded, but the first one will report.
% 0.49/0.92  % (30759)Refutation found. Thanks to Tanya!
% 0.49/0.92  % SZS status Theorem for theBenchmark
% 0.49/0.92  % SZS output start Proof for theBenchmark
% See solution above
% 0.49/0.92  % (30759)------------------------------
% 0.49/0.92  % (30759)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.49/0.92  % (30759)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.49/0.92  % (30759)CaDiCaL version: 2.1.3
% 0.49/0.92  % (30759)Termination reason: Refutation
% 0.49/0.92  % (30759)Time elapsed: 0.004 s
% 0.49/0.92  % (30759)Peak memory usage: 81 MB
% 0.49/0.92  % (30759)Instructions burned: 12 (million)
% 0.49/0.92  % (30759)------------------------------
% 0.49/0.92  % (30759)------------------------------
% 0.49/0.92  % (30751)Success in time 0.28 s
%------------------------------------------------------------------------------
