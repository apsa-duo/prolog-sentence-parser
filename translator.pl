%% ----------------------------------
%% English-Spanish Translator Interface
%% ----------------------------------

%% --- SENTENCE MAPPINGS ---
sentence(spa, s(NP,VP)) --> p_nominal(spa, NP), p_verbal(spa, VP).
sentence(spa, cs(S1, Conj, S2)) --> sentence(spa, S1), conjunction(spa, Conj), sentence(spa, S2).
sentence(spa, rs(NP, RelPro, VP)) --> p_nominal(spa, NP), relativePronoun(spa, RelPro), p_verbal(spa, VP).

sentence(eng, s(NP,VP)) --> p_nominal(eng, NP), p_verbal(eng, VP).
sentence(eng, cs(S1, Conj, S2)) --> sentence(eng, S1), conjunction(eng, Conj), sentence(eng, S2).
sentence(eng, rs(NP, RelPro, VP)) --> p_nominal(eng, NP), relativePronoun(eng, RelPro), p_verbal(eng, VP).

%% --- NOUN PHRASE MAPPINGS ---
p_nominal(Language, NP) --> nounPhrase(Language, NP).

nounPhrase(spa, np(N)) --> noun(spa, N).
nounPhrase(spa, np(D,N)) --> determiner(spa, D), noun(spa, N).
nounPhrase(spa, np(ProperN)) --> properNoun(spa, ProperN).
nounPhrase(spa, np(Pro)) --> pronoun(spa, Pro).

nounPhrase(eng, np(N)) --> noun(eng, N).
nounPhrase(eng, np(D,N)) --> determiner(eng, D), noun(eng, N).
nounPhrase(eng, np(ProperN)) --> properNoun(eng, ProperN).
nounPhrase(eng, np(Pro)) --> pronoun(eng, Pro).

%% --- VERB PHRASE MAPPINGS ---
p_verbal(Language, vp(V)) --> verb(Language, V).
p_verbal(Language, vp(V, NP)) --> verb(Language, V), p_nominal(Language, NP).

%% --- BILINGUAL DICTIONARY MATRIX ---

%% Determiners
determiner(spa, det(X)) --> [X], {det(X,_)}.
determiner(eng, det(X)) --> [Y], {det(X,Y)}.

det(el, the).
det(la, the).
det(un, a).
det(una, a).
det(un, an).
det(mi, my).
det(su, her).
det(cada, every).
det(que, that).

%% Nouns
noun(spa, n(X)) --> [X], {n(X,_)}.
noun(eng, n(X)) --> [Y], {n(X,Y)}.

n(hombre, man).
n(libro, book).
n(cafe, coffee).
n(mesa, table).
n(filosofia, philosophy).
n(derecho, law).
n(periodico, newspaper).
n(patatas, potatoes).
n(cerveza, beer).
n(paella, paella).
n(novela, novel).
n(procesador, processor).
n(herramienta, tool).
n(documentos, documents).
n(raton, mouse).
n(gato, cat).
n(vecino, neighbor).
n(manzanas, apples).
n(manzana, apple).
n(textos, texts).
n(tarde, afternoon).
n(pared, wall).
n(padre, father).
n(piel, skin).
n(nieve, snow).
n(cabello, hair).
n(dia, day).
n(espejo, mirror).
n(madera, wood).
n(labios, lips).
n(rosa, rose).
n(castillo, castle).
n(sirvienta, servant).
n(momento, moment).
n(pozo, well).
n(amores, love).
n(cazador, huntsman).
n(bosque, forest).
n(corazon, heart).
n(animales, animals).
n(cabana, cottage).
n(puerta, door).
n(casa, house).
n(amigos, friends).
n(anochecer, evening).
n(duenos, owners).
n(enanos, dwarfs).
n(diamante, diamond).
n(mina, mine).
n(suelo, floor).
n(fuego, fire).
n(intruso, intruder).
n(dormitorio, bedroom).
n(musica, music).
n(risa, laughter).
n(hogar, home).
n(madrastra, stepmother).
n(muerte, death).
n(olor, smell).
n(roca, rock).
n(escalada, climbing).
n(olla, pot).
n(ojos, eyes).
n(camas, beds). 
n(algo, something).

%% Proper Nouns
properNoun(spa, pn(X)) --> [X], {pn(X,_)}.
properNoun(eng, pn(X)) --> [Y], {pn(X,Y)}.

pn('Jose', 'Joseph').
pn('Maria', 'Mary').
pn('Hector', 'Hector').
pn('Irene', 'Irene').
pn('Sara', 'Sarah').
pn('Blanca Nieves', 'Snow White').
pn('Reina', 'Queen').
pn('Prinipe', 'Prince').

%% Verbs
verb(spa, v(X)) --> [X], {v(X,_)}.
verb(eng, v(X)) --> [Y], {v(X,Y)}.

