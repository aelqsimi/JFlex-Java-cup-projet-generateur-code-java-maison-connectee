// Specification JFlex
import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

%{
	public int getYyLine(){
		return yyline+1;
	}
	public int getYyColumn(){
		return yycolumn+1;
	}
	public String getYyText(){
		return yytext();
	}
%}

chiffre = [0-9]
entier = {chiffre}+
ident = [a-zA-Z_][0-9a-zA-Z_]*
deli_o = "<"
deli_f = ">"
point = \.
point_virgule = \;
virgule = \,
deux_points = \:
par_o = \(
par_f = \)
gui_o = \{
gui_f = \}
affect = "="
equal = "=="
chaine = \"[^\"\n]*\"

prog = "PROGRAMME_DOMUS"
decl_app = "DECLARATION_APPAREILS"
dec_inter = "DECLARATION_INTERFACES"
dec_scen = "DECLARATION_SCENARII"
dec_comm = "DECLARATION_COMMANDES"
scen = "SCENARIO"{espace}+{ident}

finligne = \n
espace =  [ \r\t\b]|" "
comment = \/\/.*


erreur_ident = [0-9]+[a-zA-Z]+
erreur_chaine = \"[^\"\n]*\n

  

%%
// qqs exemples de règles lexicales légales...

{deli_o}{prog}{deli_f} 					{ return new Symbol(sym.DEBPROG); }
{deli_o}"/"{prog}{deli_f} 				{ return new Symbol(sym.FINPROG); }
{deli_o}{decl_app}{deli_f} 				{ return new Symbol(sym.DEBDECLAAPP); }
{deli_o}"/"{decl_app}{deli_f} 				{ return new Symbol(sym.FINDECLAAPP); }
{deli_o}{dec_inter}{deli_f} 				{ return new Symbol(sym.DEBDECLAINTER); }
{deli_o}"/"{dec_inter}{deli_f} 				{ return new Symbol(sym.FINDECLAINTER); }
{deli_o}{dec_scen}{deli_f} 				{ return new Symbol(sym.DEBDECLASCEN); }
{deli_o}"/"{dec_scen}{deli_f} 				{ return new Symbol(sym.FINDECLASCEN); }
{deli_o}{scen}{deli_f} 					{  String str = yytext().substring(yytext().indexOf(" ")).trim(); 
							   str = str.substring(0,str.length()-1);
							   return new Symbol(sym.DEBSCEN, new String(str)); }
{deli_o}"/"{scen}{deli_f} 				{  String str = yytext().substring(yytext().indexOf(" ")).trim(); 
							   str = str.substring(0,str.length()-1);
							   return new Symbol(sym.FINSCEN, new String(str)); }
{deli_o}{dec_comm}{deli_f} 				{ return new Symbol(sym.DEBDECLACOMM); }
{deli_o}"/"{dec_comm}{deli_f} 				{ return new Symbol(sym.FINDECLACOMM); }

{affect} 						{ return new Symbol(sym.AFFECT); }
{chaine} 						{ return new Symbol(sym.CHAINE, new String(yytext())); }
{equal} 						{ return new Symbol(sym.EQUAL); }
{entier}						{ return new Symbol(sym.ENTIER, new Integer(yytext())); }
{point} 						{ return new Symbol(sym.POINT); }
{point_virgule} 					{ return new Symbol(sym.POINTVIRG); }
{virgule} 						{ return new Symbol(sym.VIRG); }
{deux_points} 						{ return new Symbol(sym.DEUXPTS); }
{par_o} 						{ return new Symbol(sym.PARO); }
{par_f} 						{ return new Symbol(sym.PARF); }
{gui_o} 						{ return new Symbol(sym.GUIO); }
{gui_f} 						{ return new Symbol(sym.GUIF); }
{affect} 						{ return new Symbol(sym.AFFECT); }

