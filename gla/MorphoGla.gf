resource MorphoGla = open CatGla, ResGla, Predef in {

oper

mkA001 : Str -> A ;
mkA001 base =
  case base of {
    base_1+base_2@("l"|"r"|"n"|(?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA001"
  } ;

mkA002 : Str -> A ;
mkA002 base =
  case base of {
    base_1@?+base_2+base_3@("m"|"s"|"r"|"rbh"|(?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+"h"+base_2+"i"+base_3 ;
              APl => base_1+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"i"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA002"
  } ;

mkA003 : Str -> A ;
mkA003 base =
  case base of {
    base_1@?+base_2 => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => base_1+base_2+"e"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA003"
  } ;

mkA004 : Str -> A ;
mkA004 base =
  case base of {
    base_1@?+base_2+"ea"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ea"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Masc => base_1+base_2+"ea"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+"ea"+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"ea"+base_3
              } ;
        compar = base_1+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA004"
  } ;

mkA005 : Str -> A ;
mkA005 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"ea"+base_2 ;
              ASg Nom Fem => base_1+"ea"+base_2 ;
              ASg Dat Masc => base_1+"ea"+base_2 ; --guessed
              ASg Dat Fem => base_1+"hi"+base_2 ; --guessed
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+"ea"+base_2
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+"hea"+base_2 --guessed
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA005"
  } ;

mkA006 : Str -> A ;
mkA006 base =
  case base of {
    base_1@?+base_2+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA006"
  } ;

mkA007 : Str -> A ;
mkA007 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => "t-"+base_1 ;
              ASg Dat Masc => base_1 ; --guessed
              ASg Dat Fem => base_1+"e" ; --guessed
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => base_1+"e" ;
              APl => base_1+"e"
            } ;
        voc = table {
                Masc => base_1 ; --guessed
                Fem => base_1 --guessed
              } ;
        compar = base_1+"e"
      };
    _ => error "Can't apply paradigm mkA007"
  } ;

mkA008 : Str -> A ;
mkA008 base =
  case base of {
    base_1@?+base_2+"ea"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ea"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+"ea"+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"ea"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA008"
  } ;

mkA009 : Str -> A ;
mkA009 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ;
              ASg Dat Masc => base_1 ; --guessed
              ASg Dat Fem => base_1+"e" ; --guessed
              ASg Gen Masc => base_1 ; --guessed
              ASg Gen Fem => base_1 ; --guessed
              APl => base_1+"a"
            } ;
        voc = table {
                Masc => base_1 ; --guessed
                Fem => base_1 --guessed
              } ;
        compar = base_1
      };
    _ => error "Can't apply paradigm mkA009"
  } ;

mkA010 : Str -> A ;
mkA010 base =
  case base of {
    base_1+"o"+base_2@("rch"|"rb"|"rm"|?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2 ;
              ASg Nom Fem => base_1+"ho"+base_2 ;
              ASg Dat Masc => base_1+"ho"+base_2 ;
              ASg Dat Fem => base_1+"hui"+base_2 ;
              ASg Gen Masc => base_1+"hui"+base_2 ;
              ASg Gen Fem => base_1+"hui"+base_2 ;
              APl => base_1+"o"+base_2
            } ;
        voc = table {
                Masc => base_1+"hui"+base_2 ;
                Fem => base_1+"ho"+base_2
              } ;
        compar = base_1+"ui"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA010"
  } ;

mkA011 : Str -> A ;
mkA011 base =
  case base of {
    base_1+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2 ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+"i"+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA011"
  } ;

mkA012 : Str -> A ;
mkA012 base =
  case base of {
    base_1+"ea"+base_2@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"ea"+base_2 ;
              ASg Nom Fem => base_1+"hea"+base_2 ;
              ASg Dat Masc => base_1+"ea"+base_2 ;
              ASg Dat Fem => base_1+"hi"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+"ea"+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"hi"+base_2 ;
                Fem => base_1+"hea"+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA012"
  } ;

mkA013 : Str -> A ;
mkA013 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+"h"+base_2+"i"+base_3 ;
              APl => base_1+"h"+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"i"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e" --guessed
      };
    _ => error "Can't apply paradigm mkA013"
  } ;

mkA014 : Str -> A ;
mkA014 base =
  case base of {
    base_1@?+base_2+base_3@("r"|"n"|(?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA014"
  } ;

mkA015 : Str -> A ;
mkA015 base =
  case base of {
    base_1@?+base_2 => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+base_2+"a" ;
              APl => base_1+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"a"
      };
    _ => error "Can't apply paradigm mkA015"
  } ;

mkA016 : Str -> A ;
mkA016 base =
  case base of {
    base_1+"o"+base_2@(?+?)+"a"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2+"a"+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"ui"+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA016"
  } ;

mkA017 : Str -> A ;
mkA017 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?)+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3
      };
    _ => error "Can't apply paradigm mkA017"
  } ;

mkA018 : Str -> A ;
mkA018 base =
  case base of {
    base_1+base_2@?+"ea"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ea"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Masc => base_1+base_2+"ea"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+"ea"+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"ea"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA018"
  } ;

mkA019 : Str -> A ;
mkA019 base =
  case base of {
    base_1+base_2@?+"un" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"un" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"èin"+base_2
      };
    _ => error "Can't apply paradigm mkA019"
  } ;

mkA020 : Str -> A ;
mkA020 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+base_2 ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => base_1+base_2+"e"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA020"
  } ;

mkA021 : Str -> A ;
mkA021 base =
  case base of {
    base_1@?+base_2 => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+"h"+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+"h"+base_2 ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"a" --guessed
      };
    _ => error "Can't apply paradigm mkA021"
  } ;

mkA022 : Str -> A ;
mkA022 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+"h"+base_2+"i"+base_3 ;
              APl => base_1+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA022"
  } ;

mkA023 : Str -> A ;
mkA023 base =
  case base of {
    base_1+"_1" => lin A
      { s = table {
              ASg Nom Masc => base_1+"_1" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1
      };
    _ => error "Can't apply paradigm mkA023"
  } ;

mkA024 : Str -> A ;
mkA024 base =
  case base of {
    base_1+base_2@("ch"|"rd"|"dh"|?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA024"
  } ;

mkA025 : Str -> A ;
mkA025 base =
  case base of {
    base_1@?+base_2+"a"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"a"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"a"+base_3 ;
              ASg Dat Masc => base_1+base_2+"a"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+"a"+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"a"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA025"
  } ;

mkA026 : Str -> A ;
mkA026 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ; --guessed
              ASg Dat Masc => base_1 ; --guessed
              ASg Dat Fem => base_1+"e" ; --guessed
              ASg Gen Masc => base_1 ; --guessed
              ASg Gen Fem => base_1 ; --guessed
              APl => base_1+"a" --guessed
            } ;
        voc = table {
                Masc => base_1 ; --guessed
                Fem => base_1 --guessed
              } ;
        compar = base_1+"a"
      };
    _ => error "Can't apply paradigm mkA026"
  } ;

mkA027 : Str -> A ;
mkA027 base =
  case base of {
    base_1@?+base_2@?+"a"+base_3 => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"a"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"a"+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"è"+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA027"
  } ;

mkA028 : Str -> A ;
mkA028 base =
  case base of {
    base_1@?+base_2 => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"a" --guessed
      };
    _ => error "Can't apply paradigm mkA028"
  } ;

mkA029 : Str -> A ;
mkA029 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"a"+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"oi"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA029"
  } ;

mkA030 : Str -> A ;
mkA030 base =
  case base of {
    base_1@(?+?)+"a"+base_2 => lin A
      { s = table {
              ASg Nom Masc => base_1+"a"+base_2 ;
              ASg Nom Fem => "t-"+base_1+"a"+base_2 ;
              ASg Dat Masc => base_1+"a"+base_2 ; --guessed
              ASg Dat Fem => base_1+"i"+base_2 ; --guessed
              ASg Gen Masc => base_1+"i"+base_2 ; --guessed
              ASg Gen Fem => base_1+"i"+base_2+"e" ; --guessed
              APl => base_1+"a"+base_2+"a" --guessed
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ; --guessed
                Fem => base_1+"a"+base_2 --guessed
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA030"
  } ;

mkA031 : Str -> A ;
mkA031 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+"h"+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"e" ;
                Fem => base_1+"h"+base_2+"e"
              } ;
        compar = base_1+base_2+"a" --guessed
      };
    _ => error "Can't apply paradigm mkA031"
  } ;

mkA032 : Str -> A ;
mkA032 base =
  case base of {
    base_1+base_2@?+base_3@(?+?)+"ai"+base_4@?+"n" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3+"ai"+base_4+"n" ;
              ASg Nom Fem => base_1+"h"+base_2+base_3+"ai"+base_4+"n" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"i"+base_3+base_4+"e"
      };
    _ => error "Can't apply paradigm mkA032"
  } ;

mkA033 : Str -> A ;
mkA033 base =
  case base of {
    "d"+base_1+"n"+base_2@? => lin A
      { s = table {
              ASg Nom Masc => "d"+base_1+"n"+base_2 ;
              ASg Nom Fem => "dh"+base_1+"n"+base_2 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "mi"+base_1+"s"+base_2
      };
    _ => error "Can't apply paradigm mkA033"
  } ;

mkA034 : Str -> A ;
mkA034 base =
  case base of {
    base_1+"o"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2 ;
              ASg Nom Fem => base_1+"ho"+base_2 ;
              ASg Dat Masc => base_1+"o"+base_2 ;
              ASg Dat Fem => base_1+"hui"+base_2 ;
              ASg Gen Masc => base_1+"hui"+base_2 ;
              ASg Gen Fem => base_1+"ui"+base_2+"e" ;
              APl => base_1+"o"+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"hui"+base_2 ;
                Fem => base_1+"ho"+base_2
              } ;
        compar = base_1+"ui"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA034"
  } ;

mkA035 : Str -> A ;
mkA035 base =
  case base of {
    base_1+"o"+base_2@(?+?+?)+"a" => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2+"a" ;
              ASg Nom Fem => base_1+"ho"+base_2+"a" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"ui"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA035"
  } ;

mkA036 : Str -> A ;
mkA036 base =
  case base of {
    "dr"+base_1+"ch" => lin A
      { s = table {
              ASg Nom Masc => "dr"+base_1+"ch" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "mi"+base_1+"sa"
      };
    _ => error "Can't apply paradigm mkA036"
  } ;

mkA037 : Str -> A ;
mkA037 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?)+"ea"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ea"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3 ;
              APl => base_1+base_2+"ea"+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"i"+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA037"
  } ;

mkA038 : Str -> A ;
mkA038 base =
  case base of {
    base_1@?+base_2+base_3@("r"|(?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+"h"+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3 ;
              APl => base_1+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"i"+base_3
              } ;
        compar = base_1+"h"+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA038"
  } ;

mkA039 : Str -> A ;
mkA039 base =
  case base of {
    base_1+base_2@(?+?+?)+"ic"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ic"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ic"+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"g"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA039"
  } ;

mkA040 : Str -> A ;
mkA040 base =
  case base of {
    base_1+base_2@?+"as" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"as" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"s"+base_2
      };
    _ => error "Can't apply paradigm mkA040"
  } ;

mkA041 : Str -> A ;
mkA041 base =
  case base of {
    base_1+base_2@?+base_3@?+"a" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3+"a" ;
              ASg Nom Fem => base_1+"h"+base_2+base_3+"a" ;
              ASg Dat Masc => base_1+base_2+base_3+"a" ;
              ASg Dat Fem => base_1+"h"+base_2+base_3+"a" ;
              ASg Gen Masc => base_1+"h"+base_2+base_3+"a" ;
              ASg Gen Fem => base_1+base_2+base_3+"a" ;
              APl => base_1+base_2+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+base_3+"a" ;
                Fem => base_1+"h"+base_2+base_3+"a"
              } ;
        compar = base_1+"h"+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA041"
  } ;

mkA042 : Str -> A ;
mkA042 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"h"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA042"
  } ;

mkA043 : Str -> A ;
mkA043 base =
  case base of {
    base_1+"ur"+base_2@(?+?)+"d"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"ur"+base_2+"d"+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"h"+base_2+base_3
      };
    _ => error "Can't apply paradigm mkA043"
  } ;

mkA044 : Str -> A ;
mkA044 base =
  case base of {
    base_1+"ur"+base_2@(?+?)+"t"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"ur"+base_2+"t"+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"h"+base_2+base_3
      };
    _ => error "Can't apply paradigm mkA044"
  } ;

mkA045 : Str -> A ;
mkA045 base =
  case base of {
    base_1+base_2@("ch"|(?+?+?+?+?+?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+"h"+base_2 ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+"i"+base_2
      };
    _ => error "Can't apply paradigm mkA045"
  } ;

mkA046 : Str -> A ;
mkA046 base =
  case base of {
    base_1+"ea"+base_2@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"ea"+base_2 ;
              ASg Nom Fem => base_1+"hea"+base_2 ;
              ASg Dat Masc => base_1+"ea"+base_2 ;
              ASg Dat Fem => base_1+"hi"+base_2 ;
              ASg Gen Masc => base_1+"hi"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+"ea"+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"hi"+base_2 ;
                Fem => base_1+"hea"+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA046"
  } ;

mkA047 : Str -> A ;
mkA047 base =
  case base of {
    base_1+base_2@?+"ur" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ur" ;
              ASg Nom Fem => base_1+"h"+base_2+"ur" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"èir"+base_2
      };
    _ => error "Can't apply paradigm mkA047"
  } ;

mkA048 : Str -> A ;
mkA048 base =
  case base of {
    base_1+"eà"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"eà"+base_2 ;
              ASg Nom Fem => base_1+"heà"+base_2 ;
              ASg Dat Masc => base_1+"eà"+base_2 ;
              ASg Dat Fem => base_1+"heà"+base_2 ;
              ASg Gen Masc => base_1+"heà"+base_2 ;
              ASg Gen Fem => base_1+"eà"+base_2 ;
              APl => base_1+"eà"+base_2
            } ;
        voc = table {
                Masc => base_1+"heà"+base_2 ;
                Fem => base_1+"heà"+base_2
              } ;
        compar = base_1+"io"+base_2+"a"
      };
    _ => error "Can't apply paradigm mkA048"
  } ;

mkA049 : Str -> A ;
mkA049 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"ea"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ea"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"ea"+base_3 ;
              ASg Dat Masc => base_1+base_2+"ea"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+"ea"+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+"ea"+base_3
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA049"
  } ;

mkA050 : Str -> A ;
mkA050 base =
  case base of {
    base_1+base_2@?+"o"+base_3@?+"a"+base_4@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"o"+base_3+"a"+base_4 ;
              ASg Nom Fem => base_1+"h"+base_2+"o"+base_3+"a"+base_4 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => base_1+base_2+base_3+"i"+base_4+"e" ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+base_3+"i"+base_4+"e"
      };
    _ => error "Can't apply paradigm mkA050"
  } ;

mkA051 : Str -> A ;
mkA051 base =
  case base of {
    base_1+base_2@(?+?)+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => base_1+base_2+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"h"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+base_2+"i"+base_3+"e" ;
              APl => base_1+base_2+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA051"
  } ;

mkA052 : Str -> A ;
mkA052 base =
  case base of {
    base_1+"o"+base_2@?+base_3@?+"id" => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2+base_3+"id" ;
              ASg Nom Fem => base_1+"ho"+base_2+base_3+"id" ;
              ASg Dat Masc => base_1+"o"+base_2+base_3+"id" ;
              ASg Dat Fem => base_1+"ho"+base_2+base_3+"id" ;
              ASg Gen Masc => base_1+"ho"+base_2+base_3+"id" ;
              ASg Gen Fem => base_1+"o"+base_2+base_3+"ide" ;
              APl => base_1+"o"+base_2+base_3+"ide"
            } ;
        voc = table {
                Masc => base_1+"ho"+base_2+base_3+"id" ;
                Fem => base_1+"ho"+base_2+base_3+"id"
              } ;
        compar = base_1+base_2+"o"+base_3+"ra"
      };
    _ => error "Can't apply paradigm mkA052"
  } ;

mkA053 : Str -> A ;
mkA053 base =
  case base of {
    base_1+base_2@(?+?)+"a"+base_3@(?+?+?)+base_4@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"a"+base_3+base_4 ;
              ASg Nom Fem => base_1+"h"+base_2+"a"+base_3+base_4 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+base_3+"i"+base_4+"e"
      };
    _ => error "Can't apply paradigm mkA053"
  } ;