v(toma, takes).
v(recoge, tidies).
v(come, eats).
v(estudia, studies).
v(lee, reads).
v(bebe, drinks).
v(prefiere, prefers).
v(canta, sings).
v(salta, jumps).
v(escala, climbs).
v(sirve, serves).
v(es, is).
v(fue, was).
v(eran, were).
v(atrapo, caught).
v(vivia, lived).
v(tenia, had).
v(miro, looked).
v(hizo, made).
v(cayo, fell).
v(dijo, told).
v(mataria, kill).
v(trajo, brings).
v(deambulaba, wandered).
v(llevaron, led).
v(llamo, knocked).
v(entro, went).
v(se_pregunto, wondered).
v(podia, could).
v(limpiaron, dusted).
v(barrieron, cleaned).
v(se_tendio, lay).
v(volvieron, returned).
v(sabian, knew).
v(llego, came).
v(buscaron, searched).
v(escribir, writing).
v(alcanzaron, reached).
v(explico, explained).
v(haciendo, doing).
v(bailaron, danced).
v(olvido, forgot).
v(encontraron, found).
v(yacia, lying).
v(decidio, decided).
v(probo, prove).
v(entraron, entered).
v(trabajaban, worked).
v(canto, sang).
v(escucharon, listened).
v(escribio, wrote).
v(trabajar, work).
v(beber, drink).
v(recoge, collects).
v(comer, eat).
v(despertando, waking).
v(eliminar, eliminate).
v(llevar, take).
v(demostrar, prove).
v(vio, saw).
v(abrio, opened).
v(hizo, did).
v(hablo, spoke).
v(tumbo, laid).


%% Personal Pronouns
pronoun(spa, pro(X)) --> [X], {pro(X,_)}.
pronoun(eng, pro(X)) --> [Y], {pro(X,Y)}.

pro(el, he).
pro(ella, she).
pro(eso, it).
pro(ellos, they).
pro(su, her).
pro(cada_uno, each).
pro(otro, other).

%% Conjunctions
conjunction(spa, conj(X)) --> [X], {conj(X,_)}.
conjunction(eng, conj(X)) --> [Y], {conj(X,Y)}.

conj(y, and).
conj(pero, but).
conj(mientras, while).
conj(aunque, although).
conj(entonces, so).
conj(cuando, when).

%% Relative Pronouns
relativePronoun(spa, pr(X)) --> [X], {pr(X,_)}.
relativePronoun(eng, pr(X)) --> [Y], {pr(X,Y)}.

pr(que, who).
pr(que, which).
pr(que, that).
pr(que, what).

%% Adjectives
adj(bronceado, tanned).
adj(alto, tall).
adj(delicado, delicate).
adj(rojo, red).
adj(poderoso, powerful).
adj(lento, slow).
adj(gris, grey).
adj(frito, fried).
adj(hermosa, beautiful).
adj(blanco, white).
adj(negro, black).
adj(vanidosa, vain).
adj(magico, magic).
adj(celoso, jealous).
adj(furiosa, furious).
adj(pequena, little).
adj(minusculo, tiny).
adj(delicioso, delicious).
adj(llena, filled).
adj(equivocado, wrong).
adj(feliz, happy).
adj(muerto, dead).
adj(ebano, ebony).
adj(exacto, exact).
adj(asustado, scared).
adj(siete, seven).
adj(barrido, swept).
adj(tal, such).
adj(agil, agile).
adj(malvada, wicked).
adj(dormido, asleep).

%% Adverbs
adv(muy, very).
adv(bastante, quite).
adv(solo, only).
adv(aun, still).
adv(pronto, soon).
adv(alli, there).

%% Prepositions
prep(junto, beside).
prep(a_traves, across).
prep(dentro, into).
prep(de, of).
prep(para, for).
prep(en, on).
prep(en, at).
prep(en, in).
prep(como, as).
prep(con, with).
prep(a, to).
prep(desde, from).
prep(sobre, about).

%% --- Core Translation Pipeline ---
%% Intercept translation query scanning bilingual map matrices.
translateWord(EngWord, SpaWord) :-
    ( det(SpaWord, EngWord)
    ; n(SpaWord, EngWord)
    ; v(SpaWord, EngWord)
    ; pro(SpaWord, EngWord)
    ; pn(SpaWord, EngWord)
    ; conj(SpaWord, EngWord)
    ; pr(SpaWord, EngWord)
    ; adj(SpaWord, EngWord)
    ; adv(SpaWord, EngWord)
    ; prep(SpaWord, EngWord)
    ),
    !.  %% Terminate depth-first search after successful discovery mapping.
translateWord(Word, Word).  %% Transparently bypass unmapped tokens gracefully.

%% Recursive reduction mapping English arrays down to native variants.
translateWordList([], []).
translateWordList([Pal|Rest], [Translation|RestTranslations]) :-
    translateWord(Pal, Translation),
    translateWordList(Rest, RestTranslations).

% --- Predicado principal corregido para translate frases ---
translate(EngPhrase) :-
    translateWordList(EngPhrase, SpaPhrase),
    write('Translated phrase: '),
    writeln(SpaPhrase).