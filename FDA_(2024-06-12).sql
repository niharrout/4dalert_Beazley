CREATE SCHEMA IF NOT EXISTS report;
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS report."Dim Calendar Date"
(
    "CalendarDate" date,
    "CalendarDate(YYYY-MM-DD)" character varying(10),
    "CalendarYear(YYYY)" character varying(4),
    "CalendarQuarter(QQ)" character varying(2),
    "CalendarMonth(MM)" character varying(2),
    "CalendarYearQuarter(YYYY-QQ)" character varying(7),
    "CalendarYearMonth(YYYY-MM)" character varying(7)
);
--------------------------------------------------------	
TRUNCATE TABLE report."Dim Calendar Date";
-------------------------------------------------
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('19000101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20000930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20001231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20010930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20011231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20020930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20021231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20030930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20031231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20040930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20041231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20050930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20051231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20060930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20061231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20070930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20071231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20080930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES
 ('20081125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20081231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20090930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20091231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20100930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20101231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20110930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20111231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20120930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20121231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20130930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20131231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20140930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20141231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20150930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20151231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20160930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20161231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20170930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171114');
INSERT INTO report."Dim Calendar Date" ( "Calend
arDate" ) VALUES ('20171115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20171231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20180930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20181231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20190930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20191231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20200930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20201231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20210930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20211231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('21541231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20220930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20221231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20230930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20231231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20240930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20241231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250131');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250301');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250302');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250303');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250304');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250305');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250306');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250307');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250308');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250309');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250310');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250311');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250312');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250313');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250314');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250315');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250316');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250317');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250318');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250319');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250320');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250321');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250322');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250323');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250324');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250325');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250326');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250327');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250328');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250329');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250330');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250331');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250401');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250402');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250403');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250404');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250405');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250406');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250407');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250408');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250409');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250410');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250411');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250412');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250413');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250414');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250415');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250416');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250417');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250418');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250419');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250420');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250421');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250422');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250423');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250424');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250425');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250426');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250427');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250428');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250429');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250430');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250501');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250502');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250503');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250504');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250505');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250506');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250507');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250508');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250509');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250510');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250511');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250512');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250513');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250514');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250515');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250516');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250517');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250518');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250519');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250520');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250521');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250522');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250523');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250524');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250525');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250526');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250527');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250528');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250529');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250530');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250531');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250601');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250602');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250603');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250604');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250605');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250606');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250607');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250608');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250609');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250610');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250611');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250612');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250613');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250614');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250615');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250616');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250617');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250618');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250619');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250620');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250621');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250622');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250623');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250624');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250625');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250626');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250627');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250628');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250629');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250630');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250701');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250702');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250703');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250704');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250705');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250706');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250707');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250708');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250709');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250710');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250711');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250712');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250713');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250714');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250715');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250716');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250717');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250718');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250719');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250720');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250721');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250722');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250723');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250724');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250725');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250726');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250727');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250728');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250729');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250730');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250731');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250801');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250802');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250803');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250804');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250805');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250806');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250807');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250808');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250809');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250810');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250811');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250812');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250813');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250814');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250815');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250816');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250817');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250818');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250819');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250820');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250821');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250822');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250823');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250824');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250825');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250826');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250827');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250828');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250829');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250830');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250831');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250901');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250902');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250903');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250904');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250905');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250906');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250907');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250908');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250909');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250910');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250911');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250912');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250913');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250914');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250915');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250916');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250917');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250918');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250919');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250920');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250921');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250922');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250923');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250924');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250925');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250926');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250927');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250928');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250929');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20250930');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251001');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251002');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251003');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251004');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251005');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251006');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251007');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251008');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251009');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251010');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251011');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251012');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251013');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251014');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251015');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251016');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251017');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251018');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251019');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251020');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251021');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251022');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251023');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251024');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251025');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251026');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251027');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251028');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251029');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251030');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251031');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251101');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251102');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251103');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251104');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251105');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251106');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251107');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251108');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251109');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251110');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251111');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251112');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251113');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251114');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251115');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251116');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251117');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251118');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251119');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251120');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251121');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251122');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251123');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251124');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251125');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251126');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251127');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251128');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251129');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251130');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251201');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251202');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251203');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251204');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251205');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251206');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251207');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251208');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251209');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251210');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251211');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251212');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251213');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251214');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251215');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251216');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251217');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251218');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251219');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251220');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251221');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251222');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251223');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251224');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251225');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251226');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251227');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251228');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251229');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251230');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20251231');
INSERT INTO report."Dim Calendar Date" ( "CalendarDate" ) VALUES ('20260101');

------------------------------------------
CREATE OR REPLACE VIEW report."Dim Data Quality Rule"
 AS
 SELECT a."FDADataQualityRulesId" AS "Dim Data Quality Rules Id",
    a."RuleName" AS "Rule Name",
    ( SELECT string_agg(x."RuleName", ' & '::text) AS string_agg
           FROM ( SELECT ("FDADataQualityMasterRulesDetails"."RuleType"::text || ' = '::text) ||
                        CASE
                            WHEN COALESCE("FDADataQualityMasterRulesDetails"."LeftFieldValue", ''::text) > ''::text AND COALESCE("FDADataQualityMasterRulesDetails"."RightFieldValue", ''::text) > ''::text THEN ("FDADataQualityMasterRulesDetails"."LeftFieldValue" || '   ^   '::text) || "FDADataQualityMasterRulesDetails"."RightFieldValue"
                            WHEN COALESCE("FDADataQualityMasterRulesDetails"."LeftFieldValue", ''::text) > ''::text AND COALESCE("FDADataQualityMasterRulesDetails"."RightFieldValue", ''::text) = ''::text THEN "FDADataQualityMasterRulesDetails"."LeftFieldValue"
                            WHEN COALESCE("FDADataQualityMasterRulesDetails"."LeftFieldValue", ''::text) = ''::text AND COALESCE("FDADataQualityMasterRulesDetails"."RightFieldValue", ''::text) > ''::text THEN "FDADataQualityMasterRulesDetails"."RightFieldValue"
                            ELSE NULL::text
                        END AS "RuleName"
                   FROM fda."FDADataQualityMasterRulesDetails"
                  WHERE "FDADataQualityMasterRulesDetails"."FDADataQualityRulesId" = a."FDADataQualityRulesId") x) AS "Rule Signature",
    a."NumberOfException" AS "Rule Number Of Exception",
    a."RuleDescription" AS "Rule Description",
    a."RuleDataType" AS "Rule Data Type",
    a."DAMADimension" AS "Rule DAMA Dimension",
    b."FDASystemsId" AS "Rule System Id",
    b."SystemName" AS "System Name",
    b."SystemType" AS "System Type",
    b."SystemOwner" AS "System Owner",
    b."SystemAliasName" AS "System Alias Name",
    b."LandscapeName" AS "System Landscape Name",
    b."Organization" AS "System Organization",
    b."SystemDescription" AS "System Description",
    a."CreatedOn" AS "Rule Created On",
    a."CreatedBy" AS "Rule Created By",
    a."LastUpdatedOn" AS "Rule Last Updated On",
    a."LastUpdatedBy" AS "Rule Last Updated By"
   FROM fda."FDADataQualityMasterRules" a,
    fda."FDASystems" b
  WHERE a."FDASystemsId" = b."FDASystemsId";

------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim Data Recon Rule"
 AS
 SELECT a."FDAAlertRulesId" AS "Dim Alert Rules Id",
    a."AlertTypeInd" AS "Alert Type Ind",
    a."FDASystemSourceId" AS "System Source Id",
    b1."SystemName" AS "System Source Name",
    b1."SystemType" AS "System Source Type",
    b1."SystemOwner" AS "System Source Owner",
    b1."SystemAliasName" AS "System Source Alias Name",
    b1."LandscapeName" AS "System Source Landscape Name",
    a."FDASystemTargeteId" AS "Target System Id",
    b2."SystemName" AS "Target System Name",
    b2."SystemType" AS "Target System Type",
    b2."SystemOwner" AS "Target System Owner",
    b2."SystemAliasName" AS "Target System Alias Name",
    b2."LandscapeName" AS "Target System Landscape Name",
    a."FDASourceTableId" AS "Source Table Id",
    c1."ObjectType" AS "Source Object Type",
    c1."ObjectName" AS "Source Object Name",
    c1."SchemaName" AS "Source Object Schema Name",
    a."FDATargetTableId" AS "Target Table Id",
    c2."ObjectType" AS "Target Object Type",
    c2."ObjectName" AS "Target Object Name",
    c2."SchemaName" AS "Target Object Schema Name",
    a."CreatedDateTime" AS "Alert Created Date Time",
    a."UpdatedDateTime" AS "Alert Updated Date Time",
    a."UpdatedBy" AS "Alert Updated By",
    a."ApplicationId" AS "Alert Application Id",
    d1."ApplicationCode" AS "Application Code",
    d1."ApplicationName" AS "Application Name",
    d1."ApplicationShortname" AS "Application Short Name",
    a."AlertTypeCategory",
    a."SourceInfoEntryType" AS "Alert Source Info Entry Type",
    a."TargetInfoEntryType" AS "Alert Target Info Entry Type",
    a."SourceQuery" AS "Alert Source Query",
    a."TargetQuery" AS "Alert Target Query",
    a."AlertName" AS "Alert Name",
    a."AlertDescription" AS "Alert Description",
    a."NewBaseLineDateTime" AS "Alert New Base Line Date Time",
    a."NewBaseLineDateTimeSource" AS "Alert New Base Line Date Time Source",
    a."UpperThresholdType" AS "Alert Upper Threshold Type",
    a."LowerThresholdType" AS "Alert Lower Threshold Type",
    a."BaseLineValueType" AS "Alert Base Line Value Type",
    a."BaseLineValue" AS "Alert Base Line Value",
    a."ThresholdType" AS "Alert Threshold Type",
    a."UpperThresholdValue" AS "Alert Upper Threshold Value",
    a."LowerThresholdValue" AS "Alert Lower Threshold Value",
    a."FolderId" AS "Alert Folder Id",
    e1."FolderName" AS "Folder Name",
    a."SourceQueryName" AS "Alert Source Query Name",
    a."TargetQueryName" AS "Alert Target Query Name",
    a."AllowNewSegmentInd" AS "Alert Allow New Segment Ind",
    a."AlertTag" AS "Alert Alert Tag",
    a."StoredComparedInd" AS "Alert Stored Compared Ind",
    a."MaxRecordCount" AS "Alert Max Record Count",
    a."SourceApiName" AS "Alert Source Api Name",
    a."SourceApiURL" AS "Alert Source Api URL",
    a."TargetApiName" AS "Alert Target Api Name",
    a."TargetApiURL" AS "Alert Target Api URL"
   FROM fda."FDAAlertRules" a
     JOIN fda."FDASystems" b1 ON a."FDASystemSourceId" = b1."FDASystemsId"
     JOIN fda."FDASystems" b2 ON a."FDASystemTargeteId" = b2."FDASystemsId"
     LEFT JOIN fda."FDASystemObjects" c1 ON a."FDASourceTableId" = c1."FDASystemObjectsId"
     LEFT JOIN fda."FDASystemObjects" c2 ON a."FDATargetTableId" = c2."FDASystemObjectsId"
     LEFT JOIN fda."FDAApplications" d1 ON a."ApplicationId" = d1."FDAApplicationsId"
     LEFT JOIN fda."Folders" e1 ON a."FolderId" = e1."FoldersId";
	 
---------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim Object"
 AS
 SELECT a."FDASystemObjectsId" AS "Dim Object Id",
    a."ObjectType" AS "Object Type",
    a."ObjectName" AS "Object Name",
    a."ApplicationName" AS "Object Application Name",
    a."Owner" AS "Object Owner",
    a."LastSyncUpDate" AS "Object Last SyncUp Date",
    a."SegmentedBy" AS "Object Segmented By",
    a."RefreshFrequency" AS "Object Refresh Frequency",
    a."RefreshTime" AS "Object Refresh Time",
    a."SchemaName" AS "Object Schema Name",
    a."ObjectGroup" AS "Object Group",
    b."FDASystemsId" AS "System Id",
    b."SystemName" AS "System Name",
    b."SystemType" AS "System Type",
    b."SystemOwner" AS "System Owner",
    b."SystemAliasName" AS "System Alias Name",
    b."LandscapeName" AS "System Landscape Name",
    b."SystemDescription" AS "System Description",
    a."CreatedBy" AS "Object Created By",
    a."LastUpdatedBy" AS "Object Last Updated By",
    a."CreationDate" AS "Object Creation Date",
    a."LastUpdatedDate" AS "Object Last Updated Date"
   FROM fda."FDASystemObjects" a,
    fda."FDASystems" b
  WHERE a."FDASystemsId" = b."FDASystemsId";
  
----------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim Object Fields"
 AS
 SELECT a."FDASystemObjectFieldsId" AS "Dim Field Id",
    a."FieldName" AS "Field Name",
    a."FieldDataType" AS "Field Data Type",
    a."IsNullPossible" AS "Field Is Null Possible",
    a."CharacterMaximumLength" AS "Field Character Maximum Length",
    a."ColumnPrecision" AS "Field Column Precision",
    a."UserFriendlyFieldName" AS "Field User Friendly Name",
    a."FieldDescription" AS "Field Description",
    a."Comment" AS "Field Comment",
    a."Owner" AS "Field Owner",
    a."Obsolute" AS "Field Obsolute",
    a."LastMetaDataSynchUpDate" AS "Field Last Meta Data SynchUp Date",
    a."LastUpdatedOn" AS "Field Last Updated On",
    a."AutoMetricsInd" AS "Field Auto Metrics Ind",
    a."SyncUpStatus" AS "Field SyncUp Status",
    a."SegmentedBy" AS "Field Segmented By",
    a."Position" AS "Field Position",
    a."UserOverwriteDatatype" AS "Field User Overwrite Datatype",
    a."LastSyncedBy" AS "Field Last Synched By",
    a."AlertWhenTrendIncrease" AS "Field Alert When Trend Increase",
    a."CreatedBy" AS "Field Created By",
    a."CreationDate" AS "Field Creation Date",
    a."LastDeletedOn" AS "Field Last Deleted On",
    a."LastDeletedBy" AS "Field Last Deleted By",
    a."ObsoleteInMetaDataInd" AS "Field Obsolete In Meta Data Ind",
    a."PrimaryKey" AS "Field Is Primary Key",
    a."ForeignKey" AS "Field Is Foreign Key",
    b."ObjectType" AS "Object Type",
    b."ObjectName" AS "Object Name",
    b."ApplicationName" AS "Object Application Name",
    b."Owner" AS "Object Owner",
    b."LastSyncUpDate" AS "Object Last SyncUp Date",
    b."SegmentedBy" AS "Object Segmented By",
    b."RefreshFrequency" AS "Object Refresh Frequency",
    b."RefreshTime" AS "Object Refresh Time",
    b."SchemaName" AS "Object Schema Name",
    b."ObjectGroup" AS "Object Group",
    c."SystemName" AS "System Name",
    c."SystemType" AS "System Type",
    c."SystemOwner" AS "System Owner",
    c."SystemAliasName" AS "System Alias Name",
    c."LandscapeName" AS "System Landscape Name",
    c."SystemDescription" AS "System Description"
   FROM fda."FDASystemObjectFields" a,
    fda."FDASystemObjects" b,
    fda."FDASystems" c
  WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId" 
  AND a."FDASystemsId" = c."FDASystemsId";
----------------------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim Object Score Run"
 AS
 SELECT a."FDAObjectScoreValueId" AS "Dim Object Score Id",
    a."ObjectScore" AS "Object Score",
    a."RowCount" AS "Row Count",
    a."LastRowCount" AS "Last Row Count",
    a."AvgNullCount" AS "Avg Null Count",
    a."LastAvgNullCount" AS "Last Avg Null Count",
    a."NullCountPercent" AS "Null Count Percent",
    a."LastNullCountPercent" AS "Last Null Count Percent",
    a."AvgDistinctCount" AS "Avg Distinct Count",
    a."LastAvgDistinctCount" AS "Last Avg Distinct Count",
    a."DistinctCountPercent" AS "Distinct Count Percent",
    a."LastDistinctCountPercent" AS "Last Distinct Count Percent",
    a."MinimumValue" AS "Minimum Value",
    a."LastMinimumValue" AS "Last Minimum Value",
    a."MaximumValue" AS "Maximum Value",
    a."LastMaximumValue" AS "Last Maximum Value",
    a."StandardDevition" AS "Standard Devition",
    a."LastStandardDevition" AS "Last Standard Devition",
    a."Average",
    a."LastAverage" AS "Last Average",
    a."Median",
    a."LastMedian" AS "Last Median",
    a."Formats",
    a."LastFormats" AS "Last Formats",
    a."Outliers",
    a."LastOutliers" AS "Last Outliers",
    a."CalenderDate",
    a."LastRefreshedDateTime" AS "Last Refreshed Date Time",
    a."Freshness",
    a."RowCountOutlierInd" AS "Row Count OutlierInd",
    a."AvgNullCountOutlierInd" AS "Avg Null Count Outlier Ind",
    a."NullCountPercentOutlierInd" AS "Null Count Percent Outlier Ind",
    a."AvgDistinctCountOutlierInd" AS "Avg Distinct Count Outlier Ind",
    a."DistinctCountPercentOutlierInd" AS "Distinct Count Percent Outlier Ind",
    a."NewBaseLineInd" AS "New BaseLine Ind",
    a."NewBaseLineDateTime" AS "New BaseLine Date Time",
    a."CreatedDateTime" AS "Created Date Time",
    a."LastUpdatedDateTime" AS "Last Updated Date Time",
    a."LoadStartTime" AS "Load Start Time",
    a."LoadEndTime" AS "Load End Time",
    a."RefreshBy" AS "Refresh By",
    a."Status",
    a."LastUpdatedBy" AS "LastUpdated By",
    a."LastChecksumAggValue" AS "Last Check Sum Agg Value",
    a."ChecksumAggValue" AS "Check Sum Agg Value",
    b."SystemName" AS "System Name",
    b."SystemType" AS "System Type",
    b."SystemOwner" AS "System Owner",
    b."SystemAliasName" AS "System Alias Name",
    c."ObjectType" AS "Object Type",
    c."ObjectName" AS "Object Name",
    c."ApplicationName" AS "Object Application Name",
    c."Owner" AS "Object Owner",
    c."LastSyncUpDate" AS "Object Last SyncUp Date",
    c."SegmentedBy" AS "Object Segmented By",
    c."RefreshFrequency" AS "Object Refresh Frequency",
    c."RefreshTime" AS "Object Refresh Time",
    c."SchemaName" AS "Object Schema Name"
   FROM fda."FDAObjectsScoreValue" a,
    fda."FDASystems" b,
    fda."FDASystemObjects" c
  WHERE a."FDASystemId" = b."FDASystemsId" 
  AND a."FDASystemObjectsId" = c."FDASystemObjectsId"; 
--------------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim System"
 AS
 SELECT "FDASystems"."FDASystemsId" AS "Dim System Id",
    "FDASystems"."SystemName" AS "System Name",
    "FDASystems"."SystemType" AS "System Type",
    "FDASystems"."SystemOwner" AS "System Owner",
    "FDASystems"."SystemAliasName" AS "System Alias Name",
    "FDASystems"."LandscapeName" AS "System Landscape Name",
    "FDASystems"."Organization" AS "System Organization",
    "FDASystems"."SystemDescription" AS "System Description",
    "FDASystems"."CreatedBy" AS "System Created By",
    "FDASystems"."CreatedOn" AS "System Created On",
    "FDASystems"."LastUpdatedBy" AS "System Last Updated By",
    "FDASystems"."LastUpdatedOn" AS "System Last Updated On"
   FROM fda."FDASystems";  
  
-------------------------------------------------------
CREATE OR REPLACE VIEW report."Dim User"
 AS
 SELECT "FDAUsers"."User_Id" AS "User Id",
    "FDAUsers"."U_UserName" AS "User Name",
    "FDAUsers"."U_Email" AS "User Email",
    "FDAUsers"."U_Firstname" AS "User First Name",
    "FDAUsers"."U_Lastname" AS "User Last Name",
    "FDAUsers"."U_Midname" AS "User Middle Name",
    "FDAUsers"."U_Join_Date" AS "User Join Date",
    "FDAUsers"."U_Last_Login" AS "User Last Login Date",
    "FDAUsers"."UserType" AS "User Type",
    "FDAUsers"."DefaultLanguage" AS "User Default Language",
    "FDAUsers"."CreatedFrom" AS "User Created From",
    "FDAUsers"."UserActiveInd" AS "User Active Ind",
    "FDAUsers"."ActiveSessions" AS "Active Sessions"
   FROM fda."FDAUsers";
-------------------------------------------------------
CREATE OR REPLACE VIEW report."Fact DQ Rules By Object Fields"
 AS
 SELECT a."FDADataQualityMasterRuleObjectColumnsId" AS "Fact DataQuality Rule Object Columns Linkage Id",
    a."FDADataQualityRulesId" AS "Dim DQ Rules Id",
    a."FDASystemsId" AS "Dim System Id",
    a."FDASystemObjectsId" AS "Dim Object Id",
    a."FDASystemObjectFieldsId" AS "Dim Object Field Id",
    a."CreatedBy" AS "Rule Column Linkage Created By",
    ( SELECT x."User_Id" AS "User Id"
           FROM fda."FDAUsers" x
          WHERE x."U_UserName"::text = a."CreatedBy"::text
         LIMIT 1) AS "Dim User Field Rule Added By Id",
    1 AS "Rule Applicability Count"
   FROM fda."FDADataQualityMasterRuleObjectColumns" a;
   
-------------------------------------------------------
CREATE OR REPLACE VIEW report."Fact DQ Run Details"
 AS
 SELECT a."FDAObjectScoreOutlierCountByCategoryId" AS "Fact Object Score Run Id",
    b."FDASystemsId" AS "Dim System Id",
    a."FDAObjectScoreId" AS "Dim Object Score Run Id",
    b."FDASystemObjectsId" AS "Dim Object Id",
    a."FDAFieldScoreId" AS "Dim Field Score Run Id",
    f."FDASystemObjectFieldsId" AS "Dim Field Id",
    a."FDAObjectSegmentId" AS "Dim Object Segment Id",
    a."MasterRuleId" AS "Dim Rule Id",
    a."RuleName" AS "DQ Rule Name",
    a."OutlierCount" AS "Outlier Row Count",
    e."RowCount" - a."OutlierCount" AS "Non-Outlier Row Count",
    e."RowCount" AS "Total Row Count",
    a."LastOutlierCount" AS "Prior Run Outlier Count",
    e."LastRowCount" AS "Prior Run Total Row Count",
    e."LastRowCount" - a."LastOutlierCount" AS "Prior Run Non-Outlier Row Count",
    a."LastUpdatedBy" AS "DQ Run By",
    ( SELECT x."User_Id" AS "User Id"
           FROM fda."FDAUsers" x
          WHERE x."U_UserName"::text = a."LastUpdatedBy"::text
         LIMIT 1) AS "Dim User DQ Run By Id",
    to_char(a."LastUpdatedOn", 'YYYY-MM-DD'::text) AS "DQ Run Date",
    a."LastUpdatedOn" AS "DQ Run Date Time"
   FROM fda."FDAObjectScoreOutlierCountByCategory" a,
    fda."FDAObjectsScoreValue" e,
    fda."FDASystemObjects" b,
    fda."FDASystems" c,
    fda."FDAObjectFieldsScoreValue" f
  WHERE a."FDAObjectScoreId" = e."FDAObjectScoreValueId" 
  AND e."FDASystemObjectsId" = b."FDASystemObjectsId" 
  AND b."FDASystemsId" = c."FDASystemsId" 
  AND a."FDAFieldScoreId" = f."FDAObjectFieldsScoreValueId";
  
------------------------------------------------------------------------

CREATE OR REPLACE VIEW report."Fact Data Recon Output By Segment"
 AS
 SELECT a."FDAAlertOutputByAdvancedSegmentId",
    a."FDAAlertOutputId" AS "Dim Alert Output Id",
    a."FDAAlertRulesId" AS "Dim Alert Rules Id",
    b."FDASystemTargeteId" AS "Dim Target System Id",
    a."Severity",
    a."SourceSegment1",
    a."SourceSegment2",
    a."SourceSegment3",
    a."SourceSegment4",
    a."SourceSegment5",
    a."TargetSegment1",
    a."TargetSegment2",
    a."TargetSegment3",
    a."TargetSegment4",
    a."TargetSegment5",
    a."SourceValue1",
    a."TargetValue1",
    a."ColorBasedoThreasold1" AS "ColorBasedOnThreshold1",
    a."SourceValue2",
    a."TargetValue2",
    a."ColorBasedoThreasold2" AS "ColorBasedOnThreshold2",
    a."SourceValue3",
    a."TargetValue3",
    a."ColorBasedoThreasold3" AS "ColorBasedOnThreshold3",
    a."SourceValue4",
    a."TargetValue4",
    a."ColorBasedoThreasold4" AS "ColorBasedOnThreshold4",
    a."SourceValue5",
    a."TargetValue5",
    a."ColorBasedoThreasold5" AS "ColorBasedOnThreshold5",
    a."SourceValue6",
    a."TargetValue6",
    a."ColorBasedoThreasold6" AS "ColorBasedOnThreshold6",
    a."SourceValue7",
    a."TargetValue7",
    a."ColorBasedoThreasold7" AS "ColorBasedOnThreshold7",
    a."SourceValue8",
    a."TargetValue8",
    a."ColorBasedoThreasold8" AS "ColorBasedOnThreshold8",
    a."SourceValue9",
    a."TargetValue9",
    a."ColorBasedoThreasold9" AS "ColorBasedOnThreshold9",
    a."SourceValue10",
    a."TargetValue10",
    a."ColorBasedoThreasold10" AS "ColorBasedOnThreshold10",
    a."SourceValue11",
    a."TargetValue11",
    a."ColorBasedoThreasold11" AS "ColorBasedOnThreshold11",
    a."SourceValue12",
    a."TargetValue12",
    a."ColorBasedoThreasold12" AS "ColorBasedOnThreshold12",
    a."SourceValue13",
    a."TargetValue13",
    a."ColorBasedoThreasold13" AS "ColorBasedOnThreshold13",
    a."SourceValue14",
    a."TargetValue14",
    a."ColorBasedoThreasold14" AS "ColorBasedOnThreshold14",
    a."SourceValue15",
    a."TargetValue15",
    a."ColorBasedoThreasold15" AS "ColorBasedOnThreshold15",
    a."SourceValue16",
    a."TargetValue16",
    a."ColorBasedoThreasold16" AS "ColorBasedOnThreshold16",
    a."SourceValue17",
    a."TargetValue17",
    a."ColorBasedoThreasold17" AS "ColorBasedOnThreshold17",
    a."SourceValue18",
    a."TargetValue18",
    a."ColorBasedoThreasold18" AS "ColorBasedOnThreshold18",
    a."SourceValue19",
    a."TargetValue19",
    a."ColorBasedoThreasold19" AS "ColorBasedOnThreshold19",
    a."SourceValue20",
    a."TargetValue20",
    a."ColorBasedoThreasold20" AS "ColorBasedOnThreshold20",
    a."SourceValue21",
    a."TargetValue21",
    a."ColorBasedoThreasold21" AS "ColorBasedOnThreshold21",
    a."SourceValue22",
    a."TargetValue22",
    a."ColorBasedoThreasold22" AS "ColorBasedOnThreshold22",
    a."SourceValue23",
    a."TargetValue23",
    a."ColorBasedoThreasold23" AS "ColorBasedOnThreshold23",
    a."SourceValue24",
    a."TargetValue24",
    a."ColorBasedoThreasold24" AS "ColorBasedOnThreshold24",
    a."SourceValue25",
    a."TargetValue25",
    a."ColorBasedoThreasold25" AS "ColorBasedOnThreshold25",
    a."SourceValue26",
    a."TargetValue26",
    a."ColorBasedoThreasold26" AS "ColorBasedOnThreshold26",
    a."SourceValue27",
    a."TargetValue27",
    a."ColorBasedoThreasold27" AS "ColorBasedOnThreshold27",
    a."SourceValue28",
    a."TargetValue28",
    a."ColorBasedoThreasold28" AS "ColorBasedOnThreshold28",
    a."SourceValue29",
    a."TargetValue29",
    a."ColorBasedoThreasold29" AS "ColorBasedOnThreshold29",
    a."SourceValue30",
    a."TargetValue30",
    a."ColorBasedoThreasold30" AS "ColorBasedOnThreshold30",
    a."Threshold",
    a."ReconciliationDate",
    a."ReconciliationTime",
    a."Notes",
    a."AlertLifeCycleStatus",
    a."PriorTargetValue",
    a."PriorPriorTargetValue",
    a."CreatedDateTime",
    a."CreatedBy",
    a."UpdatedDateTime",
    a."UpdatedBy",
    a."AlertInd",
    a."SourceTargetConcatenatedColumn",
    a."SegmentInfo",
    a."ColumnInfo",
    a."LastRunTargetValue1",
    a."LastRunTargetValue2",
    a."LastRunTargetValue3",
    a."LastRunTargetValue4",
    a."LastRunTargetValue5",
    a."LastRunTargetValue6",
    a."LastRunTargetValue7",
    a."LastRunTargetValue8",
    a."LastRunTargetValue9",
    a."LastRunTargetValue10",
    a."LastRunTargetValue11",
    a."LastRunTargetValue12",
    a."LastRunTargetValue13",
    a."LastRunTargetValue14",
    a."LastRunTargetValue15",
    a."LastRunTargetValue16",
    a."LastRunTargetValue17",
    a."LastRunTargetValue18",
    a."LastRunTargetValue19",
    a."LastRunTargetValue20"
   FROM fda."FDAAlertOutputByAdvancedSegment" a
     JOIN fda."FDAAlertRules" b 
	 ON a."FDAAlertRulesId" = b."FDAAlertRulesId"
     LEFT JOIN fda."FDASystems" b1 
	 ON b."FDASystemTargeteId" = b1."FDASystemsId";

--------------------------------------------------------

CREATE OR REPLACE VIEW report."Fact User Activity"
 AS
 SELECT a."FDAUserActivityLogId" AS "Fact User Activity Log Id",
    ( SELECT x."User_Id" AS "User Id"
           FROM fda."FDAUsers" x
          WHERE x."U_UserName"::text = a."UserName"::text
         LIMIT 1) AS "Dim User Id",
    a."UserName" AS "User Name",
    a."ModuleName" AS "Module Name",
    a."ModuleURL" AS "Module URL",
    a."LogTime" AS "Login Time",
    b."U_Join_Date" AS "User Join Date",
    b."U_Last_Login" AS "User Last Login Date",
    b."UserType" AS "User Type",
    b."DefaultLanguage" AS "User Default Language",
    b."CreatedFrom" AS "User Created From",
    b."UserActiveInd" AS "User Active Ind",
    b."ActiveSessions" AS "Active Sessions"
   FROM fda."FDAUserActivityLog" a
     LEFT JOIN fda."FDAUsers" b ON a."UserName"::text = b."U_UserName"::text;
	 
-------------------------------------------------------------------------------------------------------

INSERT INTO fda."FDAReconCICDConfig" ("ConfigType","SystemType","Param3","Param4") VALUES ('CICD','Oracle','Index','INDEX');

--------------------------------------------------------------------------------------------------------

ALTER TABLE fda."FDAAlertOutput" ADD COLUMN "ServiceTicket" character varying(200);
ALTER TABLE fda."FDAAlertOutput" ADD COLUMN "ServiceTicketURL" character varying(200);
ALTER TABLE fda."FDADataQualityMasterRulesDetails" ADD COLUMN "IgnoreNull" character varying(1);
ALTER TABLE fda."FDADataQualityMasterRulesDetails" ADD COLUMN "IgnoreBlank" character varying(1);

--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS fda."FDAMasterRuleTags"
(
    "FDAMasterRuleTagsId" bigserial,
    "FDADataQualityRulesId" bigint,
    "MasterRuleTagName" text
);
--------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ListFieldOutlierCheckRules"(
	"InFieldId" bigint,
	"InSegmentedRuleInd" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
	
OPEN $3 FOR --OPEN THE REF CURSOR
	SELECT DISTINCT
		f."ObjectName",
		e."SystemName",
		e."SystemAliasName",
		e."SystemPassword",
		e."ConnectionDetails",
		e."SystemUserName",
		e."Schema",
		e."RoleName",
		e."Warehouse",
		e."Region",
		e."S3BucketLocation",
		e."PortNumber",
		e."AccessKeyID",
		e."SecretAccessKey",
		e."ClientEmail",
		e."PrivateKey",
		e."ProjectId",
		e."PassPhrase",
		COALESCE(b."SegmentedByFieldName",'') "SegmentedByFieldName",
		COALESCE(b."SegmentedByFieldValue",'') "SegmentedByFieldValue",
		b."RuleType" AS "RuleName",
		a."RuleName" AS "MasterRuleName",
		a."FDADataQualityRulesId" AS "MasterRuleId",
		d."FieldName",
		COALESCE(NULLIF(b."LeftFieldValue",'null'),'') AS "LeftFieldValue", 
		COALESCE(NULLIF(b."RightFieldValue",'null'),'')  AS "RightFieldValue",
		(CASE WHEN b."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(b."UpperThreshold",'null'),'') END) AS "HighestPossibleValue",
		(CASE WHEN b."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(b."LowerThreshold",'null'),'') END) AS "LowestPossibleValue",
        UPPER(e."SystemType") "SystemType",
        (CASE WHEN d."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') AND COALESCE(d."UserOverwriteDatatype",'STRING') = 'STRING'THEN  'STRING'
              WHEN d."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') AND COALESCE(d."UserOverwriteDatatype",'NUMBER') = 'NUMBER'THEN  'NUMBER'
              WHEN d."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') 
					AND COALESCE(d."UserOverwriteDatatype",'DATE') = 'DATE'  THEN  'DATE'
			ELSE d."UserOverwriteDatatype" 
		END) "FieldDataType",
		COALESCE(e."EncryptionInd",'No') "EncryptionInd",
		COALESCE(b."IgnoreNull",'N') "IgnoreNull",
		COALESCE(b."IgnoreBlank",'N') "IgnoreBlank"
		
    FROM fda."FDADataQualityMasterRules" a
	INNER JOIN fda."FDADataQualityMasterRulesDetails" b
		ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId"
	INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" c
		ON b."FDADataQualityRulesId" = c."FDADataQualityRulesId"
	INNER JOIN fda."FDASystemObjectFields" d
		ON  c."FDASystemsId" = d."FDASystemsId" 
		AND c."FDASystemObjectsId" = d."FDASystemObjectsId"
		AND c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	INNER JOIN fda."FDASystems" e
		ON d."FDASystemsId" = e."FDASystemsId"
	INNER JOIN fda."FDASystemObjects" f
		ON d."FDASystemsId" = f."FDASystemsId"
		AND d."FDASystemObjectsId" = f."FDASystemObjectsId"
    WHERE d."FDASystemObjectFieldsId" = "InFieldId";
	
RETURN NEXT $3;

END;
$BODY$;

------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_RuleCatalogOutlier"(
	"InRuleId" character varying,
	"InObjectId" character varying,
	"InObjectScoreId" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$


BEGIN
---------------------------------------------OBJECT & RULE DETAILS------------------------------------
IF "InObjectId" = ''  AND "InObjectScoreId" = ''  THEN

OPEN $4 FOR

SELECT X."RuleId",
	X."FDASystemObjectsId",
	X."RuleName",
	X."RuleType",
	X."MasterRuleId",
	X."ObjectName",
	X."FDAObjectScoreId",
	X."SystemName",
	X."OutlierCount",
	X."ScoreRunDate"
	
FROM(SELECT a."FDADataQualityRulesId" AS "RuleId",
			a."RuleName",
			STRING_AGG(DISTINCT b."RuleType"::TEXT,',') "RuleType",
			b."MasterRuleId",
			e."ObjectName",
			e."FDASystemObjectsId",
			STRING_AGG(DISTINCT b."FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			f."SystemAliasName" AS "SystemName",
			SUM(b."OutlierCount") "OutlierCount",
			LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT  SUM("OutlierCount") AS "OutlierCount",
						"MasterRuleId",
						"RuleName" AS "RuleType",
						"FDAObjectScoreId",
						"FDAFieldScoreId",
						"LastUpdatedOn"::date AS "ScoreRunDate"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > current_date - 30
					AND "MasterRuleId" IS NOT NULL
				GROUP BY "MasterRuleId","RuleName","FDAObjectScoreId","FDAFieldScoreId","LastUpdatedOn"::date
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN fda."FDAObjectFieldsScoreValue" c
		ON  b."FDAFieldScoreId" = c."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = c."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" d
		ON c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" e
		ON d."FDASystemObjectsId" = e."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" f
		ON e."FDASystemsId" = f."FDASystemsId"
		
	WHERE  "FDADataQualityRulesId" =  "InRuleId"::bigint
		AND e."ObjectName" IS NOT NULL 
		AND f."SystemAliasName" IS NOT NULL 
	GROUP BY a."FDADataQualityRulesId",a."RuleName",e."ObjectName",
	 		f."SystemAliasName",e."FDASystemObjectsId","ScoreRunDate",b."MasterRuleId"
	)X;
	
RETURN NEXT $4;
---------------------
OPEN $5 FOR

SELECT 
	X."ObjectName",
	X."OutlierCount",
	( MIN("OutlierCount") OVER() ) * 0.8 "MinOutlierCount",
	( MAX("OutlierCount") OVER() ) * 1.2 "MaxOutlierCount"
FROM(SELECT e."ObjectName",
			SUM(b."OutlierCount") "OutlierCount"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT  SUM("OutlierCount") AS "OutlierCount",
						"MasterRuleId",
						"FDAObjectScoreId",
						"FDAFieldScoreId"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > current_date - 30
					AND "MasterRuleId" IS NOT NULL
				GROUP BY "MasterRuleId","RuleName","FDAObjectScoreId","FDAFieldScoreId"
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN fda."FDAObjectFieldsScoreValue" c
		ON  b."FDAFieldScoreId" = c."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = c."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" d
		ON c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" e
		ON d."FDASystemObjectsId" = e."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" f
		ON e."FDASystemsId" = f."FDASystemsId"
	 
	WHERE  "FDADataQualityRulesId" = "InRuleId"::bigint
		AND e."ObjectName" IS NOT NULL 
		AND f."SystemAliasName" IS NOT NULL 
	GROUP BY e."ObjectName"
	)X;
RETURN NEXT $5;
---------------------------------------------FIELD & RULE DETAILS------------------------------------
	
ELSE IF "InObjectId" > ''  AND "InObjectScoreId" > ''
THEN

OPEN $4 FOR

SELECT X."RuleName",
	X."RuleType",
	X."MasterRuleId",
	X."ObjectName",
	X."FieldName",
	X."FDAObjectScoreId",
	X."SystemAliasName",
	X."OutlierCount",
	X."ScoreRunDate"
FROM(SELECT a."RuleName",
		STRING_AGG(DISTINCT (b."MasterRuleId"||'-'||b."RuleName")::TEXT,',') "RuleType",
		b."MasterRuleId",
		f."ObjectName",
		e."FieldName",
		STRING_AGG(DISTINCT b."FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		g."SystemAliasName",
		SUM(b."OutlierCount") "OutlierCount",
	 	LEFT(b."ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT 	"FDAObjectScoreOutlierCountByCategoryId",
						"FDAObjectScoreId",
						"FDAFieldScoreId",
						"RuleName",
						"OutlierCount",
						"MasterRuleId",
						"LastUpdatedOn"::date AS "ScoreRunDate"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > CURRENT_DATE - 30
					AND "MasterRuleId" IS NOT NULL			
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN  fda."FDAObjectFieldsScoreValue" d
		ON b."FDAFieldScoreId" = d."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = d."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" e
		ON d."FDASystemObjectFieldsId" = e."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" f
		ON e."FDASystemObjectsId" = f."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" g
		ON f."FDASystemsId" = g."FDASystemsId"
		
	WHERE a."FDADataQualityRulesId" = "InRuleId"::bigint
		AND f."FDASystemObjectsId" = "InObjectId"::bigint
	 	AND b."FDAObjectScoreId"::text IN ( SELECT "Result" FROM UNNEST(string_to_array("InObjectScoreId", ',')) "Result")
		AND f."ObjectName" IS NOT NULL
	GROUP BY a."FDADataQualityRulesId",a."RuleName",f."ObjectName",e."FieldName",g."SystemAliasName",b."ScoreRunDate",b."MasterRuleId"
	)X;
	
RETURN NEXT $4;

OPEN $5 FOR

SELECT '' "ObjectName",'' "OutlierCount",'' "MinOutlierCount",'' "MaxOutlierCount";

RETURN NEXT $5;

ELSE

OPEN $4 FOR
SELECT '';
RETURN NEXT $4;

OPEN $5 FOR
SELECT '';
RETURN NEXT $5;

END IF;
END IF;

/*
SELECT fda."Proc_RuleCatalogOutlier"(
	'107',--"InRuleId" character varying,
	'',--"InObjectId" character varying,
	'',--"InObjectScoreId" character varying,
	'refcursor1',
	'refcursor2');
FETCH ALL IN "refcursor1";
FETCH ALL IN "refcursor2";
*/

END;

$BODY$;

---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_DAMAObjectRuleOutlier_V2"(
	"InSystemName" character varying,
	"InObjectName" character varying,
	"InDAMADimension" character varying,
	"InDaysInd" bigint,
	"InDate" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$


BEGIN
"InSystemName" := CONCAT('%',"InSystemName",'%');
"InObjectName" := CONCAT('%',"InObjectName",'%');

---------------------------------------------------------------OBJECT(1- DAY)-----------------------------------------------
IF UPPER("InDAMADimension") = 'ACCURACY' --AND "InDaysInd" = 1
THEN

IF "InDaysInd" = 1
THEN

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR
SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   d."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY d."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 				
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT "RuleName",
	   "OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   c."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY c."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 		
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"				
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;
END IF;
---------------------------------------------------------------------------------------------------------
ELSE IF UPPER("InDAMADimension") = 'TIMELINESS'
THEN

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
	SELECT DISTINCT 
			'Freshness/SLA' AS "RuleName",
			SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
	FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
				(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
					ELSE 'GREEN' 
				END) "Color",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "GreenSLA",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "RedSLA"			
		FROM fda."FDASystems" a1
		INNER JOIN fda."FDASystemObjects" a
			ON a1."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
		WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
			AND a1."SystemAliasName" ILIKE "InSystemName"
			AND a."ObjectName" ILIKE "InObjectName"
		)X
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
									AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
		SELECT DISTINCT 
				'Freshness/SLA' AS "RuleName",
				SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
		FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
					(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
						ELSE 'GREEN' 
					END) "Color",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "GreenSLA",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "RedSLA"			
			FROM fda."FDASystems" a1
			INNER JOIN fda."FDASystemObjects" a
				ON a1."FDASystemsId" = a."FDASystemsId"
			INNER JOIN fda."FDAObjectsScoreValue" b
				ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
			WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND a1."SystemAliasName" ILIKE "InSystemName"
				AND a."ObjectName" ILIKE "InObjectName"
			)X
	)Y
ORDER BY "OutlierCount" DESC;

RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"	
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

END IF;
--------------------------------------------------------------------------------------------------------------
ELSE 

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR 

SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	)X
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"	
WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

ELSE

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR 

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	ORDER BY "OutlierCount" DESC
	)X;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"
WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

END IF;

END IF;
END IF;

END;
$BODY$;

-------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_DeleteFDADataQualityMasterRules"(
	"InRuleId" bigint)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

	
BEGIN
	
	DELETE FROM fda."FDADataQualityMasterRules"
	WHERE "FDADataQualityRulesId" = "InRuleId";	
	
	DELETE FROM fda."FDADataQualityMasterRulesDetails"
	WHERE "FDADataQualityRulesId" = "InRuleId";	
	
	DELETE FROM fda."FDADataQualityMasterRuleObjectColumns"
	WHERE "FDADataQualityRulesId" = "InRuleId";
	
	/*SELECT fda."Proc_DeleteFDADataQualityMasterRules"(
	'13'--<"InRuleId" bigint>
	);*/

END;       
$BODY$;

-------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_EditJobSchedule"(
	"InJobScheduleId" bigint,
	"InScheduleJobType" character varying,
	"InAlertIdList" character varying,
	"InJobName" character varying,
	"InJobDescription" character varying,
	"InJobStartDate" character varying,
	"InJobNoEndInd" character varying,
	"InJobEndDate" character varying,
	"InJobRecurrenceValue" character varying,
	"InJobRecurrenceType" character varying,
	"InJobExecutionTimeDetails" character varying,
	"InJobExecutionDayDetails" character varying,
	"InUpdatedBy" character varying,
	"InScheduleType" character varying,
	"InSystemName" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE
	"lvTimes" VARCHAR(1000);
	"OutJobScheduleId" BIGINT;
	"lvBundleName" VARCHAR(1000);
    "ITEM_CURSOR_TIME"  CURSOR 
	FOR 
	SELECT "VALUE"
	FROM UNNEST(STRING_TO_ARRAY("InJobExecutionTimeDetails", '|')) "VALUE"
	WHERE "VALUE" IS NOT NULL;
		
BEGIN

IF CAST("InJobEndDate" AS VARCHAR) = '' THEN
"InJobEndDate" := NULL;
END IF;

SELECT CONCAT("U_Firstname",' ',"U_Lastname")
INTO "InUpdatedBy"
FROM fda."FDAUsers"
WHERE "U_UserName" = "InUpdatedBy"
OR "U_Email" = "InUpdatedBy";

IF UPPER("InScheduleType") = 'QUALITY'
THEN

		
	SELECT STRING_AGG("Type"||'-'||"SystemName" ||'.'|| "ObjectName",'|' ORDER BY "Position"ASC ) 
		INTO "lvBundleName"
	FROM
		(SELECT 
			a."Position",a."Type",a."Id",b."ObjectName",c."SystemName"
		FROM
		(SELECT "Values",
			(SPLIT_PART("Values",'-',1)::BIGINT) "Position",
			SPLIT_PART("Values",'-',2) "Type",
			SPLIT_PART("Values",'-',3) "Id"
		FROM UNNEST(string_to_array("InAlertIdList",'|')) "Values"
		WHERE "Values" IS NOT NULL
			AND SPLIT_PART("Values",'-',2) = 'OBJECT') a
		INNER JOIN fda."FDASystemObjects" b
			ON (a."Id" :: BIGINT) = b."FDASystemObjectsId"
		INNER JOIN fda."FDASystems" c
			ON b."FDASystemsId" = c."FDASystemsId"
			
	UNION
	
		SELECT 
			a."Position",a."Type",a."Id",b."AlertName" "ObjectName",'' "SystemName"
		FROM
		(SELECT "Values",
			(SPLIT_PART("Values",'-',1)::BIGINT) "Position",
			SPLIT_PART("Values",'-',2) "Type",
			SPLIT_PART("Values",'-',3) "Id"
		FROM UNNEST(STRING_TO_ARRAY("InAlertIdList",'|')) "Values"
		WHERE "Values" != ''
			AND SPLIT_PART("Values",'-',2) = 'ALERT') a
		INNER JOIN fda."FDAAlertRules" b
			ON (a."Id" :: BIGINT) = b."FDAAlertRulesId"
			
		) x;

RAISE NOTICE 'VALUE: %',"lvBundleName";
	
END IF;

RAISE NOTICE 'VALUE: %',"InJobScheduleId";
	UPDATE fda."JobSchedules"
	SET "JobName" = "InJobName",
		"JobDescription" = "InJobDescription",
		"JobStartDate" = CAST("InJobStartDate" AS DATE),
		"JobRecurrenceValue" = CAST("InJobRecurrenceValue" AS BIGINT),
		"JobRecurrenceType" = "InJobRecurrenceType",
		"JobEndInd" = "InJobNoEndInd",
		"JobEndDate" = CAST(COALESCE("InJobEndDate",'1900-01-01') AS DATE),
		"LastUpdatedOn" = CURRENT_TIMESTAMP,
		"LastUpdatedBy" = "InUpdatedBy",
		"ScheduleJobType" = "InScheduleJobType",
		"ScheduleType" = UPPER("InScheduleType"),
		"SystemName" = "InSystemName",
		"BundleName" = "lvBundleName"

	WHERE "JobScheduleId" = "InJobScheduleId";

--DELETE fda.JobScheduleDays TABLE
DELETE FROM fda."JobScheduleDays"
WHERE "JobScheduleId" = "InJobScheduleId"; 

--DELETE fda.JobScheduleTimes TABLE
DELETE FROM fda."JobScheduleTimes"
WHERE "JobScheduleId" = "InJobScheduleId"; 

DELETE FROM fda."JobSchedulesXRef"
WHERE "JobScheduleId" = "InJobScheduleId";

IF "InJobRecurrenceType" = 'Week'
THEN

    INSERT INTO fda."JobScheduleDays" 
    (
	"JobScheduleId",
	"JobScheduleDays",
	"LastUpdatedOn",
	"LastUpdatedBy"
	)
	SELECT
	"InJobScheduleId",
	"VALUE",
	CURRENT_DATE,
	"InUpdatedBy"
	FROM UNNEST(STRING_TO_ARRAY("InJobExecutionDayDetails", '|')) "VALUE"
    WHERE "VALUE" IS NOT NULL;

END IF;  --IF END

IF "InJobExecutionTimeDetails" > ''
THEN
FOR row IN "ITEM_CURSOR_TIME" LOOP
RAISE NOTICE 'VALUE: %',row;
"lvTimes" = REPLACE(CAST(row AS TEXT),'(','');
"lvTimes" = REPLACE("lvTimes",')','');
"lvTimes" = REPLACE("lvTimes",'"','');

        INSERT INTO fda."JobScheduleTimes" 
        (
		"JobScheduleId",
		"JobExecutionHour",
		"JobExecutionMinute",
		"LastUpdatedOn",
		"LastUpdatedBy"
		)
		VALUES 
		(
		"InJobScheduleId",
		CAST(SPLIT_PART(REPLACE("lvTimes",':',','),',',1) AS BIGINT),
		CAST(COALESCE(SPLIT_PART(REPLACE("lvTimes",':',','),',',2),'0') AS BIGINT),
		CURRENT_TIMESTAMP,
		"InUpdatedBy"
		);

END LOOP;
END IF;

IF "InAlertIdList" <> '' AND UPPER("InScheduleType") = UPPER('QUALITY')
THEN
  RAISE NOTICE 'VALUE: %',"InScheduleType";
    INSERT INTO fda."JobSchedulesXRef"
     (
		"JobScheduleId",
		"FDAAlertId",
		"ObjectId",
		"JobCreationBy",
		"JobCreationDate",
		"LastUpdatedBy" ,
		"LastUpdatedOn",
		"Position",
		"Status"
     )
     SELECT  
		"InJobScheduleId",
		(CASE WHEN SPLIT_PART("VALUE",'-',2) = 'ALERT' THEN CAST(SPLIT_PART("VALUE",'-',3) AS BIGINT) ELSE NULL END),
		(CASE WHEN SPLIT_PART("VALUE",'-',2) = 'OBJECT' THEN CAST(SPLIT_PART("VALUE",'-',3) AS BIGINT) ELSE NULL END),
     	"InUpdatedBy",
     	CURRENT_DATE,
     	"InUpdatedBy",
     	CURRENT_DATE,
		CAST(SPLIT_PART("VALUE",'-',1) AS BIGINT),
		(CASE WHEN SPLIT_PART("VALUE",'-',2) = 'OBJECT' THEN SPLIT_PART("VALUE",'-',4)  ELSE NULL END)
     FROM UNNEST(STRING_TO_ARRAY("InAlertIdList" ,'|')) "VALUE"
     WHERE "VALUE" IS NOT NULL;
	
ELSE IF "InAlertIdList" <> '' AND UPPER("InScheduleType") = UPPER('ALERT')
THEN
RAISE NOTICE 'VALUE: %',"InScheduleType";
	INSERT INTO fda."JobSchedulesXRef"
    (
    "JobScheduleId",
    "FDAAlertId",
    "JobCreationBy",
    "JobCreationDate",
    "LastUpdatedBy" ,
    "LastUpdatedOn"
    )
    SELECT  
	"InJobScheduleId",
    CAST("VALUE" AS BIGINT),
    "InUpdatedBy",
    CURRENT_DATE,
    "InUpdatedBy",
    CURRENT_DATE
    FROM UNNEST(STRING_TO_ARRAY("InAlertIdList", '|')) "VALUE"
    WHERE "VALUE" IS NOT NULL;
END IF;  --ELSE IF END
END IF;  --IF END

OPEN $16 FOR --OPEN THE REF CURSOR
	SELECT "InJobScheduleId" AS "OutJobScheduleId" ;
RETURN NEXT $16;

END;
$BODY$;

--------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS fda."Proc_InsertFDADataQualityMasterRules" ;
--------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_InsertFDADataQualityMasterRules"(
	"InRuleId" character varying,
	"InMasterRuleName" character varying,
	"InRuleDescription" text,
	"InData" text,
	"InCreatedBy" character varying,
	"InSystemName" character varying,
	"InDAMADimension" character varying,
	"InRuleTagData" text,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE "lvFDADataQualityRulesId" BIGINT;
DECLARE "OutQualityRuleId" BIGINT;
DECLARE "lvRules" TEXT;

BEGIN

IF "InRuleId" = '' THEN 

	INSERT INTO fda."FDADataQualityMasterRules"
				(
					"RuleName",
					"RuleDescription",
					"DAMADimension",
					"FDASystemsId",
					"CreatedOn",
					"CreatedBy"
				)
	VALUES
				(
					"InMasterRuleName",
					"InRuleDescription",
					"InDAMADimension",
					(SELECT "FDASystemsId" FROM fda."FDASystems" WHERE "SystemAliasName" = "InSystemName"),
					CURRENT_TIMESTAMP,
					"InCreatedBy"
				);
	
	SELECT MAX("FDADataQualityRulesId")
	INTO "OutQualityRuleId" 
	FROM fda."FDADataQualityMasterRules";
	
	INSERT INTO fda."FDADataQualityMasterRulesDetails"
				(
					"FDADataQualityRulesId",
					"RuleType",
					"LeftFieldValue",
					"RightFieldValue",
					"UpperThreshold",
					"LowerThreshold",
					"IgnoreNull",
					"IgnoreBlank",
					"CreatedOn",
					"CreatedBy" 
				)
	SELECT 
			"OutQualityRuleId" ,
			NULLIF(SPLIT_PART("VALUE",'(^)',1),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',2),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',3),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',4),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',5),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',6),''),
			NULLIF(SPLIT_PART("VALUE",'(^)',7),''),	
			CURRENT_TIMESTAMP,
			"InCreatedBy"
	FROM UNNEST(STRING_TO_ARRAY("InData",'|')) "VALUE";
	
	SELECT MAX((CASE 
					WHEN UPPER("RuleType") = UPPER('Range of Values') THEN 'NUMBER'
					WHEN UPPER("RuleType") = UPPER('Date Range') THEN 'DATE'
					WHEN "RuleType" IN ('Enumerated Value','Row Count Variation','Date Range','Length Check','DataType Check','Possible Character','Blank/NonBlank','Fixed static value','Distinct Check','Enumerated Value(Query)','User Criteria') THEN 'NUMBER,STRING,DATE'
				END))
	INTO "lvRules"
	FROM(SELECT (CASE 
					WHEN "RuleType" IN ('Enumerated Value','Range of Values','Date Range','Length Check') AND "LeftFieldValue" > '' OR "RightFieldValue" > ''
						THEN  "RuleType"
					WHEN "RuleType" IN ('DataType Check','Possible Character','Blank/NonBlank','Fixed static value','Distinct Check','Enumerated Value(Query)','User Criteria') AND "LeftFieldValue" > '' 
						THEN "RuleType"
					WHEN "RuleType" IN ('Possible Character','Row Count Variation') AND ("LeftFieldValue" > '' OR "RightFieldValue" > '') 
						THEN "RuleType"
				END) "RuleType"
		FROM fda."FDADataQualityMasterRulesDetails"
		WHERE "FDADataQualityRulesId" = "OutQualityRuleId"
		)x
	WHERE "RuleType" IS NOT NULL;
	
	UPDATE fda."FDADataQualityMasterRules" 
	SET "RuleDataType" = "lvRules"
	WHERE "FDADataQualityRulesId" = "OutQualityRuleId";
	
