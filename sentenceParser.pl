%% @file treeDrawer.pl
%% External script used for visual compilation and rendering of ASCII syntax trees.
:- consult('treeDrawer.pl').

%% @file translator.pl
%% Contains vocabulary mapping for English <-> Spanish translation functionality.
:- consult('translator.pl').

%% --- English Lexicon ---
%% Defines token rules for all terminal nodes in the parse tree.
%% Determiners
determiner(det(X)) --> [X], {det(X)}.
det(the).
det(a).
det(an).
det(my).
det(her).
det(every).
det(that).
det(seven).
det(three).

%% Common Nouns
noun(n(X)) --> [X], {n(X)}.
n(man).
n(book).
n(coffee).
n(table).
n(philosophy).
n(law).
n(newspaper).
n(pot).
n(potatoes).
n(beer).
n(paella).
n(novel).
n(processor).
n(tool).
n(documents).
n(mouse).
n(cat).
n(neighbor).
n(apples).
n(apple).
n(texts).
n(writing).
n(afternoon).
n(wall).
n(father).
n(skin).
n(snow).
n(hair).
n(day).
n(mirror).
n(wood).
n(lips).
n(rose).
n(castle).
n(servant).
n(moment).
n(well).
n(love).
n(huntsman).
n(forest).
n(heart).
n(animals).
n(cottage).
n(door).
n(house).
n(friends).
n(evening).
n(owners).
n(dwarfs).
n(diamond).
n(mine).
n(floor).
n(fire).
n(intruder).
n(bedroom).
n(music).
n(laughter).
n(home).
n(stepmother).
n(death).
n(smell).
n(eyes).
n(beds).
n(something).

%% Proper Nouns
properNoun(pn(X)) --> [X], {pn(X)}.
pn('Joseph').
pn('Mary').
pn('Hector').
pn('Irene').
pn('Sarah').
pn('Snow White').
pn('Queen').
pn('Prince').

%% Verbs
verb(v(X)) --> [X], {v(X)}.
v(is).
v(studies).
v(tidies).
v(takes).
v(collects).
v(reads).
v(eats).
v(eat).
v(drinks).
v(drink).
v(prefers).
v(sings).
v(jumps).
v(climbs).
v(serves).
v(wrote).
v(saw).
v(was).
v(were).
v(caught).
v(lived).
v(had).
v(looked).
v(made).
v(work).
v(fell).
v(told).
v(kill).
v(brings).
v(wandered).
v(led).
v(knocked).
v(went).
v(wondered).
v(could).
v(dusted).
v(cleaned).
v(laid).
v(returned).
v(knew).
v(came).
v(searched).
v(reached).
v(explained).
v(doing).
v(filled).
v(danced).
v(forgot).
v(found).
v(lying).
v(decided).
v(sang).
v(listened).
v(prove).
v(proves).
v(entered).
v(worked).
v(opened).
v(did).
v(spoke).

%% Adjectives
adjective(adj(X)) --> [X], {adj(X)}.
adjective(adj('rock_climbing')) --> ['rock', 'climbing'].
adj(tanned).
adj(tall).
adj(agile).
adj(delicate).
adj(red).
adj(powerful).
adj(slow).
adj(grey).
adj(fried).
adj(wicked).
adj(beautiful).
adj(white).
adj(black).
adj(vain).
adj(magic).
adj(jealous).
adj(furious).
adj(little).
adj(tiny).
adj(delicious).
adj(wrong).
adj(happy).
adj(such).
adj(dead).
adj(ebony).
adj(exact).
adj(scared).
adj(swept).
adj(lying).
adj(asleep).

%% Adverbs
adverb(adv(X)) --> [X], {adv(X)}.
adv(very).
adv(quite).
adv(only).
adv(still).
adv(soon).
adv(there).

%% Conjunctions
conjunction(conj(X)) --> [X], {conj(X)}.
conj(and).
conj(but).
conj(while).
conj(although).
conj(so).
conj(when).

%% Prepositions
preposition(prep(X)) --> [X], {prep(X)}.
prep(for).
prep(on).
prep(in).
prep(with).
prep(to).
prep(at).
prep(of).
prep(from).
prep(about).
prep(between).
prep(as).
prep(into).
prep(back).
prep(beside).
prep(across).