mkA054 : Str -> A ;
mkA054 base =
  case base of {
    base_1+"ri"+base_2@?+"n" => lin A
      { s = table {
              ASg Nom Masc => base_1+"ri"+base_2+"n" ;
              ASg Nom Fem => base_1+"hri"+base_2+"n" ;
              ASg Dat Masc => base_1+"hri"+base_2+"n" ;
              ASg Dat Fem => base_1+"hri"+base_2+"n" ;
              ASg Gen Masc => base_1+"hri"+base_2+"n" ;
              ASg Gen Fem => base_1+"hri"+base_2+"n" ;
              APl => base_1+"la"+base_2
            } ;
        voc = table {
                Masc => base_1+"hri"+base_2+"n" ;
                Fem => base_1+"hri"+base_2+"n"
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA054"
  } ;

mkA055 : Str -> A ;
mkA055 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+base_2+"i"+base_3 ;
              ASg Gen Fem => nonExist ;
              APl => base_1+"h"+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"i"+base_3 ;
                Fem => base_1+"h"+base_2+base_3
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA055"
  } ;

mkA056 : Str -> A ;
mkA056 base =
  case base of {
    base_1@?+base_2@(?+?)+base_3+"a" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3+"a" ;
              ASg Nom Fem => base_1+"h"+base_2+base_3+"a" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA056"
  } ;

mkA057 : Str -> A ;
mkA057 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"ea"+base_2 ;
              ASg Nom Fem => base_1+"ea"+base_2 ;
              ASg Dat Masc => base_1+"ea"+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2 ;
              APl => base_1+"ea"+base_2
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+"ea"+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA057"
  } ;

mkA058 : Str -> A ;
mkA058 base =
  case base of {
    "ionmh"+base_1+"i"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => "ionmh"+base_1+"i"+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"sa"
      };
    _ => error "Can't apply paradigm mkA058"
  } ;

mkA059 : Str -> A ;
mkA059 base =
  case base of {
    "ionmhui"+base_1 => lin A
      { s = table {
              ASg Nom Masc => "ionmhui"+base_1 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "a"+base_1+"sa"
      };
    _ => error "Can't apply paradigm mkA059"
  } ;

mkA060 : Str -> A ;
mkA060 base =
  case base of {
    base_1+"nn" => lin A
      { s = table {
              ASg Nom Masc => base_1+"nn" ;
              ASg Nom Fem => base_1+"nn" ;
              ASg Dat Masc => base_1+"nn" ;
              ASg Dat Fem => base_1+"inn" ;
              ASg Gen Masc => base_1+"inn" ;
              ASg Gen Fem => base_1+"inne" ;
              APl => base_1+"nna"
            } ;
        voc = table {
                Masc => base_1+"inn" ;
                Fem => base_1+"nn"
              } ;
        compar = base_1
      };
    _ => error "Can't apply paradigm mkA060"
  } ;

mkA061 : Str -> A ;
mkA061 base =
  case base of {
    "mat"+base_1 => lin A
      { s = table {
              ASg Nom Masc => "mat"+base_1 ;
              ASg Nom Fem => "m"+base_1+"ath" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => "mait"+base_1 ;
              ASg Gen Fem => "mait"+base_1+"e" ;
              APl => "mat"+base_1+"a"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "f"+base_1+"eàrr"
      };
    _ => error "Can't apply paradigm mkA061"
  } ;

mkA062 : Str -> A ;
mkA062 base =
  case base of {
    base_1+"i"+base_2@?+"i"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"i"+base_2+"i"+base_3 ;
              ASg Nom Fem => base_1+"hi"+base_2+"i"+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+"hi"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+"ì"+base_2+base_3+"e" ;
              APl => base_1+"ì"+base_2+base_3+"e"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"ì"+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA062"
  } ;

mkA063 : Str -> A ;
mkA063 base =
  case base of {
    base_1+base_2@(?+?)+"_1" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"_1" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA063"
  } ;

mkA064 : Str -> A ;
mkA064 base =
  case base of {
    base_1+"òr" => lin A
      { s = table {
              ASg Nom Masc => base_1+"òr" ;
              ASg Nom Fem => base_1+"hòr" ;
              ASg Dat Masc => base_1+"òr" ;
              ASg Dat Fem => base_1+"hòir" ;
              ASg Gen Masc => base_1+"hòir" ;
              ASg Gen Fem => base_1+"òire" ;
              APl => base_1+"òra"
            } ;
        voc = table {
                Masc => base_1+"hòir" ;
                Fem => base_1+"hòr"
              } ;
        compar = base_1+"otha"
      };
    _ => error "Can't apply paradigm mkA064"
  } ;

mkA065 : Str -> A ;
mkA065 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+"h"+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+base_2+"e" ;
              APl => base_1+base_2+"e"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA065"
  } ;

mkA066 : Str -> A ;
mkA066 base =
  case base of {
    base_1+"ór" => lin A
      { s = table {
              ASg Nom Masc => base_1+"ór" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"otha"
      };
    _ => error "Can't apply paradigm mkA066"
  } ;

mkA067 : Str -> A ;
mkA067 base =
  case base of {
    "neo-"+base_1+"h"+base_2@(?+?+?)+base_3@? => lin A
      { s = table {
              ASg Nom Masc => "neo-"+base_1+"h"+base_2+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => base_1+base_2+base_3+"a"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA067"
  } ;

mkA068 : Str -> A ;
mkA068 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ;
              ASg Dat Masc => base_1 ;
              ASg Dat Fem => base_1+"e" ;
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => base_1 ;
              APl => base_1
            } ;
        voc = table {
                Masc => base_1 ;
                Fem => base_1
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA068"
  } ;

mkA069 : Str -> A ;
mkA069 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => base_1+"e" ;
              APl => base_1+"e"
            } ;
        voc = table {
                Masc => base_1 ;
                Fem => base_1
              } ;
        compar = base_1+"e"
      };
    _ => error "Can't apply paradigm mkA069"
  } ;

mkA070 : Str -> A ;
mkA070 base =
  case base of {
    base_1+"lc" => lin A
      { s = table {
              ASg Nom Masc => base_1+"lc" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "mi"+base_1+"sa"
      };
    _ => error "Can't apply paradigm mkA070"
  } ;

mkA071 : Str -> A ;
mkA071 base =
  case base of {
    base_1+"a"+base_2@(?+?)+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"a"+base_2+base_3 ;
              ASg Nom Fem => base_1+"a"+base_2+base_3 ;
              ASg Dat Masc => base_1+"a"+base_2+base_3 ;
              ASg Dat Fem => base_1+"a"+base_2+"i"+base_3 ;
              ASg Gen Masc => base_1+"a"+base_2+"i"+base_3 ;
              ASg Gen Fem => base_1+"o"+base_2+"i"+base_3+"e" ;
              APl => base_1+"a"+base_2+base_3
            } ;
        voc = table {
                Masc => base_1+"a"+base_2+"i"+base_3 ;
                Fem => base_1+"a"+base_2+base_3
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA071"
  } ;

mkA072 : Str -> A ;
mkA072 base =
  case base of {
    base_1+base_2@?+"o"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"o"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"o"+base_3 ;
              ASg Dat Masc => base_1+base_2+"o"+base_3 ;
              ASg Dat Fem => base_1+"h"+base_2+"ui"+base_3 ;
              ASg Gen Masc => base_1+base_2+"ui"+base_3 ;
              ASg Gen Fem => base_1+base_2+"ui"+base_3+"e" ;
              APl => base_1+base_2+"o"+base_3+"a"
            } ;
        voc = table {
                Masc => base_1+"h"+base_2+"ui"+base_3 ;
                Fem => base_1+"h"+base_2+"o"+base_3
              } ;
        compar = base_1+base_2+"ui"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA072"
  } ;

mkA073 : Str -> A ;
mkA073 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => base_1+"h"+base_2 ;
              ASg Dat Masc => base_1+base_2 ;
              ASg Dat Fem => base_1+"h"+base_2 ;
              ASg Gen Masc => base_1+"h"+base_2 ;
              ASg Gen Fem => base_1+"h"+base_2 ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => base_1+"h"+base_2 ;
                Fem => base_1+"h"+base_2
              } ;
        compar = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA073"
  } ;

mkA074 : Str -> A ;
mkA074 base =
  case base of {
    base_1+"a"+base_2@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"a"+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"a"
      };
    _ => error "Can't apply paradigm mkA074"
  } ;

mkA075 : Str -> A ;
mkA075 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ;
              ASg Dat Masc => base_1 ;
              ASg Dat Fem => base_1 ;
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => base_1 ;
              APl => base_1
            } ;
        voc = table {
                Masc => base_1 ;
                Fem => base_1
              } ;
        compar = base_1+"e"
      };
    _ => error "Can't apply paradigm mkA075"
  } ;

mkA076 : Str -> A ;
mkA076 base =
  case base of {
    base_1+"è"+base_2@(?+?)+"ea"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"è"+base_2+"ea"+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+"è"+base_2+"i"+base_3 ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"é"+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA076"
  } ;

mkA077 : Str -> A ;
mkA077 base =
  case base of {
    base_1+base_2@("g"|(?+?)) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => "t-"+base_1+base_2 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+base_2+"a"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA077"
  } ;

mkA078 : Str -> A ;
mkA078 base =
  case base of {
    base_1+base_2@?+"an" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"an" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"in"+base_2
      };
    _ => error "Can't apply paradigm mkA078"
  } ;

mkA079 : Str -> A ;
mkA079 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"a"+base_2 ;
              ASg Nom Fem => base_1+"a"+base_2 ;
              ASg Dat Masc => base_1+"a"+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+"a"+base_2+"a"
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+"a"+base_2
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA079"
  } ;

mkA080 : Str -> A ;
mkA080 base =
  case base of {
    base_1+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1+base_2 ;
              ASg Gen Fem => base_1+base_2 ;
              APl => base_1+base_2
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA080"
  } ;

mkA081 : Str -> A ;
mkA081 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+"ea"+base_2 ;
              ASg Nom Fem => base_1+"ea"+base_2 ;
              ASg Dat Masc => base_1+"ea"+base_2 ;
              ASg Dat Fem => base_1+"i"+base_2 ;
              ASg Gen Masc => base_1+"i"+base_2 ;
              ASg Gen Fem => base_1+"i"+base_2+"e" ;
              APl => base_1+"ea"+base_2
            } ;
        voc = table {
                Masc => base_1+"i"+base_2 ;
                Fem => base_1+"ea"+base_2
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA081"
  } ;

mkA082 : Str -> A ;
mkA082 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => base_1 ;
              ASg Dat Masc => base_1 ;
              ASg Dat Fem => base_1 ;
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => base_1+"e" ;
              APl => base_1
            } ;
        voc = table {
                Masc => base_1 ;
                Fem => base_1
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA082"
  } ;

mkA083 : Str -> A ;
mkA083 base =
  case base of {
    base_1+base_2@?+"inn" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"inn" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"n"+base_2
      };
    _ => error "Can't apply paradigm mkA083"
  } ;

mkA084 : Str -> A ;
mkA084 base =
  case base of {
    base_1@(?+?)+base_2+"a" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"a" ;
              ASg Nom Fem => "t-"+base_1+base_2+"a" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA084"
  } ;

mkA085 : Str -> A ;
mkA085 base =
  case base of {
    base_1+base_2@?+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"o"+base_3+"a"
      };
    _ => error "Can't apply paradigm mkA085"
  } ;

mkA086 : Str -> A ;
mkA086 base =
  case base of {
    base_1+base_2@?+"u"+base_3@(?+?) => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"u"+base_3 ;
              ASg Nom Fem => base_1+"h"+base_2+"u"+base_3 ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA086"
  } ;

mkA087 : Str -> A ;
mkA087 base =
  case base of {
    base_1+base_2@?+base_3@?+"un" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+base_3+"un" ;
              ASg Nom Fem => base_1+"h"+base_2+base_3+"un" ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+"èin"+base_3
      };
    _ => error "Can't apply paradigm mkA087"
  } ;

mkA088 : Str -> A ;
mkA088 base =
  case base of {
    base_1 => lin A
      { s = table {
              ASg Nom Masc => base_1 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => base_1 ;
              ASg Gen Fem => nonExist ;
              APl => base_1+"an"
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = nonExist
      };
    _ => error "Can't apply paradigm mkA088"
  } ;

mkA089 : Str -> A ;
mkA089 base =
  case base of {
    base_1+base_2@?+"ai"+base_3@?+"n" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"ai"+base_3+"n" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"i"+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA089"
  } ;

mkA090 : Str -> A ;
mkA090 base =
  case base of {
    base_1+"o"+base_2@?+"a"+base_3@? => lin A
      { s = table {
              ASg Nom Masc => base_1+"o"+base_2+"a"+base_3 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+base_2+base_3+"e"
      };
    _ => error "Can't apply paradigm mkA090"
  } ;

mkA091 : Str -> A ;
mkA091 base =
  case base of {
    base_1+base_2@?+"al" => lin A
      { s = table {
              ASg Nom Masc => base_1+base_2+"al" ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = base_1+"l"+base_2
      };
    _ => error "Can't apply paradigm mkA091"
  } ;

mkA092 : Str -> A ;
mkA092 base =
  case base of {
    "ù"+base_1+base_2@? => lin A
      { s = table {
              ASg Nom Masc => "ù"+base_1+base_2 ;
              ASg Nom Fem => nonExist ;
              ASg Dat Masc => nonExist ;
              ASg Dat Fem => nonExist ;
              ASg Gen Masc => nonExist ;
              ASg Gen Fem => nonExist ;
              APl => nonExist
            } ;
        voc = table {
                Masc => nonExist ;
                Fem => nonExist
              } ;
        compar = "u"+base_1+"i"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkA092"
  } ;

mkN001 : Str -> N ;
mkN001 base =
  case base of {
    base_1+"ea"+base_2@("m"|"c"|"s"|"r"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN001"
  } ;

mkN002 : Str -> N ;
mkN002 base =
  case base of {
    base_1+base_2@("bh"|"nn"|"rn"|"dh"|"gh"|"ch"|"sg"|"th"|"rt"|"rd"|"ll"|"rc"|"mh"|"lt"|"rm"|"nnd"|"rbh"|"ths"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => "h-"+base_1+"i"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => "h-"+base_1+"i"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ;
                Pl => base_1+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN002"
  } ;

mkN003 : Str -> N ;
mkN003 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"chan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"chan" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN003"
  } ;

mkN004 : Str -> N ;
mkN004 base =
  case base of {
    base_1+base_2@(?+?)+"r" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"chean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"re" ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN004"
  } ;

mkN005 : Str -> N ;
mkN005 base =
  case base of {
    base_1+"ea"+base_2@("l"|"p"|"d"|"c"|"r"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hea"+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"hea"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => base_1+"ea"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hi"+base_2 ;
                Pl => base_1+"hea"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN005"
  } ;

mkN006 : Str -> N ;
mkN006 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN006"
  } ;

mkN007 : Str -> N ;
mkN007 base =
  case base of {
    base_1+base_2@("bh"|"nc"|"nn"|"cs"|"dh"|"gh"|"rt"|"rc"|"th"|"ll"|"ng"|"rd"|"mh"|"sg"|"nt"|"rbh"|"ths"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN007"
  } ;

mkN008 : Str -> N ;
mkN008 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"chan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"chan" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN008"
  } ;

mkN009 : Str -> N ;
mkN009 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"ean" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN009"
  } ;

mkN010 : Str -> N ;
mkN010 base =
  case base of {
    base_1+"a"+base_2@("bh"|"nd"|"nn"|"rt"|"rg"|"mh"|"sg"|"nt"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+"a"+base_2 ;
                                Pl => "h-"+base_1+"a"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => "h-"+base_1+"a"+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+"a"+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ;
                Pl => base_1+"a"+base_2+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN010"
  } ;

mkN011 : Str -> N ;
mkN011 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"ea"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"ea"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"ea"+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN011"
  } ;

mkN012 : Str -> N ;
mkN012 base =
  case base of {
    base_1+"ia" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia" ;
                                  Pl => base_1+"iathan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"hè" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN012"
  } ;

mkN013 : Str -> N ;
mkN013 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN013"
  } ;

mkN014 : Str -> N ;
mkN014 base =
  case base of {
    base_1+"a"+base_2@("ch"|"ng"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+"a"+base_2 ;
                                Pl => "h-"+base_1+"i"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => "h-"+base_1+"i"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"a"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+"a"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ;
                Pl => base_1+"a"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN014"
  } ;

mkN015 : Str -> N ;
mkN015 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"oi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"oi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN015"
  } ;

mkN016 : Str -> N ;
mkN016 base =
  case base of {
    base_1+base_2@("s"|"l"|"n"|"d"|"r"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN016"
  } ;

mkN017 : Str -> N ;
mkN017 base =
  case base of {
    base_1+base_2@("n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ;
                Pl => base_1+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN017"
  } ;

mkN018 : Str -> N ;
mkN018 base =
  case base of {
    base_1+base_2@("s"|"n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN018"
  } ;

mkN019 : Str -> N ;
mkN019 base =
  case base of {
    base_1+"a"+base_2@("lg"|"ch"|"rg"|"ng"|"rc"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+"a"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+"a"+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"a"+base_2 ; --guessed
                Pl => base_1+"a"+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN019"
  } ;

mkN020 : Str -> N ;
mkN020 base =
  case base of {
    base_1@?+base_2+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN020"
  } ;

mkN021 : Str -> N ;
mkN021 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN021"
  } ;

mkN022 : Str -> N ;
mkN022 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1 ;
                                Pl => "h-"+base_1+"chan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"chan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"chan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"chan"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN022"
  } ;

mkN023 : Str -> N ;
mkN023 base =
  case base of {
    base_1+base_2@("nn"|"gh"|"ch"|"rt"|"rd"|"ng"|"rc"|"mh"|"sg"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN023"
  } ;

mkN024 : Str -> N ;
mkN024 base =
  case base of {
    base_1+base_2@(?+?)+"ai"+base_3@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ai"+base_3+"n" ;
                                  Pl => base_1+"i"+base_2+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN024"
  } ;

mkN025 : Str -> N ;
mkN025 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN025"
  } ;

mkN026 : Str -> N ;
mkN026 base =
  case base of {
    base_1+"ai"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ai"+base_2 ;
                                  Pl => base_1+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN026"
  } ;

mkN027 : Str -> N ;
mkN027 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"annan"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN027"
  } ;

mkN028 : Str -> N ;
mkN028 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"ean" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN028"
  } ;

mkN029 : Str -> N ;
mkN029 base =
  case base of {
    base_1+"s" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"s" ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"is" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN029"
  } ;

mkN030 : Str -> N ;
mkN030 base =
  case base of {
    base_1+base_2@("ch"|"ng"|"rc"|"mh"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN030"
  } ;

mkN031 : Str -> N ;
mkN031 base =
  case base of {
    base_1+"dha" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"dha" ;
                                  Pl => "àine"+base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"dha" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN031"
  } ;

mkN032 : Str -> N ;
mkN032 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => base_1+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN032"
  } ;

mkN033 : Str -> N ;
mkN033 base =
  case base of {
    base_1+base_2@("rt"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN033"
  } ;

mkN034 : Str -> N ;
mkN034 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN034"
  } ;

mkN035 : Str -> N ;
mkN035 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"aig" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN035"
  } ;

mkN036 : Str -> N ;
mkN036 base =
  case base of {
    base_1+base_2@("d"|"n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+"i"+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+"i"+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ;
                                Pl => base_1+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ;
                Pl => base_1+base_2+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN036"
  } ;

mkN037 : Str -> N ;
mkN037 base =
  case base of {
    base_1+base_2@(?+?)+"a"+base_3@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3+"n" ;
                                  Pl => base_1+base_2+"a"+base_3+"nan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN037"
  } ;

mkN038 : Str -> N ;
mkN038 base =
  case base of {
    base_1+"ea"+base_2@("d"|"s"|"r"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ; --guessed
                                Pl => base_1+"ea"+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hi"+base_2 ; --guessed
                Pl => base_1+"hea"+base_2+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN038"
  } ;

mkN039 : Str -> N ;
mkN039 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN039"
  } ;

mkN040 : Str -> N ;
mkN040 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN040"
  } ;

mkN041 : Str -> N ;
mkN041 base =
  case base of {
    base_1+"a"+base_2@("bh"|"mh"|"rt"|"lg"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+"a"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ; --guessed
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+"a"+base_2+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ; --guessed
                Pl => base_1+"a"+base_2+"an" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN041"
  } ;

mkN042 : Str -> N ;
mkN042 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN042"
  } ;

mkN043 : Str -> N ;
mkN043 base =
  case base of {
    base_1+base_2@("r"|"l"|"g"|"n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ; --guessed
                                Pl => "h-"+base_1+"i"+base_2 --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => "h-"+base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN043"
  } ;

mkN044 : Str -> N ;
mkN044 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN044"
  } ;

mkN045 : Str -> N ;
mkN045 base =
  case base of {
    base_1+"o"+base_2@("ll"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN045"
  } ;

mkN046 : Str -> N ;
mkN046 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN046"
  } ;

mkN047 : Str -> N ;
mkN047 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN047"
  } ;

mkN048 : Str -> N ;
mkN048 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"io"+base_2+"a" ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN048"
  } ;

