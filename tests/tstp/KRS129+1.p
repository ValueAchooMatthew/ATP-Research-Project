
%------------------------------------------------------------------------------
% File     : KRS129+1 : TPTP v9.2.1. Released v3.1.0.
% Domain   : Knowledge Representation (Semantic Web)
% Problem  : An example combinging owl:oneOf and owl:inverseOf
% Version  : Especial.
% English  :

% Refs     : [Bec03] Bechhofer (2003), Email to G. Sutcliffe
%          : [<a href=SeeTPTP?Category=BibTeX&File=TR+04>TR+04</a>] Tsarkov et al. (2004), Using Vampire to Reason with OW
% Source   : [Bec03]
% Names    : positive_I4.5-Manifest001 [Bec03]

% Status   : Theorem
% Rating   : 0.06 v9.0.0, 0.08 v8.1.0, 0.06 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.00 v6.1.0, 0.03 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.2.0, 0.11 v3.1.0
% Syntax   : Number of formulae    :   27 (   8 unt;   0 def)
%            Number of atoms       :   67 (  18 equ)
%            Maximal formula atoms :    7 (   2 avg)
%            Number of connectives :   44 (   4   ~;   5   |;  17   &)
%                                         (   5 <=>;  13  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :   11 (  10 usr;   0 prp; 1-2 aty)
%            Number of functors    :    7 (   7 usr;   7 con; 0-0 aty)
%            Number of variables   :   39 (  38   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Sean Bechhofer says there are some errors in the encoding of
%            datatypes, so this problem may not be perfect. At least it's
%            still representative of the type of reasoning required for OWL.
%------------------------------------------------------------------------------
<A NAME="cEUCountry_substitution_1"></A>fof(cEUCountry_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cEUCountry(A) )
     => cEUCountry(B) ) ).

<A NAME="cEuroMP_substitution_1"></A>fof(cEuroMP_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cEuroMP(A) )
     => cEuroMP(B) ) ).

<A NAME="cEuropeanCountry_substitution_1"></A>fof(cEuropeanCountry_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cEuropeanCountry(A) )
     => cEuropeanCountry(B) ) ).

<A NAME="cPerson_substitution_1"></A>fof(cPerson_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cPerson(A) )
     => cPerson(B) ) ).

<A NAME="cowlNothing_substitution_1"></A>fof(cowlNothing_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cowlNothing(A) )
     => cowlNothing(B) ) ).

<A NAME="cowlThing_substitution_1"></A>fof(cowlThing_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & cowlThing(A) )
     => cowlThing(B) ) ).

<A NAME="rhasEuroMP_substitution_1"></A>fof(rhasEuroMP_substitution_1,axiom,
    ! [A,B,C] :
      ( ( A = B
        & rhasEuroMP(A,C) )
     => rhasEuroMP(B,C) ) ).

<A NAME="rhasEuroMP_substitution_2"></A>fof(rhasEuroMP_substitution_2,axiom,
    ! [A,B,C] :
      ( ( A = B
        & rhasEuroMP(C,A) )
     => rhasEuroMP(C,B) ) ).

<A NAME="risEuroMPFrom_substitution_1"></A>fof(risEuroMPFrom_substitution_1,axiom,
    ! [A,B,C] :
      ( ( A = B
        & risEuroMPFrom(A,C) )
     => risEuroMPFrom(B,C) ) ).

<A NAME="risEuroMPFrom_substitution_2"></A>fof(risEuroMPFrom_substitution_2,axiom,
    ! [A,B,C] :
      ( ( A = B
        & risEuroMPFrom(C,A) )
     => risEuroMPFrom(C,B) ) ).

<A NAME="xsd_integer_substitution_1"></A>fof(xsd_integer_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & xsd_integer(A) )
     => xsd_integer(B) ) ).

<A NAME="xsd_string_substitution_1"></A>fof(xsd_string_substitution_1,axiom,
    ! [A,B] :
      ( ( A = B
        & xsd_string(A) )
     => xsd_string(B) ) ).

%----Thing and Nothing
<A NAME="axiom_0"></A>fof(axiom_0,axiom,
    ! [X] :
      ( cowlThing(X)
      & ~ cowlNothing(X) ) ).

%----String and Integer disjoint
<A NAME="axiom_1"></A>fof(axiom_1,axiom,
    ! [X] :
      ( xsd_string(X)
    <=> ~ xsd_integer(X) ) ).

%----Enumeration cEUCountry
<A NAME="axiom_2"></A>fof(axiom_2,axiom,
    ! [X] :
      ( cEUCountry(X)
    <=> ( X = iBE
        | X = iFR
        | X = iES
        | X = iUK
        | X = iNL
        | X = iPT ) ) ).

%----Equality cEuroMP
<A NAME="axiom_3"></A>fof(axiom_3,axiom,
    ! [X] :
      ( cEuroMP(X)
    <=> ? [Y] :
          ( risEuroMPFrom(X,Y)
          & cowlThing(Y) ) ) ).

%----Domain: rhasEuroMP
<A NAME="axiom_4"></A>fof(axiom_4,axiom,
    ! [X,Y] :
      ( rhasEuroMP(X,Y)
     => cEUCountry(X) ) ).

%----Inverse: risEuroMPFrom
<A NAME="axiom_5"></A>fof(axiom_5,axiom,
    ! [X,Y] :
      ( risEuroMPFrom(X,Y)
    <=> rhasEuroMP(Y,X) ) ).

%----iBE
<A NAME="axiom_6"></A>fof(axiom_6,axiom,
    cEuropeanCountry(iBE) ).

%----iES
<A NAME="axiom_7"></A>fof(axiom_7,axiom,
    cEuropeanCountry(iES) ).

%----iFR
<A NAME="axiom_8"></A>fof(axiom_8,axiom,
    cEuropeanCountry(iFR) ).

%----iKinnock
<A NAME="axiom_9"></A>fof(axiom_9,axiom,
    cPerson(iKinnock) ).

%----iNL
<A NAME="axiom_10"></A>fof(axiom_10,axiom,
    cEuropeanCountry(iNL) ).

%----iPT
<A NAME="axiom_11"></A>fof(axiom_11,axiom,
    cEuropeanCountry(iPT) ).

%----iUK
<A NAME="axiom_12"></A>fof(axiom_12,axiom,
    cEuropeanCountry(iUK) ).

<A NAME="axiom_13"></A>fof(axiom_13,axiom,
    rhasEuroMP(iUK,iKinnock) ).

%----Thing and Nothing
%----String and Integer disjoint
%----iKinnock
<A NAME="the_axiom"></A>fof(the_axiom,conjecture,
    ( ! [X] :
        ( cowlThing(X)
        & ~ cowlNothing(X) )
    & ! [X] :
        ( xsd_string(X)
      <=> ~ xsd_integer(X) )
    & cEuroMP(iKinnock) ) ).

%------------------------------------------------------------------------------
