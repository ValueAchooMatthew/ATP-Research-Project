% Proof: Problems/example1_c.p
fof(a1, axiom, p(a), file('Problems/example1_c.p', a1)).
fof(c, conjecture, ! [X] : p(X), file('Problems/example1_c.p', c)).
fof(s1, negated_conjecture, ~ ( ! [X] : p(X) ), inference(negated_conjecture, [status(cth)], [c])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