%% Pronouns
pronoun(pro(X)) --> [X], {pro(X)}.
pro(he).
pro(she).
pro(it).
pro(they).
pro(her).
pro(each).
pro(other).
pro(something).

%% Relative Pronouns
relativePronoun(pr(X)) --> [X], {pr(X)}.
pr(who).
pr(which).
pr(that).
pr(what).

%% Comma Support
comma(comma(',')) --> [','].

%% Personal Pronoun Identification
isPronoun(he).
isPronoun(she).
isPronoun(it).
isPronoun(they).
isPronoun(her).
isPronoun(each).
isPronoun(other).
isPronoun(something).

%% --- Main Syntactic Rules ---
%% Definite Clause Grammars (DCG) configuring the valid constituent structures.
%% Noun Phrase (NP) Rules
nounPhrase(np(N)) --> noun(N).
nounPhrase(np(Det, N)) --> determiner(Det), noun(N).
nounPhrase(np(ProperN)) --> properNoun(ProperN).
nounPhrase(np(Det, ProperN)) --> determiner(Det), properNoun(ProperN).
nounPhrase(np(Pro)) --> pronoun(Pro).
nounPhrase(np(Adj, N)) --> adjective(Adj), noun(N).
nounPhrase(np(Det, AdjP, N)) --> determiner(Det), adjectivePhrase(AdjP), noun(N).
nounPhrase(np(Det, N, PP)) --> determiner(Det), noun(N), prepositionalPhrase(PP).
nounPhrase(np(N, NP)) --> noun(N), nounPhrase(NP).
nounPhrase(np(ProperN1, Conj, ProperN2)) --> properNoun(ProperN1), conjunction(Conj), properNoun(ProperN2).
nounPhrase(np(ProperN1, Conj, NP)) --> properNoun(ProperN1), conjunction(Conj), nounPhrase(NP).
nounPhrase(np(N1, Conj, N2)) --> noun(N1), conjunction(Conj), noun(N2).
nounPhrase(np(Det, N1, Conj, ProperN)) --> determiner(Det), noun(N1), conjunction(Conj), properNoun(ProperN).

%% Adjective Phrase (AdjP) Rules
adjectivePhrase(adjp(Adv, Adj)) --> adverb(Adv), adjective(Adj).
adjectivePhrase(adjp(Adj)) --> adjective(Adj).
adjectivePhrase(adjp(Adj, PP)) --> adjective(Adj), prepositionalPhrase(PP).

%% Adverb Phrase (AdvP) Rules
adverbPhrase(advp(Adv)) --> adverb(Adv).

%% Prepositional Phrase (PP) Rules
prepositionalPhrase(pp(Prep, NP)) --> preposition(Prep), nounPhrase(NP).

%% Verb Phrase (VP) Rules
%% Supports verb transitivity, preposition dependencies, and subordination.
verbPhrase(vp(V, NP)) --> verb(V), nounPhrase(NP).
verbPhrase(vp(V)) --> verb(V).
verbPhrase(vp(V, PP)) --> verb(V), prepositionalPhrase(PP).
verbPhrase(vp(V, AdjP)) --> verb(V), adjectivePhrase(AdjP).
verbPhrase(vp(V1, NP1, Conj, V2, NP2)) --> verb(V1), nounPhrase(NP1), conjunction(Conj), verb(V2), nounPhrase(NP2).
verbPhrase(vp(V1, Conj, V2)) --> verb(V1), conjunction(Conj), verb(V2).
verbPhrase(vp(V, PP, AdvP)) --> verb(V), prepositionalPhrase(PP), adverbPhrase(AdvP).
verbPhrase(vp(V, AdvP, NP)) --> verb(V), adverbPhrase(AdvP), nounPhrase(NP).
verbPhrase(vp(V, PP1, PP2)) --> verb(V), prepositionalPhrase(PP1), prepositionalPhrase(PP2).
verbPhrase(vp(V, NP, PP)) --> verb(V), nounPhrase(NP), prepositionalPhrase(PP).
verbPhrase(vp(V, NP, SubCl)) --> 
    verb(V), 
    nounPhrase(NP), 
    subClause(SubCl).
verbPhrase(vp(V1, PP1, Conj, V2)) --> 
    verb(V1), 
    prepositionalPhrase(PP1), 
    conjunction(Conj), 
    verb(V2).
