
local function LevelLearnSpells( player )
	local Class_Warrior = 1
	local Class_Paladin = 2
	local Class_Hunter = 3
	local Class_Rogue = 4
	local Class_Priest = 5
	local Class_Deathknight = 6 
	local Class_Shaman = 7
	local Class_Mage = 8
	local Class_Warlock = 9
	local Class_Druid = 11

	local Shaman_Earth_Totem = 5175 --level 4 reward
	local Shaman_Fire_Totem = 5176 --level 10 reward
	local Shaman_Water_Totem = 5177 -- level 20 reward
	local Shaman_Air_Totem = 5178 -- level 30 reward
	local Shaman_All_Totem = 46978 -- level 30 reward
	
	local Level_Req = 1
	local Spell_ID = 2

	local spell_list = {}
	spell_list[Class_Warrior] = {{1, 6673}, {1, 107}, {1, 2764}, {1, 2457}, {1, 78}, {4, 100}, {4, 772}, {6, 3127}, {6, 6343}, {6, 34428}, {8, 1715}, {8, 284}, {10, 71}, {10, 7386}, {10, 355}, {10, 2687}, {10, 6546}, {12, 5242}, {12, 7384}, {12, 72}, {14, 1160}, {14, 6572}, {16, 285}, {16, 694}, {16, 2565}, {18, 676}, {18, 8198}, {20, 674}, {20, 845}, {20, 6547}, {20, 20230}, {20, 12678}, {22, 6192}, {22, 5246}, {24, 6190}, {24, 5308}, {24, 1608}, {24, 6574}, {26, 1161}, {26, 6178}, {28, 871}, {28, 8204}, {30, 7369}, {30, 20252}, {30, 6548}, {30, 1464}, {30, 2458}, {32, 11549}, {32, 18499}, {32, 20658}, {32, 11564}, {34, 11554}, {34, 7379}, {36, 1680}, {38, 6552}, {38, 8820}, {38, 8205}, {40, 11608}, {40, 20660}, {40, 11565}, {40, 11572}, {40, 23922}, {40, 750}, {42, 11550}, {44, 11555}, {44, 11600}, {46, 11578}, {46, 11604}, {48, 20661}, {48, 11566}, {48, 21551}, {48, 23923}, {48, 11580}, {50, 11609}, {50, 1719}, {50, 11573}, {52, 11551}, {54, 11556}, {54, 21552}, {54, 11601}, {54, 23924}, {54, 11605}, {56, 20662}, {56, 11567}, {58, 11581}, {60, 25289}, {60, 20569}, {60, 30016}, {60, 25286}, {60, 21553}, {60, 11574}, {60, 25288}, {60, 23925}, {61, 25241}, {62, 25202}, {63, 25269}, {64, 23920}, {65, 25234}, {66, 29707}, {66, 25248}, {66, 25258}, {67, 25264}, {68, 25231}, {68, 469}, {68, 25208}, {69, 2048}, {69, 25242}, {70, 25203}, {70, 30022}, {70, 25236}, {70, 30324}, {70, 3411}, {70, 30330}, {70, 30357}, {70, 30356}, {71, 46845}, {71, 64382}, {72, 47519}, {72, 47449}, {73, 47470}, {73, 47501}, {74, 47439}, {74, 47474}, {75, 47497}, {75, 55694}, {75, 47485}, {75, 47487}, {76, 47450}, {76, 47465}, {77, 47520}, {78, 47436}, {78, 47502}, {79, 47437}, {79, 47475}, {80, 47440}, {80, 47498}, {80, 47471}, {80, 57755}, {80, 47486}, {80, 57823}, {80, 47488}}
	spell_list[Class_Paladin] = {{1, 465}, {1, 21084}, {1, 635}, {4, 19740}, {4, 20271}, {6, 498}, {6, 639}, {8, 3127}, {8, 853}, {8, 1152}, {10, 10290}, {10, 1022}, {10, 633}, {12, 7328}, {12, 19834}, {12, 53408}, {14, 19742}, {14, 647}, {14, 31789}, {16, 62124}, {16, 7294}, {16, 25780}, {18, 1044}, {20, 13819}, {20, 20217}, {20, 26573}, {20, 643}, {20, 879}, {20, 19750}, {20, 5502}, {22, 19835}, {22, 19746}, {22, 1026}, {22, 20164}, {24, 19850}, {24, 5588}, {24, 5599}, {24, 10322}, {24, 10326}, {26, 19939}, {26, 1038}, {26, 10298}, {28, 5614}, {28, 53407}, {28, 19876}, {30, 20116}, {30, 10291}, {30, 19752}, {30, 1042}, {30, 2800}, {30, 20165}, {32, 19836}, {32, 19888}, {34, 19852}, {34, 642}, {34, 19940}, {36, 5615}, {36, 19891}, {36, 10324}, {36, 10299}, {38, 10278}, {38, 3472}, {38, 20166}, {40, 23214}, {40, 750}, {40, 20922}, {40, 1032}, {40, 5589}, {40, 19895}, {42, 19837}, {42, 4987}, {42, 19941}, {44, 19853}, {44, 10312}, {44, 19897}, {44, 24275}, {46, 6940}, {46, 10328}, {46, 10300}, {48, 19899}, {48, 20929}, {48, 20772}, {50, 20923}, {50, 10292}, {50, 19942}, {50, 20927}, {50, 2812}, {50, 10310}, {52, 19838}, {52, 10313}, {52, 25782}, {52, 24274}, {52, 19896}, {54, 19854}, {54, 25894}, {54, 10308}, {54, 10329}, {56, 19898}, {56, 20930}, {56, 10301}, {58, 19943}, {60, 32699}, {60, 25291}, {60, 25290}, {60, 20924}, {60, 10293}, {60, 10314}, {60, 19900}, {60, 25898}, {60, 25916}, {60, 25899}, {60, 25918}, {60, 24239}, {60, 25292}, {60, 20928}, {60, 10318}, {60, 20773}, {62, 32223}, {62, 27135}, {63, 27151}, {64, 27174}, {64, 31801}, {65, 27142}, {65, 27143}, {66, 27137}, {66, 27150}, {66, 53736}, {68, 27138}, {68, 27152}, {68, 27180}, {69, 27139}, {69, 27154}, {70, 32700}, {70, 31884}, {70, 27140}, {70, 27173}, {70, 27149}, {70, 27153}, {70, 27141}, {70, 27136}, {70, 27179}, {70, 33072}, {71, 48935}, {71, 54428}, {71, 48937}, {72, 48816}, {72, 48949}, {73, 48931}, {73, 48800}, {73, 48933}, {74, 48941}, {74, 48784}, {74, 48805}, {75, 48826}, {75, 48818}, {75, 48781}, {75, 48951}, {75, 48824}, {75, 53600}, {76, 54043}, {76, 48943}, {77, 48936}, {77, 48945}, {77, 48938}, {78, 48947}, {78, 48817}, {78, 48788}, {79, 48932}, {79, 48942}, {79, 48801}, {79, 48785}, {79, 48934}, {79, 48950}, {80, 48827}, {80, 48819}, {80, 48806}, {80, 48782}, {80, 48952}, {80, 48825}, {80, 53601}, {80, 61411}}
	spell_list[Class_Hunter] = {{1, 75}, {1, 1494}, {1, 2973}, {4, 13163}, {4, 1978}, {6, 3044}, {6, 1130}, {8, 3127}, {8, 5116}, {8, 14260}, {10, 13165}, {10, 13549}, {10, 19883}, {10, 883}, {10, 2641}, {10, 6991}, {10, 982}, {10, 1515}, {12, 14281}, {12, 20736}, {12, 136}, {12, 2974}, {14, 6197}, {14, 1002}, {14, 1513}, {16, 5118}, {16, 13795}, {16, 1495}, {16, 14261}, {18, 14318}, {18, 2643}, {18, 13550}, {18, 19884}, {20, 14282}, {20, 34074}, {20, 674}, {20, 781}, {20, 1499}, {20, 3111}, {22, 14323}, {22, 3043}, {24, 1462}, {24, 14262}, {24, 19885}, {26, 14302}, {26, 3045}, {26, 13551}, {26, 19880}, {28, 20900}, {28, 14283}, {28, 14319}, {28, 13809}, {28, 3661}, {30, 13161}, {30, 5384}, {30, 14269}, {30, 14288}, {30, 14326}, {32, 1543}, {32, 14263}, {32, 19878}, {34, 13813}, {34, 13552}, {36, 20901}, {36, 14284}, {36, 14303}, {36, 3662}, {36, 3034}, {38, 14320}, {40, 8737}, {40, 13159}, {40, 14310}, {40, 14324}, {40, 14264}, {40, 19882}, {40, 1510}, {42, 20909}, {42, 14289}, {42, 13553}, {44, 20902}, {44, 14285}, {44, 14316}, {44, 13542}, {44, 14270}, {46, 20043}, {46, 14304}, {46, 14327}, {48, 14321}, {48, 14265}, {50, 13554}, {50, 56641}, {50, 19879}, {50, 14294}, {50, 24132}, {52, 20903}, {52, 14286}, {52, 13543}, {54, 20910}, {54, 14317}, {54, 14290}, {56, 20190}, {56, 14305}, {56, 14266}, {57, 63668}, {58, 14322}, {58, 14325}, {58, 14271}, {58, 13555}, {58, 14295}, {60, 20904}, {60, 14287}, {60, 25296}, {60, 19263}, {60, 14311}, {60, 13544}, {60, 25294}, {60, 25295}, {60, 19801}, {60, 24133}, {61, 27025}, {62, 34120}, {63, 63669}, {63, 27014}, {65, 27023}, {66, 27067}, {66, 34026}, {67, 27021}, {67, 27016}, {67, 27022}, {68, 27044}, {68, 27045}, {68, 27046}, {68, 34600}, {69, 27019}, {69, 63670}, {70, 27065}, {70, 60051}, {70, 34477}, {70, 36916}, {70, 27068}, {71, 49066}, {71, 53351}, {71, 48995}, {71, 49051}, {72, 48998}, {72, 49055}, {73, 49044}, {73, 49000}, {74, 61846}, {74, 48989}, {74, 49047}, {74, 58431}, {75, 49049}, {75, 63671}, {75, 60052}, {75, 61005}, {75, 53271}, {75, 49011}, {76, 49071}, {76, 53338}, {77, 49067}, {77, 48996}, {77, 49052}, {78, 48999}, {78, 49056}, {79, 49045}, {79, 49001}, {80, 49050}, {80, 61847}, {80, 63672}, {80, 62757}, {80, 60053}, {80, 60192}, {80, 61006}, {80, 48990}, {80, 53339}, {80, 49048}, {80, 58434}, {80, 49012}}
	spell_list[Class_Rogue] = {{1, 1752}, {1, 2098}, {1, 674}, {1, 1784}, {4, 53}, {4, 921}, {6, 1776}, {6, 1757}, {8, 5277}, {8, 6760}, {10, 6770}, {10, 5171}, {10, 2983}, {12, 3127}, {12, 2589}, {12, 1766}, {14, 8647}, {14, 703}, {14, 1758}, {16, 6761}, {16, 1966}, {18, 8676}, {20, 2590}, {20, 51722}, {20, 1943}, {22, 1725}, {22, 8631}, {22, 1759}, {22, 1856}, {24, 2836}, {24, 6762}, {24, 1804}, {26, 8724}, {26, 1833}, {28, 2591}, {28, 6768}, {28, 8639}, {28, 2070}, {30, 1842}, {30, 8632}, {30, 408}, {30, 1760}, {32, 8623}, {34, 8725}, {34, 2094}, {34, 8696}, {36, 8721}, {36, 8640}, {38, 8633}, {38, 8621}, {40, 8624}, {40, 8637}, {40, 1860}, {42, 11267}, {42, 6774}, {42, 1857}, {44, 11279}, {44, 11273}, {46, 11289}, {46, 17347}, {46, 11293}, {48, 11299}, {48, 11297}, {50, 11268}, {50, 26669}, {50, 8643}, {50, 34411}, {52, 11280}, {52, 11303}, {52, 11274}, {54, 11290}, {54, 11294}, {56, 11300}, {58, 11269}, {58, 17348}, {58, 11305}, {60, 11281}, {60, 25300}, {60, 31016}, {60, 25302}, {60, 34412}, {60, 11275}, {61, 26839}, {62, 32645}, {62, 26861}, {62, 26889}, {64, 26679}, {64, 26865}, {64, 27448}, {66, 27441}, {66, 31224}, {68, 26863}, {68, 26867}, {69, 32684}, {70, 48689}, {70, 48673}, {70, 26884}, {70, 26864}, {70, 34413}, {70, 5938}, {70, 26862}, {71, 51724}, {72, 48658}, {73, 48667}, {74, 48656}, {74, 57992}, {74, 48671}, {75, 48690}, {75, 48675}, {75, 48663}, {75, 57934}, {76, 48674}, {76, 48637}, {78, 48659}, {79, 48668}, {79, 48672}, {80, 48691}, {80, 48657}, {80, 57993}, {80, 51723}, {80, 48676}, {80, 48660}, {80, 48666}, {80, 48638}}
	spell_list[Class_Priest] = {{1, 5019}, {1, 1243}, {1, 585}, {1, 2050}, {4, 2052}, {4, 589}, {6, 17}, {6, 591}, {8, 586}, {8, 139}, {10, 2053}, {10, 8092}, {10, 2006}, {10, 594}, {12, 588}, {12, 1244}, {12, 592}, {14, 528}, {14, 8122}, {14, 6074}, {14, 598}, {16, 2054}, {16, 8102}, {18, 527}, {18, 600}, {18, 970}, {20, 2944}, {20, 6346}, {20, 2061}, {20, 14914}, {20, 15237}, {20, 7128}, {20, 453}, {20, 6075}, {20, 9484}, {22, 2055}, {22, 8103}, {22, 2096}, {22, 2010}, {22, 984}, {24, 15262}, {24, 8129}, {24, 1245}, {24, 3747}, {26, 19238}, {26, 9472}, {26, 6076}, {26, 992}, {28, 19276}, {28, 6063}, {28, 15430}, {28, 8104}, {28, 17311}, {28, 8124}, {30, 14752}, {30, 15263}, {30, 602}, {30, 605}, {30, 6065}, {30, 596}, {30, 976}, {30, 1004}, {32, 552}, {32, 9473}, {32, 6077}, {34, 19240}, {34, 6064}, {34, 1706}, {34, 8105}, {34, 10880}, {34, 2767}, {36, 19277}, {36, 988}, {36, 15264}, {36, 15431}, {36, 17312}, {36, 2791}, {36, 6066}, {38, 9474}, {38, 6078}, {38, 6060}, {40, 14818}, {40, 2060}, {40, 1006}, {40, 8106}, {40, 996}, {40, 9485}, {42, 19241}, {42, 15265}, {42, 10898}, {42, 10888}, {42, 10957}, {42, 10892}, {44, 19278}, {44, 10915}, {44, 27799}, {44, 17313}, {44, 10909}, {44, 10927}, {46, 10963}, {46, 10945}, {46, 10881}, {46, 10933}, {48, 15266}, {48, 10937}, {48, 10899}, {48, 21562}, {50, 19242}, {50, 14819}, {50, 10916}, {50, 10951}, {50, 27870}, {50, 10960}, {50, 10928}, {50, 10893}, {52, 19279}, {52, 10964}, {52, 27800}, {52, 10946}, {52, 17314}, {54, 15267}, {54, 10900}, {54, 10934}, {56, 34863}, {56, 10917}, {56, 27683}, {56, 10890}, {56, 10929}, {56, 10958}, {58, 19243}, {58, 10965}, {58, 10947}, {58, 20770}, {58, 10894}, {60, 34864}, {60, 19280}, {60, 27841}, {60, 25314}, {60, 15261}, {60, 27801}, {60, 10952}, {60, 27871}, {60, 18807}, {60, 10938}, {60, 10901}, {60, 21564}, {60, 10961}, {60, 25316}, {60, 27681}, {60, 25315}, {60, 10955}, {60, 34916}, {61, 25233}, {61, 25363}, {62, 32379}, {63, 25210}, {63, 25372}, {64, 32546}, {65, 34865}, {65, 25217}, {65, 25221}, {65, 25367}, {66, 25437}, {66, 25384}, {66, 34433}, {67, 25235}, {68, 25467}, {68, 25213}, {68, 25331}, {68, 25387}, {68, 25308}, {68, 33076}, {68, 25435}, {68, 25433}, {69, 25431}, {69, 25375}, {69, 25364}, {70, 34866}, {70, 25312}, {70, 28275}, {70, 32375}, {70, 53005}, {70, 25389}, {70, 25218}, {70, 25392}, {70, 39374}, {70, 32999}, {70, 25222}, {70, 32996}, {70, 25368}, {70, 34917}, {71, 48040}, {72, 48119}, {72, 48134}, {73, 48172}, {73, 48299}, {73, 48070}, {73, 48062}, {74, 48126}, {74, 48155}, {74, 48112}, {74, 48122}, {75, 48088}, {75, 48077}, {75, 48086}, {75, 48045}, {75, 53006}, {75, 48065}, {75, 48067}, {75, 48157}, {75, 48124}, {75, 48159}, {76, 48072}, {76, 48169}, {77, 48168}, {77, 48170}, {78, 48120}, {78, 48063}, {78, 48135}, {78, 48171}, {79, 48300}, {79, 48071}, {79, 48127}, {79, 48113}, {79, 48123}, {80, 48089}, {80, 48173}, {80, 64843}, {80, 48073}, {80, 48078}, {80, 64901}, {80, 48087}, {80, 48156}, {80, 53023}, {80, 53007}, {80, 48161}, {80, 48066}, {80, 48162}, {80, 48074}, {80, 48068}, {80, 48158}, {80, 48125}, {80, 48160}}
	spell_list[Class_Deathknight] = {{55, 49576}, {55, 45477}, {55, 45462}, {55, 45902}, {55, 47541}, {55, 674}, {55, 3127}, {55, 49410}, {55, 48266}, {55, 59921}, {55, 61455}, {55, 59879}, {61, 49896}, {67, 49903}, {73, 49904}, {78, 49909}, {60, 49917}, {65, 49918}, {70, 49919}, {75, 49920}, {80, 49921}, {59, 49926}, {64, 49927}, {59, 49928}, {74, 49929}, {80, 49930}, {55, 53341}, {60, 53331}, {55, 53343}, {57, 54447}, {57, 53342}, {63, 54446}, {63, 53323}, {70, 53344}, {72, 70164}, {72, 62158}, {56, 55050}, {59, 55258}, {64, 55259}, {69, 55260}, {74, 55261}, {80, 55262}, {65, 57330}, {75, 57623}, {56, 49143}, {60, 51416}, {65, 51417}, {70, 51418}, {75, 51419}, {80, 55268}, {56, 49184}, {70, 51409}, {75, 51410}, {80, 51411}, {56, 49158}, {60, 51325}, {70, 51326}, {75, 51327}, {80, 51328}, {58, 55090}, {67, 55265}, {73, 55270}, {79, 55271}, {56, 50842}, {56, 49998}, {63, 49999}, {70, 45463}, {75, 49923}, {80, 49924}, {56, 46584}, {57, 48263}, {57, 47528}, {58, 48721}, {66, 49939}, {72, 49940}, {78, 49941}, {58, 45524}, {59, 47476}, {60, 43265}, {67, 49936}, {73, 49937}, {80, 49938}, {61, 49020}, {67, 51423}, {73, 51424}, {79, 51425}, {61, 3714}, {62, 48792}, {62, 49892}, {68, 49893}, {76, 49894}, {80, 49895}, {64, 45529}, {65, 56222}, {66, 48743}, {67, 56815}, {68, 48707}, {70, 48265}, {72, 61999}, {75, 47568}, {80, 42650}, {56, 48778}, {56, 53428}}
	spell_list[Class_Shaman] = {{1, 8017}, {1, 107}, {1, 403}, {1, 331}, {4, 8071}, {4, 8042}, {6, 2484}, {6, 332}, {8, 8044}, {8, 529}, {8, 324}, {8, 8018}, {8, 5730}, {10, 8050}, {10, 8024}, {10, 8075}, {10, 3599}, {12, 2008}, {12, 1535}, {12, 547}, {12, 370}, {14, 8045}, {14, 548}, {14, 8154}, {16, 526}, {16, 2645}, {16, 325}, {16, 8019}, {16, 57994}, {18, 8052}, {18, 8027}, {18, 913}, {18, 6390}, {18, 8143}, {20, 5394}, {20, 8056}, {20, 8033}, {20, 8004}, {20, 915}, {20, 6363}, {20, 52127}, {22, 8498}, {22, 131}, {24, 20609}, {24, 8046}, {24, 8181}, {24, 939}, {24, 905}, {24, 10399}, {24, 8155}, {24, 8160}, {26, 6196}, {26, 8030}, {26, 943}, {26, 8190}, {26, 5675}, {28, 8184}, {28, 8053}, {28, 8227}, {28, 8038}, {28, 8008}, {28, 6391}, {28, 52129}, {28, 546}, {30, 556}, {30, 66842}, {30, 51730}, {30, 8177}, {30, 6375}, {30, 10595}, {30, 20608}, {30, 6364}, {30, 36936}, {30, 8232}, {32, 421}, {32, 8499}, {32, 959}, {32, 6041}, {32, 945}, {32, 8012}, {32, 8512}, {34, 8058}, {34, 6495}, {34, 10406}, {34, 52131}, {36, 20610}, {36, 10412}, {36, 16339}, {36, 8010}, {36, 10585}, {36, 10495}, {38, 8170}, {38, 8249}, {38, 10478}, {38, 10456}, {38, 10391}, {38, 6392}, {38, 8161}, {40, 66843}, {40, 1064}, {40, 930}, {40, 51988}, {40, 10447}, {40, 6377}, {40, 8005}, {40, 8134}, {40, 6365}, {40, 8235}, {40, 8737}, {41, 52134}, {42, 11314}, {42, 10537}, {44, 10466}, {44, 10392}, {44, 10600}, {44, 10407}, {46, 10622}, {46, 16341}, {46, 10472}, {46, 10586}, {46, 10496}, {48, 20776}, {48, 2860}, {48, 10413}, {48, 10526}, {48, 16355}, {48, 10395}, {48, 10431}, {48, 10427}, {48, 52136}, {50, 66844}, {50, 51991}, {50, 10462}, {50, 15207}, {50, 10437}, {50, 10486}, {52, 11315}, {52, 10448}, {52, 10467}, {52, 10442}, {54, 10623}, {54, 10479}, {54, 10408}, {55, 52138}, {56, 10605}, {56, 16342}, {56, 10396}, {56, 15208}, {56, 10432}, {56, 10587}, {56, 10497}, {58, 10538}, {58, 16387}, {58, 10473}, {58, 16356}, {58, 10428}, {60, 20777}, {60, 32593}, {60, 10414}, {60, 51992}, {60, 29228}, {60, 10463}, {60, 25357}, {60, 10468}, {60, 10601}, {60, 10438}, {60, 25361}, {60, 57720}, {60, 16362}, {61, 25422}, {61, 25546}, {62, 25448}, {62, 24398}, {63, 25439}, {63, 25391}, {63, 25469}, {63, 25508}, {64, 25489}, {64, 3738}, {65, 25552}, {65, 25570}, {65, 25528}, {66, 2062}, {66, 25500}, {66, 25420}, {67, 25557}, {67, 25560}, {67, 25449}, {67, 25525}, {68, 25423}, {68, 2894}, {68, 25563}, {68, 25464}, {68, 25505}, {69, 25590}, {69, 25454}, {69, 25567}, {69, 25574}, {69, 25533}, {69, 33736}, {70, 2825}, {70, 25442}, {70, 32594}, {70, 51993}, {70, 25547}, {70, 25457}, {70, 25396}, {70, 32182}, {70, 25472}, {70, 61299}, {70, 25509}, {70, 59156}, {70, 57721}, {71, 58649}, {71, 58785}, {71, 58794}, {71, 58755}, {71, 58771}, {71, 58699}, {71, 58580}, {71, 58801}, {72, 49275}, {73, 49235}, {73, 49237}, {73, 58731}, {73, 58751}, {74, 55458}, {74, 49270}, {74, 49230}, {75, 49283}, {75, 61649}, {75, 58737}, {75, 49232}, {75, 58652}, {75, 58741}, {75, 49272}, {75, 51505}, {75, 49280}, {75, 58746}, {75, 61300}, {75, 58703}, {75, 58581}, {75, 57622}, {75, 59158}, {76, 58789}, {76, 58795}, {76, 58756}, {76, 58773}, {76, 57960}, {76, 58803}, {77, 49276}, {78, 49236}, {78, 58734}, {78, 58582}, {78, 58753}, {79, 49231}, {79, 49238}, {80, 49277}, {80, 55459}, {80, 49271}, {80, 49284}, {80, 51994}, {80, 61657}, {80, 58739}, {80, 49233}, {80, 58656}, {80, 58790}, {80, 58745}, {80, 58796}, {80, 58757}, {80, 49273}, {80, 51514}, {80, 60043}, {80, 49281}, {80, 58774}, {80, 58749}, {80, 61301}, {80, 58704}, {80, 58643}, {80, 59159}, {80, 57722}, {80, 58804}}
	spell_list[Class_Mage] = {{1, 5019}, {1, 1459}, {1, 133}, {1, 168}, {4, 116}, {4, 5504}, {6, 2136}, {6, 143}, {6, 587}, {8, 5143}, {8, 205}, {8, 118}, {10, 7300}, {10, 122}, {10, 5505}, {12, 604}, {12, 145}, {12, 130}, {12, 597}, {14, 1449}, {14, 1460}, {14, 2137}, {14, 837}, {16, 5144}, {16, 2120}, {18, 1008}, {18, 3140}, {18, 475}, {20, 1953}, {20, 10}, {20, 12051}, {20, 543}, {20, 7301}, {20, 7322}, {20, 1463}, {20, 12824}, {20, 5506}, {22, 8437}, {22, 2138}, {22, 6143}, {22, 2948}, {22, 990}, {24, 5145}, {24, 2139}, {24, 8450}, {24, 8400}, {24, 2121}, {24, 12505}, {26, 120}, {26, 865}, {26, 8406}, {28, 1461}, {28, 6141}, {28, 8494}, {28, 8444}, {28, 759}, {30, 8455}, {30, 8438}, {30, 8412}, {30, 8457}, {30, 8401}, {30, 7302}, {30, 45438}, {30, 12522}, {30, 6127}, {32, 8416}, {32, 8422}, {32, 8461}, {32, 8407}, {32, 6129}, {34, 8492}, {34, 6117}, {34, 8445}, {36, 13018}, {36, 8427}, {36, 8451}, {36, 8402}, {36, 8495}, {36, 12523}, {38, 8439}, {38, 8413}, {38, 8408}, {38, 3552}, {40, 8417}, {40, 8458}, {40, 8423}, {40, 6131}, {40, 7320}, {40, 12825}, {40, 8446}, {40, 10138}, {42, 10169}, {42, 10156}, {42, 10159}, {42, 10148}, {42, 8462}, {42, 12524}, {42, 10144}, {44, 13019}, {44, 10185}, {44, 10179}, {44, 10191}, {46, 10201}, {46, 10197}, {46, 13031}, {46, 22782}, {46, 10205}, {48, 10211}, {48, 10173}, {48, 10149}, {48, 10215}, {48, 12525}, {48, 10053}, {50, 10160}, {50, 10223}, {50, 10180}, {50, 10219}, {50, 10139}, {52, 13020}, {52, 10186}, {52, 10177}, {52, 13032}, {52, 10192}, {52, 10206}, {52, 10145}, {54, 10170}, {54, 10202}, {54, 10199}, {54, 10150}, {54, 10230}, {54, 12526}, {56, 23028}, {56, 10157}, {56, 10212}, {56, 33041}, {56, 10216}, {56, 10181}, {58, 10161}, {58, 13033}, {58, 22783}, {58, 10207}, {58, 10054}, {60, 25345}, {60, 13021}, {60, 10187}, {60, 10174}, {60, 10225}, {60, 10151}, {60, 25306}, {60, 28609}, {60, 25304}, {60, 10220}, {60, 10193}, {60, 12826}, {60, 18809}, {60, 28612}, {60, 10140}, {61, 27078}, {62, 27080}, {62, 30482}, {63, 27130}, {63, 27075}, {63, 27071}, {64, 30451}, {64, 33042}, {64, 27086}, {64, 27134}, {65, 27133}, {65, 27087}, {65, 27073}, {65, 37420}, {66, 27070}, {66, 30455}, {66, 27132}, {67, 33944}, {67, 27088}, {68, 27085}, {68, 66}, {68, 27131}, {68, 27101}, {69, 33946}, {69, 38699}, {69, 27128}, {69, 27072}, {69, 27124}, {69, 27125}, {70, 44780}, {70, 27127}, {70, 27082}, {70, 27126}, {70, 38704}, {70, 33933}, {70, 33043}, {70, 27079}, {70, 38692}, {70, 32796}, {70, 38697}, {70, 33405}, {70, 55359}, {70, 33938}, {70, 43987}, {70, 27074}, {70, 30449}, {70, 33717}, {70, 27090}, {71, 42894}, {71, 43023}, {71, 43045}, {72, 42930}, {72, 42925}, {72, 42913}, {73, 43019}, {73, 42890}, {73, 42858}, {74, 42939}, {74, 42872}, {74, 42832}, {75, 42843}, {75, 42944}, {75, 42949}, {75, 42917}, {75, 42841}, {75, 44614}, {75, 43038}, {75, 42955}, {76, 42896}, {76, 42920}, {76, 43015}, {77, 43017}, {77, 42891}, {77, 42985}, {78, 43010}, {78, 42833}, {78, 42914}, {78, 42859}, {79, 42846}, {79, 42931}, {79, 42926}, {79, 43012}, {79, 42842}, {79, 43008}, {79, 43024}, {79, 43020}, {79, 43046}, {80, 44781}, {80, 42897}, {80, 43002}, {80, 42921}, {80, 42995}, {80, 42945}, {80, 42940}, {80, 42950}, {80, 42873}, {80, 47610}, {80, 43039}, {80, 55360}, {80, 55342}, {80, 58659}, {80, 42956}, }
	spell_list[Class_Warlock] = {{1, 5019}, {1, 348}, {1, 686}, {1, 688}, {1, 687}, {4, 172}, {4, 702}, {6, 1454}, {6, 695}, {8, 980}, {8, 5782}, {10, 697}, {10, 6201}, {10, 696}, {10, 707}, {10, 1120}, {12, 1108}, {12, 755}, {12, 705}, {14, 6222}, {14, 689}, {16, 1455}, {16, 5697}, {18, 1014}, {18, 5676}, {18, 693}, {20, 712}, {20, 706}, {20, 3698}, {20, 1094}, {20, 5740}, {20, 698}, {20, 1088}, {22, 6202}, {22, 6205}, {22, 699}, {22, 126}, {24, 6223}, {24, 5138}, {24, 5500}, {24, 18867}, {24, 8288}, {26, 1714}, {26, 132}, {26, 1456}, {26, 17919}, {28, 710}, {28, 6217}, {28, 3699}, {28, 1106}, {28, 6366}, {30, 691}, {30, 1086}, {30, 709}, {30, 1098}, {30, 1949}, {30, 2941}, {30, 20752}, {32, 1490}, {32, 7646}, {32, 6213}, {32, 6229}, {32, 18868}, {34, 7648}, {34, 5699}, {34, 6219}, {34, 17920}, {36, 3700}, {36, 11687}, {36, 7641}, {36, 17951}, {36, 2362}, {38, 11711}, {38, 7651}, {38, 8289}, {20, 5784}, {40, 11733}, {40, 5484}, {40, 11665}, {40, 18869}, {40, 20755}, {42, 11707}, {42, 6789}, {42, 11683}, {42, 17921}, {42, 11739}, {44, 11671}, {44, 11725}, {44, 11693}, {44, 11659}, {46, 11729}, {46, 11721}, {46, 11699}, {46, 11688}, {46, 11677}, {46, 17952}, {48, 18647}, {48, 11712}, {48, 18870}, {48, 6353}, {48, 17727}, {50, 1122}, {50, 11719}, {50, 18937}, {50, 17925}, {50, 11734}, {50, 11667}, {50, 17922}, {50, 20756}, {52, 11708}, {52, 11694}, {52, 11660}, {52, 11740}, {52, 11675}, {54, 11672}, {54, 11700}, {54, 11684}, {54, 17928}, {56, 6215}, {56, 11689}, {56, 18871}, {56, 17924}, {56, 17953}, {58, 11730}, {58, 11713}, {58, 17926}, {58, 11726}, {58, 11678}, {58, 17923}, {60, 23161}, {60, 18540}, {60, 25311}, {60, 603}, {60, 11722}, {60, 18938}, {60, 11735}, {60, 11695}, {60, 11668}, {60, 25309}, {60, 11661}, {60, 25307}, {60, 28610}, {60, 30413}, {60, 30404}, {60, 20757}, {60, 17728}, {61, 27224}, {62, 27219}, {62, 28176}, {63, 27263}, {64, 29722}, {64, 27211}, {65, 27216}, {65, 27210}, {66, 29858}, {66, 27250}, {66, 28172}, {67, 27218}, {67, 27259}, {67, 27217}, {68, 27230}, {68, 27223}, {68, 27213}, {68, 27222}, {68, 29893}, {69, 27228}, {69, 30909}, {69, 27220}, {69, 28189}, {69, 27215}, {69, 27212}, {69, 27209}, {70, 59170}, {70, 30910}, {70, 27265}, {70, 27260}, {70, 59161}, {70, 32231}, {70, 30459}, {70, 27243}, {70, 30546}, {70, 30414}, {70, 30545}, {70, 30405}, {70, 27238}, {71, 47812}, {71, 50511}, {72, 61191}, {72, 47819}, {72, 47890}, {72, 47886}, {73, 47871}, {73, 47863}, {73, 47859}, {74, 47892}, {74, 47837}, {74, 47814}, {74, 47808}, {74, 60219}, {75, 59171}, {75, 59163}, {75, 47810}, {75, 47835}, {75, 47826}, {75, 47897}, {75, 47846}, {75, 47824}, {75, 47841}, {76, 47793}, {76, 47856}, {76, 47884}, {77, 47813}, {77, 47855}, {78, 47865}, {78, 47860}, {78, 47857}, {78, 47823}, {78, 47891}, {78, 47888}, {79, 47878}, {79, 47864}, {79, 47893}, {79, 47820}, {79, 47815}, {79, 47809}, {80, 59172}, {80, 47867}, {80, 59092}, {80, 47889}, {80, 48018}, {80, 48020}, {80, 59164}, {80, 47811}, {80, 47838}, {80, 57946}, {80, 58887}, {80, 47836}, {80, 47827}, {80, 61290}, {80, 47847}, {80, 47825}, {80, 47843}, {80, 60220}}
	spell_list[Class_Druid] = {{1, 1126}, {1, 5176}, {1, 5185}, {4, 8921}, {4, 774}, {6, 467}, {6, 5177}, {8, 339}, {8, 5186}, {10, 99}, {10, 5232}, {10, 8924}, {10, 16689}, {10, 1058}, {12, 5229}, {12, 8936}, {12, 50769}, {14, 8946}, {14, 5211}, {14, 5187}, {14, 782},{14, 5178}, {16, 1066},{16, 8925},{16, 1430},{16, 779},{16, 783},{18, 1062},{18, 770},{18, 16857},{18, 2637},{18, 6808},{18, 16810},{18, 8938},{20, 768},{20, 1082},{20, 1735},{20, 5188},{20, 6756},{20, 5215},{20, 20484},{20, 1079},{20, 2912},{22, 8926},{22, 2090},{22, 5221},{22, 2908},{22, 5179},{24, 1822},{24, 8939},{24, 2782},{24, 50768},{24, 780},{24, 1075},{24, 5217},{26, 2893},{26, 1850},{26, 5189},{26, 6809},{26, 8949},{28, 5209},{28, 3029},{28, 8998},{28, 5195},{28, 8927},{28, 16811},{28, 2091},{28, 9492},{30, 6798},{30, 24974},{30, 5234},{30, 20739},{30, 8940},{30, 6800},{30, 740},{30, 5180},{32, 9490},{32, 22568},{32, 6778},{32, 6785},{32, 5225},{34, 8972},{34, 8928},{34, 1823},{34, 3627},{34, 8950},{34, 769},{34, 8914},{36, 22842},{36, 9005},{36, 8941},{36, 50767},{36, 9493},{36, 6793},{38, 5201},{38, 5196},{38, 8903},{38, 18657},{38, 16812},{38, 8992},{38, 8955},{38, 6780},{40, 9000},{40, 9634},{40, 20719},{40, 22827},{40, 16914},{40, 29166},{40, 24975},{40, 8907},{40, 8929},{40, 20742},{40, 8910},{40, 62600},{40, 8918},{42, 9747},{42, 9745},{42, 6787},{42, 9750},{42, 8951},{44, 22812},{44, 9758},{44, 1824},{44, 9752},{44, 9754},{44, 9756},{46, 8983},{46, 9821},{46, 9833},{46, 9823},{46, 9839},{46, 9829},{46, 8905},{48, 9849},{48, 9852},{48, 22828},{48, 16813},{48, 9856},{48, 50766},{48, 9845},{50, 21849},{50, 9888},{50, 17401},{50, 24976},{50, 9884},{50, 9880},{50, 9866},{50, 20747},{50, 9875},{50, 9862},{52, 9892},{52, 9898},{52, 9834},{52, 9840},{52, 9894},{54, 9904},{54, 9857},{54, 9830},{54, 9901},{54, 9908},{54, 9910},{54, 9912},{56, 22829},{56, 9889},{56, 9827},{58, 9850},{58, 9853},{58, 18658},{58, 33986},{58, 33982},{58, 9881},{58, 9835},{58, 17329},{58, 9867},{58, 9841},{58, 9876},{60, 31709},{60, 31018},{60, 33943},{60, 21850},{60, 25297},{60, 17402},{60, 24977},{60, 9885},{60, 20748},{60, 9858},{60, 25299},{60, 50765},{60, 9896},{60, 25298},{60, 9846},{60, 9863},{60, 53223},{61, 27001},{61, 26984},{62, 26998},{62, 26978},{62, 22570},{63, 24248},{63, 26987},{63, 26981},{64, 33763},{64, 27003},{64, 26997},{64, 26992},{65, 33357},{65, 26980},{66, 33745},{66, 27006},{66, 27005},{67, 27000},{67, 26996},{67, 27008},{67, 26986},{68, 26989},{68, 33987},{68, 33983},{68, 27009},{69, 27004},{69, 26979},{69, 26994},{69, 26982},{69, 50764},{69, 26985},{70, 33786},{70, 26991},{70, 27012},{70, 27013},{70, 26990},{70, 26988},{70, 27002},{70, 26995},{70, 53199},{70, 40120},{70, 26983},{70, 53225},{70, 53248},{71, 48559},{71, 48442},{71, 49799},{71, 62078},{71, 50212},{72, 48576},{72, 48450},{72, 48573},{72, 48464},{72, 48561},{73, 48569},{73, 48567},{73, 48479},{73, 48578},{74, 48377},{74, 49802},{74, 53307},{74, 48459},{75, 48563},{75, 48565},{75, 48462},{75, 48440},{75, 52610},{75, 48571},{75, 53200},{75, 48446},{75, 53226},{75, 53249},{76, 48575},{77, 48560},{77, 49803},{77, 48443},{77, 48562},{78, 53308},{78, 48577},{78, 53312},{78, 48574},{78, 48465},{79, 48570},{79, 48378},{79, 48480},{79, 48579},{79, 48477},{79, 50213},{79, 48461},{80, 48470},{80, 48467},{80, 48468},{80, 48568},{80, 48451},{80, 48564},{80, 48566},{80, 48469},{80, 48463},{80, 50464},{80, 48441},{80, 50763},{80, 49800},{80, 48572},{80, 53201},{80, 48447},{80, 61384},{80, 53251}}

	mage_portals_alliance = {{35, 49360}, {40, 32266}, {40, 11416}, {40, 10059}, {50, 11419}, {65, 33691}, {74, 53142}, {20, 32271}, {20, 3562}, {20, 3561}, {30, 3565}, {35, 49359}, {60, 33690}, {71, 53140}}
	mage_portals_horde = {{35, 49361}, {40, 11417}, {40, 32267}, {40, 11418}, {50, 11420}, {65, 35717}, {74, 53142}, {20, 3567}, {20, 32272}, {20, 3563}, {30, 3566}, {35, 49358}, {60, 35715}, {71, 53140}}


	-- scan through each spell, confirm if it is valid for level and learn it if the player doesn't know it and is above it's required level
	for key, spell in ipairs(spell_list[player:GetClass()]) do
		if spell[Level_Req] <= player:GetLevel() and not player:HasSpell( spell[Spell_ID] ) then
			player:LearnSpell( spell[Spell_ID] )
		end
	end
	
	-- Give Shaman's their totems
	if player:GetClass() == Class_Shaman then
		if player:GetLevel() == 4 then 
			GivePlayerItem(player, Shaman_Earth_Totem)
		elseif player:GetLevel() == 10 then 
			GivePlayerItem(player, Shaman_Fire_Totem)
		elseif player:GetLevel() == 20 then 
			GivePlayerItem(player, Shaman_Water_Totem)
		elseif player:GetLevel() == 30 then 
			GivePlayerItem(player, Shaman_Air_Totem)
			GivePlayerItem(player, Shaman_All_Totem)
		end
	end
	
	-- Give Mage's their portals
	if player:GetClass() == Class_Mage then
		if	player:IsHorde() then
			for key, spell in ipairs(mage_portals_horde) do
				if spell[Level_Req] <= player:GetLevel() and not player:HasSpell( spell[Spell_ID] ) then
					player:LearnSpell( spell[Spell_ID] )
				end
			end
		end
		if	player:IsAlliance() then
			for key, spell in ipairs(mage_portals_alliance) do
				if spell[Level_Req] <= player:GetLevel() and not player:HasSpell( spell[Spell_ID] ) then
					player:LearnSpell( spell[Spell_ID] )
				end
			end
		end
	end
end

local function GivePlayerItem(player, item)
	-- Add item to player's inventory, and if inventory is full mail it to them.
	if player:AddItem( item ) == nil then 
		SendMail( "Lost Item", "Your inventory was full so this item was mailed to you.", player:GetGUIDLow(), player:GetGUIDLow(), 41, 0, 0, 0, item , 1)
	end 
end

local function OnLevelUpTrigger(event, player, oldLevel)
	LevelLearnSpells(player)
end

RegisterPlayerEvent(13, OnLevelUpTrigger) --PLAYER_EVENT_ON_LEVEL_CHANGE =     13,       // (event, player, oldLevel)