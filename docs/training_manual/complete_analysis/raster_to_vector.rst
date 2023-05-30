|LS| Raster to Vector Conversion
===============================================================================

Converting between raster and vector formats allows you to make use of both
raster and vector data when solving a GIS problem, as well as using the various
analysis methods unique to these two forms of geographic data. This increases
the flexibility you have when considering data sources and processing methods
for solving a GIS problem.

To combine a raster and vector analysis, you need to convert the one type of
data to the other.
Let's convert the raster result of the previous lesson to a vector.

**The goal for this lesson:** To get the raster result into a vector that can
be used to complete the analysis.

|moderate| |FA| The :guilabel:`Raster to Vector` Tool
-------------------------------------------------------------------------------

Start with the map from the last module, :file:`raster_analysis.qgs`.
There you should have the :file:`all_conditions_simple.tif` calculated
during the previous exercises.

#. Click on :menuselection:`Raster --> Conversion --> Polygonize (Raster to Vector)`.
   The tool dialog will appear.
#. Set it up like this:

   * :guilabel:`Input layer` is :guilabel:`all_conditions_simple.tif`.
   * :guilabel:`Band number` is kept to :guilabel:`1`.
   * :guilabel:`Name of the field to create` (describing the values of the raster)
     is set to ``suitable``.
   * Save the output file :guilabel:`Polygonized` to
     :file:`exercise_data/residential_development/all_terrain.shp`.

   .. figure:: img/polygonize_raster.png
      :align: center

#. Press :guilabel:`Run` to start the conversion process.

Now you have a vector file which contains all the values of the raster, but
the only areas you're interested in are those that are suitable; i.e., those
polygons where the value of :guilabel:`suitable` is ``1``. You can change the
style of this layer if you want to have a clearer visualization of it.


|moderate| |TY|
-------------------------------------------------------------------------------

Refer back to the module on vector analysis, if necessary.

#. Create a new vector file that contains only the polygons where
   :guilabel:`suitable` has the value of ``1``.
#. Save the new file under :file:`exercise_data/residential_development/`
   as :file:`suitable_terrain.shp`.

.. admonition:: Answer
   :class: dropdown

   #. Select the :guilabel:`all_terrain` layer in the :guilabel:`Layers` panel
   #. Press the |expressionSelect| :sup:`Select features using an expression` button
   #. Then build the query ``"suitable" = 1``.
   #. Click :guilabel:`Select features` to select all the polygons that meet this condition.
   #. You can save this layer by right-clicking on the :guilabel:`all_terrain` layer
      and choosing :menuselection:`Export --> Save Selected Features As...`,
   #. Then select :guilabel:`ESRI Shapefile` as :guilabel:`Format,
      and indicate :guilabel:`File name` with path using the :guilabel:`...` button.
   #. Press :guilabel:`OK` to load the new filtered layer into the project.


|moderate| |FA| The :guilabel:`Vector to Raster` Tool
-------------------------------------------------------------------------------

Although unnecessary for our current problem, it's useful to know about the
opposite conversion from the one performed above. Convert to raster the
:file:`suitable_terrain.shp` vector file you just created in previous step.

#. Click on :menuselection:`Raster --> Conversion --> Rasterize (Vector to Raster)`
   to start this tool, then set it up as below:

   * :guilabel:`Input layer` is :guilabel:`all_terrain`.
   * Field name is :guilabel:`suitable`.
   * :guilabel:`Output raster size units` is :guilabel:`Pixels`.
   * :guilabel:`Width` and :guilabel:`Height` are ``837`` and ``661``, respectively.
   * Get the :guilabel:`Output extent` from the :guilabel:`all_terrain` layer.
   * Clear the :guilabel:`Assign a specified no-data value to output band` widget,
     to ``Not set``. (NEED TO CHECK!!!)
   * Set output file :guilabel:`Rasterized` to
     :file:`exercise_data/residential_development/raster_conversion.tif`.

   .. note::  The size of the output image is specified here to be the same as the
     original raster which was vectorized. To view the dimensions of an image,
     open its metadata (:guilabel:`Metadata` tab in the :guilabel:`Layer Properties`).

   .. figure:: img/vector_to_raster.png
      :align: center

#. Press :guilabel:`Run` to start the conversion process.
#. When it is complete, gauge its success by comparing the new raster with the original one.
   They should match up exactly, pixel for pixel.

|IC|
-------------------------------------------------------------------------------

Converting between raster and vector formats allows you to widen the
applicability of data, and need not lead to data degradation.

|WN|
-------------------------------------------------------------------------------

Now that we have the results of the terrain analysis available in vector format,
they can be used to solve the problem of which buildings we should consider
for the residential development.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |moderate| image:: /static/common/moderate.png