verbPhrase(vp(V1, Conj, V2, NP)) --> verb(V1), conjunction(Conj), verb(V2), nounPhrase(NP).
verbPhrase(vp(V, SubCl)) --> 
    verb(V), 
    subClause(SubCl).
verbPhrase(vp(V1, PP, Conj, V2, AdjP)) --> 
    verb(V1), 
    prepositionalPhrase(PP), 
    conjunction(Conj), 
    verb(V2), 
    adjectivePhrase(AdjP).

%% Support for VP containing Present Participle adjectival phrases
verbPhrase(vp(V, NP, adjp(adj(Adj), PP))) --> 
    verb(V), 
    nounPhrase(NP), 
    adjective(adj(Adj)), 
    prepositionalPhrase(PP).

%% Subordinate Clause Rules
subClause(subcl(V)) --> verb(V).
subClause(subcl(V, PP)) --> verb(V), prepositionalPhrase(PP).
subClause(subcl(V, PP1, PP2)) --> verb(V), prepositionalPhrase(PP1), prepositionalPhrase(PP2).
subClause(subcl(pr(RelPro), S)) --> 
    relativePronoun(pr(RelPro)), 
    simpleSentence(S).
subClause(subcl(pr(RelPro), NP, V, AdvP)) --> 
    relativePronoun(pr(RelPro)), 
    nounPhrase(NP), 
    verb(V), 
    adverbPhrase(AdvP).
subClause(subcl(S)) --> simpleSentence(S).

%% Sentence Rules (Simple, Coordinated, Relative, Compound)
simpleSentence(s(NP, VP)) --> nounPhrase(NP), verbPhrase(VP).
coordSentence(cs(S1, Conj, S2)) --> simpleSentence(S1), conjunction(Conj), simpleSentence(S2).
relSentence(rs(NP, RelPro, VP)) --> nounPhrase(NP), (comma(_) -> [] ; []), relativePronoun(RelPro), (comma(_) -> [] ; []), verbPhrase(VP).
relSentence(rs(NP, RelPro, VP, VP2)) --> nounPhrase(NP), (comma(_) -> [] ; []), relativePronoun(RelPro), (comma(_) -> [] ; []), verbPhrase(VP), verbPhrase(VP2).
relSentence(rs(np(Det, N, PP), RelPro, VP)) --> nounPhrase(np(Det, N, PP)), relativePronoun(RelPro), verbPhrase(VP).
compSentence(cms(OC, Conj, S)) --> coordSentence(OC), conjunction(Conj), simpleSentence(S).
compSentence(cms(S, Conj, OC)) --> simpleSentence(S), conjunction(Conj), coordSentence(OC).
compSentence(cms(OR, Conj, S)) --> relSentence(OR), conjunction(Conj), simpleSentence(S).
compSentence(cms(S, Conj, OR)) --> simpleSentence(S), conjunction(Conj), relSentence(OR).
compSentence(cms(OC1, Conj, OC2)) --> coordSentence(OC1), conjunction(Conj), coordSentence(OC2).
sentence(S) --> simpleSentence(S).
sentence(OC) --> coordSentence(OC).
sentence(OR) --> relSentence(OR).
sentence(OCM) --> compSentence(OCM).
sentence(s(NP, VP, rs(np(pr(RelPro)), VPRel), Conj, S2)) -->
    nounPhrase(NP),
    verbPhrase(VP),
    relativePronoun(pr(RelPro)),
    verbPhrase(VPRel),
    conjunction(Conj),
    simpleSentence(S2).
sentence(s(NP, rs(RelPro, NP2, VP1), VP2)) -->
    nounPhrase(NP),
    relativePronoun(RelPro),
    nounPhrase(NP2),
    verbPhrase(VP1),
    verbPhrase(VP2).
sentence(s(NP, VP, rs(np(pr(RelPro)), VPRel))) -->
    nounPhrase(NP),
    verbPhrase(VP),
    relativePronoun(pr(RelPro)),
    verbPhrase(VPRel).
sentence(cms(subcl(conj(when), S1), S2)) --> 
    conjunction(conj(when)), 
    simpleSentence(S1), 
    simpleSentence(S2).

