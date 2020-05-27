# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

sub1 = Subject.create :name => 'Astro Object', :label => "AstroObject", :uri => 'vo:astroobject'
sub2 = Subject.create :name => 'Stellar Object', :label => "StellarObject", :uri => 'vo:stellarobject'
sub3 = Subject.create :name => 'Galaxy', :label => "Galaxy", :uri => 'vo:galaxy'
sub4 = Subject.create :name => 'Star', :label => "Star", :uri => 'vo:star'
sub5 = Subject.create :name => 'White Dwarf', :label => "WhiteDwarf", :uri => 'vo:whitedwarf'
sub6 = Subject.create :name => 'Super Giant Star', :label => "SuperGiant", :uri => 'vo:supergiantstar'
sub7 = Subject.create :name => 'Planetary Nebula', :label => "PlanetaryNebula", :uri => 'vo:planetarynebulae'

sub1.subclasses << sub2
sub1.subclasses << sub3
sub2.subclasses << sub4
sub4.subclasses << sub5
sub4.subclasses << sub6
sub1.subclasses << sub7

res1a = Resource.create :name => 'GalaxyStarResource 1', :identifier => "vo:resc1a", :title => 'This is resource 1a.'
res1b = Resource.create :name => 'GalaxyStarResource 2', :identifier => "vo:resc1b", :title => 'This is resource 1b.'
res2 = Resource.create :name => 'GalaxyStellarObjectResource 1', :identifier => "vo:resc2", :title => 'This is resource 2.'
res3 = Resource.create :name => 'GalaxySuperGiantResource', :identifier => "vo:resc3", :title => 'This is resource 3.'
res4 = Resource.create :name => 'SuperGiantResource', :identifier => "vo:resc4", :title => 'This is resource 4.'
res5 = Resource.create :name => 'StarResource', :identifier => "vo:resc5", :title => 'This is resource 5.'
res6 = Resource.create :name => 'PNResource', :identifier => "vo:resc6", :title => 'This is resource 6.'
res7 = Resource.create :name => 'WhiteDwarfResource', :identifier => "vo:resc7", :title => 'This is resource 7.'

top1 = Topic.create :name => 'Galaxy--Star'
top2 = Topic.create :name => 'Galaxy--StellarObject'
top3 = Topic.create :name => 'Galaxy--SuperGiant'
top4 = Topic.create :name => 'SuperGiant'
top5 = Topic.create :name => 'Star'
top6 = Topic.create :name => 'PlanetaryNebula'
top7 = Topic.create :name => 'WhiteDwarf'

top1.resources << res1a
top1.resources << res1b
top2.resources << res2
top3.resources << res3
top4.resources << res4
top5.resources << res5
top6.resources << res6
top7.resources << res7

top1.subjects << sub3
top1.subjects << sub4

top2.subjects << sub3
top2.subjects << sub2

top3.subjects << sub3
top3.subjects << sub6

top4.subjects << sub6

top5.subjects << sub4

top6.subjects << sub7

top7.subjects << sub5