mkN049 : Str -> N ;
mkN049 base =
  case base of {
    "a"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "a"+base_1 ;
                                  Pl => "ui"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "ui"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN049"
  } ;

mkN050 : Str -> N ;
mkN050 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN050"
  } ;

mkN051 : Str -> N ;
mkN051 base =
  case base of {
    "a"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "a"+base_1 ;
                                  Pl => "a"+base_1+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "ui"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN051"
  } ;

mkN052 : Str -> N ;
mkN052 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN052"
  } ;

mkN053 : Str -> N ;
mkN053 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN053"
  } ;

mkN054 : Str -> N ;
mkN054 base =
  case base of {
    base_1+"a"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN054"
  } ;

mkN055 : Str -> N ;
mkN055 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN055"
  } ;

mkN056 : Str -> N ;
mkN056 base =
  case base of {
    base_1+base_2@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"ir" ;
                                Pl => "h-"+base_1+"r"+base_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ir" ;
                                Pl => "h-"+base_1+"r"+base_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"r" ;
                                Pl => base_1+"r"+base_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2+"ir" ;
                Pl => base_1+"r"+base_2+"ichean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN056"
  } ;

mkN057 : Str -> N ;
mkN057 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"an" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN057"
  } ;

mkN058 : Str -> N ;
mkN058 base =
  case base of {
    base_1@?+base_2+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN058"
  } ;

mkN059 : Str -> N ;
mkN059 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN059"
  } ;

mkN060 : Str -> N ;
mkN060 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"t"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN060"
  } ;

mkN061 : Str -> N ;
mkN061 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"rean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN061"
  } ;

mkN062 : Str -> N ;
mkN062 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"n"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN062"
  } ;

mkN063 : Str -> N ;
mkN063 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN063"
  } ;

mkN064 : Str -> N ;
mkN064 base =
  case base of {
    base_1@?+base_2+base_3@("t"|"l"|"s"|"n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN064"
  } ;

mkN065 : Str -> N ;
mkN065 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"ui"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN065"
  } ;

mkN066 : Str -> N ;
mkN066 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"chan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"chan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"chan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"chan"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN066"
  } ;

mkN067 : Str -> N ;
mkN067 base =
  case base of {
    base_1@?+"a"+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN067"
  } ;

mkN068 : Str -> N ;
mkN068 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"thaichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN068"
  } ;

mkN069 : Str -> N ;
mkN069 base =
  case base of {
    base_1+"na"+base_2@?+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"na"+base_2+base_3 ;
                                  Pl => base_1+base_2+"nn"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"nn"+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN069"
  } ;

mkN070 : Str -> N ;
mkN070 base =
  case base of {
    base_1+"a"+base_2@("ch"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"oi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"oi"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN070"
  } ;

mkN071 : Str -> N ;
mkN071 base =
  case base of {
    "bea"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "bea"+base_1 ;
                                  Pl => "m"+base_1+"athan"
                                } ;
                       Def => table {
                                Sg => "bhea"+base_1 ;
                                Pl => "m"+base_1+"athan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => "bea"+base_1 ;
                                  Pl => "m"+base_1+"athan"
                                } ;
                       Def => table {
                                Sg => "bhea"+base_1 ;
                                Pl => "m"+base_1+"athan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "m"+base_1+"à" ;
                                  Pl => "ba"+base_1
                                } ;
                       Def => table {
                                Sg => "m"+base_1+"à" ;
                                Pl => "ba"+base_1
                              }
                     }
            } ;
        voc = table {
                Sg => "bhea"+base_1 ;
                Pl => "mh"+base_1+"athan"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN071"
  } ;

mkN072 : Str -> N ;
mkN072 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"a"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN072"
  } ;

mkN073 : Str -> N ;
mkN073 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"nnan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"nnan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN073"
  } ;

mkN074 : Str -> N ;
mkN074 base =
  case base of {
    base_1@?+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN074"
  } ;

mkN075 : Str -> N ;
mkN075 base =
  case base of {
    base_1+base_2@?+"i"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"tan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"tan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"tan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"tan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"ta"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN075"
  } ;

mkN076 : Str -> N ;
mkN076 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN076"
  } ;

mkN077 : Str -> N ;
mkN077 base =
  case base of {
    base_1+"i"+base_2@(?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"i"+base_3 ;
                                  Pl => base_1+"i"+base_2+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN077"
  } ;

mkN078 : Str -> N ;
mkN078 base =
  case base of {
    base_1+"u"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+"u"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"òi"+base_2 ;
                                  Pl => base_1+"òi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN078"
  } ;

mkN079 : Str -> N ;
mkN079 base =
  case base of {
    base_1+"u"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+"òi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"òi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN079"
  } ;

mkN080 : Str -> N ;
mkN080 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"an" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN080"
  } ;

mkN081 : Str -> N ;
mkN081 base =
  case base of {
    base_1+"eà"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"eà"+base_2 ;
                                  Pl => base_1+"eà"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN081"
  } ;

mkN082 : Str -> N ;
mkN082 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN082"
  } ;

mkN083 : Str -> N ;
mkN083 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"than"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN083"
  } ;

mkN084 : Str -> N ;
mkN084 base =
  case base of {
    base_1+"ia"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia"+base_2 ;
                                  Pl => base_1+"ia"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ì"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN084"
  } ;

mkN085 : Str -> N ;
mkN085 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN085"
  } ;

mkN086 : Str -> N ;
mkN086 base =
  case base of {
    base_1@("cr"|"cn"|"st"|?)+"o"+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"ui"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN086"
  } ;

mkN087 : Str -> N ;
mkN087 base =
  case base of {
    base_1@?+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN087"
  } ;

mkN088 : Str -> N ;
mkN088 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN088"
  } ;

mkN089 : Str -> N ;
mkN089 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"an" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN089"
  } ;

mkN090 : Str -> N ;
mkN090 base =
  case base of {
    base_1+base_2@?+"ug" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ug" ;
                                  Pl => base_1+base_2+"ugan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èig"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN090"
  } ;

mkN091 : Str -> N ;
mkN091 base =
  case base of {
    base_1+base_2@?+"r" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN091"
  } ;

mkN092 : Str -> N ;
mkN092 base =
  case base of {
    base_1+base_2@?+"o"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"o"+base_3 ;
                                  Pl => base_1+base_2+"ui"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"o"+base_3 ;
                                Pl => base_1+base_2+"ui"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"o"+base_3 ;
                                  Pl => base_1+base_2+"ui"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"o"+base_3 ;
                                Pl => base_1+base_2+"ui"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ui"+base_3 ;
                                  Pl => base_1+"h"+base_2+"o"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => base_1+base_2+"o"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                Pl => base_1+"h"+base_2+"o"+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN092"
  } ;

mkN093 : Str -> N ;
mkN093 base =
  case base of {
    base_1+"o"+base_2@("sg"|"rc"|"rt"|"nn"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN093"
  } ;

mkN094 : Str -> N ;
mkN094 base =
  case base of {
    base_1@?+base_2+base_3@("c"|"s"|"g"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN094"
  } ;

mkN095 : Str -> N ;
mkN095 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ; --guessed
                                Pl => base_1+"ea"+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hi"+base_2 ; --guessed
                Pl => base_1+"hea"+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN095"
  } ;

mkN096 : Str -> N ;
mkN096 base =
  case base of {
    base_1+"i"+base_2@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"n" ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN096"
  } ;

mkN097 : Str -> N ;
mkN097 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"thntan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"thntan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"thntan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"thntan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"than" ;
                                  Pl => base_1+"h"+base_2+"thntan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"than" ;
                                Pl => base_1+base_2+"thntan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"thntan"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN097"
  } ;

mkN098 : Str -> N ;
mkN098 base =
  case base of {
    base_1+base_2@(?+?)+"i"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"eachan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"eachan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ad" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ad" ;
                                Pl => base_1+base_2+"i"+base_3+"eachan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"eachan"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN098"
  } ;

mkN099 : Str -> N ;
mkN099 base =
  case base of {
    base_1+base_2@(?+?)+base_3@(?+?)+"ai"+base_4@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ai"+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+base_4+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ai"+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+base_4+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ai"+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+base_4+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ai"+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+base_4+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a"+base_4 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+base_4+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"a"+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+base_4+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+"ai"+base_4 ;
                Pl => base_1+"h"+base_2+"i"+base_3+base_4+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN099"
  } ;

mkN100 : Str -> N ;
mkN100 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hea"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"hea"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ; --guessed
                                Pl => base_1+"ea"+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hi"+base_2 ; --guessed
                Pl => base_1+"hea"+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN100"
  } ;

mkN101 : Str -> N ;
mkN101 base =
  case base of {
    base_1+base_2@?+"ù" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ù" ;
                                  Pl => base_1+base_2+"ùthan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ù" ;
                                Pl => base_1+base_2+"ùthan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"oinn" ;
                                  Pl => base_1+base_2+"onnaibh"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"oinn" ;
                                Pl => base_1+base_2+"onnaibh"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"onn" ;
                                  Pl => base_1+"h"+base_2+"onn"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"onn" ;
                                Pl => base_1+base_2+"onn"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ù" ;
                Pl => base_1+"h"+base_2+"ùtha"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN101"
  } ;

mkN102 : Str -> N ;
mkN102 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN102"
  } ;

mkN103 : Str -> N ;
mkN103 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN103"
  } ;

mkN104 : Str -> N ;
mkN104 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"h"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN104"
  } ;

mkN105 : Str -> N ;
mkN105 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN105"
  } ;

mkN106 : Str -> N ;
mkN106 base =
  case base of {
    base_1+"à"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"à"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN106"
  } ;

mkN107 : Str -> N ;
mkN107 base =
  case base of {
    base_1+"ò" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ò" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => base_1+"hò" ;
                                Pl => base_1+"à"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ò" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => base_1+"hoin" ;
                                Pl => base_1+"à"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"à" ;
                                  Pl => base_1+"ò"
                                } ;
                       Def => table {
                                Sg => base_1+"à" ;
                                Pl => base_1+"ò"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hò" ;
                Pl => base_1+"hà"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN107"
  } ;

mkN108 : Str -> N ;
mkN108 base =
  case base of {
    base_1+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"l" ;
                                  Pl => base_1+"gais"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"gais" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN108"
  } ;

mkN109 : Str -> N ;
mkN109 base =
  case base of {
    base_1+"ò"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ò"+base_2 ;
                                  Pl => base_1+"ùi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ùi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN109"
  } ;

mkN110 : Str -> N ;
mkN110 base =
  case base of {
    base_1+"ó" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ó" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"oin" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"à" ;
                                  Pl => base_1+"ó"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN110"
  } ;

mkN111 : Str -> N ;
mkN111 base =
  case base of {
    base_1@?+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN111"
  } ;

mkN112 : Str -> N ;
mkN112 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"annan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"annan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ; --guessed
                                Pl => base_1+"annan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"annan" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN112"
  } ;

mkN113 : Str -> N ;
mkN113 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN113"
  } ;

mkN114 : Str -> N ;
mkN114 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"idhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN114"
  } ;

mkN115 : Str -> N ;
mkN115 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aidhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN115"
  } ;

mkN116 : Str -> N ;
mkN116 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN116"
  } ;

mkN117 : Str -> N ;
mkN117 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"nnan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN117"
  } ;

mkN118 : Str -> N ;
mkN118 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"than"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN118"
  } ;

mkN119 : Str -> N ;
mkN119 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"than"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"than"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"than"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"than"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"than"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"than"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"than"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN119"
  } ;

mkN120 : Str -> N ;
mkN120 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"tean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN120"
  } ;

mkN121 : Str -> N ;
mkN121 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ich"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ich"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ibh"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ibh"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ch" ;
                                  Pl => base_1+base_2+"ch"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ch" ;
                                Pl => base_1+base_2+"ch"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ich"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN121"
  } ;

mkN122 : Str -> N ;
mkN122 base =
  case base of {
    base_1+"a"+base_2@?+base_3@?+"id" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3+"id" ;
                                  Pl => base_1+"ài"+base_2+"de"+base_3+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3+"id" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN122"
  } ;

mkN123 : Str -> N ;
mkN123 base =
  case base of {
    base_1@?+base_2+base_3@("gh"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN123"
  } ;

mkN124 : Str -> N ;
mkN124 base =
  case base of {
    base_1+"u" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u" ;
                                  Pl => base_1+"othan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"u" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN124"
  } ;

mkN125 : Str -> N ;
mkN125 base =
  case base of {
    base_1+base_2@(?+?+?)+base_3@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r"+base_3+"ch" ;
                                  Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"r"+base_3+"ch" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+"ir" ;
                Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN125"
  } ;

mkN126 : Str -> N ;
mkN126 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN126"
  } ;

mkN127 : Str -> N ;
mkN127 base =
  case base of {
    base_1+base_2@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"l" ;
                                  Pl => base_1+"l"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"il" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN127"
  } ;

mkN128 : Str -> N ;
mkN128 base =
  case base of {
    base_1+"eò"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"eò"+base_2 ;
                                  Pl => base_1+"iùi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"iùi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN128"
  } ;

mkN129 : Str -> N ;
mkN129 base =
  case base of {
    base_1+base_2@?+"a"+base_3@("s"|"n"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN129"
  } ;

mkN130 : Str -> N ;
mkN130 base =
  case base of {
    base_1@?+base_2@?+"a"+base_3 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN130"
  } ;

mkN131 : Str -> N ;
mkN131 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN131"
  } ;

mkN132 : Str -> N ;
mkN132 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"an" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN132"
  } ;

mkN133 : Str -> N ;
mkN133 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"ui"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"ui"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"ui"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"ui"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ui"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN133"
  } ;

mkN134 : Str -> N ;
mkN134 base =
  case base of {
    base_1+"ea"+base_2@?+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2+base_3 ;
                                  Pl => base_1+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN134"
  } ;

