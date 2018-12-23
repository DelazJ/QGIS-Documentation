.. only:: html

   |updatedisclaimer|

|LS| Creating a New Vector Dataset
===============================================================================

The data that you use has to come from somewhere. For most common applications,
the data exists already; but the more particular and specialized the project,
the less likely it is that the data will already be available. In such cases,
you'll need to create your own new data.

**The goal for this lesson:** To create a new vector dataset.

|basic| |FA| The Layer Creation Dialog
-------------------------------------------------------------------------------

Before you can add new vector data, you need a vector dataset to add it to. In
our case, you'll begin by creating new data entirely, rather than editing an
existing dataset. Therefore, you'll need to define your own new dataset first,
in a GeoPackage format.

#. Select the :menuselection:`Layer --> Create Layer -->` |newGeoPackageLayer|
   :menuselection:`New GeoPackage Layer...` menu.
   You'll be presented with the following dialog:

   .. figure:: img/create_vector_layer.png
      :align: center

#. Click the |browseButton| next to the :guilabel:`Database` field, navigate to
   the :file:`exercise_data` directory and save as :file:`editing_data.gpkg`
#. As previoulsy mentioned, a geoPackage file can contain more than one layer.
   For the next exercise, we're going to be creating items related to school
   features so we'll call the layer ``school_property``.

   In the :guilabel:`Table name` text field, replace :guilabel:`editing_data`
   (by default, QGIS uses the same file name as layer name) with ``school_property``.

   It's important to decide which kind of dataset you want at this stage. Each
   different vector layer type is "built differently" in the background, so once
   you've created the layer, you can't change its type.

   The new features we want describe areas in the school. For such features,
   you'll need to create a polygon dataset.

#. In the :guilabel:`Geometry type` menu, select |polygonLayer| :guilabel:`Polygon`.

   This will enable some spatial properties in the dialog, but it will mainly
   cause the correct type of geometry to be used when the vector dataset is created.
