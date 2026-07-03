
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : KRS130+1 : TPTP v9.2.1. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n012.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:33:58 PM UTC 2026

% Result   : Theorem 1.16s 0.71s
% Output   : Refutation 1.16s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   13
%            Number of leaves      :   15
% Syntax   : Number of formulae    :   67 (  15 unt;   6 def)
%            Number of atoms       :  191 (   0 equ)
%            Maximal formula atoms :   10 (   2 avg)
%            Number of connectives :  206 (  82   ~;  84   |;  19   &)
%                                         (  13 <=>;   6  =>;   0  <=;   2 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   13 (  12 usr;   7 prp; 0-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-1 aty)
%            Number of variables   :   40 (   0 sgn  27   !;  13   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="f1"></A>fof(f1,axiom,
    ! [X0] :
      ( cowlThing(X0)
      & ~ cowlNothing(X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="f2"></A>fof(f2,axiom,
    ! [X0] :
      ( xsd_string(X0)
    <=> ~ xsd_integer(X0) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="f3"></A>fof(f3,axiom,
    ! [X0] :
      ( cNothing(X0)
     => ~ ? [X1] : rp(X0,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_2) ).

<A NAME="f4"></A>fof(f4,axiom,
    ! [X0] :
      ( cNothing(X0)
     => ? [X1] : rp(X0,X1) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="f5"></A>fof(f5,conjecture,
    ( ! [X0] :
        ( cowlThing(X0)
        & ~ cowlNothing(X0) )
    & ! [X0] :
        ( xsd_string(X0)
      <=> ~ xsd_integer(X0) )
    & ! [X0] :
        ( cNothing(X0)
      <=> cowlNothing(X0) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="f6"></A>fof(f6,negated_conjecture,
    ~ ( ! [X0] :
          ( cowlThing(X0)
          & ~ cowlNothing(X0) )
      & ! [X0] :
          ( xsd_string(X0)
        <=> ~ xsd_integer(X0) )
      & ! [X0] :
          ( cNothing(X0)
        <=> cowlNothing(X0) ) ),
    inference(negated_conjecture,[status(cth)],[<A HREF="#f5">f5</A>]) ).

<A NAME="f7"></A>fof(f7,plain,
    ~ ( ! [X0] :
          ( cowlThing(X0)
          & ~ cowlNothing(X0) )
      & ! [X1] :
          ( xsd_string(X1)
        <=> ~ xsd_integer(X1) )
      & ! [X2] :
          ( cNothing(X2)
        <=> cowlNothing(X2) ) ),
    inference(rectify,[],[<A HREF="#f6">f6</A>]) ).

<A NAME="f8"></A>fof(f8,plain,
    ! [X0] :
      ( ! [X1] : ~ rp(X0,X1)
      | ~ cNothing(X0) ),
    inference(ennf_transformation,[],[<A HREF="#f3">f3</A>]) ).

<A NAME="f9"></A>fof(f9,plain,
    ! [X0] :
      ( ? [X1] : rp(X0,X1)
      | ~ cNothing(X0) ),
    inference(ennf_transformation,[],[<A HREF="#f4">f4</A>]) ).

<A NAME="f10"></A>fof(f10,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
    | ? [X1] :
        ( xsd_string(X1)
      <~> ~ xsd_integer(X1) )
    | ? [X2] :
        ( cNothing(X2)
      <~> cowlNothing(X2) ) ),
    inference(ennf_transformation,[],[<A HREF="#f7">f7</A>]) ).

<A NAME="f11"></A>fof(f11,plain,
    ! [X0] :
      ( ( xsd_string(X0)
        | xsd_integer(X0) )
      & ( ~ xsd_integer(X0)
        | ~ xsd_string(X0) ) ),
    inference(nnf_transformation,[],[<A HREF="#f2">f2</A>]) ).

<A NAME="f12"></A>fof(f12,plain,
    ! [X0] :
      ( ? [X1] : rp(X0,X1)
     => rp(X0,sK0(X0)) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f13"></A>fof(f13,plain,
    ! [X0] :
      ( rp(X0,sK0(X0))
      | ~ cNothing(X0) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[<A HREF="#f9">f9</A>,<A HREF="#f12">f12</A>]) ).

<A NAME="f14"></A>fof(f14,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
    | ? [X1] :
        ( ( xsd_integer(X1)
          | ~ xsd_string(X1) )
        & ( ~ xsd_integer(X1)
          | xsd_string(X1) ) )
    | ? [X2] :
        ( ( ~ cowlNothing(X2)
          | ~ cNothing(X2) )
        & ( cowlNothing(X2)
          | cNothing(X2) ) ) ),
    inference(nnf_transformation,[],[<A HREF="#f10">f10</A>]) ).

<A NAME="f15"></A>fof(f15,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
   => ( ~ cowlThing(sK1)
      | cowlNothing(sK1) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f16"></A>fof(f16,plain,
    ( ? [X1] :
        ( ( xsd_integer(X1)
          | ~ xsd_string(X1) )
        & ( ~ xsd_integer(X1)
          | xsd_string(X1) ) )
   => ( ( xsd_integer(sK2)
        | ~ xsd_string(sK2) )
      & ( ~ xsd_integer(sK2)
        | xsd_string(sK2) ) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f17"></A>fof(f17,plain,
    ( ? [X2] :
        ( ( ~ cowlNothing(X2)
          | ~ cNothing(X2) )
        & ( cowlNothing(X2)
          | cNothing(X2) ) )
   => ( ( ~ cowlNothing(sK3)
        | ~ cNothing(sK3) )
      & ( cowlNothing(sK3)
        | cNothing(sK3) ) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f18"></A>fof(f18,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | ( ( xsd_integer(sK2)
        | ~ xsd_string(sK2) )
      & ( ~ xsd_integer(sK2)
        | xsd_string(sK2) ) )
    | ( ( ~ cowlNothing(sK3)
        | ~ cNothing(sK3) )
      & ( cowlNothing(sK3)
        | cNothing(sK3) ) ) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1,sK2,sK3])],[<A HREF="#f14">f14</A>,<A HREF="#f17">f17</A>,<A HREF="#f16">f16</A>,<A HREF="#f15">f15</A>]) ).

<A NAME="f19"></A>fof(f19,plain,
    ! [X0] : ~ cowlNothing(X0),
    inference(cnf_transformation,[],[<A HREF="#f1">f1</A>]) ).

<A NAME="f20"></A>fof(f20,plain,
    ! [X0] : cowlThing(X0),
    inference(cnf_transformation,[],[<A HREF="#f1">f1</A>]) ).

<A NAME="f21"></A>fof(f21,plain,
    ! [X0] :
      ( ~ xsd_integer(X0)
      | ~ xsd_string(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f11">f11</A>]) ).

<A NAME="f22"></A>fof(f22,plain,
    ! [X0] :
      ( xsd_string(X0)
      | xsd_integer(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f11">f11</A>]) ).

<A NAME="f23"></A>fof(f23,plain,
    ! [X0,X1] :
      ( ~ rp(X0,X1)
      | ~ cNothing(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f8">f8</A>]) ).

<A NAME="f24"></A>fof(f24,plain,
    ! [X0] :
      ( rp(X0,sK0(X0))
      | ~ cNothing(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f13">f13</A>]) ).

<A NAME="f25"></A>fof(f25,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | ~ xsd_integer(sK2)
    | xsd_string(sK2)
    | cowlNothing(sK3)
    | cNothing(sK3) ),
    inference(cnf_transformation,[],[<A HREF="#f18">f18</A>]) ).

<A NAME="f27"></A>fof(f27,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | xsd_integer(sK2)
    | ~ xsd_string(sK2)
    | cowlNothing(sK3)
    | cNothing(sK3) ),
    inference(cnf_transformation,[],[<A HREF="#f18">f18</A>]) ).

<A NAME="f30"></A>fof(f30,definition,
    ( spl4_1
  <=> cNothing(sK3) ),
    introduced(definition,[new_symbols(naming,[spl4_1])],[avatar_definition]) ).

<A NAME="f32"></A>fof(f32,plain,
    ( cNothing(sK3)
    | ~ spl4_1 ),
    inference(avatar_component_clause,[],[<A HREF="#f30">f30</A>]) ).

<A NAME="f34"></A>fof(f34,definition,
    ( spl4_2
  <=> cowlNothing(sK3) ),
    introduced(definition,[new_symbols(naming,[spl4_2])],[avatar_definition]) ).

<A NAME="f36"></A>fof(f36,plain,
    ( cowlNothing(sK3)
    | ~ spl4_2 ),
    inference(avatar_component_clause,[],[<A HREF="#f34">f34</A>]) ).

<A NAME="f38"></A>fof(f38,definition,
    ( spl4_3
  <=> xsd_string(sK2) ),
    introduced(definition,[new_symbols(naming,[spl4_3])],[avatar_definition]) ).

<A NAME="f39"></A>fof(f39,plain,
    ( ~ xsd_string(sK2)
    | spl4_3 ),
    inference(avatar_component_clause,[],[<A HREF="#f38">f38</A>]) ).

<A NAME="f42"></A>fof(f42,definition,
    ( spl4_4
  <=> xsd_integer(sK2) ),
    introduced(definition,[new_symbols(naming,[spl4_4])],[avatar_definition]) ).

<A NAME="f43"></A>fof(f43,plain,
    ( xsd_integer(sK2)
    | ~ spl4_4 ),
    inference(avatar_component_clause,[],[<A HREF="#f42">f42</A>]) ).

<A NAME="f46"></A>fof(f46,definition,
    ( spl4_5
  <=> cowlNothing(sK1) ),
    introduced(definition,[new_symbols(naming,[spl4_5])],[avatar_definition]) ).

<A NAME="f48"></A>fof(f48,plain,
    ( cowlNothing(sK1)
    | ~ spl4_5 ),
    inference(avatar_component_clause,[],[<A HREF="#f46">f46</A>]) ).

<A NAME="f50"></A>fof(f50,definition,
    ( spl4_6
  <=> cowlThing(sK1) ),
    introduced(definition,[new_symbols(naming,[spl4_6])],[avatar_definition]) ).

<A NAME="f52"></A>fof(f52,plain,
    ( ~ cowlThing(sK1)
    | spl4_6 ),
    inference(avatar_component_clause,[],[<A HREF="#f50">f50</A>]) ).

<A NAME="f53"></A>fof(f53,plain,
    ( spl4_1
    | spl4_2
    | spl4_3
    | ~ spl4_4
    | spl4_5
    | ~ spl4_6 ),
    inference(avatar_split_clause,[],[<A HREF="#f25">f25</A>,<A HREF="#f50">f50</A>,<A HREF="#f46">f46</A>,<A HREF="#f42">f42</A>,<A HREF="#f38">f38</A>,<A HREF="#f34">f34</A>,<A HREF="#f30">f30</A>]) ).

<A NAME="f55"></A>fof(f55,plain,
    ( spl4_1
    | spl4_2
    | ~ spl4_3
    | spl4_4
    | spl4_5
    | ~ spl4_6 ),
    inference(avatar_split_clause,[],[<A HREF="#f27">f27</A>,<A HREF="#f50">f50</A>,<A HREF="#f46">f46</A>,<A HREF="#f42">f42</A>,<A HREF="#f38">f38</A>,<A HREF="#f34">f34</A>,<A HREF="#f30">f30</A>]) ).

<A NAME="f57"></A>fof(f57,plain,
    ( $false
    | spl4_6 ),
    inference(resolution,[],[<A HREF="#f20">f20</A>,<A HREF="#f52">f52</A>]) ).

<A NAME="f58"></A>fof(f58,plain,
    spl4_6,
    inference(avatar_contradiction_clause,[],[<A HREF="#f57">f57</A>]) ).

<A NAME="f59"></A>fof(f59,plain,
    ( xsd_integer(sK2)
    | spl4_3 ),
    inference(resolution,[],[<A HREF="#f22">f22</A>,<A HREF="#f39">f39</A>]) ).

<A NAME="f62"></A>fof(f62,plain,
    ( $false
    | ~ spl4_5 ),
    inference(forward_subsumption_resolution,[],[<A HREF="#f48">f48</A>,<A HREF="#f19">f19</A>]) ).

<A NAME="f63"></A>fof(f63,plain,
    ~ spl4_5,
    inference(avatar_contradiction_clause,[],[<A HREF="#f62">f62</A>]) ).

<A NAME="f64"></A>fof(f64,plain,
    ( spl4_4
    | spl4_3 ),
    inference(avatar_split_clause,[],[<A HREF="#f59">f59</A>,<A HREF="#f38">f38</A>,<A HREF="#f42">f42</A>]) ).

<A NAME="f65"></A>fof(f65,plain,
    ( ~ xsd_string(sK2)
    | ~ spl4_4 ),
    inference(resolution,[],[<A HREF="#f43">f43</A>,<A HREF="#f21">f21</A>]) ).

<A NAME="f66"></A>fof(f66,plain,
    ! [X0] : ~ cNothing(X0),
    inference(forward_subsumption_resolution,[],[<A HREF="#f24">f24</A>,<A HREF="#f23">f23</A>]) ).

<A NAME="f67"></A>fof(f67,plain,
    ( $false
    | ~ spl4_1 ),
    inference(resolution,[],[<A HREF="#f66">f66</A>,<A HREF="#f32">f32</A>]) ).

<A NAME="f68"></A>fof(f68,plain,
    ~ spl4_1,
    inference(avatar_contradiction_clause,[],[<A HREF="#f67">f67</A>]) ).

<A NAME="f69"></A>fof(f69,plain,
    ( $false
    | ~ spl4_2 ),
    inference(forward_subsumption_resolution,[],[<A HREF="#f36">f36</A>,<A HREF="#f19">f19</A>]) ).

<A NAME="f70"></A>fof(f70,plain,
    ~ spl4_2,
    inference(avatar_contradiction_clause,[],[<A HREF="#f69">f69</A>]) ).

<A NAME="f71"></A>fof(f71,plain,
    ( ~ spl4_3
    | ~ spl4_4 ),
    inference(avatar_split_clause,[],[<A HREF="#f65">f65</A>,<A HREF="#f42">f42</A>,<A HREF="#f38">f38</A>]) ).

<A NAME="s1"></A>cnf(s1,plain,
    ( spl4_1
    | spl4_2
    | spl4_3
    | ~ spl4_4
    | spl4_5
    | ~ spl4_6 ),
    inference(sat_conversion,[],[<A HREF="#f53">f53</A>]) ).

<A NAME="s3"></A>cnf(s3,plain,
    ( spl4_1
    | spl4_2
    | ~ spl4_3
    | spl4_4
    | spl4_5
    | ~ spl4_6 ),
    inference(sat_conversion,[],[<A HREF="#f55">f55</A>]) ).

<A NAME="s5"></A>cnf(s5,plain,
    spl4_6,
    inference(sat_conversion,[],[<A HREF="#f58">f58</A>]) ).

<A NAME="s7"></A>cnf(s7,plain,
    ~ spl4_5,
    inference(sat_conversion,[],[<A HREF="#f63">f63</A>]) ).

<A NAME="s8"></A>cnf(s8,plain,
    ( spl4_3
    | spl4_4 ),
    inference(sat_conversion,[],[<A HREF="#f64">f64</A>]) ).

<A NAME="s9"></A>cnf(s9,plain,
    ~ spl4_1,
    inference(sat_conversion,[],[<A HREF="#f68">f68</A>]) ).

<A NAME="s10"></A>cnf(s10,plain,
    ~ spl4_2,
    inference(sat_conversion,[],[<A HREF="#f70">f70</A>]) ).

<A NAME="s11"></A>cnf(s11,plain,
    ( ~ spl4_3
    | ~ spl4_4 ),
    inference(sat_conversion,[],[<A HREF="#f71">f71</A>]) ).

<A NAME="s12"></A>cnf(s12,plain,
    ( ~ spl4_3
    | spl4_4 ),
    inference(rat,[],[<A HREF="#s3">s3</A>,<A HREF="#s5">s5</A>,<A HREF="#s7">s7</A>,<A HREF="#s10">s10</A>,<A HREF="#s9">s9</A>]) ).

<A NAME="s13"></A>cnf(s13,plain,
    ( spl4_3
    | ~ spl4_4 ),
    inference(rat,[],[<A HREF="#s1">s1</A>,<A HREF="#s5">s5</A>,<A HREF="#s7">s7</A>,<A HREF="#s10">s10</A>,<A HREF="#s9">s9</A>]) ).

<A NAME="s14"></A>cnf(s14,plain,
    spl4_3,
    inference(rat,[],[<A HREF="#s13">s13</A>,<A HREF="#s8">s8</A>]) ).

<A NAME="s15"></A>cnf(s15,plain,
    ~ spl4_4,
    inference(rat,[],[<A HREF="#s11">s11</A>,<A HREF="#s14">s14</A>]) ).

<A NAME="s16"></A>cnf(s16,plain,
    $false,
    inference(rat,[],[<A HREF="#s12">s12</A>,<A HREF="#s15">s15</A>,<A HREF="#s14">s14</A>]) ).

<A NAME="f72"></A>fof(f72,plain,
    $false,
    inference(avatar_sat_refutation,[],[<A HREF="#s16">s16</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.06  % Problem    : KRS130+1 : TPTP v9.2.1. Released v3.1.0.
% 0.00/0.06  % Command    : run_vampire %s %d THM
% 0.06/0.24  % Computer   : n012.cluster.edu
% 0.06/0.24  % Model      : x86_64 x86_64
% 0.06/0.24  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.06/0.24  % Memory     : 8042.1875MB
% 0.06/0.24  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.06/0.24  % CPULimit   : 300
% 0.06/0.24  % WCLimit    : 300
% 0.06/0.24  % DateTime   : Thu Apr 30 18:48:31 EDT 2026
% 0.06/0.24  % CPUTime    : 
% 0.06/0.25  This is a FOF_THM_RFO_NEQ problem
% 0.06/0.25  Running first-order theorem proving
% 0.06/0.25  Running /export/starexec/sandbox/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.25/0.46  % (6972)Detected formulas, will run a generic FOF schedule.
% 0.63/0.56  % (6979)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=1376880699:s2a=on:i=139:gtg=position_3000 on theBenchmark for (3000ds/139Mi)
% 0.63/0.56  % (6977)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=3924775331:i=109:sd=1:ins=1:gsp=on:ss=axioms_3000 on theBenchmark for (3000ds/109Mi)
% 0.63/0.56  % (6978)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=325619777:i=119:av=off:ss=axioms_3000 on theBenchmark for (3000ds/119Mi)
% 0.63/0.56  % (6976)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3550351174:i=141695:sd=1:nm=32:gsp=on:ss=included_3000 on theBenchmark for (3000ds/141695Mi)
% 0.63/0.56  % (6975)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=3710000943:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_3000 on theBenchmark for (3000ds/134677Mi)
% 0.63/0.57  % (6977)Refutation not found, incomplete strategy
% 0.63/0.57  % (6977)------------------------------
% 0.63/0.57  % (6977)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.63/0.57  % (6977)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.63/0.57  % (6977)CaDiCaL version: 2.1.3
% 0.63/0.57  % (6977)Termination reason: Refutation not found, incomplete strategy
% 0.63/0.57  % (6977)Time elapsed: 0.0000 s
% 0.63/0.57  % (6977)Peak memory usage: 80 MB
% 0.63/0.57  % (6978)Refutation not found, incomplete strategy
% 0.63/0.57  % (6978)------------------------------
% 0.63/0.57  % (6978)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.63/0.57  % (6978)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.63/0.57  % (6978)CaDiCaL version: 2.1.3
% 0.63/0.57  % (6978)Termination reason: Refutation not found, incomplete strategy
% 0.63/0.57  % (6978)Time elapsed: 0.0000 s
% 0.63/0.57  % (6978)Peak memory usage: 80 MB
% 0.63/0.57  % (6979)First to succeed.
% 0.63/0.57  % (6979)Solution written to "/export/starexec/sandbox/tmp/vampire-proof-6972"
% 0.63/0.58  % (6980)dis-21_1_sil=8000:lcm=predicate:random_seed=373694168:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_3000 on theBenchmark for (3000ds/129Mi)
% 0.63/0.58  % (6980)Also succeeded, but the first one will report.
% 0.63/0.58  % (6974)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=4084821192:i=141193_3000 on theBenchmark for (3000ds/141193Mi)
% 1.25/0.69  % (6977)------------------------------
% 1.25/0.69  % (6977)------------------------------
% 1.25/0.69  % (6978)------------------------------
% 1.25/0.69  % (6978)------------------------------
% 1.16/0.71  % (6979)Refutation found. Thanks to Tanya!
% 1.16/0.71  % SZS status Theorem for theBenchmark
% 1.16/0.71  % SZS output start Proof for theBenchmark
% See solution above
% 1.16/0.71  % (6979)------------------------------
% 1.16/0.71  % (6979)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 1.16/0.71  % (6979)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 1.16/0.71  % (6979)CaDiCaL version: 2.1.3
% 1.16/0.71  % (6979)Termination reason: Refutation
% 1.16/0.71  % (6979)Time elapsed: 0.001 s
% 1.16/0.71  % (6979)Peak memory usage: 81 MB
% 1.16/0.71  % (6979)Instructions burned: 2 (million)
% 1.16/0.71  % (6979)------------------------------
% 1.16/0.71  % (6979)------------------------------
% 1.16/0.71  % (6972)Success in time 0.249 s
%------------------------------------------------------------------------------