--------------------------------------------------------(Rule Tag)---------------------------------------	
	INSERT INTO fda."FDAMasterRuleTags"(
	                  "FDADataQualityRulesId",
                      "MasterRuleTagName" 
                       )
                SELECT 
				"OutQualityRuleId",
				 NULLIF(value,'')
				 FROM 
                 UNNEST(STRING_TO_ARRAY("InRuleTagData",'(^)')) AS value;			
	
ELSE
	
		UPDATE fda."FDADataQualityMasterRules"
			SET "RuleName" = "InMasterRuleName",
				"RuleDescription" = "InRuleDescription",
				"DAMADimension" = "InDAMADimension",
				"FDASystemsId" = (SELECT "FDASystemsId" FROM fda."FDASystems" WHERE "SystemAliasName" = "InSystemName"),
				"LastUpdatedOn" = CURRENT_TIMESTAMP,
				"LastUpdatedBy" = "InCreatedBy"
		WHERE "FDADataQualityRulesId" = "InRuleId"::bigint ;
			
		"OutQualityRuleId" := (SELECT  "InRuleId"::bigint);
			
		
		DELETE FROM fda."FDADataQualityMasterRulesDetails"
		WHERE "FDADataQualityRulesId" = "InRuleId"::bigint ;
		
		INSERT INTO fda."FDADataQualityMasterRulesDetails"
					(
						"FDADataQualityRulesId",
						"RuleType",
						"LeftFieldValue",
						"RightFieldValue",
						"UpperThreshold",
						"LowerThreshold",
						"IgnoreNull",
						"IgnoreBlank",
						"CreatedOn",
						"CreatedBy" 
					)
		SELECT 
				"InRuleId"::bigint,
				NULLIF(SPLIT_PART("VALUE",'(^)',1),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',2),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',3),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',4),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',5),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',6),''),
				NULLIF(SPLIT_PART("VALUE",'(^)',7),''),	
				CURRENT_TIMESTAMP,
				"InCreatedBy"
		FROM UNNEST(STRING_TO_ARRAY("InData",'|')) "VALUE";
		
	SELECT MAX((CASE 
					WHEN UPPER("RuleType") = UPPER('Range of Values') THEN 'NUMBER'
					WHEN UPPER("RuleType") = UPPER('Date Range') THEN 'DATE'
					WHEN "RuleType" IN ('Enumerated Value','Row Count Variation','Date Range','Length Check','DataType Check','Possible Character','Blank/NonBlank','Fixed static value','Distinct Check','Enumerated Value(Query)','User Criteria') THEN 'NUMBER,STRING,DATE'
				END))
	INTO "lvRules"
	FROM (SELECT(CASE 
					WHEN "RuleType" IN ('Enumerated Value','Range of Values','Date Range','Length Check') AND "LeftFieldValue" > '' OR "RightFieldValue" > ''
						THEN  "RuleType"
					WHEN "RuleType" IN ('DataType Check','Possible Character','Blank/NonBlank','Fixed static value','Distinct Check','Enumerated Value(Query)','User Criteria') AND "LeftFieldValue" > '' 
						THEN "RuleType"
					WHEN "RuleType" IN ('Possible Character','Row Count Variation') AND ("LeftFieldValue" > '' OR "RightFieldValue" > '') 
						THEN "RuleType"
				END) "RuleType"
		FROM fda."FDADataQualityMasterRulesDetails"
		WHERE "FDADataQualityRulesId" = "InRuleId"::bigint
		)x
	WHERE "RuleType" IS NOT NULL;
	
	UPDATE fda."FDADataQualityMasterRules" 
	SET "RuleDataType" = "lvRules"
	WHERE "FDADataQualityRulesId" = "InRuleId"::bigint;
	
