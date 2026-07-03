
%------------------------------------------------------------------------------
% File     : Drodi---4.1.0
% Problem  : SET002+4 : TPTP v9.2.0. Released v2.2.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : drodi -timeout(300) /export/starexec/sandbox/benchmark/theBenchmark.p

% Computer : n014.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Mon Sep 29 08:39:13 PM UTC 2025

% Result   : Theorem 0.16s 0.31s
% Output   : CNFRefutation 0.16s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :   12
%            Number of leaves      :    4
% Syntax   : Number of formulae    :   32 (   9 unt;   0 def)
%            Number of atoms       :   91 (   0 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   92 (  33   ~;  39   |;  15   &)
%                                         (   4 ;   1  =>;   0  )
%            Maximal formula depth :    8 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   1 prp; 0-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   75 (  72   !;   3   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(f1,axiom,
    ! [A,B] :
      ( subset(A,B)
     ! [X] :
          ( member(X,A)
         => member(X,B) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p') ).

fof(f2,axiom,
    ! [A,B] :
      ( equal_set(A,B)
     ( subset(A,B)
        & subset(B,A) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p') ).

fof(f5,axiom,
    ! [X,A,B] :
      ( member(X,union(A,B))
     ( member(X,A)
        | member(X,B) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p') ).

fof(f12,conjecture,
    ! [A] : equal_set(union(A,A),A),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p') ).

fof(f13,negated_conjecture,
    ~ ! [A] : equal_set(union(A,A),A),
    inference(negated_conjecture,[status(cth)],[f12]) ).

fof(f14,plain,
    ! [A,B] :
      ( subset(A,B)
     ! [X] :
          ( ~ member(X,A)
          | member(X,B) ) ),
    inference(pre_NNF_transformation,[status(esa)],[f1]) ).

fof(f15,plain,
    ! [A,B] :
      ( ( ~ subset(A,B)
        | ! [X] :
            ( ~ member(X,A)
            | member(X,B) ) )
      & ( subset(A,B)
        | ? [X] :
            ( member(X,A)
            & ~ member(X,B) ) ) ),
    inference(NNF_transformation,[status(esa)],[f14]) ).

fof(f16,plain,
    ( ! [A,B] :
        ( ~ subset(A,B)
        | ! [X] :
            ( ~ member(X,A)
            | member(X,B) ) )
    & ! [A,B] :
        ( subset(A,B)
        | ? [X] :
            ( member(X,A)
            & ~ member(X,B) ) ) ),
    inference(miniscoping,[status(esa)],[f15]) ).

fof(f17,plain,
    ( ! [A,B] :
        ( ~ subset(A,B)
        | ! [X] :
            ( ~ member(X,A)
            | member(X,B) ) )
    & ! [A,B] :
        ( subset(A,B)
        | ( member(sK0_skl(B,A),A)
          & ~ member(sK0_skl(B,A),B) ) ) ),
    inference(skolemization,[status(esa),new_symbols(skolem,[sK0_skl])],[f16]) ).

fof(f19,plain,
    ! [X0,X1] :
      ( subset(X0,X1)
      | member(sK0_skl(X1,X0),X0) ),
    inference(cnf_transformation,[status(thm)],[f17]) ).

fof(f20,plain,
    ! [X0,X1] :
      ( subset(X0,X1)
      | ~ member(sK0_skl(X1,X0),X1) ),
    inference(cnf_transformation,[status(thm)],[f17]) ).

fof(f21,plain,
    ! [A,B] :
      ( ( ~ equal_set(A,B)
        | ( subset(A,B)
          & subset(B,A) ) )
      & ( equal_set(A,B)
        | ~ subset(A,B)
        | ~ subset(B,A) ) ),
    inference(NNF_transformation,[status(esa)],[f2]) ).

fof(f22,plain,
    ( ! [A,B] :
        ( ~ equal_set(A,B)
        | ( subset(A,B)
          & subset(B,A) ) )
    & ! [A,B] :
        ( equal_set(A,B)
        | ~ subset(A,B)
        | ~ subset(B,A) ) ),
    inference(miniscoping,[status(esa)],[f21]) ).

fof(f25,plain,
    ! [X0,X1] :
      ( equal_set(X0,X1)
      | ~ subset(X0,X1)
      | ~ subset(X1,X0) ),
    inference(cnf_transformation,[status(thm)],[f22]) ).

fof(f35,plain,
    ! [X,A,B] :
      ( ( ~ member(X,union(A,B))
        | member(X,A)
        | member(X,B) )
      & ( member(X,union(A,B))
        | ( ~ member(X,A)
          & ~ member(X,B) ) ) ),
    inference(NNF_transformation,[status(esa)],[f5]) ).

fof(f36,plain,
    ( ! [X,A,B] :
        ( ~ member(X,union(A,B))
        | member(X,A)
        | member(X,B) )
    & ! [X,A,B] :
        ( member(X,union(A,B))
        | ( ~ member(X,A)
          & ~ member(X,B) ) ) ),
    inference(miniscoping,[status(esa)],[f35]) ).

fof(f37,plain,
    ! [X0,X1,X2] :
      ( ~ member(X0,union(X1,X2))
      | member(X0,X1)
      | member(X0,X2) ),
    inference(cnf_transformation,[status(thm)],[f36]) ).

fof(f39,plain,
    ! [X0,X1,X2] :
      ( member(X0,union(X1,X2))
      | ~ member(X0,X2) ),
    inference(cnf_transformation,[status(thm)],[f36]) ).

fof(f68,plain,
    ? [A] : ~ equal_set(union(A,A),A),
    inference(pre_NNF_transformation,[status(esa)],[f13]) ).

fof(f69,plain,
    ~ equal_set(union(sK3_skl,sK3_skl),sK3_skl),
    inference(skolemization,[status(esa),new_symbols(skolem,[sK3_skl])],[f68]) ).

fof(f70,plain,
    ~ equal_set(union(sK3_skl,sK3_skl),sK3_skl),
    inference(cnf_transformation,[status(thm)],[f69]) ).

fof(f81,plain,
    ! [X0,X1,X2] :
      ( subset(union(X0,X1),X2)
      | member(sK0_skl(X2,union(X0,X1)),X0)
      | member(sK0_skl(X2,union(X0,X1)),X1) ),
    inference(resolution,[status(thm)],[f19,f37]) ).

fof(f111,plain,
    ! [X0,X1] :
      ( subset(union(X0,X1),X1)
      | subset(union(X0,X1),X1)
      | member(sK0_skl(X1,union(X0,X1)),X0) ),
    inference(resolution,[status(thm)],[f20,f81]) ).

fof(f114,plain,
    ! [X0,X1,X2] :
      ( subset(X0,union(X1,X2))
      | ~ member(sK0_skl(union(X1,X2),X0),X2) ),
    inference(resolution,[status(thm)],[f20,f39]) ).

fof(f118,plain,
    ! [X0,X1] :
      ( subset(union(X0,X1),X1)
      | member(sK0_skl(X1,union(X0,X1)),X0) ),
    inference(duplicate_literals_removal,[status(thm)],[f111]) ).

fof(f206,plain,
    ! [X0,X1] :
      ( subset(X0,union(X1,X0))
      | subset(X0,union(X1,X0)) ),
    inference(resolution,[status(thm)],[f114,f19]) ).

fof(f215,plain,
    ! [X0,X1] : subset(X0,union(X1,X0)),
    inference(duplicate_literals_removal,[status(thm)],[f206]) ).

fof(f218,plain,
    ! [X0,X1] :
      ( equal_set(union(X0,X1),X1)
      | ~ subset(union(X0,X1),X1) ),
    inference(resolution,[status(thm)],[f215,f25]) ).

fof(f240,plain,
    ! [X0] :
      ( subset(union(X0,X0),X0)
      | subset(union(X0,X0),X0) ),
    inference(resolution,[status(thm)],[f118,f20]) ).

fof(f256,plain,
    ! [X0] : subset(union(X0,X0),X0),
    inference(duplicate_literals_removal,[status(thm)],[f240]) ).

fof(f257,plain,
    ! [X0] : equal_set(union(X0,X0),X0),
    inference(resolution,[status(thm)],[f256,f218]) ).

fof(f264,plain,
    $false,
    inference(backward_subsumption_resolution,[status(thm)],[f70,f257]) ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.00/0.09  % Problem  : SET002+4 : TPTP v9.2.0. Released v2.2.0.
% 0.09/0.10  % Command  : drodi -timeout(300) /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.09/0.30  % Computer : n014.cluster.edu
% 0.09/0.30  % Model    : x86_64 x86_64
% 0.09/0.30  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.09/0.30  % Memory   : 8042.1875MB
% 0.09/0.30  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.09/0.30  % CPULimit : 300
% 0.09/0.30  % WCLimit  : 300
% 0.09/0.30  % DateTime : Fri Sep 26 14:10:23 EDT 2025
% 0.09/0.30  % CPUTime  : 
% 0.09/0.31  % Drodi V4.1.0
% 0.16/0.31  % Refutation found
% 0.16/0.31  % SZS status Theorem for theBenchmark: Theorem is valid
% 0.16/0.31  % SZS output start CNFRefutation for theBenchmark
% See solution above
% 0.16/0.32  % Elapsed time: 0.020656 seconds
% 0.16/0.32  % CPU time: 0.071480 seconds
% 0.16/0.32  % Total memory used: 18.557 MB
% 0.16/0.32  % Net memory used: 18.480 MB
%------------------------------------------------------------------------------
