# MATLAB postprocessing tools

* Requires Paraview to export 2D slices of the simulation data, one time stamp at a time.
* Slices are stored in test*.csv.
* rename.sh changes the name of the csv files so they can be read sequentially by MATLAB.

Using the tools:

* import_data_local.m imports a csv file into an MATLAB array.
* This is called sequentially from calculateContactAngle.m

calculateContactAngle:

* Apologies for the name, this is a legacy of an old code.
* The contact angle is not calculated.  
* Instead, this code runs sequentially through all the csv files and picks out the interface location in each file.
* From the interface, the triple point is located and stored in an arrya.

Output: 

[t,triple_point]=calculateContactAngle()

* t is a vector of time points
* triple_point is a corresponding vector of triple-point values.





