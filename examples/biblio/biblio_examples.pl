#!/usr/bin/perl -w
# simple examples of Bio::Biblio usage
# Brian Osborne

use strict;
use Bio::Biblio;
use Bio::Biblio::IO;
use Data::Dumper;

# number of articles in Medline with author Osborne...
my $num = new Bio::Biblio->find("Osborne","authors")->get_count;

# number of articles in Medline with author Osborne in year 2000...
$num = new Bio::Biblio->find("Osborne","authors")->
  find("2000","year")->get_count;

# number of JBC articles...
$num = new Bio::Biblio->find("J Biol Chem","journal")->get_count;

# a reference as XML...
my $xml = new Bio::Biblio->get_by_id("3047008");

# get a reference to an array of ids...
my $arr_ref = new Bio::Biblio->find ("Osborne","authors")->
  find("2000","year")->get_all_ids;

# retrieve the entry as text or retrieve specific text fields...
my $id = "88329717";
my $ref = new Bio::Biblio->get_by_id($id);
my $io = Bio::Biblio::IO->new( -result => "raw",
			       -data   => $ref );
my $nextref = $io->next_bibref;
# print the entire hash...
my $dump = Data::Dumper->Dump([$nextref],["$id"]);
# or just the abstract...
my $abstract = $nextref->{article}->{abstract}->{abstractText};

__END__

Output from Data::Dumper->Dump:

88329717 = {
	 'chemicals' => [
		     {
			'nameOfSubstance' => 'DNA, Fungal',
                        'registryNumber' => '0'
                     },
                     {
                        'nameOfSubstance' => 'DNA, Superhelical',
                        'registryNumber' => '0'
                     },
                     {
                        'nameOfSubstance' => 'RNA Polymerase II',
                        'registryNumber' => 'EC 2.7.7.-'
                     }
                        ],
	 'journalInfo' => {
                        'medlineTA' => 'Genes Dev',
                        'country' => 'UNITED STATES',
                        'nlmUniqueID' => '8711660'
                          },
         'PMID' => '3047008',
         'medlineID' => '88329717',
         'status' => 'Completed',
         'article' => {
                        'journal' => {
                                  'journalIssue' => {
                                  'volume' => '2',
                                  'issue' => '6',
                                  'pubDate' => {
                                             'month' => 'Jun',
                                             'year' => '1988'
                                                }
                                                    },
                                  'iSSN' => '0890-9369'
                                          },
                        'grants' => [
                                 {
                                  'agency' => 'NIGMS',
                                  'grantID' => '5R01 GM30454-05',
                                  'acronym' => 'GM'
                                 }
                                     ],
                        'pagination' => {
                                  'medlinePgn' => '766-72'
                                        },
                        'abstract' => {
                                             'abstractText' => 'We show that induction of transcription of a CYC1-lacZ fusion gene, borne on a yeast plasmid, causes an increase in negative superhelicity of approximately five turns. This increase is abolished by deletion of either essential element of the CYC1 promoter, the upstream activation site (UAS), or the TATA boxes. Several experiments indicate that the size of the increase is proportional to the size of the transcribed region. First, an internal deletion removing half of the CYC1-lacZ transcribed region results in a plasmid whose negative superhelicity on induction is intermediate between promoter-deletion plasmids and the parental plasmid. Second, plasmids bearing insertions of a fragment containing the putative CYC1 terminator into the CYC1-lacZ fusion gene have relative negative superhelicities proportional to the length of the truncated fusion transcripts generated. A plausible model explaining these observations is that local unwinding of the double helix by transcribing RNA polymerase generates positively supercoiled DNA, which is subsequently relaxed by a topoisomerase.'
                                           },
                        'languages' => [
                                        'eng'
                                       ],
                        'publicationTypes' => [
                                         'Journal Article'
                                              ],
                        'authors' => [
                                   {
                                         'personalName' => {
                                                   'initials' => 'BI',
                                                   'lastName' => 'Osborne',
                                                   'foreName' => 'B I',
                                                   'type' => 'PersonalName'
                                                            }
                                            },
                                            {
                                          'personalName' => {
                                                    'initials' => 'L',
                                                    'lastName' => 'Guarente',
                                                    'foreName' => 'L',
                                                    'type' => 'PersonalName'
                                                            }
                                            }
                                          ],
                        'articleTitle' => 'Transcription by RNA polymerase II induces changes of DNA topology in yeast.',
                        'affiliation' => 'Massachusetts Institute of Technology, Department of Biology, Cambridge 02139.'
                           },
                         'dateRevised' => {
                                 'day' => '18',
                                 'month' => '12',
                                 'year' => '2000'
                               },
              'meshHeadings' => [
                                  {
                                    'descriptorName' => 'Chromosome Deletion'
                                  },
                                  {
                                    'descriptorName' => 'DNA, Fungal',
                                    'subHeadings' => [
                                                       {
                                                         'subHeading' => 'genetics',
                                                         'majorTopic' => 'Y'
                                                       },
                                                       {
                                                         'subHeading' => 'ultrastructure'
                                                       }
                                                     ]
                                  },
                                  {
                                    'descriptorName' => 'DNA, Superhelical',
                                    'subHeadings' => [
                                                       {
                                                         'subHeading' => 'genetics'
                                                       }
                                                     ]
                                  },
                                  {
                                    'descriptorName' => 'Genes, Fungal'
                                  },
                                  {
                                    'descriptorName' => 'Promoter Regions (Genetics)'
                                  },
                                  {
                                    'descriptorName' => 'RNA Polymerase II',
                                    'subHeadings' => [
                                                       {
                                                         'subHeading' => 'metabolism',
                                                         'majorTopic' => 'Y'
                                                       }
                                                     ]
                                  },
                                  {
                                    'descriptorName' => 'Saccharomyces cerevisiae',
                                    'subHeadings' => [
                                                       {
                                                         'subHeading' => 'genetics',
                                                         'majorTopic' => 'Y'
                                                       }
                                                     ]
                                  },
                                  {
                                    'descriptorName' => 'Support, Non-U.S. Gov\'t'
                                  },
                                  {
                                    'descriptorName' => 'Support, U.S. Gov\'t, P.H.S.'
                                  },
                                  {
                                    'descriptorName' => 'Transcription, Genetic'
                                  }
                                ],
              'dateCreated' => {
                                 'day' => '24',
                                 'month' => '10',
                                 'year' => '1988'
                               },
              'citationSubsets' => [
                                     'IM'
                                   ],
              'type' => 'MedlineCitation',
              'dateCompleted' => {
                                   'day' => '24',
                                   'month' => '10',
                                   'year' => '1988'
                                 }
            };