"definir" 						{ return new Symbol(sym.DEF); }
"executer_scenario" 					{ return new Symbol(sym.EXESCEN); }
"associer" 						{ return new Symbol(sym.ASSOC); }
"programmer" 						{ return new Symbol(sym.PROGRAMMER); }
"message" 						{ return new Symbol(sym.MESS); }
"pourtout" 						{ return new Symbol(sym.PRTOUT); }
"faire" 						{ return new Symbol(sym.FAIRE); }
"fait" 							{ return new Symbol(sym.FAIT); }
"si" 							{ return new Symbol(sym.SI); }
"alors" 						{ return new Symbol(sym.ALORS); }
"sinon" 						{ return new Symbol(sym.SINON); }
"fsi" 							{ return new Symbol(sym.FSI); }
"ouvrir" 						{ return new Symbol(sym.OUVRIR, yytext()); }
"fermer" 						{ return new Symbol(sym.FERMER, yytext()); }
"eteindre" 						{ return new Symbol(sym.ETEINDRE, yytext()); }
"allumer" 						{ return new Symbol(sym.ALLUMER, yytext()); }
"tamiser" 						{ return new Symbol(sym.TAMISER, yytext()); }
"etat" 							{ return new Symbol(sym.ETAT); }
"allumer_partiel" 					{ return new Symbol(sym.ALLUMERPART, yytext()); }
"allumer_eco" 						{ return new Symbol(sym.ALLUMERECO, yytext()); }
"ouvrir_partiel" 					{ return new Symbol(sym.OUVRIRPART, yytext()); }
"fermer_partiel" 					{ return new Symbol(sym.FERMERPART, yytext()); }
"allume" 						{ return new Symbol(sym.ALLUME, yytext()); }
"eteint" 						{ return new Symbol(sym.ETEINT, yytext()); }
"demi" 							{ return new Symbol(sym.DEMI, new String(yytext())); }
"eco" 							{ return new Symbol(sym.ECO, new String(yytext())); }
"ouvert" 						{ return new Symbol(sym.OUVERT, new String(yytext())); }
"ferme" 						{ return new Symbol(sym.FERME, new String(yytext())); }
"eclairage" 						{ return new Symbol(sym.ECLAIRAGE, yytext()); }
"volet" 						{ return new Symbol(sym.VOLET, yytext()); }
"chauffage" 						{ return new Symbol(sym.CHAUFFAGE, yytext()); }
"alarme" 						{ return new Symbol(sym.ALARME, yytext()); }
"fenetre" 						{ return new Symbol(sym.FENETRE, yytext()); }
"autre_appareil" 					{ return new Symbol(sym.AUTREAPP); }
"interrupteur" 						{ return new Symbol(sym.INTERUPTEUR, yytext()); }
"mobile" 						{ return new Symbol(sym.MOBILE, yytext()); }
"telephone" 						{ return new Symbol(sym.TELEPHONE, yytext()); }
"telecommande" 						{ return new Symbol(sym.TELECOMMANDE, yytext()); }
"tablette" 						{ return new Symbol(sym.TABLETTE, yytext()); }
"tv" 							{ return new Symbol(sym.TV, yytext()); }
"hifi" 							{ return new Symbol(sym.HIFI, yytext()); }
"cafetiere" 						{ return new Symbol(sym.CAFETIERE, yytext()); }
"video_proj" 						{ return new Symbol(sym.VIDEOPROJ, yytext()); }
"lave_vaisselle" 					{ return new Symbol(sym.LAVEVAISS, yytext()); }
"lave_linge" 						{ return new Symbol(sym.LAVELING, yytext()); }
"seche_linge" 						{ return new Symbol(sym.SECHELING, yytext()); }
"ordinateur" 						{ return new Symbol(sym.ORDINATEUR, yytext()); }
"portail" 						{ return new Symbol(sym.PORTAIL, yytext()); }
{ident} 						{ return new Symbol(sym.IDENT, new String(yytext())); }
{comment} 						{}
{espace} 						{}
{finligne} 						{}

// qqs exemples de règles de détection d'erreurs lexicales...
{erreur_ident} {System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => syntaxe identificateur non respectee ! "); }

{erreur_chaine} {System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => fin de chaine attendue ! "); }

.  {System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => caractère inconnu ! "); } 