mkN135 : Str -> N ;
mkN135 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"oi"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"oi"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"oi"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"oi"+base_3+"e" ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"a"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN135"
  } ;

mkN136 : Str -> N ;
mkN136 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"è"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+"è"+base_2+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"è"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+"è"+base_2+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"hè"+base_2+base_3 ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hè"+base_2+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN136"
  } ;

mkN137 : Str -> N ;
mkN137 base =
  case base of {
    base_1+"i"+base_2@(?+?+?)+"ai"+base_3@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"ai"+base_3+"n" ;
                                  Pl => base_1+"e"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e"+base_2+base_3+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN137"
  } ;

mkN138 : Str -> N ;
mkN138 base =
  case base of {
    base_1@?+base_2+"a"+base_3@("ct"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN138"
  } ;

mkN139 : Str -> N ;
mkN139 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN139"
  } ;

mkN140 : Str -> N ;
mkN140 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"dhan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"dha" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN140"
  } ;

mkN141 : Str -> N ;
mkN141 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN141"
  } ;

mkN142 : Str -> N ;
mkN142 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"than"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN142"
  } ;

mkN143 : Str -> N ;
mkN143 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"t"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+"t"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"t"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+"t"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"t"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"t"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3 ;
                Pl => base_1+base_2+"t"+base_3+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN143"
  } ;

mkN144 : Str -> N ;
mkN144 base =
  case base of {
    base_1+"i"+base_2@(?+?+?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN144"
  } ;

mkN145 : Str -> N ;
mkN145 base =
  case base of {
    base_1+base_2@?+"al" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"al" ;
                                  Pl => base_1+"l"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"l"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN145"
  } ;

mkN146 : Str -> N ;
mkN146 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"achan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"achan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"achan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"achan"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN146"
  } ;

mkN147 : Str -> N ;
mkN147 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => base_1+"i"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN147"
  } ;

mkN148 : Str -> N ;
mkN148 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN148"
  } ;

mkN149 : Str -> N ;
mkN149 base =
  case base of {
    base_1+"a"+base_2@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"l" ;
                                  Pl => base_1+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN149"
  } ;

mkN150 : Str -> N ;
mkN150 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN150"
  } ;

mkN151 : Str -> N ;
mkN151 base =
  case base of {
    base_1+"i"+base_2@("l"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN151"
  } ;

mkN152 : Str -> N ;
mkN152 base =
  case base of {
    base_1+base_2@(?+?)+"a" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN152"
  } ;

mkN153 : Str -> N ;
mkN153 base =
  case base of {
    base_1+"o"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN153"
  } ;

mkN154 : Str -> N ;
mkN154 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN154"
  } ;

mkN155 : Str -> N ;
mkN155 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN155"
  } ;

mkN156 : Str -> N ;
mkN156 base =
  case base of {
    base_1+"ui"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"o"+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"o"+base_2+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"o"+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"o"+base_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+"ach" ;
                                  Pl => base_1+"ho"+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"o"+base_2+"ach" ;
                                Pl => base_1+"o"+base_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hui"+base_2 ;
                Pl => base_1+"ho"+base_2+"aiche"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN156"
  } ;

mkN157 : Str -> N ;
mkN157 base =
  case base of {
    base_1+"ea"+base_2@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2+"l" ;
                                  Pl => base_1+base_2+"eachan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"l" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN157"
  } ;

mkN158 : Str -> N ;
mkN158 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"achan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"achan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"achan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ; --guessed
                                Pl => base_1+"achan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"achan" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN158"
  } ;

mkN159 : Str -> N ;
mkN159 base =
  case base of {
    base_1+"s"+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"s"+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"s"+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN159"
  } ;

mkN160 : Str -> N ;
mkN160 base =
  case base of {
    base_1+base_2@?+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"aichean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN160"
  } ;

mkN161 : Str -> N ;
mkN161 base =
  case base of {
    base_1+"à"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"à"+base_2 ;
                                  Pl => base_1+"ùi"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"à"+base_2 ;
                                Pl => base_1+"ùi"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"à"+base_2 ;
                                  Pl => base_1+"ùi"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hà"+base_2 ;
                                Pl => base_1+"ùi"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ùi"+base_2 ;
                                  Pl => base_1+"hà"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hùi"+base_2 ;
                                Pl => base_1+"à"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hùi"+base_2 ;
                Pl => base_1+"hà"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN161"
  } ;

mkN162 : Str -> N ;
mkN162 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ithe" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN162"
  } ;

mkN163 : Str -> N ;
mkN163 base =
  case base of {
    base_1+"o"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN163"
  } ;

mkN164 : Str -> N ;
mkN164 base =
  case base of {
    base_1+"ò"+base_2@(?+?+?+?)+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ò"+base_2+"a"+base_3 ;
                                  Pl => base_1+"ó"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ó"+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN164"
  } ;

mkN165 : Str -> N ;
mkN165 base =
  case base of {
    base_1+base_2@?+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ach" ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ach" ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"aiche"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN165"
  } ;

mkN166 : Str -> N ;
mkN166 base =
  case base of {
    base_1+"h"+base_2@?+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"h"+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN166"
  } ;

mkN167 : Str -> N ;
mkN167 base =
  case base of {
    base_1+"ù" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ù" ;
                                  Pl => base_1+"oin"
                                } ;
                       Def => table {
                                Sg => base_1+"ù" ;
                                Pl => base_1+"oin"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ù" ;
                                  Pl => base_1+"oin"
                                } ;
                       Def => table {
                                Sg => base_1+"hù" ;
                                Pl => base_1+"oin"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"oin" ;
                                  Pl => base_1+"hon"
                                } ;
                       Def => table {
                                Sg => base_1+"hoin" ;
                                Pl => base_1+"on"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hoin" ;
                Pl => base_1+"hona"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN167"
  } ;

mkN168 : Str -> N ;
mkN168 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN168"
  } ;

mkN169 : Str -> N ;
mkN169 base =
  case base of {
    base_1@?+base_2+base_3@("ch"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN169"
  } ;

mkN170 : Str -> N ;
mkN170 base =
  case base of {
    base_1@?+base_2+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN170"
  } ;

mkN171 : Str -> N ;
mkN171 base =
  case base of {
    base_1+base_2@?+"och" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"och" ;
                                  Pl => base_1+base_2+"ochan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"igh"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN171"
  } ;

mkN172 : Str -> N ;
mkN172 base =
  case base of {
    base_1+"u"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+"u"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"òi"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN172"
  } ;

mkN173 : Str -> N ;
mkN173 base =
  case base of {
    base_1+"ia" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia" ;
                                  Pl => base_1+"iathan"
                                } ;
                       Def => table {
                                Sg => base_1+"ia" ;
                                Pl => base_1+"iathan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ia" ;
                                  Pl => base_1+"iathan"
                                } ;
                       Def => table {
                                Sg => base_1+"ia" ;
                                Pl => base_1+"iathan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è" ;
                                  Pl => base_1+"hia"
                                } ;
                       Def => table {
                                Sg => base_1+"è" ;
                                Pl => base_1+"ia"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hè" ;
                Pl => base_1+"hiatha"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN173"
  } ;

mkN174 : Str -> N ;
mkN174 base =
  case base of {
    base_1@?+base_2+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN174"
  } ;

mkN175 : Str -> N ;
mkN175 base =
  case base of {
    base_1+base_2@?+"s" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"s" ;
                                  Pl => base_1+"s"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"is" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN175"
  } ;

mkN176 : Str -> N ;
mkN176 base =
  case base of {
    base_1+base_2@?+"st" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"st" ;
                                  Pl => base_1+"s"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ist" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN176"
  } ;

mkN177 : Str -> N ;
mkN177 base =
  case base of {
    base_1+"u"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN177"
  } ;

mkN178 : Str -> N ;
mkN178 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"annan"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN178"
  } ;

mkN179 : Str -> N ;
mkN179 base =
  case base of {
    base_1+base_2@?+"as" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"as" ;
                                  Pl => base_1+base_2+"asan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"is"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN179"
  } ;

mkN180 : Str -> N ;
mkN180 base =
  case base of {
    base_1+"ui"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"o"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN180"
  } ;

mkN181 : Str -> N ;
mkN181 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN181"
  } ;

mkN182 : Str -> N ;
mkN182 base =
  case base of {
    base_1+"à"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"à"+base_2 ;
                                  Pl => base_1+"a"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN182"
  } ;

mkN183 : Str -> N ;
mkN183 base =
  case base of {
    base_1+"u"+base_2@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+"ao"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN183"
  } ;

mkN184 : Str -> N ;
mkN184 base =
  case base of {
    base_1+"e" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"eannan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"inn" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"eann" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN184"
  } ;

mkN185 : Str -> N ;
mkN185 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN185"
  } ;

mkN186 : Str -> N ;
mkN186 base =
  case base of {
    base_1+base_2@(?+?+?)+"ai"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ai"+base_3 ;
                                  Pl => base_1+base_2+base_3+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ai"+base_3 ;
                                Pl => base_1+base_2+base_3+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ai"+base_3 ;
                                  Pl => base_1+base_2+base_3+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ai"+base_3 ;
                                Pl => base_1+base_2+base_3+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a" ;
                                  Pl => base_1+"h"+base_2+base_3+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"a" ;
                                Pl => base_1+base_2+base_3+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ai"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"annan"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN186"
  } ;

mkN187 : Str -> N ;
mkN187 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"idh" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN187"
  } ;

mkN188 : Str -> N ;
mkN188 base =
  case base of {
    base_1+base_2@?+"r" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"r" ;
                                Pl => base_1+"r"+base_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"r" ;
                                Pl => base_1+"r"+base_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ir" ;
                                Pl => base_1+"r"+base_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2+"r" ;
                Pl => base_1+"r"+base_2+"ichean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN188"
  } ;

mkN189 : Str -> N ;
mkN189 base =
  case base of {
    base_1+base_2@?+"ann" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ann" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"n"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN189"
  } ;

mkN190 : Str -> N ;
mkN190 base =
  case base of {
    "e"+base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "e"+base_1+"i"+base_2 ;
                                  Pl => "è"+base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "è"+base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN190"
  } ;

mkN191 : Str -> N ;
mkN191 base =
  case base of {
    "eu"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "eu"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "èi"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN191"
  } ;

mkN192 : Str -> N ;
mkN192 base =
  case base of {
    "eò" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "eò" ;
                                  Pl => "iach"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "iach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN192"
  } ;

mkN193 : Str -> N ;
mkN193 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"thaichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN193"
  } ;

mkN194 : Str -> N ;
mkN194 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"ich"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN194"
  } ;

mkN195 : Str -> N ;
mkN195 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"n"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN195"
  } ;

mkN196 : Str -> N ;
mkN196 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN196"
  } ;

mkN197 : Str -> N ;
mkN197 base =
  case base of {
    base_1+base_2@(?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"a" ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN197"
  } ;

mkN198 : Str -> N ;
mkN198 base =
  case base of {
    base_1+"ai"+base_2@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ai"+base_2+"l" ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN198"
  } ;

mkN199 : Str -> N ;
mkN199 base =
  case base of {
    base_1+"i"+base_2@(?+?)+"ea"+base_3@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"ea"+base_3+"l" ;
                                  Pl => base_1+"ì"+base_2+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"i"+base_3+"l" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ì"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN199"
  } ;

mkN200 : Str -> N ;
mkN200 base =
  case base of {
    base_1+"o"+base_2@(?+?)+"a" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+"a" ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN200"
  } ;

mkN201 : Str -> N ;
mkN201 base =
  case base of {
    base_1+"ui"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"a"+base_2+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"a"+base_2+"annan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"a"+base_2+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"a"+base_2+"annan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a" ;
                                  Pl => base_1+"ha"+base_2+"annan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2+"a" ;
                                Pl => base_1+"a"+base_2+"annan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hui"+base_2 ;
                Pl => base_1+"ha"+base_2+"a" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN201"
  } ;

mkN202 : Str -> N ;
mkN202 base =
  case base of {
    base_1+base_2@(?+?+?)+"ea"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN202"
  } ;

mkN203 : Str -> N ;
mkN203 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"ich"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN203"
  } ;

mkN204 : Str -> N ;
mkN204 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN204"
  } ;

mkN205 : Str -> N ;
mkN205 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ach" ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ach" ;
                                Pl => base_1+base_2+base_3+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"aichean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN205"
  } ;

mkN206 : Str -> N ;
mkN206 base =
  case base of {
    base_1+"a"+base_2@?+"a"+base_3@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a"+base_3 ;
                                  Pl => base_1+"i"+base_2+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN206"
  } ;

mkN207 : Str -> N ;
mkN207 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"ea"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+"ea"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                Pl => base_1+"h"+base_2+"ea"+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN207"
  } ;

mkN208 : Str -> N ;
mkN208 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"chan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"chan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ; --guessed
                Pl => base_1+"chan" --guessed
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN208"
  } ;

mkN209 : Str -> N ;
mkN209 base =
  case base of {
    base_1+base_2@(?+?)+"ai"+base_3@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ai"+base_3+"n" ;
                                  Pl => base_1+base_2+base_3+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN209"
  } ;

mkN210 : Str -> N ;
mkN210 base =
  case base of {
    base_1+base_2@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN210"
  } ;

mkN211 : Str -> N ;
mkN211 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"nnan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN211"
  } ;

mkN212 : Str -> N ;
mkN212 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3+"a" ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3+"a" ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3+"a" ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"a"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN212"
  } ;

mkN213 : Str -> N ;
mkN213 base =
  case base of {
    base_1+"ug" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ug" ;
                                  Pl => base_1+"ugan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "gèi"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN213"
  } ;

mkN214 : Str -> N ;
mkN214 base =
  case base of {
    base_1+base_2@?+"à"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"à"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"à"+base_3 ;
                                Pl => base_1+base_2+"à"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"à"+base_3+"a" ;
                                  Pl => base_1+base_2+"à"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"à"+base_3+"a" ;
                                Pl => base_1+base_2+"à"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3+"a" ;
                                  Pl => base_1+"h"+base_2+"à"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"à"+base_3+"a" ;
                                Pl => base_1+base_2+"à"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"à"+base_3 ;
                Pl => base_1+"h"+base_2+"à"+base_3+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN214"
  } ;

mkN215 : Str -> N ;
mkN215 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a" ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN215"
  } ;

mkN216 : Str -> N ;
mkN216 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN216"
  } ;

mkN217 : Str -> N ;
mkN217 base =
  case base of {
    base_1@?+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN217"
  } ;

mkN218 : Str -> N ;
mkN218 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"dhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN218"
  } ;

mkN219 : Str -> N ;
mkN219 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN219"
  } ;

mkN220 : Str -> N ;
mkN220 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN220"
  } ;

mkN221 : Str -> N ;
mkN221 base =
  case base of {
    base_1+base_2@?+base_3@(?+?)+base_4@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+"inn" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+"inn" ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+base_4 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN221"
  } ;

mkN222 : Str -> N ;
mkN222 base =
  case base of {
    base_1@(?+?)+base_2+base_3@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"l" ;
                                  Pl => base_1+"i"+base_2+"le"+base_3+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"il" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN222"
  } ;

mkN223 : Str -> N ;
mkN223 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN223"
  } ;

mkN224 : Str -> N ;
mkN224 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eannan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN224"
  } ;

mkN225 : Str -> N ;
mkN225 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+"a"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"a"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN225"
  } ;

mkN226 : Str -> N ;
mkN226 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+base_4@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4 ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+"inn" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+base_4+"inn" ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+base_4 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN226"
  } ;

mkN227 : Str -> N ;
mkN227 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+base_4@?+base_5@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+base_5+"n" ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+base_5
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+base_5+"n" ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+base_5
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+base_5+"n" ;
                                  Pl => base_1+base_2+"i"+base_3+"ne"+base_4+base_5
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+base_5+"n" ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+base_5
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+"i"+base_5+"n" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+base_5
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+base_4+"i"+base_5+"n" ;
                                Pl => base_1+base_2+"i"+base_3+"ne"+base_4+base_5
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+base_4+base_5+"n" ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+base_5
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN227"
  } ;

mkN228 : Str -> N ;
mkN228 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"s"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"an" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN228"
  } ;

mkN229 : Str -> N ;
mkN229 base =
  case base of {
    base_1+"a"+base_2@("dh"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN229"
  } ;

mkN230 : Str -> N ;
mkN230 base =
  case base of {
    base_1+"èa"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"èa"+base_2 ;
                                  Pl => base_1+"eòi"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"èa"+base_2 ;
                                Pl => base_1+"eòi"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"èa"+base_2 ;
                                  Pl => base_1+"eòi"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hèa"+base_2 ;
                                Pl => base_1+"eòi"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"eòi"+base_2 ;
                                  Pl => base_1+"hèa"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"heòi"+base_2 ;
                                Pl => base_1+"èa"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"heòi"+base_2 ;
                Pl => base_1+"hèa"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN230"
  } ;

mkN231 : Str -> N ;
mkN231 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN231"
  } ;

mkN232 : Str -> N ;
mkN232 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "è"+base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN232"
  } ;

