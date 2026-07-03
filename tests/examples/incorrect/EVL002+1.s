%------------------------------------------------------------------------------
% File     : EVL002+1.s : ProoVer 2026
% Proof    : Problems/EVL002+1.p
% Source   : ProoVer 2026
% Status   : Unknown
% SPC      : FOF_UNK_RFO_PEQ
%------------------------------------------------------------------------------
% SZS output start Proof
fof(a1, axiom, ![X] : (f(f(X)) = f(g(X)) | g(f(X)) = f(f(X))), file('Problems/EVL002+1.p',a1)).
fof(c, conjecture, g(f(a)) = f(g(a)), file('Problems/EVL002+1.p',c)).
fof(s1, negated_conjecture, ~(g(f(a)) = f(g(a))), inference(negated_conjecture, [status(cth)], [c])).
fof(s2, plain, f(f(a)) = f(g(a)), inference(deduction, [status(thm)], [a1])).
fof(s3, plain, f(f(a)) = g(f(a)), inference(deduction, [status(thm)], [a1])).
fof(s4, plain, g(f(a)) = f(g(a)), inference(deduction, [status(thm)], [s2, s3])).
fof(s5, plain, $false, inference(deduction, [status(thm)], [s1, s4])).
% SZS output end Proof
