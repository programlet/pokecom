10 ' ATODASHI JYANKEN -----------------
20 '
30 ' INITIALIZE
40 CLEAR :RANDOMIZE :OPEN "SCRN:"FOR OUTPUT AS #1
50 A=PEEK &BFC87+PEEK &BFC88*&100+PEEK &BFC89*&10000+&3C0,G=INT (A/&10000),B=A-G*&10000,F=INT (B/&100),E=B-F*&100
60 FOR I=&TO &8:Z$=Z$+CHR$ &1D:NEXT :Z$=Z$+CHR$ &1F,Z$="?????????"+Z$+"?????????"+Z$+"?????????"+Z$+"?????????"
70 C$=" IDEAED BY SOMOSOMO. PROGRAMMED BY T.SUZUHARA. OPAS,PSS,OMP,ALICE (C)OCHAME soft.",C$=C$+LEFT$ (C$,&16)
80 ' TITLE
90 CLS :LOCATE &A,&:PRINT "???޼ ?ެݹ?":LINE (&3C,&8)-(&EF,&8)
100 LOCATE &20,&3:PRINT "[START!]":IF H>&LOCATE &1E,&:PRINT "HIGH";H
110 GOSUB 340:A=&,B=A,R=A,S=&1
120 POKE 785556,245+A:LOCATE 0,0:PRINT #1,Z$:LOCATE 10,3:PRINT #1,MID$ (C$,B+1,22):A=-(A+1)*(A<5),B=-(B+0.5)*(B<80.5),K$=INKEY$ :IF K$=""GOTO 120
130 K=ASC K$:ON &1-(K=&F5)-(K=&45)*&2 GOTO 120,140,*END
140 M$="$32:1YZ4":GOSUB *OMP
150 ' GAME START
160 CLS :LOCATE &21,&:PRINT "STAGE";S
170 GOSUB 350:FOR I=&TO &2:LOCATE &22,&1+I:PRINT MID$ ("[1]??-[2]???[3]??-",I*&6+&1,&6):NEXT
180 A=RND &1B+&14,B=RND &1B+&14:IF (S=&2 AND A<B)OR (S=&1 AND A>B)LET I=A,A=B,B=I
190 IF S=&3LET A=B
200 L=A+B+&50+S*&14,C=&,D=C
210 LOCATE &14,&1:PAUSE "?ެ?";:PRINT " ??":GOSUB 340
220 IF A LET C=-(C+1)*(C<2):POKE 785556,245+C:LOCATE 0,0:PRINT #1,Z$:A=A-1
230 IF B LET D=-(D+1)*(D<2):POKE 785556,248+D:LOCATE 9,0:PRINT #1,Z$:B=B-1
240 L=L-1,K$=INKEY$ :IF K$=""GOTO 220
250 ' JUDGEMENT
260 GOSUB 350:IF A+B LET M$="MA":GOSUB *OMP:LOCATE &14,&2:PAUSE "???޼!":GOTO 160
270 K=VAL K$:IF K<1OR K>3GOTO 180ELSE LOCATE &14,&2:PRINT MID$ ("??-?????-",K*3-2,3);
280 J=C-K+&1,J=-(J-(J<&)*&3=D),M$=CHR$ (&50+J*&11):GOSUB *OMP:PAUSE " ";MID$ ("?????ԯ??!",J*&5+&1,&5)
290 LOCATE &14,&3:PRINT "SCORE"
300 IF J LET L=-L*(L>&):FOR I=&TO L:LOCATE &19,&3:PRINT R+&A*I:NEXT :R=R+&A*L
310 LOCATE &19,&3:PAUSE R:S=S+&1:IF S<&5GOTO 160
320 CLS :PRINT "CONGURATUATION!!":PRINT "YOUR SCORE";R;:IF R>H PRINT "HIGH SCORE!!":H=R,M$="CFGHL8N":GOSUB *OMP
330 IF INKEY$ =""GOTO 330ELSE 90
340 POKE &BFC93,&9A,&F5,&B:RETURN
350 POKE &BFC93,E,F,G:RETURN
360 ' GRAPHIC MAKING
370 *SET CLEAR :DEGREE :Z=&BF600:FOR I=&TO &5:CLS :LOCATE &A,&:PRINT MID$ ("??-?????-?????!Ϲ?",I*&3+&1,&3)
380 FOR Y=&TO &7:FOR X=&TO &47:IF NOT -POINT (X+&3C,Y)GOTO 410
390 LINE (X*&3,Y*&4)-(X*&3+&2,Y*&4+&2),BF:FOR K=&TO &3:W=VAL MID$ ("2210",K+&1,&1)-&1,V=VAL MID$ ("0111",K+&1,&1):IF NOT -POINT (X+W+&3C,Y+V)GOTO 410
400 FOR J=&TO &3:LINE (X*&3+W*J,Y*&4+V*J)-(X*&3+W*J+&2,Y*&4+V*J+&2),BF:NEXT
410 NEXT :NEXT :FOR Y=&TO &3:FOR X=&TO &35:G=&,Q=&1
420 FOR J=&TO &7:G=G+POINT (X,Y*&8+J)*Q,Q=Q+Q:NEXT :POKE Z,G:Z=Z+&1:NEXT :NEXT :Z=Z+&28:NEXT :GOTO 40
430 ' OCHAME's Music Plug-in(OMP)
440 *OMP FOR I=&1TO LEN M$:Z=ASC MID$ (M$,I,1):IF Z>64LET X=6.13*TEN (0.02508*Z):BEEP 1,64000/X-22,X*Y/T ELSE IF Z>47LET Y=Z-48ELSE IF Z=36LET T=VAL RIGHT$ (M$,LEN M$-I)ELSE IF Z=42FOR J=&1TO 730*Y/T+20:NEXT
450 NEXT :RETURN
460 *AREA POKE &BFE03,&1A,&FD,&B,&,&6,&:CALL &FFFD8
470 *END CLS :KEY &,"INIT"+CHR$ &22+"SCRN:"+CHR$ &D:END
480 ' PSS ver.1.2 (C)OCHAME soft
60000 *ALICE CLS :CLEAR :OPEN BTEXT$ FOR INPUT AS #1:D$=INPUT $(&13,&1):DIM A(&2)
60010 A$="///0?GW/F>kS^4/7T^_QKKe^/K=<Xh7hHh^/bLDeJK/6K:9/C/1TG
60020 FOR J=&1TO LEN A$:Y=ASC MID$ (A$,J,&1):FOR I=&TO &2:A(I)=ASC INPUT $(&1,&1):NEXT :A=&1,B=A(&)+A(&1),C=A(&)*256+A(&1):PRINT C;:IF Y<48LET D$=INPUT $(A(&2),1):GOTO "CK"ELSE FOR I=2TO A(&2):Z=ASC INPUT $(1,1),B=B+A*(Z-(Z>95))+1,A=3-A:NEXT
60030 D$=INPUT $(&1,&1):IF Y+(Y>95)<>(B-32768AND 63)+48BEEP 1:WAIT :PRINT "???!";:WAIT &:M=&1
60040 "CK"PRINT :NEXT :IF M PRINT "???"ELSE BEEP &3:PRINT "???߷?!"
