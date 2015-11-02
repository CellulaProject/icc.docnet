:- use_module(library(semweb/rdf_db)).
:- use_module(library(semweb/rdf_portray)).
:- use_module(library(semweb/rdfs)).
:- use_module(library(semweb/rdf_http_plugin)).
:- use_module(library(semweb/turtle)).	% Turtle and TRiG
:- use_module(library(semweb/rdf_ntriples)).
:- use_module(library(semweb/rdf_zlib_plugin)).
:- use_module(library(http/http_ssl_plugin)).
:- rdf_register_prefix(foaf, 'http://xmlns.com/foaf/0.1/').
:- rdf_register_prefix(ex,   'http://example.com/person/').
:- rdf_register_prefix(base,  'http://purl.oclc.org/NET/WebApiAuthentication#',[force(true)]).
:- rdf_register_prefix(was,  'http://www.owl-ontologies.com/Ontology1278065549.owl#',[force(true)]).
:- rdf_load(library(semweb/rdfs)).

                                % Web authentication ontology
                                % Description is at http://omnivoke.kmi.open.ac.uk/authentication/
:- rdf_load('http://people.aifb.kit.edu/mma/WAA/Auth.rdf', [graph(was), register_namespaces(true)]).

                                % Другие онтологии:
                                % dctypes - Dublic core types - типы контента (документов).
                                % oa = OpenAnnotation ontology . http://www.openannotation.org/spec/core/core.html
                                % prov=http://www.w3.org/TR/prov-o/ - онтология происхождения источника.
                                % scos=http://www.w3.org/TR/skos-reference/ отношения между онтолгиями (привязка)
                                % http://www.w3.org/TR/activitystreams-vocabulary/ Действия с объектами (в соцсетях).
                                % http://www.w3.org/TR/wordnet-rdf/ WORDNET's as RDF http://wordnet-rdf.princeton.edu/ontology
%


:- rdf_meta
        person(r).
:- rdf_meta
        label_predicate(r).
person(X) :-
        rdfs_individual_of(X, foaf:'Person').

label_predicate(rdfs:label).
label_predicate(skos:prefLabel).
label_predicate(skos:altLabel).
