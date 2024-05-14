
    formBasedSelectionN : Str -> Str -> Str => NClass
    = \f1, f2, f3 -> case <f1, f2, f3> of { 

    	<_ + "ты", _ + "пен", _ + "тың"> -> {ablatsing="тан"; accsing="ты"; datsing="қа"; locsing="та"; gensing="тың"; instrsing="пен"; nomsing="base_1"; } ;
		<_ + "ті", _ + "пен", _ + "тің"> -> {ablatsing="тен"; accsing="ті"; datsing="ке"; locsing="те"; gensing="тің"; instrsing="пен"; nomsing="base_1"; } ;
		<_ + "ды", _ + "мен", _ + "дың"> -> {ablatsing="дан"; accsing="ды"; datsing="ға"; locsing="да"; gensing="дың"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ны", _ + "мен", _ + "ның"> -> {ablatsing="дан"; accsing="ны"; datsing="ға"; locsing="да"; gensing="ның"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ды", _ + "мен", _ + "ның"> -> {ablatsing="нан"; accsing="ды"; datsing="ға"; locsing="да"; gensing="ның"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ді", _ + "мен", _ + "нің"> -> {ablatsing="нен"; accsing="ді"; datsing="ге"; locsing="де"; gensing="нің"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ді", _ + "мен", _ + "дің"> -> {ablatsing="ден"; accsing="ді"; datsing="ге"; locsing="де"; gensing="дің"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ні", _ + "мен", _ + "нің"> -> {ablatsing="ден"; accsing="ні"; datsing="ге"; locsing="де"; gensing="нің"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ді", _ + "бен", _ + "дің"> -> {ablatsing="ден"; accsing="ді"; datsing="ге"; locsing="де"; gensing="дің"; instrsing="бен"; nomsing="base_1"; } ;
		<_ + "ны", _ + "нымен", _ + "ның"> -> {ablatsing="дан"; accsing="ны"; datsing="ған"; locsing="нда"; gensing="ның"; instrsing="нымен"; nomsing="л"; } ;
		<_ + "де", _ + "мен", _ + "дің"> -> {ablatsing="ден"; accsing="де"; datsing="ге"; locsing="ді"; gensing="дің"; instrsing="мен"; nomsing="base_1"; } ;
		<_ + "ды", _ + "бен", _ + "дың"> -> {ablatsing="дан"; accsing="ды"; datsing="ға"; locsing="да"; gensing="дың"; instrsing="бен"; nomsing="base_1"; } ;
		<_ + "е + "base_2 + "і", _ + "е + "base_2 + "імен", _ + "е + "base_2 + "ің"> -> {ablatsing="нен"; accsing="і"; datsing="base_2"; locsing="де"; gensing="ің"; instrsing="імен"; nomsing="base_2"; } ;
} ;