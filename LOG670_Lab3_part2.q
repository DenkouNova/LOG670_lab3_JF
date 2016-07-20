//This file was generated from (Commercial) UPPAAL 4.0.14 (rev. 5615), May 2014

/*
Si on a en attente le v\u00e9hicule prioritaire B et quatre voitures normales, le v\u00e9hicule prioritaire A va n\u00e9cessairement passer en premier.
*/
(VAPB(0).Attente && VAA(0).Attente && VAA(1).Attente && VAB(0).Attente && VAB(1).Attente) --> (VAPB(0).SurPont && VAA(0).Attente && VAA(1).Attente && VAB(0).Attente && VAB(1).Attente)

/*
Si on a en attente le v\u00e9hicule prioritaire A et quatre voitures normales, le v\u00e9hicule prioritaire A va n\u00e9cessairement passer en premier.
*/
(VAPA(0).Attente && VAA(0).Attente && VAA(1).Attente && VAB(0).Attente && VAB(1).Attente) --> (VAPA(0).SurPont && VAA(0).Attente && VAA(1).Attente && VAB(0).Attente && VAB(1).Attente)

/*
V\u00e9rifie que les autos B traversent avant un certain d\u00e9lai
*/
A[] VAB(0).crossing imply VAB(0).horlogeTraverse <= TEMPS_MAX * (NVAB + NVAPB) * 4

/*
V\u00e9rifie que les autos A traversent avant un certain d\u00e9lai
*/
A[] VAA(0).crossing imply VAA(0).horlogeTraverse <= TEMPS_MAX * (NVAA + NVAPA) * 4

/*
Lorsqu'une voiture A ou PA est sur le pont, il n'y a aucune voiture B ou PB sur le pont. Lorsqu'une voiture B ou PB est sur le pont, il n'y a aucune voiture A ou PA sur le pont.
*/
A[] forall (a : idVoitureA) forall (b : idVoitureB) forall (pa : idVoiturePA) forall (pb : idVoiturePB) (((VAA(a).SurPont || VAPA(pa).SurPont) imply not (VAB(b).SurPont || VAPB(pb).SurPont)) && ((VAB(b).SurPont || VAPB(pb).SurPont) imply not (VAA(a).SurPont || VAPA(pa).SurPont)))

/*
Il n'y a pas de deadlock.
*/
A[] not deadlock
