# RESUM FINAL DE RESULTATS


## Introducció

En el context internacional, hi ha estudis que tenen per objectiu facilitar la comprensió del microbioma en la salut de les persones. El projecte NIH Human Microbiome Projecte en concret l’apartat de la malaltia inflamatòria intestinal (MII) té dades de diverses òmiques de diferents malalts. Aquest estudi però no té un seguiment exhaustiu per pacient ni es centra en els efectes d’un tractament en els pacients. 
En estudis previs de integració en la MII s’ha utilitzat mètodes bivariats després de una selecció dels gens per relacionar la expressió dels gens amb l’abundància dels microorganismes (1). Posteriorment es va analitzar la funcionalitat dels gens que més es correlacionaven amb els microorganismes. Aquesta aproximació no té en compte l’estat del pacient ni la relació entre diferents gens per trobar la relació entre els microorganismes i els gens. Per la qual cosa es necessiten mètodes multivariats.
A l’a unitat de la MII, de l’Hospital Clínic, s’estan provant tractaments per tractar la malaltia inflamatòria. En aquests estudis seguim els malalts al llarg del tractament, obtenint mostres al llarg d’aquest temps on es poden realitzar diferents anàlisis òmics i relacionar-los amb variable clíniques i demogràfiques associades (tals com sexe, edat, edat diagnòstic, localització de la mostra, tractament rebut, etc). Com a controls s’ha pogut obtenir mostres d’altres pacients que no presenten inflamació intestinal, i s’han realitzats diferents anàlisis òmics de seqüenciació.

Disposem per això de les mostres de DNA i de RNA de diferents biòpsies en diferents llocs en diferents pacients en diferents tractaments. Hi ha una  cohort on es realitza un trasplantament autòleg de la medul·la òssia. En aquests estudis tant el DNA com el RNA de biopsies intestinal s’ha seqüenciat per a poder saber la composició microbiana i la transcripció de la mucosa intestinal. En el cas del DNA s’ha seqüenciat un segment del gen del 16S. 
Tant la transcripció gènica com la composició (i funció) de la microbiota intestinal estan altament influenciades per la presència de MII activa (2). Estudis previs del nostre grup demostren canvis transcripcionals en la mucosa intestinal dels pacients amb MII independentment de la presència de inflamació intestinal (3–5). Aquests canvis afecten especialment al compartiment epitelial potencialment alterant la seva funció.

## Objectius

La nostra hipòtesi és que pot existir un vincle directe entre la funció epitelial i la composició de la microbiota associada a la paret intestinal i que aquest epiteli queda danyat tot i la reducció de la inflamació. El dany de l’epiteli podria ser degut a una microbiota que dificultés la recuperació a l’estat sa de l’epiteli. Per aquesta raó l’objectiu principal d’aquesta tesi és trobar les relacions entre la microbiota i la expressió gènica de la mucosa intestinal. Per això estudiarem aquesta relació en mostres provinents de individus control i pacients amb MII en estats diversos de la seva malaltia. Tenint com a objectius concrets:
    • Utilitzar el millor mètode  tal de trobar les relacions entre el microbioma i l’expressió gènica de l’epiteli intestinal mètodes de integració .
        ◦ Si s’escau desenvolupar nous mètodes, o combinacions de mètodes, per l’anàlisi de dades del mateix pacient amb l’objectiu .
    • Trobar la relació entre gens i microorganismes, o si no és possible, entre funcions. 
        ◦ A poder ser aquestes relacions s’haurien de poder identificar si són degudes a la zona de l’intestí, al tractament rebut, a l’edat o a alguna altre factor de confusió. 
        ◦ Un cop trobades les relacions generals, descobrir relacions específiques entre microorganismes i gens de la mucosa. 
    • Determinar la influència de diverses variables com la localització (colon o ili), el tractament rebut, l’activitat de la MII, el sexe, l’edat, etc. en la relació entre microbiota i la mucosa.

## Resultats


S’ha provat STATegRa(9), mixOmics(10) i RGCCA(11) en les dades de l’estudi de transplant hematopoiètic, per tal de trobar quines variables es relacionen amb quines. RGCCA s’ha seleccionat per ser la més flexible i general. 

Optimització de paràmetres
Amb RGCCA s’han explorat els efectes del diferents paràmetres sobre 2 cohorts de dades (dades del transplant hematopoiètic i una altra cohort externa relacionada amb gliomes). 
El paràmetre regularitzador de les variables que regula si les variables identificades es correlacionen o covarien. S’ha seleccionat com a òptim quan hi ha un equilibri entre la correlació i la covariància. 
Cerca del model de relació
S’ha buscat el millor model de interacció entre la microbiota i la transcriptòmica utilitzant un sistema iteratiu per trobar el millor model que descriu la relació entre les dades. S’ha provat un model on només hi ha la interacció entre la microbiota i el perfil transcripcional de l’epiteli de l’intestí (Model “1”). 
També s’ha provat un altre model on tots dos estaven relacionats amb les variables clíniques (Model “1”) i un altre model on estaven relacionats entre ells i amb les variables clíniques (Model “2”). 

