import 'package:epl_predictor/src/models/leagues_of_interest.dart';

// this class allows for the creation of a list of objects of leagues of
//interest without cluttering the main code.
class ListofLeagues {
  static List<LeaguesOfInterest> leagues = [
    LeaguesOfInterest(
        leagueId: '2',
        leagueName: 'UEFA Champions League',
        season: '2021',
        country: 'Europe'),
    LeaguesOfInterest(
        leagueId: '525',
        leagueName: 'UEFA Champions League Women',
        season: '2021',
        country: 'Europe'),
    LeaguesOfInterest(
        leagueId: '3',
        leagueName: 'UEFA Europa League',
        season: '2021',
        country: 'Europe'),
    LeaguesOfInterest(
        leagueId: '39',
        leagueName: 'English Premier League',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '40',
        leagueName: 'England Championship',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '41',
        leagueName: 'England League One',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '42',
        leagueName: 'England League Two',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '702',
        leagueName: 'England Premier League 2 Division One',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '703',
        leagueName: 'England Development League',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '45',
        leagueName: 'FA Cup',
        season: '2021',
        country: 'England'),
    LeaguesOfInterest(
        leagueId: '311',
        leagueName: '1st Division',
        season: '2021',
        country: 'Albania'),
    LeaguesOfInterest(
        leagueId: '310',
        leagueName: 'Super Liga',
        season: '2021',
        country: 'Albania'),
    LeaguesOfInterest(
        leagueId: '512',
        leagueName: 'Second Division - Group A',
        season: '2021',
        country: 'Albania'),
    LeaguesOfInterest(
        leagueId: '513',
        leagueName: 'Second Division - Group B',
        season: '2021',
        country: 'Albania'),
    LeaguesOfInterest(
        leagueId: '186',
        leagueName: 'Algeria Ligue 1',
        season: '2021',
        country: 'Algeria'),
    LeaguesOfInterest(
        leagueId: '187',
        leagueName: 'Algeria Ligue 2',
        season: '2021',
        country: 'Algeria'),
    // LeaguesOfInterest(
    //     leagueId: '397',
    //     leagueName: 'Angola Girabola',
    //     season: '2021',
    //     country: 'Angola'),
    // LeaguesOfInterest(
    //     leagueId: '483', leagueName: 'Argentina Copa de Supaliga'),
    LeaguesOfInterest(
        leagueId: '219',
        leagueName: 'Austria Erste Liga',
        season: '2021',
        country: 'Austria'),
    LeaguesOfInterest(
        leagueId: '188',
        leagueName: 'Australian A-League',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '190',
        leagueName: 'Australian W-League',
        season: '2021',
        country: 'Australia'),
    //LeaguesOfInterest(leagueId: '190', leagueName: 'Australian W-League'),
    LeaguesOfInterest(
        leagueId: '481',
        leagueName: 'Northern Australia NSW NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '482',
        leagueName: 'Queensland NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '191',
        leagueName: 'Brisbane Premier League',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '192',
        leagueName: 'New South Wales NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '194',
        leagueName: 'South Australia NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '195',
        leagueName: 'Victoria NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '196',
        leagueName: 'Western Australia NPL',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '189',
        leagueName: 'National Premier Leagues',
        season: '2021',
        country: 'Australia'),
    LeaguesOfInterest(
        leagueId: '648',
        leagueName: 'Tasmania NPL',
        season: '2021',
        country: 'Australia'),
    //LeaguesOfInterest(leagueId: '116', leagueName: 'Belarus Vysshaya League'),
    LeaguesOfInterest(
        leagueId: '116',
        leagueName: 'Belarus - Vysshaya League',
        season: '2021',
        country: 'Belarus'),
    LeaguesOfInterest(
        leagueId: '144',
        leagueName: 'Belgian Pro League',
        season: '2021',
        country: 'Belgium'),
    LeaguesOfInterest(
        leagueId: '145',
        leagueName: 'Belgian Tweede Klasse',
        season: '2021',
        country: 'Belgium'),
    //LeaguesOfInterest(leagueId: '478', leagueName: 'Brazil - Gaucho 2'),
    LeaguesOfInterest(
        leagueId: '172',
        leagueName: 'Bulgaria A PFG',
        season: '2021',
        country: 'Bulgaria'),
    LeaguesOfInterest(
        leagueId: '173',
        leagueName: 'Bulgaria B PFG',
        season: '2021',
        country: 'Bulgaria'),
    //LeaguesOfInterest(leagueId: '239', leagueName: 'Colombia Primera A'),
    LeaguesOfInterest(
        leagueId: '143',
        leagueName: 'Copa Del Rey',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '210',
        leagueName: 'Croatia 1.HNL',
        season: '2021',
        country: 'Croatia'),
    LeaguesOfInterest(
        leagueId: '266',
        leagueName: 'Primera B, Torneo Transicion',
        season: '2021',
        country: 'Chile'),
    LeaguesOfInterest(
        leagueId: '211',
        leagueName: 'Croatia 2.HNL',
        season: '2021',
        country: 'Croatia'),
    LeaguesOfInterest(
        leagueId: '318',
        leagueName: 'Cyprus 1st Division',
        season: '2021',
        country: 'Cyprus'),
    LeaguesOfInterest(
        leagueId: '319',
        leagueName: 'Cyprus 2nd Division',
        season: '2021',
        country: 'Cyprus'),
    LeaguesOfInterest(
        leagueId: '345',
        leagueName: 'Czech Liga 1',
        season: '2021',
        country: 'Czech Republic'),
    LeaguesOfInterest(
        leagueId: '346',
        leagueName: 'Czech FNL',
        season: '2021',
        country: 'Czech Republic'),
    LeaguesOfInterest(
        leagueId: '119',
        leagueName: 'Danish Superligaen',
        season: '2021',
        country: 'Denmark'),
    LeaguesOfInterest(
        leagueId: '120',
        leagueName: 'Danish 1st Division',
        season: '2021',
        country: 'Denmark'),
    LeaguesOfInterest(
        leagueId: '122',
        leagueName: 'Danish 2nd Division - Group 1',
        season: '2021',
        country: 'Denmark'),
    //LeaguesOfInterest(leagueId: '357', leagueName: 'Irish Premier League'),
    LeaguesOfInterest(
        leagueId: '363',
        leagueName: 'Premier League',
        season: '2021',
        country: 'Ethiopia'),
    LeaguesOfInterest(
        leagueId: '233',
        leagueName: 'Premier League',
        season: '2021',
        country: 'Egypt'),
    LeaguesOfInterest(
        leagueId: '61',
        leagueName: 'French Ligue 1',
        season: '2021',
        country: 'France'),
    LeaguesOfInterest(
        leagueId: '62',
        leagueName: 'French Ligue 2',
        season: '2021',
        country: 'France'),
    LeaguesOfInterest(
        leagueId: '63',
        leagueName: 'French National League',
        season: '2021',
        country: 'France'),
    LeaguesOfInterest(
        leagueId: '64',
        leagueName: 'French Division 1 Women',
        season: '2021',
        country: 'France'),
    LeaguesOfInterest(
        leagueId: '78',
        leagueName: 'German Bundesliga 1',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '79',
        leagueName: 'German Bundesliga 2',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '80',
        leagueName: 'German 3rd Liga',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '81',
        leagueName: 'German DFB Pokal',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '82',
        leagueName: 'German Women Bundesliga',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '87',
        leagueName: 'German Amateur - Regionalliga West',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '84',
        leagueName: 'German Amateur - Regionalliga Nord',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '85',
        leagueName: 'German Amateur - Regionalliga Nordorst',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '86',
        leagueName: 'German Amateur - Regionalliga SudWest',
        season: '2021',
        country: 'Germany'),
    LeaguesOfInterest(
        leagueId: '197',
        leagueName: 'Super League',
        season: '2021',
        country: 'Greece'),
    LeaguesOfInterest(
        leagueId: '494',
        leagueName: 'Super League - 2',
        season: '2021',
        country: 'Greece'),
    LeaguesOfInterest(
        leagueId: '271',
        leagueName: 'Hungary NB I',
        season: '2021',
        country: 'Hungary'),
    LeaguesOfInterest(
        leagueId: '272',
        leagueName: 'Hungary NB II',
        season: '2021',
        country: 'Hungary'),
    LeaguesOfInterest(
        leagueId: '323',
        leagueName: 'Indian Super League',
        season: '2021',
        country: 'India'),
    LeaguesOfInterest(
        leagueId: '324',
        leagueName: 'I-League',
        season: '2021',
        country: 'India'),
    LeaguesOfInterest(
        leagueId: '717',
        leagueName: 'I-League 2nd Div',
        season: '2021',
        country: 'India'),
    LeaguesOfInterest(
        leagueId: '382',
        leagueName: 'Israeli National League',
        season: '2021',
        country: 'Israel'),
    LeaguesOfInterest(
        leagueId: '135',
        leagueName: 'Italian Serie A',
        season: '2021',
        country: 'Italy'),
    LeaguesOfInterest(
        leagueId: '136',
        leagueName: 'Italian Serie B',
        season: '2021',
        country: 'Italy'),
    LeaguesOfInterest(
        leagueId: '705',
        leagueName: 'Italian Campionato Primavera - 1',
        season: '2021',
        country: 'Italy'),
    LeaguesOfInterest(
        leagueId: '706',
        leagueName: 'Italian Campionato Primavera - 2',
        season: '2021',
        country: 'Italy'),
    //LeaguesOfInterest(leagueId: '291', leagueName: 'Iran Azadegan League'),
    //LeaguesOfInterest(leagueId: '98', leagueName: 'Japan J-League'),
    LeaguesOfInterest(
        leagueId: '389',
        leagueName: 'Kazakhstan Premier League',
        season: '2021',
        country: 'Kazakhstan'),
    LeaguesOfInterest(
        leagueId: '98',
        leagueName: 'J-League Div 1',
        season: '2022',
        country: 'Japan'),
    LeaguesOfInterest(
        leagueId: '276',
        leagueName: 'Kenya Premier League',
        season: '2021',
        country: 'Kenya'),
    LeaguesOfInterest(
        leagueId: '330',
        leagueName: 'Kuwait League',
        season: '2021',
        country: 'Kuwait'),
    LeaguesOfInterest(
        leagueId: '371',
        leagueName: 'Macedonia - 1.MFL',
        season: '2021',
        country: 'Macedonia'),
    LeaguesOfInterest(
        leagueId: '279',
        leagueName: 'Malasyian Premier League',
        season: '2021',
        country: 'Malasyia'),
    LeaguesOfInterest(
        leagueId: '722',
        leagueName: 'Mexican Liga Primera Serie A',
        season: '2021',
        country: 'Mexico'),
    LeaguesOfInterest(
        leagueId: '262',
        leagueName: 'Mexican Liga MX',
        season: '2021',
        country: 'Mexico'),
    LeaguesOfInterest(
        leagueId: '673',
        leagueName: 'Mexican Liga MX Women',
        season: '2021',
        country: 'Mexico'),
    LeaguesOfInterest(
        leagueId: '355',
        leagueName: 'First League',
        season: '2021',
        country: 'Montenegro'),
    LeaguesOfInterest(
        leagueId: '356',
        leagueName: 'Second League',
        season: '2021',
        country: 'Montenegro'),
    LeaguesOfInterest(
        leagueId: '201',
        leagueName: 'Morocco Botola 2',
        season: '2021',
        country: 'Morocco'),
    LeaguesOfInterest(
        leagueId: '91',
        leagueName: 'Netherlands Eredivise Women',
        season: '2021',
        country: 'Netherlands'),
    LeaguesOfInterest(
        leagueId: '88',
        leagueName: 'Netherlands Eredivise',
        season: '2021',
        country: 'Netherlands'),
    LeaguesOfInterest(
        leagueId: '89',
        leagueName: 'Netherlands Eerste Divisie',
        season: '2021',
        country: 'Netherlands'),
    LeaguesOfInterest(
        leagueId: '492',
        leagueName: 'Netherlands Tweede Divisie',
        season: '2021',
        country: 'Netherlands'),
    //leagueId: '399', leagueName: 'Nigeria Professional Football League'),
    // LeaguesOfInterest(
    //     leagueId: '357', leagueName: 'Northern Ireland Premiership'),
    LeaguesOfInterest(
        leagueId: '106',
        leagueName: 'Polish Ekstraklasa',
        season: '2021',
        country: 'Poland'),
    LeaguesOfInterest(
        leagueId: '107',
        leagueName: 'Polish I Liga',
        season: '2021',
        country: 'Poland'),
    LeaguesOfInterest(
        leagueId: '107',
        leagueName: 'Polish II Liga - East',
        season: '2021',
        country: 'Poland'),
    LeaguesOfInterest(
        leagueId: '780',
        leagueName: 'Polish III Liga',
        season: '2021',
        country: 'Poland'),
    LeaguesOfInterest(
        leagueId: '94',
        leagueName: 'Portuguese Primera Liga',
        season: '2021',
        country: 'Portugal'),
    LeaguesOfInterest(
        leagueId: '283',
        leagueName: 'Romania Liga I',
        season: '2021',
        country: 'Romania'),
    LeaguesOfInterest(
        leagueId: '284',
        leagueName: 'Romania Liga II',
        season: '2021',
        country: 'Romania'),
    LeaguesOfInterest(
        leagueId: '235',
        leagueName: 'Russia Premier League',
        season: '2021',
        country: 'Russia'),
    LeaguesOfInterest(
        leagueId: '650',
        leagueName: 'Russia PFL - Center',
        season: '2021',
        country: 'Russia'),
    LeaguesOfInterest(
        leagueId: '651',
        leagueName: 'Russia PFL - South',
        season: '2021',
        country: 'Russia'),
    LeaguesOfInterest(
        leagueId: '652',
        leagueName: 'Russia PFL - West',
        season: '2021',
        country: 'Russia'),
    LeaguesOfInterest(
        leagueId: '653',
        leagueName: 'Russia PFL - Ural-Povolzhye',
        season: '2021',
        country: 'Russia'),
    LeaguesOfInterest(
        leagueId: '405',
        leagueName: 'Rwanda National League',
        season: '2021',
        country: 'Rwanda'),
    LeaguesOfInterest(
        leagueId: '307',
        leagueName: 'Saudi Pro-League',
        season: '2021',
        country: 'Saudi Arabia'),
    LeaguesOfInterest(
        leagueId: '308',
        leagueName: 'Saudi Division-1',
        season: '2021',
        country: 'Saudi Arabia'),
    LeaguesOfInterest(
        leagueId: '288',
        leagueName: 'SA Premier League',
        season: '2021',
        country: 'South Africa'),
    LeaguesOfInterest(
        leagueId: '180',
        leagueName: 'Scotland Championship',
        season: '2021',
        country: 'Scotland'),
    LeaguesOfInterest(
        leagueId: '183',
        leagueName: 'Scotland League One',
        season: '2021',
        country: 'Scotland'),
    LeaguesOfInterest(
        leagueId: '184',
        leagueName: 'Scotland League Two',
        season: '2021',
        country: 'Scotland'),
    LeaguesOfInterest(
        leagueId: '286',
        leagueName: 'Serbia Super Liga',
        season: '2021',
        country: 'Serbia'),
    LeaguesOfInterest(
        leagueId: '287',
        leagueName: 'Serbia Prva Liga',
        season: '2021',
        country: 'Serbia'),
    LeaguesOfInterest(
        leagueId: '140',
        leagueName: 'Spanish Primera Division',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '141',
        leagueName: 'Spanish Segunda Division',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '435',
        leagueName: 'Spanish Segunda B - Group 1',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '436',
        leagueName: 'Spanish Segunda B - Group 2',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '437',
        leagueName: 'Spanish Segunda B - Group 3',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '438',
        leagueName: 'Spanish Segunda B - Group 4',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '439',
        leagueName: 'Spanish Segunda B - Group 5',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '439',
        leagueName: 'Spanish Tercera Division - Grp 1',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '440',
        leagueName: 'Spanish Tercera Division - Grp 2',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '441',
        leagueName: 'Spanish Tercera Division - Grp 3',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '442',
        leagueName: 'Spanish Tercera Division - Grp 4',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '443',
        leagueName: 'Spanish Tercera Division - Grp 5',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '444',
        leagueName: 'Spanish Tercera Division - Grp 6',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '445',
        leagueName: 'Spanish Tercera Division - Grp 7',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '446',
        leagueName: 'Spanish Tercera Division - Grp 8',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '447',
        leagueName: 'Spanish Tercera Division - Grp 9',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '448',
        leagueName: 'Spanish Tercera Division - Grp 10',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '449',
        leagueName: 'Spanish Tercera Division - Grp 11',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '450',
        leagueName: 'Spanish Tercera Division - Grp 12',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '451',
        leagueName: 'Spanish Tercera Division - Grp 13',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '452',
        leagueName: 'Spanish Tercera Division - Grp 14',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '453',
        leagueName: 'Spanish Tercera Division - Grp 15',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '454',
        leagueName: 'Spanish Tercera Division - Grp 16',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '455',
        leagueName: 'Spanish Tercera Division - Grp 17',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '456',
        leagueName: 'Spanish Tercera Division - Grp 18',
        season: '2021',
        country: 'Spain'),
    LeaguesOfInterest(
        leagueId: '208',
        leagueName: 'Switzerland Challenge League',
        season: '2021',
        country: 'Switzerland'),
    LeaguesOfInterest(
        leagueId: '207',
        leagueName: 'Switzerland Super League',
        season: '2021',
        country: 'Switzerland'),
    LeaguesOfInterest(
        leagueId: '510',
        leagueName: 'Switzerland Promotion League',
        season: '2021',
        country: 'Switzerland'),
    LeaguesOfInterest(
        leagueId: '567',
        leagueName: 'Tanzania Ligi Kuu Bara',
        season: '2021',
        country: 'Tanzania'),
    LeaguesOfInterest(
        leagueId: '202',
        leagueName: 'Tunisia Ligue Professionalle 1',
        season: '2021',
        country: 'Tunisia'),
    LeaguesOfInterest(
        leagueId: '828',
        leagueName: 'Tunisia Ligue 2',
        season: '2021',
        country: 'Tunisia'),
    LeaguesOfInterest(
        leagueId: '203',
        leagueName: 'Super League',
        season: '2021',
        country: 'Turkey'),
    LeaguesOfInterest(
        leagueId: '204',
        leagueName: 'Turkey TFF 1.Lig',
        season: '2021',
        country: 'Turkey'),
    LeaguesOfInterest(
        leagueId: '205',
        leagueName: 'Turkey TFF 2.Lig',
        season: '2021',
        country: 'Turkey'),
    LeaguesOfInterest(
        leagueId: '554',
        leagueName: 'Turkey 3.Lig-Grp 3',
        season: '2021',
        country: 'Turkey'),
    LeaguesOfInterest(
        leagueId: '585',
        leagueName: 'Uganda Premier League',
        season: '2021',
        country: 'Uganda'),
    LeaguesOfInterest(
        leagueId: '334',
        leagueName: 'Ukraine Persha Liga',
        season: '2021',
        country: 'Ukraine'),
    LeaguesOfInterest(
        leagueId: '270',
        leagueName: 'Uruguay Primera Clasura',
        season: '2021',
        country: 'Uruguay'),
    LeaguesOfInterest(
        leagueId: '255',
        leagueName: 'USL Championship',
        season: '2021',
        country: 'USA'),
    LeaguesOfInterest(
        leagueId: '400',
        leagueName: 'ZM Super League',
        season: '2021',
        country: 'Zambia'),
    //LeaguesOfInterest(leagueId: '340', leagueName: 'Vietnam V-League 1'),
  ];
}

// One league in the multilevel list displayed by this app
class League {
  // const League(this.title, [this.children = const <LeaguesOfInterest>[]]);
  const League(this.title, [this.children = const <League>[]]);
  final String title;
  final List<League> children;
}

//   static List<LeaguesOfInterest> leagues = [
//     LeaguesOfInterest(
//         leagueId: '2', leagueName: 'UEFA Champions League', season: '2021', country: 'Europe'),

// Data to display

List<League> data = <League>[
  League('England', <League>[
    League('League 1'),
    League('League 2'),
    League('League 3'),
  ]),
  League('France', <League>[
    League('League 1'),
    League('League 2'),
    League('League 3'),
  ]),
];