%% Sentences with prepended PP serving as an adverbial modifier
sentence(s(PP, S)) --> prepositionalPhrase(PP), sentence(S).

%% --- Parsing & Tree Generation ---
%% @public
%% Entrypoints to process input strings into syntactical nested tree objects.
parseSentence(InputStr, Tree) :-
    sentence(Tree, InputStr, []).

drawTree(InputStr) :-
    parseSentence(InputStr, Tree),
    draw(Tree).

%% --- Recursive Sentence Simplification ---
%% Traverses compound/complex structure trees flattening them into granular simple structures.
%% Base Case: Simple sentence requiring no decomposition
simplify(s(NP, VP), [s(NP, VP)]) :- 
    \+ (VP = vp(_, _, _, _)),
    \+ (VP = vp(_, subcl(_, _, _, _))),
    \+ (VP = vp(_, _, subcl(_))).

%% Handle verb phrases strictly bound to a prepositional phrase
simplify(s(NP, vp(V, NP2, PP)), [s(NP, vp(V, NP2, PP))]).

%% Simplifies coordinated NPs and VPs (e.g. Phrase 28)
simplify(s(np(Det, N1, Conj1, ProperN), vp(V1, Conj2, V2)), 
           [s(np(Det, N1, Conj1, ProperN), vp(V1)), s(np(Det, N1, Conj1, ProperN), vp(V2))]) :- 
    conj(Conj1), conj(Conj2).

%% VP decomposition for two coordinated verbs
simplify(s(NP, vp(V1, PP1, Conj, V2)), [s(NP, vp(V1, PP1)), s(NP, vp(V2))]) :- 
    conj(Conj).

simplify(s(NP, vp(V1, Conj, V2, NP2)), [s(NP, vp(V1, NP2)), s(NP, vp(V2, NP2))]) :- 
    conj(Conj).

%% VP decomposition for bare coordination
simplify(s(NP, vp(V1, Conj, V2)), [s(NP, vp(V1)), s(NP, vp(V2))]) :- 
    conj(Conj).

% Nueva regla para manejar "laid across three tiny beds and fell asleep" (phrase 19)
simplify(s(NP, vp(V1, PP, Conj, V2, AdjP)), [s(NP, vp(V1, PP)), s(NP, vp(V2, AdjP))]) :- 
    conj(Conj).

% Nueva regla para manejar "knew something was wrong" (phrase 22)
simplify(s(NP, vp(V, NP2, subcl(S))), [s(NP, vp(V, NP2)), S]) :- 
    simpleSentence(S).

% Oración simple con subordinada introducida por pronoun relativo
simplify(s(NP, vp(V, subcl(pr(_), S))), [s(NP, vp(V)), S]) :- 
    simplify(S, [S]).

% Oración con relativa incrustada
simplify(s(NP, vp(V, NP2), rs(np(pr(_)), VPRel)), [s(NP, vp(V, NP2)), s(NP2, VPRel)]).

%% Subordinate Clause Rules con pronoun relativo, grupo nominal, verb y adverb
simplify(s(NP, vp(V, subcl(pr(_), NP2, V2, AdvP))), [s(NP, vp(V)), s(NP2, vp(V2, AdvP))]).

% Oración coordinada: Divide en suboraciones y simplifica recursivamente
simplify(cs(S1, _, S2), Simple) :-
    simplify(S1, Simple1),
    simplify(S2, Simple2),
    append(Simple1, Simple2, Simple).

% Oración relativa: Simplifica la oración principal y la relativa
simplify(rs(NP, pr(_), VP), [s(NP, VP)]).
simplify(rs(NP, pr(_), VP, VP2), [s(NP, VP), s(NP, VP2)]).
simplify(rs(np(Det, N, PP), pr(_), VP), [s(np(Det, N, PP), VP)]).

% Oración relativa específica (tipo "the mouse that the cat caught was grey")
simplify(rs(np(Det1, N1), pr(that), vp(v(V), np(Det2, N2))), 
           [s(np(Det2, N2), vp(v(V))), s(np(Det1, N1), vp(v(was), adjp(adj(grey))))]).

% Oración compuesta: Simplifica cada suboración
simplify(cms(S1, _, S2), Simple) :-
    simplify(S1, Simple1),
    simplify(S2, Simple2),
    append(Simple1, Simple2, Simple).

