
%------------------------------------------------------------------------------
% File     : Vampire---5.0.1
% Problem  : KRS129+1 : TPTP v9.2.1. Released v3.1.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_vampire %s %d THM

% Computer : n003.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Fri May  1 03:33:58 PM UTC 2026

% Result   : Theorem 0.74s 0.90s
% Output   : Refutation 0.74s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   15
%            Number of leaves      :   14
% Syntax   : Number of formulae    :   66 (  14 unt;   5 def)
%            Number of atoms       :  186 (   0 equ)
%            Maximal formula atoms :    8 (   2 avg)
%            Number of connectives :  204 (  84   ~;  80   |;  25   &)
%                                         (  11 <=>;   3  =>;   0  <=;   1 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :   13 (  12 usr;   6 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-1 aty)
%            Number of variables   :   43 (   0 sgn  33   !;  10   ?)

% Comments : 
%------------------------------------------------------------------------------
<A NAME="f13"></A>fof(f13,axiom,
    ! [X0] :
      ( cowlThing(X0)
      & ~ cowlNothing(X0) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_0) ).

<A NAME="f14"></A>fof(f14,axiom,
    ! [X0] :
      ( xsd_string(X0)
    <=> ~ xsd_integer(X0) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_1) ).

<A NAME="f16"></A>fof(f16,axiom,
    ! [X0] :
      ( cEuroMP(X0)
    <=> ? [X1] :
          ( risEuroMPFrom(X0,X1)
          & cowlThing(X1) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_3) ).

<A NAME="f18"></A>fof(f18,axiom,
    ! [X0,X1] :
      ( risEuroMPFrom(X0,X1)
    <=> rhasEuroMP(X1,X0) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_5) ).

<A NAME="f26"></A>fof(f26,axiom,
    rhasEuroMP(iUK,iKinnock),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',axiom_13) ).

<A NAME="f27"></A>fof(f27,conjecture,
    ( ! [X0] :
        ( cowlThing(X0)
        & ~ cowlNothing(X0) )
    & ! [X0] :
        ( xsd_string(X0)
      <=> ~ xsd_integer(X0) )
    & cEuroMP(iKinnock) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',the_axiom) ).

<A NAME="f28"></A>fof(f28,negated_conjecture,
    ~ ( ! [X0] :
          ( cowlThing(X0)
          & ~ cowlNothing(X0) )
      & ! [X0] :
          ( xsd_string(X0)
        <=> ~ xsd_integer(X0) )
      & cEuroMP(iKinnock) ),
    inference(negated_conjecture,[status(cth)],[<A HREF="#f27">f27</A>]) ).

<A NAME="f29"></A>fof(f29,plain,
    ~ ( ! [X0] :
          ( cowlThing(X0)
          & ~ cowlNothing(X0) )
      & ! [X1] :
          ( xsd_string(X1)
        <=> ~ xsd_integer(X1) )
      & cEuroMP(iKinnock) ),
    inference(rectify,[],[<A HREF="#f28">f28</A>]) ).

<A NAME="f55"></A>fof(f55,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
    | ? [X1] :
        ( xsd_string(X1)
      <~> ~ xsd_integer(X1) )
    | ~ cEuroMP(iKinnock) ),
    inference(ennf_transformation,[],[<A HREF="#f29">f29</A>]) ).

<A NAME="f56"></A>fof(f56,plain,
    ! [X0] :
      ( ( xsd_string(X0)
        | xsd_integer(X0) )
      & ( ~ xsd_integer(X0)
        | ~ xsd_string(X0) ) ),
    inference(nnf_transformation,[],[<A HREF="#f14">f14</A>]) ).

<A NAME="f59"></A>fof(f59,plain,
    ! [X0] :
      ( ( cEuroMP(X0)
        | ! [X1] :
            ( ~ risEuroMPFrom(X0,X1)
            | ~ cowlThing(X1) ) )
      & ( ? [X1] :
            ( risEuroMPFrom(X0,X1)
            & cowlThing(X1) )
        | ~ cEuroMP(X0) ) ),
    inference(nnf_transformation,[],[<A HREF="#f16">f16</A>]) ).

<A NAME="f60"></A>fof(f60,plain,
    ! [X0] :
      ( ( cEuroMP(X0)
        | ! [X1] :
            ( ~ risEuroMPFrom(X0,X1)
            | ~ cowlThing(X1) ) )
      & ( ? [X2] :
            ( risEuroMPFrom(X0,X2)
            & cowlThing(X2) )
        | ~ cEuroMP(X0) ) ),
    inference(rectify,[],[<A HREF="#f59">f59</A>]) ).

<A NAME="f61"></A>fof(f61,plain,
    ! [X0] :
      ( ? [X2] :
          ( risEuroMPFrom(X0,X2)
          & cowlThing(X2) )
     => ( risEuroMPFrom(X0,sK0(X0))
        & cowlThing(sK0(X0)) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f62"></A>fof(f62,plain,
    ! [X0] :
      ( ( cEuroMP(X0)
        | ! [X1] :
            ( ~ risEuroMPFrom(X0,X1)
            | ~ cowlThing(X1) ) )
      & ( ( risEuroMPFrom(X0,sK0(X0))
          & cowlThing(sK0(X0)) )
        | ~ cEuroMP(X0) ) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK0])],[<A HREF="#f60">f60</A>,<A HREF="#f61">f61</A>]) ).

<A NAME="f63"></A>fof(f63,plain,
    ! [X0,X1] :
      ( ( risEuroMPFrom(X0,X1)
        | ~ rhasEuroMP(X1,X0) )
      & ( rhasEuroMP(X1,X0)
        | ~ risEuroMPFrom(X0,X1) ) ),
    inference(nnf_transformation,[],[<A HREF="#f18">f18</A>]) ).

<A NAME="f64"></A>fof(f64,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
    | ? [X1] :
        ( ( xsd_integer(X1)
          | ~ xsd_string(X1) )
        & ( ~ xsd_integer(X1)
          | xsd_string(X1) ) )
    | ~ cEuroMP(iKinnock) ),
    inference(nnf_transformation,[],[<A HREF="#f55">f55</A>]) ).

<A NAME="f65"></A>fof(f65,plain,
    ( ? [X0] :
        ( ~ cowlThing(X0)
        | cowlNothing(X0) )
   => ( ~ cowlThing(sK1)
      | cowlNothing(sK1) ) ),
    introduced(definition,[],[skolem_symbol_introduction]) ).

<A NAME="f66"></A>fof(f66,plain,
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

<A NAME="f67"></A>fof(f67,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | ( ( xsd_integer(sK2)
        | ~ xsd_string(sK2) )
      & ( ~ xsd_integer(sK2)
        | xsd_string(sK2) ) )
    | ~ cEuroMP(iKinnock) ),
    inference(skolemisation,[status(esa),new_symbols(skolem,[sK1,sK2])],[<A HREF="#f64">f64</A>,<A HREF="#f66">f66</A>,<A HREF="#f65">f65</A>]) ).

<A NAME="f80"></A>fof(f80,plain,
    ! [X0] : ~ cowlNothing(X0),
    inference(cnf_transformation,[],[<A HREF="#f13">f13</A>]) ).

<A NAME="f81"></A>fof(f81,plain,
    ! [X0] : cowlThing(X0),
    inference(cnf_transformation,[],[<A HREF="#f13">f13</A>]) ).

<A NAME="f82"></A>fof(f82,plain,
    ! [X0] :
      ( ~ xsd_string(X0)
      | ~ xsd_integer(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f56">f56</A>]) ).

<A NAME="f83"></A>fof(f83,plain,
    ! [X0] :
      ( xsd_string(X0)
      | xsd_integer(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f56">f56</A>]) ).

<A NAME="f93"></A>fof(f93,plain,
    ! [X0,X1] :
      ( ~ cowlThing(X1)
      | ~ risEuroMPFrom(X0,X1)
      | cEuroMP(X0) ),
    inference(cnf_transformation,[],[<A HREF="#f62">f62</A>]) ).

<A NAME="f96"></A>fof(f96,plain,
    ! [X0,X1] :
      ( risEuroMPFrom(X0,X1)
      | ~ rhasEuroMP(X1,X0) ),
    inference(cnf_transformation,[],[<A HREF="#f63">f63</A>]) ).

<A NAME="f104"></A>fof(f104,plain,
    rhasEuroMP(iUK,iKinnock),
    inference(cnf_transformation,[],[<A HREF="#f26">f26</A>]) ).

<A NAME="f105"></A>fof(f105,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | ~ xsd_integer(sK2)
    | xsd_string(sK2)
    | ~ cEuroMP(iKinnock) ),
    inference(cnf_transformation,[],[<A HREF="#f67">f67</A>]) ).

<A NAME="f106"></A>fof(f106,plain,
    ( ~ cowlThing(sK1)
    | cowlNothing(sK1)
    | xsd_integer(sK2)
    | ~ xsd_string(sK2)
    | ~ cEuroMP(iKinnock) ),
    inference(cnf_transformation,[],[<A HREF="#f67">f67</A>]) ).

<A NAME="f130"></A>fof(f130,definition,
    ( spl4_1
  <=> cEuroMP(iKinnock) ),
    introduced(definition,[new_symbols(naming,[spl4_1])],[avatar_definition]) ).

<A NAME="f131"></A>fof(f131,plain,
    ( ~ cEuroMP(iKinnock)
    | spl4_1 ),
    inference(avatar_component_clause,[],[<A HREF="#f130">f130</A>]) ).

<A NAME="f133"></A>fof(f133,definition,
    ( spl4_2
  <=> xsd_string(sK2) ),
    introduced(definition,[new_symbols(naming,[spl4_2])],[avatar_definition]) ).

<A NAME="f134"></A>fof(f134,plain,
    ( xsd_string(sK2)
    | ~ spl4_2 ),
    inference(avatar_component_clause,[],[<A HREF="#f133">f133</A>]) ).

<A NAME="f136"></A>fof(f136,definition,
    ( spl4_3
  <=> xsd_integer(sK2) ),
    introduced(definition,[new_symbols(naming,[spl4_3])],[avatar_definition]) ).

<A NAME="f139"></A>fof(f139,definition,
    ( spl4_4
  <=> cowlNothing(sK1) ),
    introduced(definition,[new_symbols(naming,[spl4_4])],[avatar_definition]) ).

<A NAME="f140"></A>fof(f140,plain,
    ( cowlNothing(sK1)
    | ~ spl4_4 ),
    inference(avatar_component_clause,[],[<A HREF="#f139">f139</A>]) ).

<A NAME="f142"></A>fof(f142,definition,
    ( spl4_5
  <=> cowlThing(sK1) ),
    introduced(definition,[new_symbols(naming,[spl4_5])],[avatar_definition]) ).

<A NAME="f143"></A>fof(f143,plain,
    ( ~ cowlThing(sK1)
    | spl4_5 ),
    inference(avatar_component_clause,[],[<A HREF="#f142">f142</A>]) ).

<A NAME="f144"></A>fof(f144,plain,
    ( ~ spl4_1
    | spl4_2
    | ~ spl4_3
    | spl4_4
    | ~ spl4_5 ),
    inference(avatar_split_clause,[],[<A HREF="#f105">f105</A>,<A HREF="#f142">f142</A>,<A HREF="#f139">f139</A>,<A HREF="#f136">f136</A>,<A HREF="#f133">f133</A>,<A HREF="#f130">f130</A>]) ).

<A NAME="f145"></A>fof(f145,plain,
    ( ~ xsd_string(sK2)
    | spl4_2 ),
    inference(avatar_component_clause,[],[<A HREF="#f133">f133</A>]) ).

<A NAME="f147"></A>fof(f147,plain,
    ( ~ spl4_1
    | ~ spl4_2
    | spl4_3
    | spl4_4
    | ~ spl4_5 ),
    inference(avatar_split_clause,[],[<A HREF="#f106">f106</A>,<A HREF="#f142">f142</A>,<A HREF="#f139">f139</A>,<A HREF="#f136">f136</A>,<A HREF="#f133">f133</A>,<A HREF="#f130">f130</A>]) ).

<A NAME="f151"></A>fof(f151,plain,
    ! [X0,X1] :
      ( cEuroMP(X0)
      | ~ risEuroMPFrom(X0,X1) ),
    inference(resolution,[],[<A HREF="#f93">f93</A>,<A HREF="#f81">f81</A>]) ).

<A NAME="f152"></A>fof(f152,plain,
    ( ! [X0] : ~ risEuroMPFrom(iKinnock,X0)
    | spl4_1 ),
    inference(resolution,[],[<A HREF="#f151">f151</A>,<A HREF="#f131">f131</A>]) ).

<A NAME="f154"></A>fof(f154,plain,
    ( ! [X0] : ~ rhasEuroMP(X0,iKinnock)
    | spl4_1 ),
    inference(resolution,[],[<A HREF="#f152">f152</A>,<A HREF="#f96">f96</A>]) ).

<A NAME="f155"></A>fof(f155,plain,
    ( $false
    | spl4_1 ),
    inference(resolution,[],[<A HREF="#f154">f154</A>,<A HREF="#f104">f104</A>]) ).

<A NAME="f156"></A>fof(f156,plain,
    spl4_1,
    inference(avatar_contradiction_clause,[],[<A HREF="#f155">f155</A>]) ).

<A NAME="f157"></A>fof(f157,plain,
    ( $false
    | spl4_5 ),
    inference(resolution,[],[<A HREF="#f143">f143</A>,<A HREF="#f81">f81</A>]) ).

<A NAME="f158"></A>fof(f158,plain,
    spl4_5,
    inference(avatar_contradiction_clause,[],[<A HREF="#f157">f157</A>]) ).

<A NAME="f159"></A>fof(f159,plain,
    ( xsd_integer(sK2)
    | spl4_2 ),
    inference(resolution,[],[<A HREF="#f145">f145</A>,<A HREF="#f83">f83</A>]) ).

<A NAME="f160"></A>fof(f160,plain,
    ( spl4_3
    | spl4_2 ),
    inference(avatar_split_clause,[],[<A HREF="#f159">f159</A>,<A HREF="#f133">f133</A>,<A HREF="#f136">f136</A>]) ).

<A NAME="f161"></A>fof(f161,plain,
    ( ~ xsd_integer(sK2)
    | ~ spl4_2 ),
    inference(resolution,[],[<A HREF="#f134">f134</A>,<A HREF="#f82">f82</A>]) ).

<A NAME="f162"></A>fof(f162,plain,
    ( $false
    | ~ spl4_4 ),
    inference(resolution,[],[<A HREF="#f140">f140</A>,<A HREF="#f80">f80</A>]) ).

<A NAME="f163"></A>fof(f163,plain,
    ~ spl4_4,
    inference(avatar_contradiction_clause,[],[<A HREF="#f162">f162</A>]) ).

<A NAME="f164"></A>fof(f164,plain,
    ( ~ spl4_3
    | ~ spl4_2 ),
    inference(avatar_split_clause,[],[<A HREF="#f161">f161</A>,<A HREF="#f133">f133</A>,<A HREF="#f136">f136</A>]) ).

<A NAME="s1"></A>cnf(s1,plain,
    ( ~ spl4_1
    | spl4_2
    | ~ spl4_3
    | spl4_4
    | ~ spl4_5 ),
    inference(sat_conversion,[],[<A HREF="#f144">f144</A>]) ).

<A NAME="s2"></A>cnf(s2,plain,
    ( ~ spl4_1
    | ~ spl4_2
    | spl4_3
    | spl4_4
    | ~ spl4_5 ),
    inference(sat_conversion,[],[<A HREF="#f147">f147</A>]) ).

<A NAME="s3"></A>cnf(s3,plain,
    spl4_1,
    inference(sat_conversion,[],[<A HREF="#f156">f156</A>]) ).

<A NAME="s4"></A>cnf(s4,plain,
    spl4_5,
    inference(sat_conversion,[],[<A HREF="#f158">f158</A>]) ).

<A NAME="s5"></A>cnf(s5,plain,
    ( spl4_2
    | spl4_3 ),
    inference(sat_conversion,[],[<A HREF="#f160">f160</A>]) ).

<A NAME="s6"></A>cnf(s6,plain,
    ~ spl4_4,
    inference(sat_conversion,[],[<A HREF="#f163">f163</A>]) ).

<A NAME="s7"></A>cnf(s7,plain,
    ( ~ spl4_2
    | ~ spl4_3 ),
    inference(sat_conversion,[],[<A HREF="#f164">f164</A>]) ).

<A NAME="s8"></A>cnf(s8,plain,
    ( ~ spl4_2
    | spl4_3 ),
    inference(rat,[],[<A HREF="#s2">s2</A>,<A HREF="#s4">s4</A>,<A HREF="#s6">s6</A>,<A HREF="#s3">s3</A>]) ).

<A NAME="s9"></A>cnf(s9,plain,
    ( spl4_2
    | ~ spl4_3 ),
    inference(rat,[],[<A HREF="#s1">s1</A>,<A HREF="#s4">s4</A>,<A HREF="#s6">s6</A>,<A HREF="#s3">s3</A>]) ).

<A NAME="s10"></A>cnf(s10,plain,
    spl4_2,
    inference(rat,[],[<A HREF="#s9">s9</A>,<A HREF="#s5">s5</A>]) ).

<A NAME="s11"></A>cnf(s11,plain,
    ~ spl4_3,
    inference(rat,[],[<A HREF="#s7">s7</A>,<A HREF="#s10">s10</A>]) ).

<A NAME="s12"></A>cnf(s12,plain,
    $false,
    inference(rat,[],[<A HREF="#s8">s8</A>,<A HREF="#s11">s11</A>,<A HREF="#s10">s10</A>]) ).

<A NAME="f165"></A>fof(f165,plain,
    $false,
    inference(avatar_sat_refutation,[],[<A HREF="#s12">s12</A>]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.12  % Problem    : KRS129+1 : TPTP v9.2.1. Released v3.1.0.
% 0.00/0.12  % Command    : run_vampire %s %d THM
% 0.14/0.32  % Computer   : n003.cluster.edu
% 0.14/0.32  % Model      : x86_64 x86_64
% 0.14/0.32  % CPU        : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.32  % Memory     : 8042.1875MB
% 0.14/0.32  % OS         : Linux 3.10.0-693.el7.x86_64
% 0.14/0.32  % CPULimit   : 300
% 0.14/0.32  % WCLimit    : 300
% 0.14/0.32  % DateTime   : Thu Apr 30 18:47:11 EDT 2026
% 0.14/0.33  % CPUTime    : 
% 0.14/0.34  This is a FOF_THM_RFO_SEQ problem
% 0.14/0.34  Running first-order theorem proving
% 0.14/0.35  Running /export/starexec/sandbox2/solver/bin/vampire --input_syntax tptp --proof tptp --output_axiom_names on --mode casc --cores 7 -m 16384 -t 300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.48/0.63  % (26475)Detected formulas, will run a generic FOF schedule.
% 0.50/0.75  % (26483)dis-21_1_sil=8000:lcm=predicate:random_seed=210319492:st=5:avsq=on:i=129:avsqr=1,16:sd=3:aac=none:ep=RS:fsr=off:ss=included_2999 on theBenchmark for (2999ds/129Mi)
% 0.50/0.75  % (26483)First to succeed.
% 0.50/0.75  % (26483)Solution written to "/export/starexec/sandbox2/tmp/vampire-proof-26475"
% 0.50/0.78  % (26480)lrs+1010_1_to=lpo:sil=32000:sos=on:spb=goal_then_units:bce=on:random_seed=3854678106:i=109:sd=1:ins=1:gsp=on:ss=axioms_2999 on theBenchmark for (2999ds/109Mi)
% 0.50/0.78  % (26481)dis-1010_2:3_sil=16000:sp=reverse_frequency:random_seed=1564284873:i=119:av=off:ss=axioms_2999 on theBenchmark for (2999ds/119Mi)
% 0.50/0.78  % (26482)dis-1011_1_sil=16000:fde=unused:s2agt=70:random_seed=621424511:s2a=on:i=139:gtg=position_2999 on theBenchmark for (2999ds/139Mi)
% 0.50/0.78  % (26477)lrs+10_1_ncem=casc2026/models/loop8.pt:sil=128000:tgt=full:npcc=on:drc=off:sp=weighted_frequency:spb=goal:fd=preordered:foolp=on:random_seed=637088563:i=141193_2999 on theBenchmark for (2999ds/141193Mi)
% 0.50/0.78  % (26478)lrs+11_1_ncem=casc2026/models/loop8.pt:sil=128000:npcc=on:lma=off:spb=units:urr=ec_only:bce=on:s2agt=64:updr=off:random_seed=2554529359:i=134677:sd=20:aac=none:nm=16:ss=included:sgt=10_2999 on theBenchmark for (2999ds/134677Mi)
% 0.50/0.78  % (26479)lrs+1010_1_anc=all:sfv=off:to=kbo:ncem=casc2026/models/loop7.pt:sil=128000:npcc=on:prc=on:sos=all:bsr=unit_only:sac=on:random_seed=3682203220:i=141695:sd=1:nm=32:gsp=on:ss=included_2999 on theBenchmark for (2999ds/141695Mi)
% 0.50/0.78  % (26480)Refutation not found, incomplete strategy
% 0.50/0.78  % (26480)------------------------------
% 0.50/0.78  % (26480)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.50/0.78  % (26480)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.50/0.78  % (26480)CaDiCaL version: 2.1.3
% 0.50/0.78  % (26480)Termination reason: Refutation not found, incomplete strategy
% 0.50/0.78  % (26480)Time elapsed: 0.0000 s
% 0.50/0.78  % (26480)Peak memory usage: 80 MB
% 0.50/0.78  % (26481)Also succeeded, but the first one will report.
% 0.50/0.78  % (26482)Also succeeded, but the first one will report.
% 0.74/0.90  % (26483)Refutation found. Thanks to Tanya!
% 0.74/0.90  % SZS status Theorem for theBenchmark
% 0.74/0.90  % SZS output start Proof for theBenchmark
% See solution above
% 0.74/0.90  % (26483)------------------------------
% 0.74/0.90  % (26483)Version: Vampire 5.0.1 (Release build, commit 1b9f22200 on 2026-04-29 16:18:29 +0200)
% 0.74/0.90  % (26483)Linked with Z3 4.14.0.0 3c47fd96cf5645d0c42b2c819d9e9a84380aa721 z3-4.8.4-9178-g3c47fd96c
% 0.74/0.90  % (26483)CaDiCaL version: 2.1.3
% 0.74/0.90  % (26483)Termination reason: Refutation
% 0.74/0.90  % (26483)Time elapsed: 0.002 s
% 0.74/0.90  % (26483)Peak memory usage: 81 MB
% 0.74/0.90  % (26483)Instructions burned: 3 (million)
% 0.74/0.90  % (26483)------------------------------
% 0.74/0.90  % (26483)------------------------------
% 0.74/0.90  % (26475)Success in time 0.265 s
%------------------------------------------------------------------------------
