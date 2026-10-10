% Lab 5 - The Simpsons Family Tree
% Gender facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).
% Parent facts
parent(abraham,herb).
parent(mona,herb).
parent(abraham,homer).
parent(mona,homer).
parent(clancy,marge).
parent(jackie,marge).
parent(clancy,patty).
parent(jackie,patty).
parent(clancy,selma).
parent(jackie,selma).
parent(homer,bart).
parent(marge,bart).
parent(homer,lisa).
parent(marge,lisa).
parent(homer,maggie).
parent(marge,maggie).
parent(selma,ling).

% Rules
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
son(X,Y):-parent(Y,X),male(X).
daughter(X,Y):-parent(Y,X),female(X).
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\=Y.
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\=Y.
grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).
aunt(X,Y):-sister(X,Z),parent(Z,Y).
uncle(X,Y):-brother(X,Z),parent(Z,Y).
cousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B),X\=Y.
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y),X\=Y.