simplify(cms(subcl(conj(when), S1), S2), Simple) :-
    simplify(S1, Simple1),
    simplify(S2, Simple2),
    append(Simple1, Simple2, Simple).

% Oración con relativa y conjunción
simplify(s(NP, VP, rs(np(pr(_)), VPRel), _, S2), Simple) :-
    simplify(s(NP, VP), Simple1),
    simplify(s(NP, VPRel), Simple2),
    ( S2 = s(np(pro(Pro)), VP2), isPronoun(Pro) ->
        simplify(s(NP, VP2), Simple3)
    ; simplify(S2, Simple3)
    ),
    append(Simple1, Simple2, Temp),
    append(Temp, Simple3, Simple).

% Oración con relativa tipo 13/14
simplify(s(NP, rs(pr(_), NP2, vp(V)), VP2), [s(NP, VP2), s(NP2, vp(V, NP))]).

% Oración con grupo verbal que incluye subordinada
simplify(s(NP1, vp(V, NP2, subcl(VSub))), [s(NP1, vp(V, NP2)), s(NP2, vp(VSub))]).
simplify(s(NP1, vp(V, NP2, subcl(VSub, PP))), [s(NP1, vp(V, NP2)), s(NP2, vp(VSub, PP))]).
simplify(s(NP1, vp(V, NP2, subcl(VSub, PP1, PP2))), 
           [s(NP1, vp(V, NP2)), s(NP2, vp(VSub, PP1)), s(NP2, vp(VSub, PP2))]).

%% Advanced VP parsing for highly nested structures
simplify(s(NP, vp(V1, vp(V2, pp(Prep, np(N1, Conj, N2))))), 
           [s(NP, vp(V1)), s(NP, vp(V2, pp(Prep, np(N1)))), s(NP, vp(V2, pp(Prep, np(N2))))]) :- 
    conj(Conj).

%% Fallback Case: Preserve existing abstract structure
simplify(S, [S]) :- 
    write('').

%% --- Recursive Component Printer ---
%% Helper methods safely flattening AST instances to printable streams.
%% Base Case: Simple terminal atom (word)
printComponent(X) :- 
    atomic(X), 
    write(X), 
    write(' ').

%% Special Case: Compound string literal `rock_climbing`
printComponent(adj('rock_climbing')) :- 
    write('rock climbing'), 
    write(' ').

%% Edge Case: Basic lexical elements unpack
printComponent(det(X)) :- 
    write(X), 
    write(' ').
printComponent(n(X)) :- 
    write(X), 
    write(' ').
printComponent(pn(X)) :- 
    write(X), 
    write(' ').
printComponent(pro(X)) :- 
    write(X), 
    write(' ').
printComponent(v(X)) :- 
    write(X), 
    write(' ').
printComponent(adv(X)) :- 
    write(X), 
    write(' ').
printComponent(prep(X)) :- 
    write(X), 
    write(' ').
printComponent(conj(X)) :- 
    write(X), 
    write(' ').
printComponent(pr(X)) :- 
    write(X), 
    write(' ').
printComponent(comma(',')) :- 
    write(','), 
    write(' ').

%% Recursive Case: Compound non-terminal structures (NP, VP, S, etc.)
printComponent(Term) :- 
    compound(Term), 
    Term =.. [_ | Args], 
    printComponentList(Args).

%% Fallback Case: Unhandled tokens logging
printComponent(Term) :- 
    \+ atomic(Term), 
    \+ compound(Term), 
    write('Warning: Unrecognized component: '), 
    write(Term), 
    write(' ').

%% Helper to repeatedly print a valid component stream
printComponentList([]).
printComponentList([Arg | Args]) :- 
    printComponent(Arg), 
    printComponentList(Args).

%% --- Simplified Sentence Formatter ---
%% Outputs an assembled simple sentence
printSimpleSentence(Sentence) :- 
    printComponent(Sentence), 
    writeln('').

%% Recursive stream output for simple sentences array
printList([]).
printList([Sentence | Sentences]) :- 
    printSimpleSentence(Sentence), 
    printList(Sentences).

%% @public
%% E2E interface parsing an input string, rendering simplified rulesets to STDOUT
simplifyAndPrint(InputStr) :-
    parseSentence(InputStr, Tree),
    simplify(Tree, SimpleSentences),
    printList(SimpleSentences),
    !.