#. Keep unchecked the :guilabel:`Include Z dimension` and :guilabel:`Include M
   values` radio buttons.
#. The next field allows you to specify the Coordinate Reference System, or CRS. A
   CRS specifies how to describe a point on Earth in terms of coordinates, and
   because there are many different ways to do this, there are many different CRSs.
   The CRS of this project is ``WGS 84``, so it's already correct by default:

   .. figure:: img/default_options.png
      :align: center

   By default, a new GeoPackage layer has only one attribute, the :guilabel:`fid`
   field (which you should see in the :guilabel:`Advanced Options` list). This
   field has a unique value automatically assigned to each feature you create,
   helping to identify uniquely each feature in the layer; it's a **primary key**.

   .. figure:: img/new_layer_advanced_options.png
      :align: center

   The :guilabel:`fid` field's values are however not really meaningful for
   anyone that will pick the data. In order for the data you create to be useful,
   you actually need to say something about the features you'll be creating in
   this new layer. This is doable in the collection of fields grouped under
   :guilabel:`New Field`.

   For our current purposes, it will be enough to add one field called ``name``.

#. Replicate the setup below, then click the |newAttribute| :guilabel:`Add to
   Fields List` button:

   .. figure:: img/new_attribute.png
      :align: center

#. Check that your dialog now looks like this:

   .. figure:: img/new_attribute_added.png
      :align: center

#. Click :guilabel:`OK`.

The new layer should appear in your :guilabel:`Layers` panel.

.. _tm_datasources:

|basic| |FA| Data Sources
-------------------------------------------------------------------------------

When you create new data, it obviously has to be about objects that really
exist on the ground. Therefore, you'll need to get your information from
somewhere.

There are many different ways to obtain data about objects. For example, you
could use a GPS to capture points in the real world, then import the data into
QGIS afterwards. Or you could survey points using a theodolite, and enter the
coordinates manually to create new features. Or you could use the digitizing
process to trace objects from remote sensing data, such as satellite imagery
or aerial photography.

For our example, you'll be using the digitizing approach. Sample raster datasets
are provided, so you'll need to import them as necessary.

#. Click on the |dataSourceManager| :sup:`Open Data Source Manager` button
   and enable the |addRasterLayer| :guilabel:`Raster` tab.
#. Ensure |radioButtonOn| :guilabel:`File` is checked and press |browseButton|
   to navigate to :file:`exercise_data/raster/`.
#. Select the file :file:`3420C_2010_327_RGB_LATLNG.tif` and click
   :guilabel:`Open`.

   .. figure:: img/add_raster_layer.png
      :align: center

#. Back to the :guilabel:`Data Source Manager` dialog, press :guilabel:`Add` and
   then :guilabel:`Close` .

   An image will load into your map.
#. Find the new :guilabel:`3420C_2010_327_RGB_LATLNG` image in the
   :guilabel:`Layers` panel.
#. Click and drag it to the bottom of the list so that you can still see your
   other layers.
#. Find and zoom to this area:

   .. figure:: img/map_area_zoom.png
      :align: center

   .. note:: If your :guilabel:`buildings` layer symbology is covering part or
    all of the raster layer, you can temporarily disable the layer by unchecking
    it in the :guilabel:`Layers` panel. You may also wish to hide the
    :guilabel:`roads` symbology if you find it distracting.

You'll be digitizing these three fields:

.. figure:: img/field_outlines.png
   :align: center

|

In order to begin digitizing, you'll need to enter **edit mode**. GIS software
commonly requires this to prevent you from accidentally editing or deleting
important data. Edit mode is switched on or off individually for each layer.

To enter edit mode for the :guilabel:`school_property` layer:

#. Click on the layer in the :guilabel:`Layers` panel to select it. (Make very
   sure that the correct layer is selected, otherwise you'll edit the wrong
   layer!)
#. Click on the :guilabel:`Toggle Editing` button: |toggleEditing|

   If you can't find this button, check that the :guilabel:`Digitizing` toolbar is
   enabled. There should be a check mark next to the :menuselection:`View -->
   Toolbars --> Digitizing` menu entry.

#. As soon as you are in edit mode, some other digitizing tools are set active:

   |allEdits| |capturePolygon| |vertexTool| |editPaste|

   Another relevant buttons are still inactive, but will become active when you
   start interacting with your new data:

   |saveEdits| |multiEdit| |deleteSelected| |editCut| |editCopy|

   Move the mouse over each of them to check out their purposes.

You want to add a new feature.

#. Click on the |capturePolygon| :guilabel:`Add Feature` button now to begin
   digitizing our school fields.

   You'll notice that your mouse cursor has become a crosshair. This allows you
   to more accurately place the points you'll be digitizing. Remember that even
   as you're using the digitizing tool, you can zoom in and out on your map by
   rolling the mouse wheel, and you can pan around by holding down the mouse
   wheel and dragging around in the map.

   The first feature you'll be digitizing is the |schoolAreaType1|:

   .. figure:: img/school_area_one.png
      :align: center

#. Zoom in at a scale you could well identify the field limits.
#. Start digitizing by clicking on a point somewhere along the edge of the
   field.
#. Place more points by clicking further along the edge, until the shape you're
   drawing completely covers the field.

   If you've made a mistake while digitizing the feature, press the :kbd:`BackSpace`
   key to undo your last change(s) and redo the point addition at its best place.
   You can also finish the feature and fix the mistakes afterwards.
#. After placing your last point, *right-click* to finish drawing the polygon.
   This will finalize the feature and show you the :guilabel:`Attributes` dialog.
#. Fill in the feature's :guilabel:`name` as below:

   .. figure:: img/school_area_one_attributes.png
      :align: center

#. Click :guilabel:`OK` and you've created a new feature!
#. In order to keep the feature you digitized in the layer, you'd need to save
   your changes. Remember that the project files saves the layer you use in the
   project and how they are symbolized and interact with each others but not
   their contents.

   With the :guilabel:`school_property` layer selected, press :menuselection:`Layer
   -->` |saveEdits| :menuselection:`Save Layer Edits`. You can also use the
   shortcut on the :guilabel:`Digitizing` toolbar.
#. Open the layer's attribute table; you'll notice that the previous "Autogenerate"
   mention in the :guilabel:`fid` field has become "1". Remember that this field
   is of serial type.

   .. figure:: img/school_area_one_table.png
      :align: center

#. Press |toggleEditing| :sup:`Toggle Editing` button to exit the edit mode.

.. _backlink-create-vector-digitize-1:

|basic| |TY|
-------------------------------------------------------------------------------

Digitize the school itself and the upper field. Use this image to assist you:

.. figure:: img/field_outlines.png
   :align: center

.. note:: When you're done adding features to a layer, remember to save your
   edits and then exit edit mode.

.. note:: You can style the fill, outline and label placement and formatting
   of the :guilabel:`school_property` using techniques learnt in earlier
   lessons. In our example, we will use a dashed outline of light purple color
   with no fill.

:ref:`Check your results <create-vector-digitize-1>`


.. _backlink-create-vector-digitize-2:

|moderate| |TY|
-------------------------------------------------------------------------------

#. Create a new line layer called :file:`routes.shp` with :guilabel:`id` and
   :guilabel:`type` attributes. (Use the approach above to guide you.)
#. We're going to digitize two routes which are not already marked on the 
   :guilabel:`roads` layer; one is a path, the other is a track.

   * Our path runs along the southern edge of the suburb of Railton, starting
     and ending at marked roads:

     .. figure:: img/path_start_end.png
        :align: center

   * Our track is a little further to the south:

     .. figure:: img/track_start_end.png
        :align: center

   One at a time, digitize the path and the track on the :guilabel:`routes` layer.
   Try to follow the routes as accurately as possible, using points (left-click) at
   any corners or turns.

   When creating each route, give them the :guilabel:`type` attribute value of
   ``path`` or ``track``.

You'll probably find that only the points are marked; use the
:guilabel:`Layer Properties` dialog to add styling to your routes. Feel free to
give different styles to the path and track.


:ref:`Check your results <create-vector-digitize-2>`

|IC|
-------------------------------------------------------------------------------

Now you know how to create features! This course doesn't cover adding point
features, because that's not really necessary once you've worked with more
complicated features (lines and polygons). It works exactly the same, except
that you only click once where you want the point to be, give it attributes as
usual, and then the feature is created.

Knowing how to digitize is important because it's a very common activity in GIS
programs.

|WN|
-------------------------------------------------------------------------------

Features in a GIS layer aren't just pictures, but objects in space. For
example, adjacent polygons know where they are in relation to one another. This
is called *topology*. In the next lesson you'll see an example of why this can
be useful.


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
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |allEdits| image:: /static/common/mActionAllEdits.png
   :width: 1.5em
.. |basic| image:: /static/global/basic.png
.. |browseButton| image:: /static/common/browsebutton.png
   :width: 2.3em
.. |capturePolygon| image:: /static/common/mActionCapturePolygon.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |deleteSelected| image:: /static/common/mActionDeleteSelected.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editCut| image:: /static/common/mActionEditCut.png
   :width: 1.5em
.. |editPaste| image:: /static/common/mActionEditPaste.png
   :width: 1.5em
.. |moderate| image:: /static/global/moderate.png
.. |multiEdit| image:: /static/common/mActionMultiEdit.png
   :width: 1.5em
.. |newAttribute| image:: /static/common/mActionNewAttribute.png
   :width: 1.5em
.. |newGeoPackageLayer| image:: /static/common/mActionNewGeoPackageLayer.png
   :width: 1.5em
.. |polygonLayer| image:: /static/common/mIconPolygonLayer.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
.. |saveEdits| image:: /static/common/mActionSaveEdits.png
   :width: 1.5em
.. |schoolAreaType1| replace:: athletics field
.. |toggleEditing| image:: /static/common/mActionToggleEditing.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
.. |vertexTool| image:: /static/common/mActionVertexTool.png
   :width: 1.5em
