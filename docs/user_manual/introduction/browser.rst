
.. index:: Browse data, Add layers
.. _browser_panel:

The Browser Panel
=================

The :guilabel:`Browser` is one of the main ways to quickly and easily
add your data to projects. It's available as:

* a :guilabel:`Data Source Manager` tab, enabled pressing the
  |dataSourceManager| :sup:`Open Data Source Manager` button (:kbd:`Ctrl+L`);
* as a QGIS panel you can open from the menu :menuselection:`View --> Panels`
  (or |kde| :menuselection:`Settings --> Panels`) or by pressing :kbd:`Ctrl+2`.

In both cases, the :guilabel:`Browser` helps you navigate in your file system
and manage geodata, regardless the type of layer (raster, vector, table),
or the datasource format (plain or compressed files, databases, web services).

Exploring the Interface
-----------------------

At the top of the Browser panel, you find some buttons that help you to:

* |addLayer| :sup:`Add Selected Layers`: you can also add data to the map
  canvas by selecting **Add selected layer(s)** from the layer's context menu;
* |refresh| :sup:`Refresh` the browser tree;
* |filterMap| :sup:`Filter Browser` to search for specific data. Enter a search
  word or wildcard and the browser will filter the tree to only show paths to
  matching DB tables, filenames or folders -- other data or folders won't be
  displayed. See the Browser Panel(2) example in figure_browser_panels_.
  The comparison can be case-sensitive or not. It can also be set to:

  * :guilabel:`Normal`: show items containing the search text
  * :guilabel:`Wildcard(s)`: fine tune the search using the ``?`` and/or ``*``
    characters to specify the position of the search text
  * :guilabel:`Regular expression`

* |collapseTree| :sup:`Collapse All` the whole tree;
* |metadata| :sup:`Enable/disable properties widget`: when toggled on,
  a new widget is added at the bottom of the panel showing, if applicable,
  metadata for the selected item.

The entries in the :guilabel:`Browser` panel are organised
hierarchically, and there are several top level entries:

#. :guilabel:`Favorites` where you can place shortcuts to often used locations
#. :guilabel:`Spatial Bookmarks` where you can store often used map extents
   (see :ref:`sec_bookmarks`)
#. :guilabel:`Project Home`: for a quick access to the folder in which (most of)
   the data related to your project are stored. The default value is the directory
   where your project file resides.
#. :guilabel:`Home` directory in the file system and the filesystem root directory.
#. Connected local or network drives
#. Then comes a number of container / database types and service protocols,
   depending on your platform and underlying libraries:

   * |geoPackage| :guilabel:`GeoPackage`
   * |spatialite| :guilabel:`SpatiaLite`
   * |postgis| :guilabel:`PostGIS`
   * |mssql| :guilabel:`MSSQL`
   * |oracle| :guilabel:`Oracle`
   * |db2| :guilabel:`DB2`
   * |wms| :guilabel:`WMS/WMTS`
   * |vectorTileLayer| :guilabel:`Vector Tiles`
   * |xyz| :guilabel:`XYZ Tiles`
   * |wcs| :guilabel:`WCS`
   * |wfs| :guilabel:`WFS/OGC API-Features`
   * |ows| :guilabel:`OWS`
   * |ams| :guilabel:`ArcGIS Map Service`
   * |afs| :guilabel:`ArcGIS Feature Service`
   * |geonode| :guilabel:`GeoNode`

Interacting with the Browser items
----------------------------------

The browser supports drag and drop within the browser, from the browser to
the canvas and :guilabel:`Layers` panel, and from the :guilabel:`Layers` panel
to layer containers (e.g. GeoPackage) in the browser.

Project file items inside the browser can be expanded, showing the full
layer tree (including groups) contained within that project.
Project items are treated the same way as any other item in the browser,
so they can be dragged and dropped within the browser (for example to
copy a layer item to a geopackage file) or added to the current project
through drag and drop or double click.

The context menu for an element in the :guilabel:`Browser` panel is opened
by right-clicking on it.

For file system directory entries, the context menu offers the following:

* :menuselection:`New -->` to create in the selected entry a:

  * :guilabel:`Directory...`
  * :guilabel:`GeoPackage...`
  * :guilabel:`ShapeFile...`
* :guilabel:`Add as a Favorite`: favorite folders can be renamed
  (:guilabel:`Rename favorite...`) or removed (:guilabel:`Remove favorite`) any time.
* :guilabel:`Hide from Browser`: hidden folders can be toggled to visible from
  the :menuselection:`Settings --> Options --> Data Sources --> Hidden browser
  paths` setting