mkN233 : Str -> N ;
mkN233 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => "è"+base_1+base_2
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+"a"+base_2 ;
                                Pl => "h-è"+base_1+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => "è"+base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => "h-è"+base_1+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "è"+base_1+base_2 ;
                                  Pl => base_1+"a"+base_2
                                } ;
                       Def => table {
                                Sg => "è"+base_1+base_2 ;
                                Pl => base_1+"a"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => "è"+base_1+base_2 ;
                Pl => base_1+"a"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN233"
  } ;

mkN234 : Str -> N ;
mkN234 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"an" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN234"
  } ;

mkN235 : Str -> N ;
mkN235 base =
  case base of {
    "in"+base_1+base_2@?+"an" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "in"+base_1+base_2+"an" ;
                                  Pl => "in"+base_1+base_2+"anan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "ì"+base_1+"n"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN235"
  } ;

mkN236 : Str -> N ;
mkN236 base =
  case base of {
    "io"+base_1+"a" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "io"+base_1+"a" ;
                                  Pl => "ì"+base_1+"nean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "i"+base_1+"ne" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN236"
  } ;

mkN237 : Str -> N ;
mkN237 base =
  case base of {
    base_1+base_2@(?+?)+"a" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => base_1+"i"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN237"
  } ;

mkN238 : Str -> N ;
mkN238 base =
  case base of {
    base_1+"t"+base_2@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"t"+base_2 ;
                                  Pl => base_1+"d"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN238"
  } ;

mkN239 : Str -> N ;
mkN239 base =
  case base of {
    base_1+"a"+base_2@(?+?)+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3 ;
                                  Pl => base_1+"ài"+base_2+"e"+base_3+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN239"
  } ;

mkN240 : Str -> N ;
mkN240 base =
  case base of {
    base_1+"b"+base_2@?+"idh" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"b"+base_2+"idh" ;
                                  Pl => base_1+"b"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"p"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN240"
  } ;

mkN241 : Str -> N ;
mkN241 base =
  case base of {
    base_1+"ea"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN241"
  } ;

mkN242 : Str -> N ;
mkN242 base =
  case base of {
    base_1+"a"+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a"+base_3 ;
                                  Pl => base_1+"a"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN242"
  } ;

mkN243 : Str -> N ;
mkN243 base =
  case base of {
    base_1+base_2@?+"thad" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"thad" ;
                                  Pl => base_1+"òide"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"thaid" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN243"
  } ;

mkN244 : Str -> N ;
mkN244 base =
  case base of {
    base_1+"o"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN244"
  } ;

mkN245 : Str -> N ;
mkN245 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+base_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+base_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"each" ;
                                  Pl => base_1+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"each" ;
                                Pl => base_1+base_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"i"+base_2 ;
                Pl => base_1+base_2+"ichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN245"
  } ;

mkN246 : Str -> N ;
mkN246 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN246"
  } ;

mkN247 : Str -> N ;
mkN247 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN247"
  } ;

mkN248 : Str -> N ;
mkN248 base =
  case base of {
    base_1+base_2@?+"o"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"o"+base_3 ;
                                  Pl => base_1+base_2+"o"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN248"
  } ;

mkN249 : Str -> N ;
mkN249 base =
  case base of {
    base_1+"o"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN249"
  } ;

mkN250 : Str -> N ;
mkN250 base =
  case base of {
    base_1+"i"+base_2@(?+?+?)+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN250"
  } ;

mkN251 : Str -> N ;
mkN251 base =
  case base of {
    base_1+"o"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+"o"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN251"
  } ;

mkN252 : Str -> N ;
mkN252 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN252"
  } ;

mkN253 : Str -> N ;
mkN253 base =
  case base of {
    base_1+base_2@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"r"+base_2+"ch" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN253"
  } ;

mkN254 : Str -> N ;
mkN254 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN254"
  } ;

mkN255 : Str -> N ;
mkN255 base =
  case base of {
    base_1+base_2@("mh"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ;
                                Pl => base_1+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ;
                Pl => base_1+base_2+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN255"
  } ;

mkN256 : Str -> N ;
mkN256 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ;
                Pl => base_1+base_2+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN256"
  } ;

mkN257 : Str -> N ;
mkN257 base =
  case base of {
    base_1+"èi"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"èi"+base_2 ;
                                  Pl => base_1+"eu"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"eu"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN257"
  } ;

mkN258 : Str -> N ;
mkN258 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"t"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ; --guessed
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN258"
  } ;

mkN259 : Str -> N ;
mkN259 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"idhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"idh" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN259"
  } ;

mkN260 : Str -> N ;
mkN260 base =
  case base of {
    base_1+"a"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"ha"+base_2 ;
                                Pl => base_1+"i"+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"ha"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => base_1+"a"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hi"+base_2 ;
                Pl => base_1+"ha"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN260"
  } ;

mkN261 : Str -> N ;
mkN261 base =
  case base of {
    base_1+base_2@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => base_1+"r"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"rach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN261"
  } ;

mkN262 : Str -> N ;
mkN262 base =
  case base of {
    base_1+base_2@?+"ai"+base_3@?+"n" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ai"+base_3+"n" ;
                                  Pl => base_1+"i"+base_2+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN262"
  } ;

mkN263 : Str -> N ;
mkN263 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"inn"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN263"
  } ;

mkN264 : Str -> N ;
mkN264 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"ea"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ea"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+"ea"+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                Pl => base_1+"h"+base_2+"ea"+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN264"
  } ;

mkN265 : Str -> N ;
mkN265 base =
  case base of {
    base_1+base_2@("e"|(?+?+?+?+?+?+?+?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"t"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"chan" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"chan" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+base_2+"chan" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"chan" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN265"
  } ;

mkN266 : Str -> N ;
mkN266 base =
  case base of {
    base_1+"a"+base_2@("g"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => "h-"+base_1+"a"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => "h-"+base_1+"a"+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+"a"+base_2
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"i"+base_2+"e" ;
                                Pl => base_1+"a"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"a"+base_2 ;
                Pl => base_1+"a"+base_2+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN266"
  } ;

mkN267 : Str -> N ;
mkN267 base =
  case base of {
    base_1+"u"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2 ;
                                  Pl => base_1+"u"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"òi"+base_2 ;
                                  Pl => base_1+"òi"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN267"
  } ;

mkN268 : Str -> N ;
mkN268 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN268"
  } ;

mkN269 : Str -> N ;
mkN269 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eachan" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ean" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN269"
  } ;

mkN270 : Str -> N ;
mkN270 base =
  case base of {
    base_1+"ui"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"a"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"a"+base_2+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ui"+base_2 ;
                                  Pl => base_1+"a"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"a"+base_2+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a" ;
                                  Pl => base_1+"ha"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2+"a" ;
                                Pl => base_1+"a"+base_2+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hui"+base_2 ;
                Pl => base_1+"ha"+base_2+"a"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN270"
  } ;

mkN271 : Str -> N ;
mkN271 base =
  case base of {
    base_1+base_2@(?+?+?)+base_3@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"r" ;
                                  Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"r" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+"ir" ;
                Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN271"
  } ;

mkN272 : Str -> N ;
mkN272 base =
  case base of {
    base_1+"n"+base_2@(?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"n"+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"n"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN272"
  } ;

mkN273 : Str -> N ;
mkN273 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN273"
  } ;

mkN274 : Str -> N ;
mkN274 base =
  case base of {
    "nea"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "nea"+base_1 ;
                                  Pl => "lu"+base_1+"d"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "nea"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN274"
  } ;

mkN275 : Str -> N ;
mkN275 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN275"
  } ;

mkN276 : Str -> N ;
mkN276 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"thean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN276"
  } ;

mkN277 : Str -> N ;
mkN277 base =
  case base of {
    base_1+"ea"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"n" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"n" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN277"
  } ;

mkN278 : Str -> N ;
mkN278 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eachan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ean" ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN278"
  } ;

mkN279 : Str -> N ;
mkN279 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+"id" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"id" ;
                                  Pl => base_1+"i"+base_2+"de"+base_3+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"d" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN279"
  } ;

mkN280 : Str -> N ;
mkN280 base =
  case base of {
    base_1+"ì" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ì" ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ì" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN280"
  } ;

mkN281 : Str -> N ;
mkN281 base =
  case base of {
    base_1+"ì" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ì" ;
                                  Pl => base_1+"itheachan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ith" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN281"
  } ;

mkN282 : Str -> N ;
mkN282 base =
  case base of {
    "o"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "o"+base_1 ;
                                  Pl => "ui"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "ui"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN282"
  } ;

mkN283 : Str -> N ;
mkN283 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN283"
  } ;

mkN284 : Str -> N ;
mkN284 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"idhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN284"
  } ;

mkN285 : Str -> N ;
mkN285 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN285"
  } ;

mkN286 : Str -> N ;
mkN286 base =
  case base of {
    base_1+base_2@("i"|(?+?))+"r" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"chean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"re" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN286"
  } ;

mkN287 : Str -> N ;
mkN287 base =
  case base of {
    base_1+"ea"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN287"
  } ;

mkN288 : Str -> N ;
mkN288 base =
  case base of {
    base_1+base_2@?+"ur" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ur" ;
                                  Pl => base_1+base_2+"uran"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èir"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN288"
  } ;

mkN289 : Str -> N ;
mkN289 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"é"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN289"
  } ;

mkN290 : Str -> N ;
mkN290 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"nan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN290"
  } ;

mkN291 : Str -> N ;
mkN291 base =
  case base of {
    base_1+"iu"+base_2@(?+?)+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"iu"+base_2+"a"+base_3 ;
                                  Pl => base_1+"ea"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hiu"+base_2+"a"+base_3 ;
                                Pl => base_1+"ea"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"iu"+base_2+"a"+base_3 ;
                                  Pl => base_1+"ea"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hiu"+base_2+"a"+base_3 ;
                                Pl => base_1+"ea"+base_2+base_3+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2+"a"+base_3 ;
                                  Pl => base_1+"hea"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2+"a"+base_3 ;
                                Pl => base_1+"ea"+base_2+base_3+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hiu"+base_2+"a"+base_3 ;
                Pl => base_1+"hea"+base_2+base_3+"aichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN291"
  } ;

mkN292 : Str -> N ;
mkN292 base =
  case base of {
    base_1+"a" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"othan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"o" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN292"
  } ;

mkN293 : Str -> N ;
mkN293 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN293"
  } ;

mkN294 : Str -> N ;
mkN294 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"e" ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN294"
  } ;

mkN295 : Str -> N ;
mkN295 base =
  case base of {
    base_1+base_2@?+"ul" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ul" ;
                                  Pl => base_1+base_2+"ultan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èil"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN295"
  } ;

mkN296 : Str -> N ;
mkN296 base =
  case base of {
    base_1@?+base_2@?+"a"+base_3 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ; --guessed
                                Pl => base_1+"è"+base_2+base_3 --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => base_1+"è"+base_2+base_3 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ; --guessed
                                Pl => base_1+"è"+base_2+base_3 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"hè"+base_2+base_3 ; --guessed
                                Pl => base_1+base_2+"a"+base_3 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"hè"+base_2+base_3 ; --guessed
                Pl => base_1+"h"+base_2+"a"+base_3+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN296"
  } ;

mkN297 : Str -> N ;
mkN297 base =
  case base of {
    base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN297"
  } ;

mkN298 : Str -> N ;
mkN298 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"rean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN298"
  } ;

mkN299 : Str -> N ;
mkN299 base =
  case base of {
    base_1+base_2@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ; --guessed
                                  Pl => base_1+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN299"
  } ;

mkN300 : Str -> N ;
mkN300 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"e"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN300"
  } ;

mkN301 : Str -> N ;
mkN301 base =
  case base of {
    base_1+base_2@?+"ad" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ad" ;
                                  Pl => base_1+"d"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"d"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN301"
  } ;

mkN302 : Str -> N ;
mkN302 base =
  case base of {
    base_1@?+base_2+base_3@("th"|?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN302"
  } ;

mkN303 : Str -> N ;
mkN303 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"inn"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN303"
  } ;

mkN304 : Str -> N ;
mkN304 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"innean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN304"
  } ;

mkN305 : Str -> N ;
mkN305 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN305"
  } ;

mkN306 : Str -> N ;
mkN306 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN306"
  } ;

mkN307 : Str -> N ;
mkN307 base =
  case base of {
    base_1+"ia"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia"+base_2 ;
                                  Pl => base_1+"ea"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ithi"+base_2+"n" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ei"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN307"
  } ;

mkN308 : Str -> N ;
mkN308 base =
  case base of {
    base_1+"ia"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia"+base_2 ;
                                  Pl => base_1+"ia"+base_2+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ì"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN308"
  } ;

mkN309 : Str -> N ;
mkN309 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "singular "+base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN309"
  } ;

mkN310 : Str -> N ;
mkN310 base =
  case base of {
    base_1+base_2@?+"ar" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ar" ;
                                  Pl => base_1+base_2+"aran"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "singular "+base_1+"ir"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN310"
  } ;

mkN311 : Str -> N ;
mkN311 base =
  case base of {
    base_1+"i"+base_2@(?+?)+base_3@?+"ann" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+base_3+"ann" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ì"+base_2+"n"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN311"
  } ;

mkN312 : Str -> N ;
mkN312 base =
  case base of {
    base_1+"u"+base_2@(?+?)+base_3@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2+base_3+"l" ;
                                  Pl => base_1+"ù"+base_2+"l"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"u"+base_2+base_3+"il" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN312"
  } ;

mkN313 : Str -> N ;
mkN313 base =
  case base of {
    base_1+base_2@(?+?)+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN313"
  } ;

mkN314 : Str -> N ;
mkN314 base =
  case base of {
    base_1+base_2@?+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"è"+base_2+base_3+"tean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN314"
  } ;

mkN315 : Str -> N ;
mkN315 base =
  case base of {
    base_1+base_2@?+"a"+base_3@?+"aid" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3+"aid" ;
                                  Pl => base_1+"è"+base_2+base_3+"tean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3+"te" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN315"
  } ;

mkN316 : Str -> N ;
mkN316 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN316"
  } ;

mkN317 : Str -> N ;
mkN317 base =
  case base of {
    base_1+"ua"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ua"+base_2 ;
                                  Pl => base_1+"òi"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"uai"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN317"
  } ;

mkN318 : Str -> N ;
mkN318 base =
  case base of {
    base_1+"d"+base_2@(?+?)+"nn" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"d"+base_2+"nn" ;
                                  Pl => base_1+base_2+"dhean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"dh" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN318"
  } ;

mkN319 : Str -> N ;
mkN319 base =
  case base of {
    base_1+"i"+base_2@?+"e"+base_3@(?+?+?+?)+base_4@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e"+base_3+base_4 ;
                                  Pl => base_1+"a"+base_2+base_3+"i"+base_4+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+base_3+"i"+base_4 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN319"
  } ;

mkN320 : Str -> N ;
mkN320 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?)+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN320"
  } ;

mkN321 : Str -> N ;
mkN321 base =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ; --guessed
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => "h-"+base_1+"a"+base_2+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+"a"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+"a"+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"a"+base_2 ; --guessed
                Pl => base_1+"a"+base_2+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN321"
  } ;

mkN322 : Str -> N ;
mkN322 base =
  case base of {
    base_1+base_2@?+"a"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+"è"+base_2+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"è"+base_2+base_3+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN322"
  } ;

mkN323 : Str -> N ;
mkN323 base =
  case base of {
    base_1+base_2@(?+?)+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN323"
  } ;

mkN324 : Str -> N ;
mkN324 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"each" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN324"
  } ;

mkN325 : Str -> N ;
mkN325 base =
  case base of {
    base_1+"d"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"d"+base_2 ;
                                  Pl => base_1+"g"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ig"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN325"
  } ;

mkN326 : Str -> N ;
mkN326 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN326"
  } ;

mkN327 : Str -> N ;
mkN327 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eannan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN327"
  } ;

mkN328 : Str -> N ;
mkN328 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ach" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN328"
  } ;

mkN329 : Str -> N ;
mkN329 base =
  case base of {
    base_1+base_2@(?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN329"
  } ;

mkN330 : Str -> N ;
mkN330 base =
  case base of {
    base_1+"o"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2 ;
                                  Pl => base_1+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN330"
  } ;

mkN331 : Str -> N ;
mkN331 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN331"
  } ;

mkN332 : Str -> N ;
mkN332 base =
  case base of {
    base_1+base_2@?+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a" ;
                                  Pl => base_1+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"a" ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN332"
  } ;

mkN333 : Str -> N ;
mkN333 base =
  case base of {
    base_1+"ù"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ù"+base_2 ;
                                  Pl => base_1+"u"+base_2+"eannan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ù"+base_2+"e" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN333"
  } ;

mkN334 : Str -> N ;
mkN334 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN334"
  } ;

mkN335 : Str -> N ;
mkN335 base =
  case base of {
    base_1@?+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"e" ;
                                Pl => base_1+base_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"ean"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN335"
  } ;

mkN336 : Str -> N ;
mkN336 base =
  case base of {
    base_1+base_2@(?+?)+"a"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a"+base_3 ;
                                  Pl => base_1+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ainn" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ainn" ;
                                Pl => base_1+base_2+"a"+base_3+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"a"+base_3 ;
                Pl => base_1+"h"+base_2+"a"+base_3+"an"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN336"
  } ;

mkN337 : Str -> N ;
mkN337 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"chan" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN337"
  } ;