------------------------------------------------------------------(Rule Tag)------------------------------	
	DELETE FROM fda."FDAMasterRuleTags"
	WHERE "FDADataQualityRulesId" = "InRuleId"::bigint ;
	
	
		   INSERT INTO fda."FDAMasterRuleTags"(
	                  "FDADataQualityRulesId",
                      "MasterRuleTagName" 
                       )
                SELECT 
					"OutQualityRuleId",
					NULLIF(value,'')
				 FROM 
                 UNNEST(STRING_TO_ARRAY("InRuleTagData",'(^)')) AS value;
		
				
END IF;

OPEN $9 FOR
	SELECT "OutQualityRuleId";
RETURN NEXT $9;

END;
$BODY$;

---------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ViewMasterRules"(
	"INFDADataQualityRulesId" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE "RulesCount" BIGINT;

BEGIN 

OPEN $2 FOR
		
	SELECT  COALESCE(b."RuleName",'') AS "MasterRuleName",
			COALESCE(b."RuleDescription",'') AS "RuleDescription",
			COALESCE(d."MasterRuleTagName",'') AS "MasterRuleTagName",
			c."SystemAliasName" AS "SystemName",
			"RuleType" AS "RuleName",
			COALESCE("DAMADimension",'') AS "DAMADimension",
			COALESCE(NULLIF(COALESCE("LeftFieldValue",''),'null'),'') "LeftFieldValue",
			COALESCE(NULLIF(COALESCE("RightFieldValue",''),'null'),'') "RightFieldValue",
			(CASE WHEN "RuleType" <> 'Range of Values' THEN a."UpperThreshold" END) AS "UpperThreshold",
			(CASE WHEN "RuleType" <> 'Range of Values' THEN a."LowerThreshold" END) AS "LowerThreshold",
			(CASE WHEN "RuleType" = 'Range of Values'  THEN a."UpperThreshold" END) AS "HighestPossibleValue",
			(CASE WHEN "RuleType" = 'Range of Values'  THEN a."LowerThreshold" END) AS "LowestPossibleValue",
			COALESCE(NULLIF("IgnoreNull",''),'N') "IgnoreNull",
			COALESCE(NULLIF("IgnoreBlank",''),'N') "IgnoreBlank"
	FROM fda."FDADataQualityMasterRulesDetails" a
	RIGHT JOIN fda."FDADataQualityMasterRules" b
		ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId"
	LEFT JOIN fda."FDASystems" c
		ON b."FDASystemsId" = c."FDASystemsId"
		LEFT JOIN fda."FDAMasterRuleTags" d
		ON a."FDADataQualityRulesId" = d."FDADataQualityRulesId"
	WHERE b."FDADataQualityRulesId" = COALESCE(NULLIF("INFDADataQualityRulesId",'')::bigint,'0');
			