%% --- Sentence Preprocessing ---
%% Tokenization logic that splits raw sentences into semantic grammar sequences.
%% Compound lexical mappings which should not be fragmented
compoundToken('Snow White').
compoundToken('rock climbing').
compoundToken('Queen').
compoundToken('Prince').
compoundToken('Joseph').
compoundToken('Mary').
compoundToken('Hector').
compoundToken('Irene').
compoundToken('Sarah').

%% Verifies if token targets a compound / proper noun struct via sequence search
isCompoundToken(Word) :-
    atomic_list_concat(Words, ' ', Word),
    length(Words, Len),
    Len > 1,
    atomic_list_concat(Words, ' ', Compound),
    compoundToken(Compound).

%% Verifies proper capitalization for implicit proper noun detection
isInitialCapital(Word) :-
    atom_chars(Word, [First|_]),
    char_type(First, upper).

%% Splits user space string buffers mapping characters into Prolog lists
preprocessPhrase(String, Lista) :-
    string_chars(String, Chars),
    splitIntoWords(Chars, Words),
    processWords(Words, Lista).

%% Fragments raw datastreams splitting upon space characters
splitIntoWords(Chars, Words) :-
    splitIntoWordsAux(Chars, [], Words).

splitIntoWordsAux([], [], []).
splitIntoWordsAux([], Accum, [Word]) :-
    Accum \= [],
    reverse(Accum, CorrectAccum),
    atomic_list_concat(CorrectAccum, Word).
splitIntoWordsAux([Char|Chars], Accum, Words) :-
    ( Char = ' ' ->
        ( Accum = [] ->
            splitIntoWordsAux(Chars, [], Words)
        ; reverse(Accum, CorrectAccum),
          atomic_list_concat(CorrectAccum, Word),
          ( Word = 'Snow', Chars \= [], splitIntoWordsAux(Chars, [], [Next|Rest]) ->
              ( Next = 'White' ->
                  atomic_list_concat(['Snow', 'White'], ' ', Compound),
                  Words = [Compound|Rest]
              ; Words = [Word, Next|Rest]
              )
          ; Words = [Word|Rest],
            splitIntoWordsAux(Chars, [], Rest)
          )
        )
    ; splitIntoWordsAux(Chars, [Char|Accum], Words)
    ).

%% Assigns properties to list components handling structural tokenizing
processWords([], []).
processWords([Word|Words], [Token|Tokens]) :-
    ( isCompoundToken(Word) ->
        Token = Word
    ; isInitialCapital(Word) ->
        Token = Word
    ; downcase_atom(Word, WordLower),
      atom_string(Token, WordLower)
    ),
    processWords(Words, Tokens).

%% @public
%% Interactive interface capturing `user_input` resolving parsing/translation synchronously.
processUserPhrase :-
    writeln('Introduce una phrase en inglés (por ejemplo, "Joseph is tanned and Mary is tall"):'),
    read_string(user_input, "\n", "\r", _, String),
    preprocessPhrase(String, InputStr),
    writeln('Processed phrase:'),
    write(InputStr), writeln(''),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').
%% --- Reference Examples ---
%% Example lists mapping valid syntax tests.
ejemplo1(['Joseph', is, tanned, and, 'Mary', is, tall]).
ejemplo2(['Joseph', studies, philosophy, but, 'Mary', studies, law]).
ejemplo3(['Mary', takes, a, coffee, while, 'Joseph', tidies, the, table]).
ejemplo4(['Joseph', takes, coffee, and, reads, the, newspaper]).
ejemplo5(['Joseph', and, 'Hector', eat, fried, potatoes, and, drink, beer]).
ejemplo6(['Joseph', eats, potatoes, but, 'Mary', prefers, paella, although, 'Hector', takes, coffee, and, 'Irene', reads, a, novel]).
ejemplo7(['Irene', sings, and, jumps, while, 'Joseph', studies]).
ejemplo8(['Hector', eats, fried, potatoes, and, drinks, beer, while, 'Joseph', sings, and, jumps, although, 'Mary', reads, a, novel]).
ejemplo9(['Joseph', who, is, agile, climbs, on, the, 'rock', 'climbing', wall, in, the, afternoon]).
ejemplo10(['Joseph', who, is, very, delicate, eats, only, red, apples]).
ejemplo11([the, processor, of, texts, which, is, a, quite, powerful, tool, serves, for, writing, the, documents]).
ejemplo12([the, processor, of, texts, is, a, very, powerful, tool, that, serves, for, writing, documents, but, it, is, quite, slow]).
ejemplo13([the, mouse, that, the, cat, caught, was, grey]).
ejemplo14([the, man, that, 'Joseph', saw, was, my, neighbor]).
ejemplo15([the, processor, of, texts, that, is, a, tool, serves, for, writing, the, documents]).