mkN338 : Str -> N ;
mkN338 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"ir" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ir" ;
                                  Pl => base_1+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ir" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r"+base_3+"ch" ;
                                  Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"r"+base_3+"ch" ;
                                Pl => base_1+base_2+"r"+base_3+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3+"ir" ;
                Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN338"
  } ;

mkN339 : Str -> N ;
mkN339 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"nnan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"nnan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"nnan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"nnan"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"nnan"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"nnan"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN339"
  } ;

mkN340 : Str -> N ;
mkN340 base =
  case base of {
    base_1+"à"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"à"+base_2 ;
                                  Pl => base_1+"a"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN340"
  } ;

mkN341 : Str -> N ;
mkN341 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"h"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ;
                                Pl => base_1+base_2+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2 ;
                Pl => base_1+"h"+base_2+"n"
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN341"
  } ;

mkN342 : Str -> N ;
mkN342 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"en"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN342"
  } ;

mkN343 : Str -> N ;
mkN343 base =
  case base of {
    base_1+base_2@?+"r" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"r" ;
                                  Pl => base_1+"r"+base_2+"chan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ir" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN343"
  } ;

mkN344 : Str -> N ;
mkN344 base =
  case base of {
    base_1+"o"+base_2@(?+?)+base_3@?+"s" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+base_3+"s" ;
                                  Pl => base_1+"òi"+base_2+"se"+base_3+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+base_3+"is" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN344"
  } ;

mkN345 : Str -> N ;
mkN345 base =
  case base of {
    base_1+"eu"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"eu"+base_2 ;
                                  Pl => base_1+"eu"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"èi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN345"
  } ;

mkN346 : Str -> N ;
mkN346 base =
  case base of {
    base_1+base_2@(?+?)+"i"+base_3@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ad" ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+"i"+base_3 ;
                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN346"
  } ;

mkN347 : Str -> N ;
mkN347 base =
  case base of {
    base_1@?+base_2+base_3@("g"|(?+?)) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+base_3+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => base_1+base_2+base_3
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+"h"+base_2+base_3 ;
                Pl => base_1+"h"+base_2+base_3+"a"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN347"
  } ;

mkN348 : Str -> N ;
mkN348 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN348"
  } ;

mkN349 : Str -> N ;
mkN349 base =
  case base of {
    base_1+"òi"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"òi"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"o"+base_2+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN349"
  } ;

mkN350 : Str -> N ;
mkN350 base =
  case base of {
    base_1+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2 ; --guessed
                                Pl => base_1+"i"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => base_1+"i"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => base_1+"i"+base_2+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => base_1+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ; --guessed
                                Pl => base_1+base_2 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => base_1+base_2 ; --guessed
                Pl => base_1+base_2+"a" --guessed
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN350"
  } ;

mkN351 : Str -> N ;
mkN351 base =
  case base of {
    "u"+base_1+base_2@?+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "u"+base_1+base_2+"l" ;
                                  Pl => "ù"+base_1+"l"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "u"+base_1+base_2+"il" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN351"
  } ;

mkN352 : Str -> N ;
mkN352 base =
  case base of {
    base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2 ;
                                  Pl => base_1+base_2+"nan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN352"
  } ;

mkN353 : Str -> N ;
mkN353 base =
  case base of {
    "à"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "à"+base_1 ;
                                  Pl => "a"+base_1+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "a"+base_1+"a" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN353"
  } ;

mkN354 : Str -> N ;
mkN354 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => base_1 ;
                Pl => base_1+"an"
              } ;
        g = Fem
      };
    _ => error "Can't apply paradigm mkN354"
  } ;

mkN355 : Str -> N ;
mkN355 base =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan" --guessed
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"idh" ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN355"
  } ;

mkN356 : Str -> N ;
mkN356 base =
  case base of {
    "ò"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "ò"+base_1 ;
                                  Pl => "ùi"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "ùi"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN356"
  } ;

mkV001 : Str -> V ;
mkV001 base =
  case base of {
    "abai"+base_1 => lin V
      { s = "abai"+base_1 ;
        conditional = table {
                        Sg => "thei"+base_1+"inn" ;
                        Pl => "thei"+base_1+"eadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "ab"+base_1+"am" ;
                               Pl => "ab"+base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => "abai"+base_1 ;
                               Pl => "ab"+base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "ab"+base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => "thei"+base_1 ;
                   Dep => "abai"+base_1
                 } ;
        past = table {
                 Indep => "thui"+base_1+"t" ;
                 Dep => "tui"+base_1+"t"
               } ;
        noun = base_1+"àdh" ;
        participle = base_1+"àite"
      };
    _ => error "Can't apply paradigm mkV001"
  } ;

mkV002 : Str -> V ;
mkV002 base =
  case base of {
    base_1+"i"+base_2@("c"|(?+?)) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => "dh'"+base_1+"i"+base_2+"inn" ;
                        Pl => "dh'"+base_1+"i"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"i"+base_2+"eam" ;
                               Pl => base_1+"i"+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+"i"+base_2 ;
                               Pl => base_1+"i"+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"i"+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => base_1+"i"+base_2
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => "dh'"+base_1+"i"+base_2
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV002"
  } ;

mkV003 : Str -> V ;
mkV003 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ;
                        Pl => "dh'"+base_1+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ;
                               Pl => base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV003"
  } ;

mkV004 : Str -> V ;
mkV004 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV004"
  } ;

mkV005 : Str -> V ;
mkV005 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"t" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV005"
  } ;

mkV006 : Str -> V ;
mkV006 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ea"+base_2+"adh" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV006"
  } ;

mkV007 : Str -> V ;
mkV007 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"mhainn" ;
        participle = base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV007"
  } ;

mkV008 : Str -> V ;
mkV008 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV008"
  } ;

mkV009 : Str -> V ;
mkV009 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV009"
  } ;

mkV010 : Str -> V ;
mkV010 base =
  case base of {
    base_1+"i"+base_2@("m"|(?+?)) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => "dh'"+base_1+"i"+base_2+"inn" ;
                        Pl => "dh'"+base_1+"i"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"i"+base_2+"eam" ;
                               Pl => base_1+"i"+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+"i"+base_2 ;
                               Pl => base_1+"i"+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"i"+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => base_1+"i"+base_2
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => "dh'"+base_1+"i"+base_2
               } ;
        noun = base_1+base_2 ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV010"
  } ;

mkV011 : Str -> V ;
mkV011 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"hte"
      };
    _ => error "Can't apply paradigm mkV011"
  } ;

mkV012 : Str -> V ;
mkV012 base =
  case base of {
    base_1+base_2@?+"nn" => lin V
      { s = base_1+base_2+"nn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"n"+base_2+"dh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"nn" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"nn" ;
        participle = base_1+base_2+"nnte"
      };
    _ => error "Can't apply paradigm mkV012"
  } ;

mkV013 : Str -> V ;
mkV013 base =
  case base of {
    base_1+base_2@?+"inn" => lin V
      { s = base_1+base_2+"inn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"n"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"inn" ;
                 Dep => nonExist
               } ;
        noun = base_1+"n"+base_2+"dh" ;
        participle = base_1+base_2+"innte"
      };
    _ => error "Can't apply paradigm mkV013"
  } ;

mkV014 : Str -> V ;
mkV014 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ea"+base_2+"d" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV014"
  } ;

mkV015 : Str -> V ;
mkV015 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV015"
  } ;

mkV016 : Str -> V ;
mkV016 base =
  case base of {
    base_1+"dhèa"+base_2@? => lin V
      { s = base_1+"dhèa"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"ì" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"ri"+base_2+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+"dhèa"+base_2+"amh" ;
        participle = base_1+"dhèa"+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV016"
  } ;

mkV017 : Str -> V ;
mkV017 base =
  case base of {
    base_1+"a"+base_2@(?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+"a"+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"a"+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"a"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+"a"+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV017"
  } ;

mkV018 : Str -> V ;
mkV018 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ail" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV018"
  } ;

mkV019 : Str -> V ;
mkV019 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"tinn" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV019"
  } ;

mkV020 : Str -> V ;
mkV020 base =
  case base of {
    base_1+"i"+base_2@? => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"e" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV020"
  } ;

mkV021 : Str -> V ;
mkV021 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV021"
  } ;

mkV022 : Str -> V ;
mkV022 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"tainn" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV022"
  } ;

mkV023 : Str -> V ;
mkV023 base =
  case base of {
    base_1+base_2@(?+?)+"r" => lin V
      { s = base_1+base_2+"r" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"r"+base_2+"dh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"r" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"rt" ;
        participle = base_1+base_2+"rte"
      };
    _ => error "Can't apply paradigm mkV023"
  } ;

mkV024 : Str -> V ;
mkV024 base =
  case base of {
    base_1+base_2@? => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ad"+base_2 ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV024"
  } ;

mkV025 : Str -> V ;
mkV025 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"eam" ;
        participle = base_1+"e"
      };
    _ => error "Can't apply paradigm mkV025"
  } ;

mkV026 : Str -> V ;
mkV026 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"ainn" ;
                        Pl => base_1+"h"+base_2+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"am" ;
                               Pl => base_1+base_2+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV026"
  } ;

mkV027 : Str -> V ;
mkV027 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"inn" ;
                        Pl => base_1+"h"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ;
                               Pl => base_1+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"t" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV027"
  } ;

mkV028 : Str -> V ;
mkV028 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eadh" ;
        participle = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV028"
  } ;

mkV029 : Str -> V ;
mkV029 base =
  case base of {
    base_1@?+base_2+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"d" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV029"
  } ;

mkV030 : Str -> V ;
mkV030 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"ic"+base_3@? => lin V
      { s = base_1+base_2+"ic"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"ic"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"ic"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"d"+base_3 ;
        participle = base_1+base_2+"ic"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV030"
  } ;

mkV031 : Str -> V ;
mkV031 base =
  case base of {
    "bei"+base_1 => lin V
      { s = "bei"+base_1 ;
        conditional = table {
                        Sg => "bhei"+base_1+"inn" ;
                        Pl => "bhei"+base_1+"eadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "bei"+base_1+"eam" ;
                               Pl => "bei"+base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => "bei"+base_1 ;
                               Pl => "bei"+base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "bei"+base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => "bei"+base_1+"idh" ;
                   Dep => "bhei"+base_1
                 } ;
        past = table {
                 Indep => base_1+"ug" ;
                 Dep => base_1+"ug"
               } ;
        noun = "b"+base_1+"eith" ;
        participle = "bei"+base_1+"te"
      };
    _ => error "Can't apply paradigm mkV031"
  } ;

mkV032 : Str -> V ;
mkV032 base =
  case base of {
    base_1@?+base_2+"i"+base_3@("l"|"g"|(?+?)) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"i"+base_3+"inn" ;
                        Pl => base_1+"h"+base_2+"i"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"i"+base_3+"eam" ;
                               Pl => base_1+base_2+"i"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"i"+base_3 ;
                               Pl => base_1+base_2+"i"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"i"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => base_1+"h"+base_2+"i"+base_3
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => base_1+"h"+base_2+"i"+base_3
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV032"
  } ;

mkV033 : Str -> V ;
mkV033 base =
  case base of {
    base_1+base_2@?+"à"+base_3@(?+?) => lin V
      { s = base_1+base_2+"à"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"a"+base_3+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"à"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"a"+base_3+"adh" ;
        participle = base_1+base_2+"à"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV033"
  } ;

mkV034 : Str -> V ;
mkV034 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"inn" ;
                        Pl => base_1+"h"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ;
                               Pl => base_1+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"eadh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV034"
  } ;

mkV035 : Str -> V ;
mkV035 base =
  case base of {
    base_1@?+base_2+"i"+base_3@("l"|"r"|(?+?)) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3 ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV035"
  } ;

mkV036 : Str -> V ;
mkV036 base =
  case base of {
    base_1+"ic"+base_2@? => lin V
      { s = base_1+"ic"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => nonExist ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => nonExist ;
                 Dep => nonExist
               } ;
        noun = base_1+"d"+base_2 ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV036"
  } ;

mkV037 : Str -> V ;
mkV037 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ; --guessed
                        Pl => "dh'"+base_1+"amaid" --guessed
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ; --guessed
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => base_1 ; --guessed
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh" --guessed
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ; --guessed
                   Dep => base_1 --guessed
                 } ;
        past = table {
                 Indep => base_1 ; --guessed
                 Dep => "dh'"+base_1 --guessed
               } ;
        noun = base_1 ;
        participle = base_1+"te" --guessed
      };
    _ => error "Can't apply paradigm mkV037"
  } ;

mkV038 : Str -> V ;
mkV038 base =
  case base of {
    base_1@?+base_2+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"i"+base_3+"inn" ;
                        Pl => base_1+"h"+base_2+"i"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"i"+base_3+"eam" ;
                               Pl => base_1+base_2+"i"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"i"+base_3 ;
                               Pl => base_1+base_2+"i"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"i"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => base_1+base_2+"i"+base_3
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => base_1+"h"+base_2+"i"+base_3
               } ;
        noun = base_1+base_2+"ea"+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV038"
  } ;

mkV039 : Str -> V ;
mkV039 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ad" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV039"
  } ;

mkV040 : Str -> V ;
mkV040 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"i"+base_3@?+"n" => lin V
      { s = base_1+base_2+"i"+base_3+"n" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"i"+base_3+"n" ;
        participle = base_1+base_2+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV040"
  } ;

mkV041 : Str -> V ;
mkV041 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV041"
  } ;

mkV042 : Str -> V ;
mkV042 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"inn" ; --guessed
                        Pl => base_1+"h"+base_2+"eamaid" --guessed
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ; --guessed
                               Pl => base_1+base_2+"eamaid" --guessed
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ; --guessed
                               Pl => base_1+base_2+"ibh" --guessed
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh" --guessed
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+"h"+base_2 --guessed
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2 --guessed
               } ;
        noun = base_1+base_2+"eadh" ;
        participle = base_1+base_2+"e" --guessed
      };
    _ => error "Can't apply paradigm mkV042"
  } ;

mkV043 : Str -> V ;
mkV043 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV043"
  } ;

mkV044 : Str -> V ;
mkV044 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+"inn" => lin V
      { s = base_1+base_2+base_3+"inn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"n"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"inn" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"n"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"innte"
      };
    _ => error "Can't apply paradigm mkV044"
  } ;

mkV045 : Str -> V ;
mkV045 base =
  case base of {
    base_1+base_2@?+"i"+base_3@?+"i"+base_4@? => lin V
      { s = base_1+base_2+"i"+base_3+"i"+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+"i"+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"a"+base_4 ;
        participle = base_1+base_2+"i"+base_3+"i"+base_4+"te"
      };
    _ => error "Can't apply paradigm mkV045"
  } ;

mkV046 : Str -> V ;
mkV046 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eamh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV046"
  } ;

mkV047 : Str -> V ;
mkV047 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"ainn" ;
                        Pl => base_1+"h"+base_2+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"am" ;
                               Pl => base_1+base_2+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"tainn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV047"
  } ;

mkV048 : Str -> V ;
mkV048 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"il" => lin V
      { s = base_1+base_2+base_3+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"ilidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"l"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"ilte"
      };
    _ => error "Can't apply paradigm mkV048"
  } ;

mkV049 : Str -> V ;
mkV049 base =
  case base of {
    base_1@?+base_2+base_3@(?+?)+"ai"+base_4@?+"n" => lin V
      { s = base_1+base_2+base_3+"ai"+base_4+"n" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"ai"+base_4+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+base_4+"adh" ;
        participle = base_1+base_2+base_3+"ai"+base_4+"nte"
      };
    _ => error "Can't apply paradigm mkV049"
  } ;

mkV050 : Str -> V ;
mkV050 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"il" => lin V
      { s = base_1+base_2+base_3+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"l"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"l" ;
        participle = base_1+base_2+base_3+"ilte"
      };
    _ => error "Can't apply paradigm mkV050"
  } ;

mkV051 : Str -> V ;
mkV051 base =
  case base of {
    base_1+base_2@?+"uinn" => lin V
      { s = base_1+base_2+"uinn" ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"uinninn" ;
                        Pl => base_1+"h"+base_2+"uinneadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"uinneam" ;
                               Pl => base_1+base_2+"uinneamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"uinn" ;
                               Pl => base_1+base_2+"uinnibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"uinneadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"uinnidh" ;
                   Dep => base_1+"h"+base_2+"uinn"
                 } ;
        past = table {
                 Indep => base_1+"hua"+base_2+"a" ;
                 Dep => base_1+"hua"+base_2+"a"
               } ;
        noun = base_1+base_2+"uinntinn" ;
        participle = base_1+base_2+"uinnte"
      };
    _ => error "Can't apply paradigm mkV051"
  } ;

mkV052 : Str -> V ;
mkV052 base =
  case base of {
    base_1+base_2@(?+?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3+"d" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV052"
  } ;

mkV053 : Str -> V ;
mkV053 base =
  case base of {
    base_1+base_2@?+"i"+base_3@?+"i"+base_4@?+"n" => lin V
      { s = base_1+base_2+"i"+base_3+"i"+base_4+"n" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"i"+base_4+"nidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+"i"+base_4+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+base_4+"adh" ;
        participle = base_1+base_2+"i"+base_3+"i"+base_4+"nte"
      };
    _ => error "Can't apply paradigm mkV053"
  } ;

mkV054 : Str -> V ;
mkV054 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV054"
  } ;

