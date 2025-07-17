#!/bin/bash

rm -r constant/polyMesh
cp -r ../mesh/constant/polyMesh ./constant
cp ../mesh/alpha.water.orig ./0/alpha.water
cp ../mesh/U ./0/U
setFields