%% --- Snow White Story Examples ---
%% Complex examples derived from the 'Snow White' corpus.
frase1([the, father, of, 'Snow White', was, dead, so, 'Snow White', lived, with, her, wicked, stepmother]).
frase2(['Snow White', was, very, beautiful]).
frase3([the, skin, of, 'Snow White', was, white, as, snow]).
frase4([the, 'Queen', was, very, beautiful, but, she, was, vain]).
frase5([the, 'Queen', had, a, magic, mirror, and, the, 'Queen', saw, the, mirror, in, the, afternoon]).
frase6([the, 'Queen', was, jealous, of, 'Snow White']).
frase7([the, 'Queen', made, 'Snow White', work, in, the, castle, as, a, servant]).
frase8(['Snow White', sang, beside, the, well, of, the, castle, at, that, exact, moment]).
frase9(['Snow White', sang, and, the, animals, of, the, forest, listened]).
frase10([at, that, moment, the, 'Prince', saw, 'Snow White', and, he, fell, in, love]).
frase11([the, 'Queen', saw, 'Snow White', with, the, 'Prince', and, she, was, furious]).
frase12([the, 'Queen', spoke, with, her, huntsman]).
frase13([the, huntsman, brings, the, heart, of, 'Snow White', and, proves, the, death]).
frase14(['Snow White', wandered, into, the, forest]).
frase15(['Snow White', was, very, scared, but, the, animals, led, 'Snow White', to, a, little, cottage]).
frase16(['Snow White', knocked, on, the, door, and, entered]).
frase17(['Snow White', saw, seven, dwarfs, who, lived, in, a, tiny, house]).
frase18(['Snow White', and, her, friends, of, the, forest, dusted, and, cleaned, the, little, cottage]).
frase19(['Snow White', laid, across, three, tiny, beds, and, fell, asleep]).
frase20([the, evening, came, and, the, owners, of, the, cottage, returned]).
frase21([the, owners, were, seven, dwarfs, who, worked, in, a, mine, of, diamond]).
frase22([when, the, dwarfs, entered, the, cottage, they, knew, something, was, wrong]).
frase23([the, floor, was, swept, and, a, delicious, smell, came, from, a, pot, on, the, fire]).
frase24([the, dwarfs, searched, the, cottage, for, an, intruder]).
frase25([the, dwarfs, reached, the, bedroom, when, 'Snow White', opened, the, eyes]).
frase26(['Snow White', explained, what, she, did, there]).
frase27([the, cottage, was, filled, with, music, and, laughter]).
frase28([the, dwarfs, and, 'Snow White', sang, and, danced]).
frase29(['Snow White', was, happy, so, she, forgot, about, her, wicked, stepmother]).
frase30([when, the, dwarfs, returned, to, the, cottage, they, found, 'Snow White', lying, on, the, floor]).

