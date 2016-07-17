//This file was generated from (Commercial) UPPAAL 4.0.14 (rev. 5615), May 2014

/*

*/
//NO_QUERY

/*

*/
VAB(1).Attente --> VAB(1).ApresTraverse && x <= TEMPS_MAX * (NVAB + NVAPB)

/*

*/
VAB(0).Attente --> VAB(0).ApresTraverse && x <= TEMPS_MAX * (NVAB + NVAPB)

/*

*/
VAA(1).Attente --> VAA(1).ApresTraverse && x <= TEMPS_MAX * (NVAA + NVAPA)

/*
cet 
*/
VAA(0).Attente --> VAA(0).ApresTraverse && x <= TEMPS_MAX * (NVAA + NVAPA)

/*
Lorsqu'une voiture A est sur le pont, il n'y a aucune voiture B sur le pont. Lorsqu'une voiture B est sur le pont, il n'y a aucune voiture A sur le pont.
*/
A[] forall (a : idVoitureA) forall (b : idVoitureB) forall (pa : idVoiturePA) forall (pb : idVoiturePB) (((VAA(a).SurPont || VAPA(pa).SurPont) imply not (VAB(b).SurPont || VAPB(pb).SurPont)) && ((VAB(b).SurPont || VAPB(pb).SurPont) imply not (VAA(a).SurPont || VAPA(pa).SurPont)))

/*
Il n'y a pas de deadlock.
*/
A[] not deadlock
