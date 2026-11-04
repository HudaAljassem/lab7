member1(X, [X|_]).
member1(X, [_|Tail]) :-
    member1(X, Tail).

conc([], List, List).
conc([Head|Tail], List, [Head|Result]) :-
    conc(Tail, List, Result).

add(X, List, [X|List]).

del(X, [X|Tail], Tail).
del(X, [Head|Tail], [Head|Result]) :-
    del(X, Tail, Result).

deleteElement(_, [], []).
deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).
deleteElement(X, [Head|Tail], [Head|Result]) :-
    X \= Head,
    deleteElement(X, Tail, Result).

add_at_the_end(X, [], [X]).
add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).

shopping :-
    shopping_menu([milk, bread, eggs, rice, juice]).

shopping_menu(Basket) :-
    nl,
    write('Shopping Program'), nl,
    write('d - Display all items'), nl,
    write('a - Add an item'), nl,
    write('e - Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    shopping_choice(Choice, Basket).

shopping_choice(d, Basket) :-
    nl,
    write('Shopping basket:'), nl,
    display_items(Basket),
    shopping_menu(Basket).

shopping_choice(a, Basket) :-
    write('Enter the item to add: '),
    read(Item),
    add_at_the_end(Item, Basket, NewBasket),
    shopping_menu(NewBasket).

shopping_choice(e, _) :-
    write('Goodbye!'), nl.

shopping_choice(_, Basket) :-
    write('Invalid choice. Please choose d, a, or e.'), nl,
    shopping_menu(Basket).

display_items([]).
display_items([Head|Tail]) :-
    write(Head), nl,
    display_items(Tail).