Per tal de trobar relacions que puguin canviar amb el temps i segons la localització es va separar la informació sobre la mostra en tres blocs, un per a les dades sobre el pacient (sexe, quina mostra correspon a quin pacient, si ha rebut cirurgia i en quina fase del tractament està), un altre bloc amb les dades sobre localització (lloc de la mostra), i un tercer relacionat amb el temps (edat de diagnòstic de la malaltia, edat en el moment de extreure la mostra i etapa en el procediment mèdic). Al dividir les dades clíniques es va suposar que la relació entre la microbiota i la resta de blocs seria igual que la transcriptòmica (Model “3”).
En tots aquests tres models s’ha buscat quin és la interacció òptima entre els blocs tot iterant en cada possibilitat utilitzant diferent pes en la relació entre blocs. En el model amb 5 blocs (transcriptòmica, microbiota, demografia, localització i temps), degut al gran espai de cerca computacional s’ha optat per fer 1000 anàlisis a l’atzar, visualitzar tendències i iterar sobre els possibles dissenys que segueixen aquesta tendència. Es va seleccionar el model que explicava més variància en la primera dimensió (Models “2.2”). 
Resultats

Eines de integració
S’han trobat tres mètodes que poden fer integració de dades tenint en compte que les dades són de la mateixa mostra i que hi ha més número de variables que de mostres: STATegRa, mixOmics, RGCCA. 
DISCO-SCA implementat en STATegRa busca si hi ha una component latent comuna entre les dades. Després de normalització de les dades descrit anteriorment, no s’ha trobat cap component comuna entre la microbiota i la transcriptòmica de l’epiteli intestinal. Això fa pensar que o bé no existeix o no està preparada per analitzar dades de seqüenciació del microbioma.
mixOmics, els mètodes estan basats en RGCCA però estan més enfocats a la classificació o en la regressió lineal i no en la selecció de variables. Com que el nostre objectiu no és fer una regressió o classificar les mostres en els grups coneguts no el fem servir.
RGCCA permet tant la cerca de variables com la classificació de grups. És la eina seleccionada per fer els anàlisis. Té un algoritme específicament pensat per analitzar dades on el nombre de variables és molt més gran que el nombre de les mostres com és el nostre cas. 
Model de interacció
Utilitzant RGCCA en les dades del transplant, s’ha trobat que la relació entre la microbiota i la transcriptòmica és feble i/o indirecte perquè el model que explica més variància de les dades no hi ha una relació directe entre els dos blocs de dades (Veure Taula 2). En aquest model les diferencies entre controls i malalts són principalment degudes a la microbiota. La transcriptòmica de l’epiteli de l’intestí en canvi diferència entre el colon i l’ili (Veure Figura 1). 

Taula 2 Model “3 best” optimitzat per a relacionar la microbiota, la transcriptòmica i les dades clíniques dividides en els blocs de demografia, localització i temps.

Figura 1 Representació de les mostres en la dimensió de la expressió gènica de l’intestí (GE) i la component microbiana (M). El color indica el tipus de mostra: CD representa els malalts de Crohn. Els models 1 i posteriors diferencien entre mostres sanes i mostres de malalts. En el model “3 best” hi ha dos grups clarament diferenciats, corresponen al colon i a l’ili. 
Conclusions i Discussió

Els mètodes utilitzats permeten confirmar microorganismes i gens anteriorment relacionats amb la malaltia de Crohn. A la vegada, permeten explorar quin és el model de relació entre la microbiota i la transcriptòmica la malaltia. 

## Discussió

Els resultats son coherents en les diferents cohorts. 

Una de les avantatges de l’estudi actual és que per tal de observar la relació entre microbioma i la transcriptòmica de l’intestí, s’han barrejat mostres de malalts de Crohn i de persones sense la MII (controls). Aquesta variància permet trobar relacions independents de la malaltia o que es mantenen tot i la malaltia. Una manera de validar aquestes relacions consistiria en mirar únicament amb les dades de la MII i un altre anàlisis amb les dades dels controls. Si també es busca el model òptim de relació entre la microbiota i la transcripció de l’intestí es corre el risc de sobreinterpretar les mateixes dades. 
La sobreinterpretació es podria mitigar utilitzant una altra cohort per validar el model i una altra cohort per validar les relacions. Per la qual cosa es requeriria més mostres i un estudi més generalitzat per confirmar les relacions que es puguin trobar en aquest estudi. La validació que es durà a terme en la cohort anti-TNFα serà sobre els gens i microorganismes identificats.
Gens i organismes rellevants
Les diferents integracions seleccionen els mateixos gens i microorganismes i també alguns de diferents. Les diferències entre els gens i microorganismes seleccionats pels diferents models poden indicar o relacions atzaroses o relacions rellevants per als blocs (Veure Figura 2).
Els models permeten reduir el nombre de microorganismes i gens a explorar,però no indiquen relacions individuals entre gens i microorganismes. Així es desconeixen sí hi ha una relació entre tots els gens i tots els microorganismes o és només entre un subgrup de gens i els  microorganismes-