mkV055 : Str -> V ;
mkV055 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"ainn" ;
                        Pl => base_1+"h"+base_2+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"am" ;
                               Pl => base_1+base_2+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV055"
  } ;

mkV056 : Str -> V ;
mkV056 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"sinn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV056"
  } ;

mkV057 : Str -> V ;
mkV057 base =
  case base of {
    base_1+base_2@(?+?)+base_3@? => lin V
      { s = base_1+base_2+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV057"
  } ;

mkV058 : Str -> V ;
mkV058 base =
  case base of {
    base_1+base_2@?+"i"+base_3@?+base_4@(?+?+?+?) => lin V
      { s = base_1+base_2+"i"+base_3+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh"+base_4 ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+base_4 ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV058"
  } ;

mkV059 : Str -> V ;
mkV059 base =
  case base of {
    base_1+base_2@(?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ail" ;
        participle = base_1+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV059"
  } ;

mkV060 : Str -> V ;
mkV060 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV060"
  } ;

mkV061 : Str -> V ;
mkV061 base =
  case base of {
    base_1+base_2@?+"i"+base_3@?+"ic"+base_4@? => lin V
      { s = base_1+base_2+"i"+base_3+"ic"+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"ic"+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+"ic"+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"ad"+base_4 ;
        participle = base_1+base_2+"i"+base_3+"ic"+base_4+"te"
      };
    _ => error "Can't apply paradigm mkV061"
  } ;

mkV062 : Str -> V ;
mkV062 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?)+"c"+base_3@? => lin V
      { s = base_1+base_2+"c"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"c"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"c"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"d"+base_3 ;
        participle = base_1+base_2+"c"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV062"
  } ;

mkV063 : Str -> V ;
mkV063 base =
  case base of {
    base_1+"ù"+base_2@? => lin V
      { s = base_1+"ù"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"u"+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"hù"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"u"+base_2+"ail" ;
        participle = base_1+"u"+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV063"
  } ;

mkV064 : Str -> V ;
mkV064 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@(?+?)+"ic"+base_4@? => lin V
      { s = base_1+base_2+base_3+"ic"+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"a"+base_3+"ic"+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"ic"+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"d"+base_4 ;
        participle = base_1+base_2+"a"+base_3+"ic"+base_4+"te"
      };
    _ => error "Can't apply paradigm mkV064"
  } ;

mkV065 : Str -> V ;
mkV065 base =
  case base of {
    base_1@?+base_2+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"i"+base_3+"inn" ;
                        Pl => base_1+"h"+base_2+"i"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"i"+base_3+"eam" ;
                               Pl => base_1+base_2+"i"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"i"+base_3 ;
                               Pl => base_1+base_2+"i"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"i"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => base_1+base_2+"i"+base_3
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => base_1+"h"+base_2+"i"+base_3
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV065"
  } ;

mkV066 : Str -> V ;
mkV066 base =
  case base of {
    "dèa"+base_1 => lin V
      { s = "dèa"+base_1 ;
        conditional = table {
                        Sg => "dhèa"+base_1+"ainn" ;
                        Pl => "dhèa"+base_1+"adh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "dèa"+base_1+"am" ;
                               Pl => "dèa"+base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => "dèa"+base_1 ;
                               Pl => "dèa"+base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "dèa"+base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"ì" ;
                   Dep => "dèa"+base_1
                 } ;
        past = table {
                 Indep => "ri"+base_1+"n" ;
                 Dep => "ri"+base_1+"n"
               } ;
        noun = "dèa"+base_1+"amh" ;
        participle = "dèa"+base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV066"
  } ;

mkV067 : Str -> V ;
mkV067 base =
  case base of {
    base_1@?+base_2+base_3@?+"ir" => lin V
      { s = base_1+base_2+base_3+"ir" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"r"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"ir" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"r"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"irte"
      };
    _ => error "Can't apply paradigm mkV067"
  } ;

mkV068 : Str -> V ;
mkV068 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"il" => lin V
      { s = base_1+base_2+base_3+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"l"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"l"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"ilte"
      };
    _ => error "Can't apply paradigm mkV068"
  } ;

mkV069 : Str -> V ;
mkV069 base =
  case base of {
    base_1+base_2@(?+?)+"ic"+base_3@? => lin V
      { s = base_1+base_2+"ic"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"ic"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"ic"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ead"+base_3 ;
        participle = base_1+base_2+"ic"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV069"
  } ;

mkV070 : Str -> V ;
mkV070 base =
  case base of {
    base_1+base_2@?+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"e"
      };
    _ => error "Can't apply paradigm mkV070"
  } ;

mkV071 : Str -> V ;
mkV071 base =
  case base of {
    base_1+base_2@?+"il" => lin V
      { s = base_1+base_2+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"l"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"l" ;
        participle = base_1+base_2+"ilte"
      };
    _ => error "Can't apply paradigm mkV071"
  } ;

mkV072 : Str -> V ;
mkV072 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ì"+base_2+"eadh" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV072"
  } ;

mkV073 : Str -> V ;
mkV073 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"inn" ;
                        Pl => "dh'"+base_1+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"eam" ;
                               Pl => base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1+"eadh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV073"
  } ;

mkV074 : Str -> V ;
mkV074 base =
  case base of {
    base_1+"aich" => lin V
      { s = base_1+"aich" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aichidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"aich" ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV074"
  } ;

mkV075 : Str -> V ;
mkV075 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"sadh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV075"
  } ;

mkV076 : Str -> V ;
mkV076 base =
  case base of {
    "fai"+base_1 => lin V
      { s = "fai"+base_1 ;
        conditional = table {
                        Sg => base_1+"hithinn" ;
                        Pl => base_1+"hitheadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "fai"+base_1+"eam" ;
                               Pl => "fai"+base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => "fai"+base_1 ;
                               Pl => "fai"+base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "fai"+base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"hì" ;
                   Dep => "fhai"+base_1
                 } ;
        past = table {
                 Indep => base_1+"hunnaic" ;
                 Dep => "fha"+base_1+"a"
               } ;
        noun = "fai"+base_1+"inn" ;
        participle = "fai"+base_1+"te"
      };
    _ => error "Can't apply paradigm mkV076"
  } ;

mkV077 : Str -> V ;
mkV077 base =
  case base of {
    "fa"+base_1+"gh" => lin V
      { s = "fa"+base_1+"gh" ;
        conditional = table {
                        Sg => "ghe"+base_1+"bhinn" ;
                        Pl => "ghe"+base_1+"bheadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "fa"+base_1+"gheam" ;
                               Pl => "fa"+base_1+"gheamaid"
                             } ;
                       P2 => table {
                               Sg => "fa"+base_1+"gh" ;
                               Pl => "fa"+base_1+"ghibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "fa"+base_1+"gheadh"
                             }
                     } ;
        future = table {
                   Indep => "ghe"+base_1+"bh" ;
                   Dep => "fha"+base_1+"gh"
                 } ;
        past = table {
                 Indep => "fhua"+base_1+"r" ;
                 Dep => "fhua"+base_1+"r"
               } ;
        noun = "fa"+base_1+"ghinn" ;
        participle = "fa"+base_1+"ghte"
      };
    _ => error "Can't apply paradigm mkV077"
  } ;

mkV078 : Str -> V ;
mkV078 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3+"d" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV078"
  } ;

mkV079 : Str -> V ;
mkV079 base =
  case base of {
    base_1+base_2@(?+?)+"l"+base_3@? => lin V
      { s = base_1+base_2+"l"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"l"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"l"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"eadh" ;
        participle = base_1+base_2+"l"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV079"
  } ;

mkV080 : Str -> V ;
mkV080 base =
  case base of {
    base_1+base_2@(?+?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3+"dainn" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV080"
  } ;

mkV081 : Str -> V ;
mkV081 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV081"
  } ;

mkV082 : Str -> V ;
mkV082 base =
  case base of {
    base_1+base_2@(?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"tail" ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV082"
  } ;

mkV083 : Str -> V ;
mkV083 base =
  case base of {
    "fannaich" => lin V
      { s = "fannaich" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => "fannaichidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'fhannaich" ;
                 Dep => nonExist
               } ;
        noun = "fannachadh" ;
        participle = "te"
      };
    _ => error "Can't apply paradigm mkV083"
  } ;

mkV084 : Str -> V ;
mkV084 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV084"
  } ;

mkV085 : Str -> V ;
mkV085 base =
  case base of {
    base_1@?+base_2+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV085"
  } ;

mkV086 : Str -> V ;
mkV086 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV086"
  } ;

mkV087 : Str -> V ;
mkV087 base =
  case base of {
    base_1@?+base_2+"i"+base_3@("m"|(?+?)) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => "dh'"+base_1+"h"+base_2+"i"+base_3+"inn" ;
                        Pl => "dh'"+base_1+"h"+base_2+"i"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"i"+base_3+"eam" ;
                               Pl => base_1+base_2+"i"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"i"+base_3 ;
                               Pl => base_1+base_2+"i"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"i"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => base_1+"h"+base_2+"i"+base_3
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => "dh'"+base_1+"h"+base_2+"i"+base_3
               } ;
        noun = base_1+base_2+base_3 ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV087"
  } ;

mkV088 : Str -> V ;
mkV088 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => "dh'"+base_1+"h"+base_2+"ainn" ;
                        Pl => "dh'"+base_1+"h"+base_2+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"am" ;
                               Pl => base_1+base_2+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => "dh'"+base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"ail" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV088"
  } ;

mkV089 : Str -> V ;
mkV089 base =
  case base of {
    base_1+base_2@(?+?+?)+base_3@?+"inn" => lin V
      { s = base_1+base_2+base_3+"inn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"innidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+base_3+"inn" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"n"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"innte"
      };
    _ => error "Can't apply paradigm mkV089"
  } ;

mkV090 : Str -> V ;
mkV090 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eamh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV090"
  } ;

mkV091 : Str -> V ;
mkV091 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ainn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV091"
  } ;

mkV092 : Str -> V ;
mkV092 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"e" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV092"
  } ;

mkV093 : Str -> V ;
mkV093 base =
  case base of {
    base_1@?+base_2 => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => "dh'"+base_1+"h"+base_2+"inn" ;
                        Pl => "dh'"+base_1+"h"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ;
                               Pl => base_1+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => "dh'"+base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"eadh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV093"
  } ;

mkV094 : Str -> V ;
mkV094 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => base_1+"ainn" ;
                        Pl => base_1+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ;
                               Pl => base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => base_1
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV094"
  } ;

mkV095 : Str -> V ;
mkV095 base =
  case base of {
    base_1+"o"+base_2@(?+?)+base_3@?+"in" => lin V
      { s = base_1+"o"+base_2+base_3+"in" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"ò"+base_2+"n"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"ho"+base_2+base_3+"in" ;
                 Dep => nonExist
               } ;
        noun = base_1+"ò"+base_2+"n"+base_3+"dh" ;
        participle = base_1+"o"+base_2+base_3+"inte"
      };
    _ => error "Can't apply paradigm mkV095"
  } ;

mkV096 : Str -> V ;
mkV096 base =
  case base of {
    base_1+base_2@?+"i"+base_3@(?+?+?)+"i"+base_4@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3+"i"+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"i"+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3+"i"+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"i"+base_3+"ea"+base_4+"adh" ;
        participle = base_1+base_2+"i"+base_3+"i"+base_4+"te"
      };
    _ => error "Can't apply paradigm mkV096"
  } ;

mkV097 : Str -> V ;
mkV097 base =
  case base of {
    base_1+base_2@(?+?+?)+base_3@?+"il" => lin V
      { s = base_1+base_2+base_3+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"l"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+base_3+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"l"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"ilte"
      };
    _ => error "Can't apply paradigm mkV097"
  } ;

mkV098 : Str -> V ;
mkV098 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"i"+base_3@? => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"a"+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV098"
  } ;

mkV099 : Str -> V ;
mkV099 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"ei"+base_3@? => lin V
      { s = base_1+base_2+"ei"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"ei"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3 ;
        participle = base_1+base_2+"ei"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV099"
  } ;

mkV100 : Str -> V ;
mkV100 base =
  case base of {
    base_1+base_2@(?+?+?+?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => "dh'"+base_1+"h"+base_2+"i"+base_3+"inn" ;
                        Pl => "dh'"+base_1+"h"+base_2+"i"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"i"+base_3+"eam" ;
                               Pl => base_1+base_2+"i"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"i"+base_3 ;
                               Pl => base_1+base_2+"i"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"i"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"ni"+base_3+"idh" ;
                   Dep => base_1+"h"+base_2+"i"+base_3
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => "dh'"+base_1+"h"+base_2+"i"+base_3
               } ;
        noun = base_1+base_2+"ea"+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV100"
  } ;

mkV101 : Str -> V ;
mkV101 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"il" => lin V
      { s = base_1+base_2+base_3+"il" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"ilidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+base_3+"il" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"l"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"ilte"
      };
    _ => error "Can't apply paradigm mkV101"
  } ;

mkV102 : Str -> V ;
mkV102 base =
  case base of {
    base_1+base_2@?+"i"+base_3@?+"i"+base_4@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3+"i"+base_4 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"i"+base_4+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3+"i"+base_4 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"a"+base_4 ;
        participle = base_1+base_2+"i"+base_3+"i"+base_4+"te"
      };
    _ => error "Can't apply paradigm mkV102"
  } ;

mkV103 : Str -> V ;
mkV103 base =
  case base of {
    base_1+base_2@(?+?+?)+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3 ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV103"
  } ;

mkV104 : Str -> V ;
mkV104 base =
  case base of {
    base_1@?+base_2+"i"+base_3@(?+?) => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ea"+base_3+"adh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV104"
  } ;

mkV105 : Str -> V ;
mkV105 base =
  case base of {
    base_1+base_2@(?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV105"
  } ;

mkV106 : Str -> V ;
mkV106 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+"ir" => lin V
      { s = base_1+base_2+base_3+"ir" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"iridh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"h"+base_2+base_3+"ir" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"r"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"irte"
      };
    _ => error "Can't apply paradigm mkV106"
  } ;

mkV107 : Str -> V ;
mkV107 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ail" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV107"
  } ;

mkV108 : Str -> V ;
mkV108 base =
  case base of {
    base_1+base_2@?+"à"+base_3@(?+?) => lin V
      { s = base_1+base_2+"à"+base_3 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"à"+base_3+"inn" ;
                        Pl => base_1+"h"+base_2+"à"+base_3+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"à"+base_3+"eam" ;
                               Pl => base_1+base_2+"à"+base_3+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"à"+base_3 ;
                               Pl => base_1+base_2+"à"+base_3+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"à"+base_3+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"à"+base_3+"idh" ;
                   Dep => base_1+"h"+base_2+"à"+base_3
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"à"+base_3 ;
                 Dep => base_1+"h"+base_2+"à"+base_3
               } ;
        noun = base_1+base_2+"a"+base_3+"adh" ;
        participle = base_1+base_2+"à"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV108"
  } ;

mkV109 : Str -> V ;
mkV109 base =
  case base of {
    base_1+base_2@(?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"tinn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV109"
  } ;

mkV110 : Str -> V ;
mkV110 base =
  case base of {
    base_1+base_2@(?+?+?)+"i"+base_3@? => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"i"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"ad" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV110"
  } ;

mkV111 : Str -> V ;
mkV111 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"inn" ;
                        Pl => base_1+"h"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ;
                               Pl => base_1+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"e" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV111"
  } ;

mkV112 : Str -> V ;
mkV112 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eachdainn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV112"
  } ;

mkV113 : Str -> V ;
mkV113 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ;
                        Pl => "dh'"+base_1+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ;
                               Pl => base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1+"aidh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV113"
  } ;

mkV114 : Str -> V ;
mkV114 base =
  case base of {
    base_1+base_2@?+"h" => lin V
      { s = base_1+base_2+"h" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"haidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"h" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"hadh" ;
        participle = base_1+"dh"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV114"
  } ;

mkV115 : Str -> V ;
mkV115 base =
  case base of {
    base_1+base_2@?+"ir" => lin V
      { s = base_1+base_2+"ir" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"iridh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+base_2+"ir" ;
                 Dep => nonExist
               } ;
        noun = base_1+"r"+base_2+"dh" ;
        participle = base_1+base_2+"irte"
      };
    _ => error "Can't apply paradigm mkV115"
  } ;

mkV116 : Str -> V ;
mkV116 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"inn" ;
                        Pl => "dh'"+base_1+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"eam" ;
                               Pl => base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1+"e" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV116"
  } ;

mkV117 : Str -> V ;
mkV117 base =
  case base of {
    base_1+base_2@?+"ir" => lin V
      { s = base_1+base_2+"ir" ;
        conditional = table {
                        Sg => base_1+"r"+base_2+"inn" ;
                        Pl => base_1+"r"+base_2+"maid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"r"+base_2+"m" ;
                               Pl => base_1+"r"+base_2+"maid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2+"ir" ;
                               Pl => base_1+"r"+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"r"+base_2+"dh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"r"+base_2+"idh" ;
                   Dep => base_1+base_2+"ir"
                 } ;
        past = table {
                 Indep => base_1+base_2+"ir" ;
                 Dep => base_1+base_2+"ir"
               } ;
        noun = base_1+base_2+"irt" ;
        participle = base_1+base_2+"irte"
      };
    _ => error "Can't apply paradigm mkV117"
  } ;