RETURN NEXT $2;

/*SELECT fda."Proc_ViewMasterRules"(
	'',--"INFDADataQualityRulesId" integer,
	'refcursor');
	FETCH ALL IN "refcursor";
	*/
END;
$BODY$;

---------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ListAdvanceAlertOutputSegmentGraph"(
	"InOffSet" bigint,
	"InLimit" bigint,
	"InFDAAlertRulesId" bigint,
	"InFDAAlertOutputId" bigint,
	"InPosition" integer,
	"InSegmentValues" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE "SelectString" TEXT;
		"FromString" TEXT;
		"WhereString" TEXT;
		"OrderByString" TEXT;
		"SelectString2" TEXT;
		"lvAlertTypeInd" character varying(20);
BEGIN

SELECT "AlertTypeInd"
INTO "lvAlertTypeInd"
FROM fda."FDAAlertRules" 
WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";

IF "lvAlertTypeInd" = 'SourceTargetValue' THEN 

	"SelectString2":='(CASE WHEN  '||"InPosition"||' = 1 THEN CAST(COALESCE("SourceValue1",0) AS NUMERIC(18,2)) 
						 WHEN  '||"InPosition"||' = 2 THEN CAST(COALESCE("SourceValue2",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 3 THEN CAST(COALESCE("SourceValue3",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 4 THEN CAST(COALESCE("SourceValue4",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 5 THEN CAST(COALESCE("SourceValue5",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 6 THEN CAST(COALESCE("SourceValue6",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 7 THEN CAST(COALESCE("SourceValue7",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 8 THEN CAST(COALESCE("SourceValue8",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 9 THEN CAST(COALESCE("SourceValue9",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 10 THEN CAST(COALESCE("SourceValue10",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 11 THEN CAST(COALESCE("SourceValue11",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 12 THEN CAST(COALESCE("SourceValue12",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 13 THEN CAST(COALESCE("SourceValue13",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 14 THEN CAST(COALESCE("SourceValue14",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 15 THEN CAST(COALESCE("SourceValue15",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 16 THEN CAST(COALESCE("SourceValue16",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 17 THEN CAST(COALESCE("SourceValue17",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 18 THEN CAST(COALESCE("SourceValue18",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 19 THEN CAST(COALESCE("SourceValue19",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 20 THEN CAST(COALESCE("SourceValue20",0) AS NUMERIC(18,2))
						 END)"SourceValue",
					( CASE WHEN '||"InPosition"||' = 1 THEN CAST(COALESCE("TargetValue1",0) AS NUMERIC(18,2)) 
						WHEN '||"InPosition"||' = 2 THEN CAST(COALESCE("TargetValue2",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 3 THEN CAST(COALESCE("TargetValue3",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 4 THEN CAST(COALESCE("TargetValue4",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 5 THEN CAST(COALESCE("TargetValue5",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 6 THEN CAST(COALESCE("TargetValue6",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 7 THEN CAST(COALESCE("TargetValue7",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 8 THEN CAST(COALESCE("TargetValue8",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 9 THEN CAST(COALESCE("TargetValue9",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 10 THEN CAST(COALESCE("TargetValue10",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 11 THEN CAST(COALESCE("TargetValue11",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 12 THEN CAST(COALESCE("TargetValue12",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 13 THEN CAST(COALESCE("TargetValue13",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 14 THEN CAST(COALESCE("TargetValue14",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 15 THEN CAST(COALESCE("TargetValue15",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 16 THEN CAST(COALESCE("TargetValue16",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 17 THEN CAST(COALESCE("TargetValue17",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 18 THEN CAST(COALESCE("TargetValue18",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 19 THEN CAST(COALESCE("TargetValue19",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 20 THEN CAST(COALESCE("TargetValue20",0) AS NUMERIC(18,2))	
						
						END) "TargetValue",';
ELSE 	
	"SelectString2":='(CASE WHEN  '||"InPosition"||' = 1 THEN CAST(COALESCE("SourceValue1",0) AS NUMERIC(18,2)) 
						 WHEN  '||"InPosition"||' = 2 THEN CAST(COALESCE("SourceValue2",null) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 3 THEN CAST(COALESCE("SourceValue3",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 4 THEN CAST(COALESCE("SourceValue4",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 5 THEN CAST(COALESCE("SourceValue5",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 6 THEN CAST(COALESCE("SourceValue6",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 7 THEN CAST(COALESCE("SourceValue7",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 8 THEN CAST(COALESCE("SourceValue8",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 9 THEN CAST(COALESCE("SourceValue9",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 10 THEN CAST(COALESCE("SourceValue10",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 11 THEN CAST(COALESCE("SourceValue11",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 12 THEN CAST(COALESCE("SourceValue12",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 13 THEN CAST(COALESCE("SourceValue13",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 14 THEN CAST(COALESCE("SourceValue14",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 15 THEN CAST(COALESCE("SourceValue15",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 16 THEN CAST(COALESCE("SourceValue16",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 17 THEN CAST(COALESCE("SourceValue17",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 18 THEN CAST(COALESCE("SourceValue18",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 19 THEN CAST(COALESCE("SourceValue19",0) AS NUMERIC(18,2))
						 WHEN  '||"InPosition"||' = 20 THEN CAST(COALESCE("SourceValue20",0) AS NUMERIC(18,2))
						 END) "LastRun",
						( CASE WHEN '||"InPosition"||' = 1 THEN CAST(COALESCE("TargetValue1",0) AS NUMERIC(18,2)) 
						WHEN '||"InPosition"||' = 2 THEN CAST(COALESCE("TargetValue2",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 3 THEN CAST(COALESCE("TargetValue3",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 4 THEN CAST(COALESCE("TargetValue4",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 5 THEN CAST(COALESCE("TargetValue5",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 6 THEN CAST(COALESCE("TargetValue6",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 7 THEN CAST(COALESCE("TargetValue7",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 8 THEN CAST(COALESCE("TargetValue8",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 9 THEN CAST(COALESCE("TargetValue9",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 10 THEN CAST(COALESCE("TargetValue10",0) AS NUMERIC(18,2))
						WHEN '||"InPosition"||' = 11 THEN CAST(COALESCE("TargetValue11",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 12 THEN CAST(COALESCE("TargetValue12",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 13 THEN CAST(COALESCE("TargetValue13",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 14 THEN CAST(COALESCE("TargetValue14",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 15 THEN CAST(COALESCE("TargetValue15",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 16 THEN CAST(COALESCE("TargetValue16",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 17 THEN CAST(COALESCE("TargetValue17",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 18 THEN CAST(COALESCE("TargetValue18",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 19 THEN CAST(COALESCE("TargetValue19",0) AS NUMERIC(18,2))	
						WHEN '||"InPosition"||' = 20 THEN CAST(COALESCE("TargetValue20",0) AS NUMERIC(18,2))	
						END) "TargetValue",
						 ';
END IF;

"OrderByString" := CONCAT('ORDER BY "ReconciliationDate" ASC OFFSET ',"InOffSet",' ROWS
FETCH NEXT ',"InLimit",' ROWS ONLY;');

"SelectString" :=CONCAT('SELECT * FROM( 
					SELECT DISTINCT
					"FDAAlertOutputByAdvancedSegmentId",
					"FDAAlertOutputId",
					"Severity",
					 (CASE WHEN "Severity" = 1 THEN ''RED''
				  WHEN "Severity" = 2 THEN ''ORANGE''
				  WHEN "Severity" = 3 THEN ''GREEN''
				  WHEN CAST("Severity" AS VARCHAR) LIKE ''%9%'' THEN ''GREEN''
			      ELSE ''GREEN''
				  END) "Color",
					CONCAT(COALESCE("TargetSegment1","SourceSegment1"),
							COALESCE("TargetSegment2","SourceSegment2"),
							COALESCE("TargetSegment3","SourceSegment3"),
							COALESCE("TargetSegment4","SourceSegment4"),
							COALESCE("TargetSegment5","SourceSegment5")) "SourceSegment",
							 ',"SelectString2",'
					TO_CHAR("ReconciliationDate",''yyyy-mm-dd'') "ReconciliationDate",
					''',"lvAlertTypeInd",''' as "AlertType",
					"ReconciliationTime",
					"PriorTargetValue",
					"PriorPriorTargetValue"
					 ');

"FromString" := 'FROM fda."FDAAlertOutputByAdvancedSegment" ';

"WhereString" :=CONCAT('WHERE "FDAAlertRulesId" IN( ',"InFDAAlertRulesId",')
						   AND CONCAT(COALESCE("SourceSegment1","TargetSegment1"),''|'',
							COALESCE("SourceSegment2","TargetSegment2"),''|'',
							COALESCE("SourceSegment3","TargetSegment3"),''|'',
							COALESCE("SourceSegment4","TargetSegment4"),''|'',
							COALESCE("SourceSegment5","TargetSegment5"))= ''',"InSegmentValues",''' ');
IF "InFDAAlertOutputId" > 0
THEN  
	"WhereString" :=CONCAT("WhereString",'
					AND "FDAAlertOutputId" <= ',"InFDAAlertOutputId",' ');
END IF;
"SelectString" :=CONCAT("SelectString","FromString","WhereString",' ) x ', "OrderByString");
RAISE NOTICE 'SelectString: %',"SelectString";

OPEN $7 FOR 
	EXECUTE "SelectString";
RETURN NEXT $7;

END;
$BODY$;
------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ListAlertOutput"(
	"InOffSet" bigint,
	"InLimit" bigint,
	"InViewType" character varying,
	"InOrderByColumn" character varying,
	"InOrderBy" character varying,
	"InFDAAlertOutputId" character varying,
	"InFDAAlertRulesId" character varying,
	"InAlertTypeInd" character varying,
	"InSourceSystemName" character varying,
	"InSourceTableName" character varying,
	"InTargetSystemName" character varying,
	"InTargetTableName" character varying,
	"InThreshold" character varying,
	"InReconciliationDate" character varying,
	"InEmailSent" character varying,
	"InCurrentAlertStatus" character varying,
	"InNotes" character varying,
	"InSeverity" character varying,
	"InApplicationName" character varying,
	"InAlertMonth" character varying,
	"InOwnerName" character varying,
	"InSeverityType" character varying,
	"InSeverity1AlertsInLast7DaysInd" character varying,
	"InSeverity2AlertsInLast7DaysInd" character varying,
	"InRecordCountAlertsInd" character varying,
	"InValueAlertsInd" character varying,
	"InLast30DaysInd" character varying,
	"InAlertIdList" character varying,
	"InIndicatorToSHowCalledFromDataCheck" character varying,
	"InAlertTag" character varying,
	"InScoreInd" character varying,
	"InObjectGroup" character varying,
	"InFromDate" character varying,
	"InToDate" character varying,
	refcursor,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
--DECLARE "lvQuerySelect" VARCHAR(2000)
DECLARE "OutTotalRecordCount" BIGINT;		
DECLARE "ParmDefinition" VARCHAR(500);
		"lvQuerySelect" TEXT;
		"lvQuerySelectColumn" TEXT;
		"lvQuerySelectTable" TEXT;
		"lvQuerySelect2" TEXT;
		"lvQuerySelectCount" TEXT;
		"OrderByString" TEXT;
		"TotalRowCount" BIGINT;
		"lvWhereClause" TEXT;
		"lvQuerySelect3" TEXT;
		"lvAlertId" VARCHAR(100); 
		"lvInd1" VARCHAR(5)='N';
		"ColumnName" VARCHAR(100) = '';
DECLARE "lvExecutionId" BIGINT;

DECLARE "ITEM_CURSOR" CURSOR FOR SELECT "VALUE" 
		FROM unnest(STRING_TO_ARRAY("InAlertIdList" ,'|')) "VALUE"
		WHERE "VALUE" IS NOT NULL;
BEGIN

"InAlertTypeInd" := UPPER("InAlertTypeInd");
"InSourceSystemName" := UPPER("InSourceSystemName");
"InSourceTableName" := UPPER("InSourceTableName");
"InTargetSystemName" := UPPER("InTargetSystemName");
"InTargetTableName" := UPPER("InTargetTableName");
"InThreshold" := UPPER("InThreshold");
"InReconciliationDate" := UPPER("InReconciliationDate");
"InEmailSent" := UPPER("InEmailSent");
"InCurrentAlertStatus" := UPPER("InCurrentAlertStatus");
"InNotes" := UPPER("InNotes");
"InSeverity" := UPPER("InSeverity");
"InApplicationName" := UPPER("InApplicationName");
"InAlertMonth" := UPPER("InAlertMonth");
"InOwnerName" := UPPER("InOwnerName");
"InSeverityType" := UPPER("InSeverityType");
"InSeverity1AlertsInLast7DaysInd" := UPPER("InSeverity1AlertsInLast7DaysInd");
"InSeverity2AlertsInLast7DaysInd" := UPPER("InSeverity2AlertsInLast7DaysInd");
"InRecordCountAlertsInd" := UPPER("InRecordCountAlertsInd");
"InValueAlertsInd" := UPPER("InValueAlertsInd");
--"InAlertTag" := UPPER("InAlertTag");

IF "InViewType" =  'TREE'
 THEN
   SELECT "ColumnName" = 'b."AlertName" name ,';
 END IF;

-- WHen coming from FDA Data Check button

IF "InIndicatorToSHowCalledFromDataCheck" = 'YES'  --IF BLOCK 1
THEN
FOR row IN "ITEM_CURSOR" LOOP
"lvAlertId" = REPLACE(CAST(row AS TEXT),'(','');
"lvAlertId" = REPLACE("lvAlertId",')',''); 
"lvAlertId" = REPLACE("lvAlertId",'"',''); 

-- Insert the alert run status
-- Check if Pending satus is there.
	SELECT COUNT(*) INTO "TotalRowCount"
	FROM fda."FDAAlertOutput"
	WHERE "FDAAlertRulesId" = CAST("lvAlertId" AS BIGINT)
	AND "CurrentAlertStatus" = 'PENDING';

	IF "TotalRowCount" = 0
	THEN
		"lvExecutionId" := nextval('fda."seq_FDAAlertRunId"') ;

		INSERT INTO fda."FDAAlertOutput"
		( 
		 "FDAAlertOutputId"
		 ,"FDAAlertRulesId"
		 ,"ReconciliationDate"
		 ,"ReconciliationTime"
		 ,"CurrentAlertStatus"
		 ,"UpdatedDateTime"
		 ,"UpdatedBy"
		 ,"LastUpdatedDateTime"
		 ,"LastUpdatedBy"
		)
		SELECT 
		"lvExecutionId",
		a."FDAAlertRulesId"
		,CURRENT_DATE
		,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM')  --ReconciliationTime
		,'PENDING' -- CurrentAlertStatus
		,CURRENT_TIMESTAMP
		,a."UpdatedBy"
		,CURRENT_TIMESTAMP
		,a."UpdatedBy"
		FROM fda."FDAAlertRules" a
			LEFT OUTER JOIN fda."FDASystems" d
				  ON a."FDASystemSourceId" = d."FDASystemsId"
			LEFT OUTER JOIN fda."FDASystems" e
				  ON a."FDASystemTargeteId" = e."FDASystemsId"
			LEFT OUTER JOIN fda."FDASystemObjects" h
				  ON a."FDASourceTableId" = h."FDASystemObjectsId"
			LEFT OUTER JOIN fda."FDASystemObjects" i
				  ON a."FDATargetTableId" = i."FDASystemObjectsId"
		WHERE a."FDAAlertRulesId" = CAST("lvAlertId" AS BIGINT) ;

	END IF;
--SET @OutAlertIdandAlertRunId = CONCAT(@OutAlertIdandAlertRunId,"lvAlertId",'~',"lvExecutionId",'|');

END LOOP;
-- Then query
	"lvQuerySelect" := 'SELECT DISTINCT
								a."FDAAlertOutputId",
								a."FDAAlertRulesId",
								b."AlertName",
								''ADVANCED'' as "AlertTypeCategory",----b."AlertTypeCategory",
							    b."AlertTypeInd",
								b."AlertTag",
								COALESCE(a."ServiceTicket",'''') "ServiceTicket",
								COALESCE(a."ServiceTicketURL",'''') "ServiceTicketURL",
								COALESCE(bb."ObjectGroup",''NotAssigned'')"ObjectGroup",
								a."Severity" "severity",
								c."SystemAliasName" "SystemName" ,
								d."ObjectName" "TableName",
								e."SystemAliasName" "TargetSystemName",
								(CASE WHEN b."TargetInfoEntryType" = ''Wizard'' THEN f."ObjectName" 
								ELSE ''CUSTOMIZED QUERRY'' END)"TargetTableName" ,
								0 "SourceValue",
								0 "TargetValue",
								b."LowerThresholdValue" "Threshold",
								SUBSTRING(a."ReconciliationDate":: VARCHAR ,0,11) "ReconciliationDate",
								a."ReconciliationTime" "ReconciliationTime",
								'''' "EmailSent",
								a."CurrentAlertStatus",
								a."Notes",
								CONCAT(to_char(cast(a."LastUpdatedDateTime" as timestamp),''HH24:MI:SS''),'' GMT'') AS "TIMEGMT",
								COALESCE(NULLIF(a."ThresholdType",''''),b."ThresholdType") AS "ThresholdType",
								g."ApplicationName",
								b."AlertDescription",
								h."Email" "PrimaryOwnerEmail",
								(CASE WHEN b."TargetInfoEntryType" = ''Wizard'' THEN f."ObjectName" 
								ELSE ''CUSTOMIZED QUERRY'' END)"TargetTableName" ,
								a."Notes" ,
								(CASE 
								WHEN b."TargetInfoEntryType" = ''Editor''  AND g2."TargetQuerySegmentCount" > 1 
									THEN ''*MULTIPLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Editor''  AND g2."TargetQuerySegmentCount" = 1 
									THEN ''*SINGLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard''  AND g1."TargetTableSegmentCount" > 1  
									THEN ''MULTIPLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard''  AND g1."TargetTableSegmentCount" = 1  
									THEN ''SINGLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard'' AND COALESCE(g1."TargetTableSegmentCount",0) = 0 
									THEN ''TOTAL''
								WHEN b."TargetInfoEntryType" = ''Editor'' AND COALESCE(g2."TargetQuerySegmentCount",0) = 0 
									THEN ''*TOTAL''
								ELSE ''TOTAL'' 
								END) "AlertSegmentType",
								(CASE 
								WHEN b."TargetInfoEntryType" = ''Wizard'' 
									THEN COALESCE(g1."GroupByTargetTableColumn",'''')
		                        WHEN b."TargetInfoEntryType" = ''Editor'' 
									THEN COALESCE(g2."TargetQueryGroupByColumn",'''')
		                        ELSE '''' 
								END )"TargetSegmentName"
								
							FROM fda."FDAAlertOutput" a
							INNER JOIN fda."FDAAlertRules" b
								ON a."FDAAlertRulesId" = b."FDAAlertRulesId"
							LEFT OUTER JOIN fda."FDASystems" c
								ON b."FDASystemSourceId" =  c."FDASystemsId"
							LEFT OUTER JOIN fda."FDASystemObjects" d
								ON b."FDASourceTableId" =  d."FDASystemObjectsId"
							LEFT OUTER JOIN fda."FDASystems" e
								ON b."FDASystemTargeteId" =  e."FDASystemsId"
							LEFT OUTER JOIN fda."FDASystemObjects" f
								ON b."FDATargetTableId" =  f."FDASystemObjectsId"
							LEFT OUTER JOIN  fda."FDAApplications" g 
								ON b."ApplicationId" = g."FDAApplicationsId" 
							LEFT OUTER JOIN fda."FDAPrimaryOwnerEmail" h
								ON h."FDAAlertRulesId" = b."FDAAlertRulesId"
							LEFT OUTER JOIN fda."FDAUsers" ii
								ON h."Email" = ii."U_Email" 
							LEFT OUTER JOIN	(SELECT DISTINCT a."FDAAlertRulesId",
							                        COUNT(c."FieldName") "TargetTableSegmentCount",
							                        STRING_AGG(c."FieldName",'' | '') AS "GroupByTargetTableColumn"
                                             FROM fda."FDAAlertRules" a
                                             INNER JOIN fda."FDAAlertRulesTargetSegment" b
                                             		 ON a."FDAAlertRulesId" = b."FDAAlertRulesId"
                                             INNER JOIN	fda."FDASystemObjectFields" c
                                             		  ON b."GroupByTargetColumnId" = c."FDASystemObjectFieldsId"
													  WHERE  a."TargetInfoEntryType" = ''Wizard''
                                             GROUP BY a."FDAAlertRulesId") g1
			                   ON a."FDAAlertRulesId" = g1."FDAAlertRulesId" 
		                   LEFT OUTER JOIN	(SELECT DISTINCT a."FDAAlertRulesId",
						                            COUNT(b."GroupByTargetColumnName") "TargetQuerySegmentCount",
													STRING_AGG(b."GroupByTargetColumnName",'' | '')   AS "TargetQueryGroupByColumn"
                                             FROM fda."FDAAlertRules" a,
                                             fda."FDAAlertRulesTargetSegment" b
                                             WHERE a."FDAAlertRulesId" = b."FDAAlertRulesId"
						                       AND a."TargetInfoEntryType" = ''Editor''
                                             GROUP BY a."FDAAlertRulesId") g2
			                   ON a."FDAAlertRulesId" = g2."FDAAlertRulesId"   
							LEFT OUTER JOIN (SELECT "FDAAlertRulesId",
													split_part("AlertTag", ''.''::text, 1) AS "SystemAliasName",
													(split_part("AlertTag", ''.''::text, 2) || ''.''::text) || split_part("AlertTag", ''.''::text, 3) AS "ObjectName"
												FROM fda."FDAAlertRules") aa
								ON b."FDAAlertRulesId" = aa."FDAAlertRulesId"							
							LEFT OUTER JOIN fda."FDASystems" cc
								ON cc."SystemAliasName" = aa."SystemAliasName"
							LEFT OUTER JOIN fda."FDASystemObjects" bb						
								ON aa."ObjectName" = bb."ObjectName" 
								AND cc."FDASystemsId" = bb."FDASystemsId" ';

	"lvWhereClause" := CONCAT(' WHERE a."CurrentAlertStatus" = ''PENDING'' AND a."FDAAlertRulesId" IN (',REPLACE("InAlertIdList",'|',','),') ');

	"lvQuerySelect2" := ' ORDER BY a."FDAAlertOutputId" DESC
	                    OFFSET '||"InOffSet"||'  ROWS
	                    FETCH NEXT '||"InLimit"||'  ROWS ONLY ';

						
	"lvQuerySelect" := CONCAT("lvQuerySelect","lvQuerySelectColumn", "lvQuerySelectTable", "lvWhereClause", "lvQuerySelect2");
	  
	"lvQuerySelectCount" := CONCAT('SELECT  COUNT(*) "OutTotalRecordCount" FROM fda."FDAAlertOutput" a ', "lvWhereClause");

	RAISE NOTICE 'lvQuerySelect: %',"lvQuerySelect";
	
	RAISE NOTICE 'lvQuerySelectCount: %',"lvQuerySelectCount";
	
	OPEN $35 FOR
		EXECUTE "lvQuerySelect";
	RETURN NEXT $35; 
	
	--RAISE NOTICE 'Value: %','33333';

	OPEN $36 FOR
		EXECUTE "lvQuerySelectCount";
	RETURN NEXT $36; 
	
	OPEN $37 FOR
		SELECT 1 "DUMMY";
	RETURN NEXT $37; 

	--RAISE NOTICE 'Value: %','444444';

--END IF BLOCK 1

ELSE --IF "InIndicatorToSHowCalledFromDataCheck" = "NO" -- When coming from Left Navigation bar or From Dashboard
--ELSE BLOCK 1
IF "InAlertMonth" > '' OR "InSeverityType" > '' OR "InSeverity1AlertsInLast7DaysInd" > ''  
OR "InSeverity2AlertsInLast7DaysInd" > '' OR "InRecordCountAlertsInd" > '' 
OR "InValueAlertsInd" > ''   --IF BLOCK 1.1
THEN
--RAISE NOTICE 'Value: %','1111111';

	OPEN $37 FOR  
		SELECT fda."proc_ListAlertOutputForDashboard"(
			   "InOffSet",    --InOffSet
			   "InLimit",     --InLimit
			   "InOrderByColumn",   --"InOrderByColumn"
			   "InOrderBy",  		--"InOrderBy"
			   "InApplicationName",	  --"InApplicationName"
			   "InAlertMonth" ,	      --"InAlertMonth" VARCHAR(7)
			   "InOwnerName",	      --"InOwnerName" VARCHAR(100)
			   "InSeverityType",      --"InSeverityType"
			   "InSeverity1AlertsInLast7DaysInd",   --"InSeverity1AlertsInLast7DaysInd" VARCHAR(20)
			   "InSeverity2AlertsInLast7DaysInd",	--"InSeverity2AlertsInLast7DaysInd" VARCHAR(20)
			   "InRecordCountAlertsInd",	  --"InRecordCountAlertsInd" VARCHAR(20)
			   "InValueAlertsInd",	  	--"InValueAlertsInd" VARCHAR(20)
			   "InFDAAlertOutputId" ,   --"InFDAAlertOutputId"
               "InFDAAlertRulesId" ,	--"InFDAAlertRulesId"
               "InAlertTypeInd" ,			--"InAlertTypeInd"
               "InSourceSystemName" ,	--
               "InSourceTableName" ,	--
               "InTargetSystemName" ,	--
               "InTargetTableName" ,	--
               "InThreshold" ,			--
               "InReconciliationDate" ,	--
               "InEmailSent" ,			--
               "InCurrentAlertStatus" ,	--
               "InNotes" ,				--
               "InSeverity" ,			--
			   $35,
			   $36
			   );	--"OutTotalRecordCount" int 
	RETURN NEXT $37; 
	-- END OF IF BLOCK 1.1
ELSE -- When Not from dashboard   --ELSE BLOCK 1.1
  
	RAISE NOTICE 'Value: %','When Not from dashboard';
	"lvQuerySelectColumn" := CONCAT(
	                           'SELECT DISTINCT * 
							    FROM
	                           (SELECT 
							   ',"ColumnName",'
	                            a."FDAAlertOutputId",
								a."FDAAlertRulesId",
								g."ApplicationName",
								b."AlertName",
								b."AlertDescription",
								b."AlertTag",
								COALESCE(a."ServiceTicket",'''') "ServiceTicket",
								COALESCE(a."ServiceTicketURL",'''') "ServiceTicketURL",
								COALESCE(bb."ObjectGroup",''NotAssigned'')"ObjectGroup",
								(CASE WHEN b."ThresholdType" = ''FullDataCompare'' THEN ''ADVANCED''
								ELSE ''ADVANCED'' END ) "AlertTypeCategory",

								(CASE 
								WHEN b."TargetInfoEntryType" = ''Editor''  AND g2."TargetQuerySegmentCount" > 1 
									THEN ''*MULTIPLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Editor''  AND g2."TargetQuerySegmentCount" = 1 
									THEN ''*SINGLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard''  AND g1."TargetTableSegmentCount" > 1  
									THEN ''MULTIPLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard''  AND g1."TargetTableSegmentCount" = 1  
									THEN ''SINGLE SEGMENT''
								WHEN b."TargetInfoEntryType" = ''Wizard'' AND COALESCE(g1."TargetTableSegmentCount",0) = 0 
									THEN ''TOTAL''
								WHEN b."TargetInfoEntryType" = ''Editor'' AND COALESCE(g2."TargetQuerySegmentCount",0) = 0 
									THEN ''*TOTAL''
								ELSE ''TOTAL'' 
								END) "AlertSegmentType",

							    b."AlertTypeInd",

								(CASE WHEN a."Severity" = 9 
										OR a."Severity" = 90 
										OR a."Severity" = 91 
										OR a."Severity" = 92 
										OR a."Severity" = 93
										OR a."Severity" = 99 THEN  9
								ELSE a."Severity" END ) "Severity",

								c."SystemAliasName" "SystemName",
								d."ObjectName",
								e."SystemAliasName" "TargetSystemName",
								(CASE WHEN b."TargetInfoEntryType" = ''Wizard'' THEN f."ObjectName" 
								ELSE ''CUSTOMIZED QUERRY'' END)"TargetTableName" ,

								(CASE 
								WHEN b."TargetInfoEntryType" = ''Wizard'' 
									THEN COALESCE(g1."GroupByTargetTableColumn",'''')
		                        WHEN b."TargetInfoEntryType" = ''Editor'' 
									THEN COALESCE(g2."TargetQueryGroupByColumn",'''')
		                        ELSE '''' 
								END )"TargetSegmentName",

								0 "SourceValue",
								0 "TargetValue",

								b."LowerThresholdValue" "Threshold",
								SUBSTRING(a."ReconciliationDate":: VARCHAR ,0,11) "ReconciliationDate",
								a."ReconciliationTime" "ReconciliationTime",
								'''' "EmailSent",
								a."CurrentAlertStatus",
								a."Notes",
								COALESCE(NULLIF(a."ThresholdType",''''),b."ThresholdType") AS "ThresholdType",
								CONCAT(to_char(cast(a."LastUpdatedDateTime" as timestamp),''HH24:MI:SS''),'' GMT'') AS "TIMEGMT",
								(SELECT STRING_AGG (COALESCE("Email",''''),' ,''',''',') 
								FROM fda."FDAPrimaryOwnerEmail" u
								WHERE "FDAAlertRulesId" = b."FDAAlertRulesId") "PrimaryOwnerEmail"
								');

    "lvQuerySelectTable" := ' FROM fda."FDAAlertOutput" a
							LEFT OUTER JOIN fda."FDAAlertRules" b
								ON a."FDAAlertRulesId" = b."FDAAlertRulesId"				
							LEFT OUTER JOIN fda."FDASystems" c
								ON b."FDASystemSourceId" =  c."FDASystemsId"
							LEFT OUTER JOIN fda."FDASystemObjects" d
								ON b."FDASourceTableId" =  d."FDASystemObjectsId"
							LEFT OUTER JOIN fda."FDASystems" e
								ON b."FDASystemTargeteId" =  e."FDASystemsId"
							LEFT OUTER JOIN fda."FDASystemObjects" f
								ON b."FDATargetTableId" =  f."FDASystemObjectsId"
							LEFT OUTER JOIN fda."FDAApplications" g
								ON b."ApplicationId" = g."FDAApplicationsId"
							LEFT OUTER JOIN fda."FDAPrimaryOwnerEmail" h
								ON b."FDAAlertRulesId" = h."FDAAlertRulesId"
							LEFT OUTER JOIN fda."FDAUsers" ii
								ON h."Email" = ii."U_Email" 
							LEFT OUTER JOIN	(SELECT DISTINCT a."FDAAlertRulesId",
							                        COUNT(c."FieldName") "TargetTableSegmentCount",
							                        STRING_AGG(c."FieldName",'' | '') AS "GroupByTargetTableColumn"
                                             FROM fda."FDAAlertRules" a
                                             INNER JOIN fda."FDAAlertRulesTargetSegment" b
                                             		 ON a."FDAAlertRulesId" = b."FDAAlertRulesId"
                                             INNER JOIN	fda."FDASystemObjectFields" c
                                             		  ON b."GroupByTargetColumnId" = c."FDASystemObjectFieldsId"
													  WHERE  a."TargetInfoEntryType" = ''Wizard''
                                             GROUP BY a."FDAAlertRulesId") g1
			                   ON a."FDAAlertRulesId" = g1."FDAAlertRulesId" 
		                   LEFT OUTER JOIN	(SELECT DISTINCT a."FDAAlertRulesId",
						                            COUNT(b."GroupByTargetColumnName") "TargetQuerySegmentCount",
													STRING_AGG(b."GroupByTargetColumnName",'' | '')   AS "TargetQueryGroupByColumn"
                                             FROM fda."FDAAlertRules" a,
                                             fda."FDAAlertRulesTargetSegment" b
                                             WHERE a."FDAAlertRulesId" = b."FDAAlertRulesId"
						                       AND a."TargetInfoEntryType" = ''Editor''
                                             GROUP BY a."FDAAlertRulesId") g2
			                   ON a."FDAAlertRulesId" = g2."FDAAlertRulesId"
							LEFT OUTER JOIN (SELECT "FDAAlertRulesId",
													split_part("AlertTag", ''.''::text, 1) AS "SystemAliasName",
													(split_part("AlertTag", ''.''::text, 2) || ''.''::text) || split_part("AlertTag", ''.''::text, 3) AS "ObjectName"
												FROM fda."FDAAlertRules") aa
								ON b."FDAAlertRulesId" = aa."FDAAlertRulesId"
							LEFT OUTER JOIN fda."FDASystems" cc
								ON cc."SystemAliasName" = aa."SystemAliasName"
							LEFT OUTER JOIN fda."FDASystemObjects" bb						
								ON aa."ObjectName" = bb."ObjectName" 
								AND cc."FDASystemsId" = bb."FDASystemsId" ';
						 
IF "InFDAAlertOutputId" > '' OR "InFDAAlertRulesId" > '' OR "InAlertTypeInd" > '' OR "InSourceSystemName" > '' OR "InSourceTableName" > '' OR "InThreshold" > ''
OR "InTargetSystemName" > '' OR "InTargetTableName" > '' OR "InReconciliationDate" > '' OR "InEmailSent" > '' OR "InCurrentAlertStatus" > ''  OR "InNotes" > ''
OR "InSeverity" > '' OR "InAlertIdList" > '' OR "InAlertTag" > '' OR "InScoreInd" > '' OR "InObjectGroup" > '' OR "InFromDate" >'' OR "InToDate" >'' 
OR "InApplicationName" > '' OR "InOwnerName"  > ''
 --IF BLOCK 1.2

THEN

	 "lvWhereClause" := ' WHERE ';
	
RAISE NOTICE 'Value: %','I AM IN ELSE 2222';
	
	IF "InFDAAlertRulesId" > ''
	 THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND CAST(a."FDAAlertRulesId" AS VARCHAR) = ''',"InFDAAlertRulesId",''' ');
	    ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' CAST(a."FDAAlertRulesId" AS VARCHAR) = ''',"InFDAAlertRulesId",''' ');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;
	  
	IF "InFDAAlertOutputId" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND CAST(a."FDAAlertOutputId" AS VARCHAR) ILIKE ''%',"InFDAAlertOutputId",'%''');
	    ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' CAST(a."FDAAlertOutputId" AS VARCHAR) ILIKE ''%',"InFDAAlertOutputId",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InAlertTypeInd" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(b."AlertTypeInd") = ''',"InAlertTypeInd",'''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(b."AlertTypeInd") = ''',"InAlertTypeInd",'''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InSourceSystemName" > '' THEN
		IF "lvInd1" = 'Y' THEN
			 "lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName") ILIKE ''%',"InSourceSystemName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(c."SystemAliasName") ILIKE ''%',"InSourceSystemName",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InSourceTableName" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", 'AND UPPER(d."ObjectName") ILIKE ''%',"InSourceTableName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(d."ObjectName") ILIKE ''%',"InSourceTableName",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InTargetSystemName" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(e."SystemAliasName") ILIKE ''%',"InTargetSystemName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(e."SystemAliasName") ILIKE ''%',"InTargetSystemName",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;
	IF "InTargetTableName" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(f."ObjectName") ILIKE ''%',"InTargetTableName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(f."ObjectName") ILIKE ''%',"InTargetTableName",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InThreshold" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(b."LowerThresholdValue") ILIKE ''%',"InThreshold",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(b."LowerThresholdValue") ILIKE ''%',"InThreshold",'%''');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InReconciliationDate" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", '  AND CAST(a."ReconciliationDate" AS VARCHAR) IN (SELECT "Result" FROM UNNEST(string_to_array(''',"InReconciliationDate",''' ,'','')) "Result")');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause", '  CAST(a."ReconciliationDate" AS VARCHAR) IN (SELECT "Result" FROM UNNEST(string_to_array(''',"InReconciliationDate",''' ,'','')) "Result")');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;
	
	IF "InScoreInd" > ''THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", '  AND CAST(a."ReconciliationDate" AS VARCHAR) >=  to_char((CURRENT_DATE - INTERVAL ''1 day''), ''yyyy-mm-dd'')');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause", '   CAST(a."ReconciliationDate" AS VARCHAR) >=  to_char((CURRENT_DATE - INTERVAL ''1 day''), ''yyyy-mm-dd'')');
			"lvInd1" := 'Y';
        END IF;
		END IF;
	END IF;

	IF "InEmailSent" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER("EmailSent") ILIKE ''%',"InEmailSent",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER("EmailSent") ILIKE ''%',"InEmailSent",'%''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	END IF;
	IF "InCurrentAlertStatus" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."CurrentAlertStatus") ILIKE ''%',"InCurrentAlertStatus",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."CurrentAlertStatus") ILIKE ''%',"InCurrentAlertStatus",'%''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	END IF;

	IF "InNotes" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."Notes") ILIKE ''%',"InNotes",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."Notes") ILIKE ''%',"InNotes",'%''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	END IF;

	IF "InSeverity" > ''   
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND CAST(a."Severity" AS VARCHAR) ILIKE ''',"InSeverity",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' CAST(a."Severity" AS VARCHAR) ILIKE ''',"InSeverity",'%''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	 END IF;
	 
	 IF "InAlertTag" > ''   
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND CAST(b."AlertTag" AS VARCHAR) = ''',"InAlertTag",'''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' CAST(b."AlertTag" AS VARCHAR) = ''',"InAlertTag",'''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	 END IF;
	 
	 IF "InObjectGroup" > ''   
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND COALESCE(CAST(bb."ObjectGroup" AS VARCHAR),''NotAssigned'') ILIKE ''%',"InObjectGroup",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' COALESCE(CAST(bb."ObjectGroup" AS VARCHAR),''NotAssigned'') ILIKE ''%',"InObjectGroup",'%''');
			"lvInd1" := 'Y';
		END IF;
		END IF;
	 END IF;
	 
END IF;

	 IF "InFromDate" > ''   
	  THEN
		IF "lvInd1" = 'Y' THEN
			 "lvWhereClause" := CONCAT("lvWhereClause", ' AND TO_CHAR(a."ReconciliationDate", ''YYYY-MM-DD'') >= ''',"InFromDate",'''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' TO_CHAR(a."ReconciliationDate", ''YYYY-MM-DD'')  >= ''',"InFromDate",'''');
			 "lvInd1" := 'Y';
		END IF;
	    END IF;
	 END IF;
	 
	 IF "InToDate" > ''   
	  THEN
		IF "lvInd1" = 'Y' THEN
			 "lvWhereClause" := CONCAT("lvWhereClause", ' AND TO_CHAR(a."ReconciliationDate", ''YYYY-MM-DD'') <= ''',"InToDate",'''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' TO_CHAR(a."ReconciliationDate", ''YYYY-MM-DD'')  <= ''',"InToDate",'''');
			 "lvInd1" := 'Y';
		END IF;
	    END IF;
	 END IF;
	 
	 IF "InApplicationName" > '' THEN 
		IF "lvInd1" = 'Y' THEN
			 "lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(g."ApplicationName")  LIKE ''%',"InApplicationName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		 "lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(g."ApplicationName")  LIKE ''%',"InApplicationName",'%'' ');
			 "lvInd1" := 'Y';
        END IF;
	    END IF;
	END IF;
	
	IF "InOwnerName" > '' THEN 
		IF "lvInd1" = 'Y' THEN
			 "lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(ii."U_Firstname") Like ''%',"InOwnerName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		 "lvWhereClause" := CONCAT("lvWhereClause",' UPPER(ii."U_Firstname") Like ''%',"InOwnerName",'%''');
			 "lvInd1" := 'Y';
        END IF;
	    END IF;
	END IF;

--END OF IF BLOCK 1.2

      "OrderByString" := CASE WHEN "InOrderByColumn" > '' AND "InOrderBy" > '' 
	  THEN CONCAT('ORDER BY "',"InOrderByColumn",'"  ',"InOrderBy",'')
      ELSE 'ORDER BY "FDAAlertOutputId" DESC' END;

IF "InLast30DaysInd" > '' THEN     --IF BLOCK 1.3
   
        "lvQuerySelect2" := CASE WHEN "lvWhereClause" > '' 
		THEN CONCAT(' AND a."Severity" IS NOT NULL
		   AND CAST(a."ReconciliationDate" AS VARCHAR) >= TO_CHAR(CURRENT_DATE -30,''YYYY-MM-DD'')) x
        	',"OrderByString",'
        	OFFSET ',"InOffSet",' ROWS
        	FETCH NEXT ',"InLimit",' ROWS ONLY')
        ELSE CONCAT(' WHERE a."Severity" IS NOT NULL
		AND CAST(a."ReconciliationDate" AS VARCHAR) >= TO_CHAR(CURRENT_DATE -30,''YYYY-MM-DD'')) x
        	',"OrderByString",'
        	OFFSET ',"InOffSet",' ROWS
        	FETCH NEXT ',"InLimit",' ROWS ONLY')
        END;

  
ELSE   
   
        "lvQuerySelect2" := CASE WHEN "lvWhereClause" > '' 
		THEN CONCAT(' AND a."Severity" IS NOT NULL) x
        	',"OrderByString",'
        	OFFSET ',"InOffSet",' ROWS
        	FETCH NEXT ',"InLimit",' ROWS ONLY')
        ELSE CONCAT(' WHERE a."Severity" IS NOT NULL) x
        	',"OrderByString",'
        	OFFSET ',"InOffSet",' ROWS
        	FETCH NEXT ',"InLimit",' ROWS ONLY')
        END;

END IF;  --END OF IF BLOCK 1.3

	--RAISE NOTICE 'Value: %','---------------------------------------';
	--RAISE NOTICE 'Value: %',"lvQuerySelect";
	--RAISE NOTICE 'Value: %',"lvQuerySelectColumn";
	--RAISE NOTICE 'Value: %',"lvQuerySelectTable";
	--RAISE NOTICE 'Value: %',"InOrderByColumn";
	--RAISE NOTICE 'Value: %',"InOrderBy";
	--RAISE NOTICE 'Value: %',CONCAT("lvWhereClause", "lvQuerySelect2");
	--RAISE NOTICE 'Value: %','---------------------------------------';

		"lvQuerySelect" := CONCAT("lvQuerySelect","lvQuerySelectColumn", "lvQuerySelectTable", "lvWhereClause", "lvQuerySelect2");
		
		"lvQuerySelectCount" := CONCAT('SELECT COUNT(*) "OutTotalRecordCount"  ', "lvQuerySelectTable" , "lvWhereClause");
		
		RAISE NOTICE 'Value: %',"lvQuerySelect";
		
		OPEN $35 FOR
			EXECUTE "lvQuerySelect";
		RETURN NEXT $35;

		RAISE NOTICE 'Value: %',"lvQuerySelectCount";
   
		OPEN $36 FOR  
			EXECUTE "lvQuerySelectCount";
		RETURN NEXT $36; 
		
		OPEN $37 FOR
			SELECT 1 "DUMMY";
		RETURN NEXT $37; 

   --END OF ELSE BLOCK 1 AND 1.1

	END IF;
END IF;
END;
$BODY$;

