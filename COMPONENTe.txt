Retragere (Marco)

Descriere generala:
Stiind contul si suma ce se doreste a fi retrasa, componenta calculeaza numarul de bancnote din fiecare tip ce trebuie folosite si actualizeaza suma in cont. De asemenea actualizeaza si casa in care se afla nr de bancnote.

Input:
CLK- clock-ul cu care functioneaza sistemul
ENABLE- cand are valoarea '1' permite functionarea, iar cand este '0' nu
N5I, N10I ,N20I ,N50I ,N100I - numarul de bancnote de 5, 10, 20, 50 si 100 euro 	care se afla in casa inainte de retragere
Suma_retrasa- suma ce se doreste a fi retrasa sub forma unui std_logic_vector de 	10 biti
Suma_in_contI- Suma ce se afla in contul din care se efectueaza retragerea 	inainte de operatie

Output:
N5,N10,N20,N50,N100,N200- numarul de bancnote de de un anumit tip ce trebuie sa 	se afle in casa dupa retragere
Suma_in_cont- suma ce trebuie sa se afle in cont dupa operatie
EROARE- '0' cand operatia poate fi incheiata, '1' atunci cand apar erori

Modul de functionare:
	Descriere secventiala, clock-ul fiind singurul semnal in lista de sensibilitati
	Se verifica daca clock-ul este pe front crescator si daca ENABLE este '1'
	Se initializeaza variabile temporare pentru suma, numarul de bancnote de fiecare tip si pentru eroare.
	Se verifica ca suma retrasa sa fie mai mare ca suma din cont. De asemenea sa nu fi aparut vreo eroare pana acum. Ambele intr-o structura repetitiva.
	Atat timp cat putem sa mai adaugam o valoarea unei bancnote de un anumit tip o adaugam pe cea mai mare pana cand suma bancnotelor este egala cu suma retragerii.
	Eroarea devine '1' atunci cand suma retrasa este mai mare ca cea din cont, sau cand suma retrasa nu este multiplu de 5 (nu se poate plati cu bancnote).
	Daca eroarea este '0' semnalele de output primesc valorile variabilelor intermediare .


Divizor (Marco)

Pentru input-ul generic n, divizeaza un clock de n ori.


Transfer (Marco)

Descriere generala:
Pentru 2 conturi specificare se face transferul din primul in al doilea.

Input:
CLK- clock-ul sistemului
ENABLE- cand are valoarea '1' permite functionarea, iar cand este '0' nu
ContMinus- suma contului din care se iau banii
ContPlus- suma contului in care se introduc banii
B5,B10,B20,B50,B100- semnale care indica transferului a 5, 10, 20, 50, 100 euro
STOP- semnal care opreste transferul 

Output:
ContMinusNou- valoarea noua a primului cont dupa transfer
ContPlusNou- valoarea noua a celui de-al doilea cont dupa transfer
err- '1' daca a aparut o eroare

Componente suplimentare folosite: 
Divizor

Mod de functionare:
	Mod de descriere secvential
	Semnalul new_CLK ia valoarea clockului doar cand ENABLE este '1'.
	In functie de ce buton este apasat ambele conturi se modifica cu o anumita valoarea, ce se scade din primul si se aduna in al doilea.
	La final cont contMinusNou si contPlusNou iau valorile variabilelor intermediare.	
	
	

Comparator(Marco)

Descriere generala:
Compara 2 numere de dimensiune generica.

Input:
n- parametru generic, dimensiunea vectorilor de tip std_logic ce vor fi comparati
A- primul numar pentru comparatie
B- al doilea numar pentru comparatie

Output:
EQUAL- are valoarea '1' atunci cand numere sunt egale
GREATER- are valoarea '1' daca A este mai mare ca B


binToBCD (Marco)

Descriere generala:
Transforma un numar de 10 biti in unitati, zeci, sute, mii in baza 10.

Input:
Input- numarul primit ca un vector de tip std_logic de lungime 10

Output:
unitati- vector de tip std_logic pe 4 biti care descrie cifra unitatilor in baza 10
zeci- vector de tip std_logic pe 4 biti care descrie cifra zecilor in baza 10
sute- vector de tip std_logic pe 4 biti care descrie cifra sutelor in baza 10
mii- vector de tip std_logic pe 4 biti care descrie cifra miilor in baza 10

Mod de functionare:
Foloseste algoritmul double dabble (shift and add 3).
Miile, sutele, zecile, unitatile si numarul original sunt considerate ca fiind un registru  de 26 de biti.
Se shifteaza la stanga de 10 ori (lungimea numarului initial). La fiecare pas se verifica daca gruparile de biti corespunzatoare
unitatilor, zecilor, sutelor sau miilor au valoarea mai mare sau egala cu 5. Pentru gruparile care au valori mai mare sau egale cu 5
se aduna 3 pentru ca la urmatoarea shiftare sa existe un carry la stanga. Pt gruparile cu valori mai mici strict ca 5 nu se face nimic.
	

Sumator (Marco)

Descriere generala:
Aduna 2 numere de dimensiune generica, cu carry.

Input:
A, B- numerele

Output:
sum- suma lor
CO- carry out

Afisor (Marco)

Descriere generala:
Avand cifrele unui numar (4 cifre) seteaza anozii si catozii corespunzator pentru a fi folosite pentru afisor.

Input:
unitati- cifra unitatilor 
zeci-	cifra zecilor
sute-	cifra sutelor
mii- cifra miilor
CLOCK_1KHz- un clock cu frecventa mai mare decat cel cu care functioneaza restul placii
segment- catozii de pe placa
anozi- anozii de pe placa

Mod de functionare:
Variabila cnt ia pe rand valorile 0, 1, 2, 3.
Pentru fiecare valoare a cnt un anod diferit este pus pe '0' pentru sute, unitati, zeci si mii, restul pe '1' pt a fi opriti.
Pentru fiecare impuls de clock se va afiza o cifra diferita.
Catozii sunt setati sa afiseze cifra ce se afla in in semnalele unitati, zeci, sute, mii.




	