mkV118 : Str -> V ;
mkV118 base =
  case base of {
    base_1+"i"+base_2@("l"|(?+?)) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV118"
  } ;

mkV119 : Str -> V ;
mkV119 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"e" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV119"
  } ;

mkV120 : Str -> V ;
mkV120 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"tainn" ;
        participle = base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV120"
  } ;

mkV121 : Str -> V ;
mkV121 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"eil" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV121"
  } ;

mkV122 : Str -> V ;
mkV122 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV122"
  } ;

mkV123 : Str -> V ;
mkV123 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV123"
  } ;

mkV124 : Str -> V ;
mkV124 base =
  case base of {
    base_1+"igh" => lin V
      { s = base_1+"igh" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"ighidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"igh" ;
                 Dep => nonExist
               } ;
        noun = base_1+"ì" ;
        participle = base_1+"ighte"
      };
    _ => error "Can't apply paradigm mkV124"
  } ;

mkV125 : Str -> V ;
mkV125 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ea"+base_2+"adh" ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV125"
  } ;

mkV126 : Str -> V ;
mkV126 base =
  case base of {
    base_1@(?+?+?)+"i"+base_2 => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV126"
  } ;

mkV127 : Str -> V ;
mkV127 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => base_1+"inn" ;
                        Pl => base_1+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"eam" ;
                               Pl => base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => base_1
               } ;
        noun = base_1+"eadh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV127"
  } ;

mkV128 : Str -> V ;
mkV128 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"i"+base_3@? => lin V
      { s = base_1+base_2+"i"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"eadh" ;
        participle = base_1+base_2+"i"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV128"
  } ;

mkV129 : Str -> V ;
mkV129 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV129"
  } ;

mkV130 : Str -> V ;
mkV130 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2 ;
        participle = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV130"
  } ;

mkV131 : Str -> V ;
mkV131 base =
  case base of {
    base_1+base_2@(?+?+?+?+?+?+?+?+?)+"d" => lin V
      { s = base_1+base_2+"d" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"daidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"d" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"dadh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV131"
  } ;

mkV132 : Str -> V ;
mkV132 base =
  case base of {
    base_1+"ì"+base_2@(?+?+?+?+?+?+?) => lin V
      { s = base_1+"ì"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"hì"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ì"+base_2+"adh" ;
        participle = base_1+"ì"+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV132"
  } ;

mkV133 : Str -> V ;
mkV133 base =
  case base of {
    base_1+"ì"+base_2@(?+?+?)+"ò"+base_3@(?+?) => lin V
      { s = base_1+"ì"+base_2+"ò"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"ò"+base_3+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"hì"+base_2+"ò"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ì"+base_2+"ò"+base_3+"adh" ;
        participle = base_1+"ì"+base_2+"o"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV133"
  } ;

mkV134 : Str -> V ;
mkV134 base =
  case base of {
    base_1@?+base_2+"i"+base_3@?+"n" => lin V
      { s = base_1+base_2+"i"+base_3+"n" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"i"+base_3+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"eadh" ;
        participle = base_1+base_2+"i"+base_3+"nte"
      };
    _ => error "Can't apply paradigm mkV134"
  } ;

mkV135 : Str -> V ;
mkV135 base =
  case base of {
    base_1+"dhèa"+base_2@? => lin V
      { s = base_1+"dhèa"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"ì" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"ri"+base_2+"n" ;
                 Dep => nonExist
               } ;
        noun = base_1+"dhèa"+base_2+"amh" ;
        participle = base_1+"dhèa"+base_2+"ta"
      };
    _ => error "Can't apply paradigm mkV135"
  } ;

mkV136 : Str -> V ;
mkV136 base =
  case base of {
    "n"+base_1+"ulaich" => lin V
      { s = "n"+base_1+"ulaich" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => "n"+base_1+"ulaichidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "n"+base_1+"ulaich" ;
                 Dep => nonExist
               } ;
        noun = "n"+base_1+"ulachadh" ;
        participle = "t"+base_1
      };
    _ => error "Can't apply paradigm mkV136"
  } ;

mkV137 : Str -> V ;
mkV137 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh’"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV137"
  } ;

mkV138 : Str -> V ;
mkV138 base =
  case base of {
    base_1+base_2@(?+?+?)+"t" => lin V
      { s = base_1+base_2+"t" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"daidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"t" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"tadh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV138"
  } ;

mkV139 : Str -> V ;
mkV139 base =
  case base of {
    base_1+base_2@(?+?+?+?)+"ig" => lin V
      { s = base_1+base_2+"ig" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"igidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+"ig" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eadh" ;
        participle = base_1+base_2+"igte"
      };
    _ => error "Can't apply paradigm mkV139"
  } ;

mkV140 : Str -> V ;
mkV140 base =
  case base of {
    "rach" => lin V
      { s = "rach" ;
        conditional = table {
                        Sg => "rachainn" ;
                        Pl => "rachadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "racham" ;
                               Pl => "rachamaid"
                             } ;
                       P2 => table {
                               Sg => "rach" ;
                               Pl => "rachaibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "rachadh"
                             }
                     } ;
        future = table {
                   Indep => "thèid" ;
                   Dep => "tèid"
                 } ;
        past = table {
                 Indep => "chaidh" ;
                 Dep => "deach"
               } ;
        noun = "dol" ;
        participle = "rachte"
      };
    _ => error "Can't apply paradigm mkV140"
  } ;

mkV141 : Str -> V ;
mkV141 base =
  case base of {
    base_1+"h" => lin V
      { s = base_1+"h" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"haidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h" ;
                 Dep => nonExist
               } ;
        noun = base_1+"hadh" ;
        participle = base_1+"a"
      };
    _ => error "Can't apply paradigm mkV141"
  } ;

mkV142 : Str -> V ;
mkV142 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"t" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV142"
  } ;

mkV143 : Str -> V ;
mkV143 base =
  case base of {
    base_1+"u"+base_2@(?+?) => lin V
      { s = base_1+"u"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"u"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"àin"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"u"+base_2+"sinn" ;
        participle = base_1+"u"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV143"
  } ;

mkV144 : Str -> V ;
mkV144 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ail" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV144"
  } ;

mkV145 : Str -> V ;
mkV145 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"a"
      };
    _ => error "Can't apply paradigm mkV145"
  } ;

mkV146 : Str -> V ;
mkV146 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"in" => lin V
      { s = base_1+base_2+base_3+"in" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"inidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"in" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"n"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"inte"
      };
    _ => error "Can't apply paradigm mkV146"
  } ;

mkV147 : Str -> V ;
mkV147 base =
  case base of {
    base_1+base_2@(?+?+?+?)+base_3@?+"inn" => lin V
      { s = base_1+base_2+base_3+"inn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"innidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"inn" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"n"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"innte"
      };
    _ => error "Can't apply paradigm mkV147"
  } ;

mkV148 : Str -> V ;
mkV148 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"amh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV148"
  } ;

mkV149 : Str -> V ;
mkV149 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ; --guessed
                        Pl => "dh'"+base_1+"amaid" --guessed
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ; --guessed
                               Pl => base_1+"aibh"
                             } ;
                       P2 => table {
                               Sg => base_1 ; --guessed
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh" --guessed
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ; --guessed
                   Dep => base_1 --guessed
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ; --guessed
                 Dep => "dh'"+base_1 --guessed
               } ;
        noun = base_1+"adh" ; --guessed
        participle = base_1+"te" --guessed
      };
    _ => error "Can't apply paradigm mkV149"
  } ;

mkV150 : Str -> V ;
mkV150 base =
  case base of {
    base_1+base_2@?+"g" => lin V
      { s = base_1+base_2+"g" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"gidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+base_2+"g" ;
                 Dep => nonExist
               } ;
        noun = base_1+"ga"+base_2+"l" ;
        participle = base_1+base_2+"gte"
      };
    _ => error "Can't apply paradigm mkV150"
  } ;

mkV151 : Str -> V ;
mkV151 base =
  case base of {
    base_1+"i"+base_2@?+"ic"+base_3@? => lin V
      { s = base_1+"i"+base_2+"ic"+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"ic"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"i"+base_2+"ic"+base_3 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"ad"+base_3 ;
        participle = base_1+"i"+base_2+"ic"+base_3+"te"
      };
    _ => error "Can't apply paradigm mkV151"
  } ;

mkV152 : Str -> V ;
mkV152 base =
  case base of {
    base_1+"à"+base_2@(?+?) => lin V
      { s = base_1+"à"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"a"+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"à"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"a"+base_2+"adh" ;
        participle = base_1+"a"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV152"
  } ;

mkV153 : Str -> V ;
mkV153 base =
  case base of {
    base_1+base_2@(?+?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"art" ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV153"
  } ;

mkV154 : Str -> V ;
mkV154 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"ainn" ;
                        Pl => base_1+"h"+base_2+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"am" ;
                               Pl => base_1+base_2+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"aidh" ;
                   Dep => base_1+"h"+base_2
                 } ;
        past = table {
                 Indep => base_1+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"adh" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV154"
  } ;

mkV155 : Str -> V ;
mkV155 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => base_1+"ainn" ;
                        Pl => base_1+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ;
                               Pl => base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh iad"
                             }
                     } ;
        future = table {
                   Indep => base_1 ;
                   Dep => base_1+"aidh"
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => base_1
               } ;
        noun = base_1+"adh" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV155"
  } ;

mkV156 : Str -> V ;
mkV156 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => base_1+"ibh"
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"thidh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1 ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV156"
  } ;

mkV157 : Str -> V ;
mkV157 base =
  case base of {
    base_1+base_2@(?+?)+base_3@?+"ir" => lin V
      { s = base_1+base_2+base_3+"ir" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+base_3+"iridh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"ir" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"r"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"irte"
      };
    _ => error "Can't apply paradigm mkV157"
  } ;

mkV158 : Str -> V ;
mkV158 base =
  case base of {
    "tabhair" => lin V
      { s = "tabhair" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => "bheir" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "thug" ;
                 Dep => nonExist
               } ;
        noun = "toirt" ;
        participle = "tugta"
      };
    _ => error "Can't apply paradigm mkV158"
  } ;

mkV159 : Str -> V ;
mkV159 base =
  case base of {
    base_1@?+base_2+base_3@(?+?)+"r" => lin V
      { s = base_1+base_2+base_3+"r" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"r"+base_3+"dh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"r" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+base_3+"rt" ;
        participle = base_1+base_2+base_3+"rte"
      };
    _ => error "Can't apply paradigm mkV159"
  } ;

mkV160 : Str -> V ;
mkV160 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"se" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV160"
  } ;

mkV161 : Str -> V ;
mkV161 base =
  case base of {
    base_1+"a"+base_2@?+"ra"+base_3@?+"ng" => lin V
      { s = base_1+"a"+base_2+"ra"+base_3+"ng" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"ài"+base_2+"n"+base_3+"dh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"ha"+base_2+"ra"+base_3+"ng" ;
                 Dep => nonExist
               } ;
        noun = base_1+"a"+base_2+"ra"+base_3+"ng" ;
        participle = base_1+"a"+base_2+"ra"+base_3+"ngte"
      };
    _ => error "Can't apply paradigm mkV161"
  } ;

mkV162 : Str -> V ;
mkV162 base =
  case base of {
    base_1+base_2@(?+?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => base_1+"h"+base_2+"inn" ;
                        Pl => base_1+"h"+base_2+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+base_2+"eam" ;
                               Pl => base_1+base_2+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1+base_2 ;
                               Pl => base_1+base_2+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+base_2+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => base_1+base_2
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => base_1+"h"+base_2
               } ;
        noun = base_1+base_2+"e" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV162"
  } ;

mkV163 : Str -> V ;
mkV163 base =
  case base of {
    base_1+"h"+base_2@(?+?) => lin V
      { s = base_1+"h"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"h"+base_2 ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"hàin"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"hinn" ;
        participle = base_1+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV163"
  } ;

mkV164 : Str -> V ;
mkV164 base =
  case base of {
    base_1+"h"+base_2@(?+?+?)+base_3@(?+?+?+?+?+?+?+?+?+?) => lin V
      { s = base_1+"h"+base_2+base_3 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => nonExist ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => nonExist ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"t"+base_3 ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV164"
  } ;

mkV165 : Str -> V ;
mkV165 base =
  case base of {
    "thoir" => lin V
      { s = "thoir" ;
        conditional = table {
                        Sg => "bheirinn" ;
                        Pl => "bheireadh"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => "thoiream" ;
                               Pl => "thoireamaid"
                             } ;
                       P2 => table {
                               Sg => "thoir" ;
                               Pl => "thoiribh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => "thoireadh"
                             }
                     } ;
        future = table {
                   Indep => "bheir" ;
                   Dep => "toir"
                 } ;
        past = table {
                 Indep => "thug" ;
                 Dep => "tug"
               } ;
        noun = "toirt" ;
        participle = "tugta"
      };
    _ => error "Can't apply paradigm mkV165"
  } ;

mkV166 : Str -> V ;
mkV166 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eil" ;
        participle = base_1+base_2+"the"
      };
    _ => error "Can't apply paradigm mkV166"
  } ;

mkV167 : Str -> V ;
mkV167 base =
  case base of {
    base_1+base_2@(?+?+?) => lin V
      { s = base_1+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"eam" ;
        participle = base_1+base_2+"e"
      };
    _ => error "Can't apply paradigm mkV167"
  } ;

mkV168 : Str -> V ;
mkV168 base =
  case base of {
    base_1+base_2@(?+?+?)+base_3@?+"inn" => lin V
      { s = base_1+base_2+base_3+"inn" ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+base_2+"n"+base_3+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => base_1+"h"+base_2+base_3+"inn" ;
                 Dep => nonExist
               } ;
        noun = base_1+base_2+"n"+base_3+"dh" ;
        participle = base_1+base_2+base_3+"inte"
      };
    _ => error "Can't apply paradigm mkV168"
  } ;

mkV169 : Str -> V ;
mkV169 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"a"+base_2 ;
        participle = nonExist
      };
    _ => error "Can't apply paradigm mkV169"
  } ;

mkV170 : Str -> V ;
mkV170 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ; --guessed
                        Pl => "dh'"+base_1+"amaid" --guessed
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ; --guessed
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P2 => table {
                               Sg => base_1 ; --guessed
                               Pl => base_1+"aibh" --guessed
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh" --guessed
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ; --guessed
                   Dep => base_1 --guessed
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1 --guessed
               } ;
        noun = base_1 ;
        participle = base_1+"te" --guessed
      };
    _ => error "Can't apply paradigm mkV170"
  } ;

mkV171 : Str -> V ;
mkV171 base =
  case base of {
    base_1+"i"+base_2@(?+?) => lin V
      { s = base_1+"i"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"i"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"i"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"ea"+base_2 ;
        participle = base_1+"i"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV171"
  } ;

mkV172 : Str -> V ;
mkV172 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => nonExist
               } ;
        noun = base_1+"eachd" ;
        participle = base_1+"te"
      };
    _ => error "Can't apply paradigm mkV172"
  } ;

mkV173 : Str -> V ;
mkV173 base =
  case base of {
    base_1+"c"+base_2@? => lin V
      { s = base_1+"c"+base_2 ;
        conditional = table {
                        Sg => nonExist ;
                        Pl => nonExist
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P2 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => nonExist
                             }
                     } ;
        future = table {
                   Indep => base_1+"c"+base_2+"idh" ;
                   Dep => nonExist
                 } ;
        past = table {
                 Indep => "dh'"+base_1+"c"+base_2 ;
                 Dep => nonExist
               } ;
        noun = base_1+"g"+base_2 ;
        participle = base_1+"c"+base_2+"te"
      };
    _ => error "Can't apply paradigm mkV173"
  } ;

mkV174 : Str -> V ;
mkV174 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"inn" ;
                        Pl => "dh'"+base_1+"eamaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"eam" ;
                               Pl => base_1+"eamaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"ibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"eadh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"idh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1+"eachd" ;
        participle = base_1+"e"
      };
    _ => error "Can't apply paradigm mkV174"
  } ;

mkV175 : Str -> V ;
mkV175 base =
  case base of {
    base_1 => lin V
      { s = base_1 ;
        conditional = table {
                        Sg => "dh'"+base_1+"ainn" ;
                        Pl => "dh'"+base_1+"amaid"
                      } ;
        imperative = table {
                       P1 => table {
                               Sg => base_1+"am" ;
                               Pl => base_1+"amaid"
                             } ;
                       P2 => table {
                               Sg => base_1 ;
                               Pl => base_1+"aibh"
                             } ;
                       P3 => table {
                               Sg => nonExist ;
                               Pl => base_1+"adh"
                             }
                     } ;
        future = table {
                   Indep => base_1+"aidh" ;
                   Dep => base_1
                 } ;
        past = table {
                 Indep => "dh'"+base_1 ;
                 Dep => "dh'"+base_1
               } ;
        noun = base_1 ;
        participle = base_1+"ta"
      };
    _ => error "Can't apply paradigm mkV175"
  } ;
}