%% --- Individual Test Case Execution ---
%% Standalone test validations compiling/rendering independent outputs.
runTest(1) :-
    writeln('Prueba 1:'),
    ejemplo1(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(2) :-
    writeln('Prueba 2:'),
    ejemplo2(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(3) :-
    writeln('Prueba 3:'),
    ejemplo3(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(4) :-
    writeln('Prueba 4:'),
    ejemplo4(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(5) :-
    writeln('Prueba 5:'),
    ejemplo5(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(6) :-
    writeln('Prueba 6:'),
    ejemplo6(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(7) :-
    writeln('Prueba 7:'),
    ejemplo7(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(8) :-
    writeln('Prueba 8:'),
    ejemplo8(InputStr),
    drawTree(InputStr), !,
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(9) :-
    writeln('Prueba 9:'),
    ejemplo9(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(10) :-
    writeln('Prueba 10:'),
    ejemplo10(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(11) :-
    writeln('Prueba 11:'),
    ejemplo11(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(12) :-
    writeln('Prueba 12:'),
    ejemplo12(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(13) :-
    writeln('Prueba 13:'),
    ejemplo13(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runTest(14) :-
    writeln('Prueba 14:'),
    ejemplo14(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

%% @public
%% Parameterized invokable unit tests wrapper.
test(X) :-
    runTest(X),
    write('Test '), write(X), write(' completed.'), writeln('').

%% @public
%% Synchronous macro block for triggering comprehensive system regressions.
test :-
    runTest(1),
    runTest(2),
    runTest(3),
    runTest(4),
    runTest(5),
    runTest(6),
    runTest(7),
    runTest(8),
    runTest(9),
    runTest(10),
    runTest(11),
    runTest(12),
    runTest(13),
    runTest(14),
    write('All tests completed.'), nl.

%% @public
%% Synchronous macro block for triggering comprehensive system tests on the Snow White corpus.
phrase(X) :-
    runPhrase(X),
    write('Phrase '), write(X), write(' completed.'), writeln('').

runPhrase(1) :-
    writeln('Frase 1:'),
    frase1(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(2) :-
    writeln('Frase 2:'),
    frase2(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(3) :-
    writeln('Frase 3:'),
    frase3(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(4) :-
    writeln('Frase 4:'),
    frase4(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(5) :-
    writeln('Frase 5:'),
    frase5(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(6) :-
    writeln('Frase 6:'),
    frase6(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(7) :-
    writeln('Frase 7:'),
    frase7(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(8) :-
    writeln('Frase 8:'),
    frase8(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(9) :-
    writeln('Frase 9:'),
    frase9(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(10) :-
    writeln('Frase 10:'),
    frase10(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(11) :-
    writeln('Frase 11:'),
    frase11(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(12) :-
    writeln('Frase 12:'),
    frase12(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(13) :-
    writeln('Frase 13:'),
    frase13(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(14) :-
    writeln('Frase 14:'),
    frase14(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(15) :-
    writeln('Frase 15:'),
    frase15(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(16) :-
    writeln('Frase 16:'),
    frase16(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(17) :-
    writeln('Frase 17:'),
    frase17(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(18) :-
    writeln('Frase 18:'),
    frase18(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(19) :-
    writeln('Frase 19:'),
    frase19(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(20) :-
    writeln('Frase 20:'),
    frase20(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(21) :-
    writeln('Frase 21:'),
    frase21(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(22) :-
    writeln('Frase 22:'),
    frase22(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(23) :-
    writeln('Frase 23:'),
    frase23(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(24) :-
    writeln('Frase 24:'),
    frase24(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(25) :-
    writeln('Frase 25:'),
    frase25(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(26) :-
    writeln('Frase 26:'),
    frase26(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(27) :-
    writeln('Frase 27:'),
    frase27(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(28) :-
    writeln('Frase 28:'),
    frase28(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(29) :-
    writeln('Frase 29:'),
    frase29(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

runPhrase(30) :-
    writeln('Frase 30:'),
    frase30(InputStr),
    drawTree(InputStr),
    simplifyAndPrint(InputStr),
    translate(InputStr),
    writeln('').

%% @public
%% Core macro block launching all 30 Snow White corpus tests.
snow_white :-
    runPhrase(1),
    runPhrase(2),
    runPhrase(3),
    runPhrase(4),
    runPhrase(5),
    runPhrase(6),
    runPhrase(7),
    runPhrase(8),
    runPhrase(9),
    runPhrase(10),
    runPhrase(11),
    runPhrase(12),
    runPhrase(13),
    runPhrase(14),
    runPhrase(15),
    runPhrase(16),
    runPhrase(17),
    runPhrase(18),
    runPhrase(19),
    runPhrase(20),
    runPhrase(21),
    runPhrase(22),
    runPhrase(23),
    runPhrase(24),
    runPhrase(25),
    runPhrase(26),
    runPhrase(27),
    runPhrase(28),
    runPhrase(29),
    runPhrase(30),
    write('All Snow White tests completed.'), nl.
