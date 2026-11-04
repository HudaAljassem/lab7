% ARTI 303 - Lab 7: Lists
% Task 1: Delete every occurrence of an element.
% Task 2: Add an element at the end of a list.

% Task 1
deleteElement(_, [], []).

deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).

deleteElement(X, [Head|Tail], [Head|Result]) :-
    X \= Head,
    deleteElement(X, Tail, Result).


% Task 2
add_at_the_end(X, [], [X]).

add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).
