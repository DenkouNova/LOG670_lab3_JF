//This file was generated from (Commercial) UPPAAL 4.0.14 (rev. 5615), May 2014

/*

*/
//NO_QUERY

/*
V\u00e9rifie que les autos B traversent avant un certain d\u00e9lai
*/
A[] VAB(0).crossing imply VAB(0).horlogeTraverse <= TEMPS_MAX * NVAB * 2

/*
V\u00e9rifie que les autos A traversent avant un certain d\u00e9lai
*/
A[] VAA(0).crossing imply VAA(0).horlogeTraverse <= TEMPS_MAX * NVAA * 2

/*
Lorsqu'une voiture A est sur le pont, il n'y a aucune voiture B sur le pont. Lorsqu'une voiture B est sur le pont, il n'y a aucune voiture A sur le pont.
*/
A[] forall (a : idVoitureA) forall (b : idVoitureB) ((VAA(a).SurPont imply not VAB(b).SurPont) && (VAB(b).SurPont imply not VAA(a).SurPont))

/*
Il n'y a pas de deadlock.
*/
A[] not deadlock