* :guilabel:`Fast Scan this Directory`
* :guilabel:`Open Directory`
* :guilabel:`Open in Terminal`
* :guilabel:`Properties...`
* :guilabel:`Directory Properties...`

For leaf entries that can act as layers in the project, the context
menu will have supporting entries.
For example, for non-database, non-service-based vector, raster and
mesh data sources:

* :guilabel:`Delete File "<name of file>"...`
* :guilabel:`Export Layer` --> :guilabel:`To File...`
* :guilabel:`Add Layer to Project`
* :guilabel:`Layer Properties`
* :guilabel:`File Properties`

In the :guilabel:`Layer properties` entry, you will find (similar
to what you will find in the
:ref:`vector <vector_properties_dialog>` and
:ref:`raster <raster_properties_dialog>` layer properties once
the layers have been added to the project):

* :guilabel:`Metadata` for the layer.
  Metadata groups: :guilabel:`Information from provider` (if possible,
  :guilabel:`Path` will be a hyperlink to the source),
  :guilabel:`Identification`, :guilabel:`Extent`, :guilabel:`Access`,
  :guilabel:`Fields` (for vector layers), :guilabel:`Bands` (for raster layers),
  :guilabel:`Contacts`, :guilabel:`Links` (for vector layers),
  :guilabel:`References` (for raster layers), :guilabel:`History`.
* A :guilabel:`Preview` panel
* The attribute table for vector sources (in the :guilabel:`Attributes`
  panel).

To add a layer to the project using the :guilabel:`Browser`:

#. Enable the :guilabel:`Browser` as described above.
   A browser tree with your file system, databases and web services is 
   displayed.
   You may need to connect databases and web services before they appear
   (see dedicated sections).
#. Find the layer in the list.
#. Use the context menu, double-click its name, or drag-and-drop it
   into the :ref:`map canvas <label_mapview>`.
   Your layer is now added to the :ref:`Layers panel <label_legend>` and
   can be viewed on the map canvas.

   .. tip:: **Open a QGIS project directly from the browser**

    You can also open a QGIS project directly from the Browser
    panel by double-clicking its name or by drag-and-drop into the map canvas.

Once a file is loaded, you can zoom around it using the map navigation tools.
To change the style of a layer, open the :guilabel:`Layer Properties` dialog
by double-clicking on the layer name or by right-clicking on the name in the
legend and choosing :menuselection:`Properties` from the context menu. See
section :ref:`vector_style_menu` for more information on setting symbology for
vector layers.


Right-clicking an item in the browser tree helps you to:

* for a file or a table, display its metadata or open it in your project.
  Tables can even be renamed, deleted or truncated.
* for a folder, bookmark it into your favourites or hide it from the browser
  tree. Hidden folders can be managed from the :menuselection:`Settings -->
  Options --> Data Sources` tab.
* manage your :ref:`spatial bookmarks <sec_bookmarks>`: bookmarks can be
  created, exported and imported as ``XML`` files.
* create a connection to a database or a web service.
* refresh, rename or delete a schema.

You can also import files into databases or copy tables from one schema/database
to another with a simple drag-and-drop. There is a second browser panel
available to avoid long scrolling while dragging. Just select the file and
drag-and-drop from one panel to the other.

.. _figure_browser_panels:

.. figure:: img/browser_panels.png
   :align: center

   QGIS Browser panels side-by-side


.. tip:: **Add layers to QGIS by simple drag-and-drop from your OS file browser**

   You can also add file(s) to the project by drag-and-dropping them from your
   operating system file browser to the :guilabel:`Layers Panel` or the map
   canvas.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |afs| image:: /static/common/mIconAfs.png
   :width: 1.5em
.. |ams| image:: /static/common/mIconAms.png
   :width: 1.5em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |db2| image:: /static/common/mIconDb2.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |geonode| image:: /static/common/mIconGeonode.png
   :width: 1.5em
.. |kde| image:: /static/common/kde.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |mssql| image:: /static/common/mIconMssql.png
   :width: 1.5em
.. |oracle| image:: /static/common/mIconOracle.png
   :width: 1.5em
.. |ows| image:: /static/common/mIconOws.png
   :width: 1.5em
.. |postgis| image:: /static/common/mIconPostgis.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |spatialite| image:: /static/common/mIconSpatialite.png
   :width: 1.5em
.. |vectorTileLayer| image:: /static/common/mIconVectorTileLayer.png
   :width: 1.5em
.. |wcs| image:: /static/common/mIconWcs.png
   :width: 1.5em
.. |wfs| image:: /static/common/mIconWfs.png
   :width: 1.5em
.. |wms| image:: /static/common/mIconWms.png
   :width: 1.5em
.. |xyz| image:: /static/common/mIconXyz.png
   :width: 1.5em
