.. Purpose: This chapter aims to present the Browser panel in
.. all its glory.

.. index:: Browser panel
.. _`label_browserpanel`:

The Browser panel
======================================================================


.. contents::
   :local:
   :depth: 2

The QGIS :guilabel:`Browser` panel is a great tool for browsing, searching,
inspecting, copying and loading QGIS resources.
Only resources that QGIS knows how to handle are shown in the browser.


.. _figure_browser_panel:

.. figure:: img/browser_panel.png
   :align: center

   The Browser panel







Exploring the Interface
-----------------------

At the top of the Browser panel, you find some buttons that help you:

* |addLayer| :sup:`Add Selected Layers`: you can also add data to the map
  canvas by selecting **Add selected layer(s)** from the layer's context menu;
* |refresh| :sup:`Refresh` the browser tree;
* |filterMap| :sup:`Filter Browser` to search for specific data. Enter a search
  word or wildcard and the browser will filter the tree to only show paths to
  matching DB tables, filenames or folders -- other data or folders won't be
  displayed. See the Browser Panel(2) example in :numref:`figure_browser_panels`.
  The comparison can be case-sensitive or not. It can also be set to:

  * :guilabel:`Normal`: show items containing the search text
  * :guilabel:`Wildcard(s)`: fine tune the search using the ``?`` and/or ``*``
    characters to specify the position of the search text
  * :guilabel:`Regular expression`

* |collapseTree| :sup:`Collapse All` the whole tree;
* |metadata| :sup:`Enable/disable properties widget`: when toggled on,
  a new widget is added at the bottom of the panel showing, if applicable,
  metadata for the selected item.






The entries in the :guilabel:`Browser` panel are organised hierarchically
and there are several top level entries:

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
   * |postgis| :guilabel:`PostgreSQL`
   * |mssql| :guilabel:`MS SQL Server`
   * |oracle| :guilabel:`Oracle`
   * |hana| :guilabel:`SAP HANA`
   * |wms| :guilabel:`WMS/WMTS`
   * |vectorTileLayer| :guilabel:`Vector Tiles`
   * |xyz| :guilabel:`XYZ Tiles`
   * |wcs| :guilabel:`WCS`
   * |wfs| :guilabel:`WFS/OGC API-Features`
   * |afs| :guilabel:`ArcGIS Feature REST Server`
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

* :menuselection:`Export Layer --> To File...`
* :guilabel:`Add Layer to Project`
* :guilabel:`Layer Properties`
* :menuselection:`Manage --> Rename "<name of file>"...` or
  :guilabel:`Delete "<name of file>"...`
* :guilabel:`Show in Files`
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

    You can also open a QGIS project directly from the Browser panel
    by double-clicking its name or by drag-and-drop into the map canvas.

Once a file is loaded, you can zoom around it using the map navigation tools.
To change the style of a layer, open the :guilabel:`Layer Properties` dialog
by double-clicking on the layer name or by right-clicking on the name in the legend
and choosing :menuselection:`Properties` from the context menu.
See section :ref:`vector_style_menu` for more information on setting symbology for vector layers.


Right-clicking an item in the browser tree helps you:

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









In addition, the Browser panel supports drag and drop of many QGIS resources,
such as project files, Python scripts, Processing scripts and Processing models.

Python scripts, Processing scripts and Processing models can also be opened for 
editing in an external editor and the graphical modeller.

You can drag and drop layers from the :guilabel:`Layers` panel
to the :guilabel:`Browser` panel, for instance into a GeoPackage or a
PostGIS database.


The browser panel (:numref:`figure_browser_panel`) is organised
as an expandable hierarchy with some fixed top-level entries that
organise the resources handled by the browser.
Node entries are expanded by clicking on |browserExpand| to the left
of the entry name.
A branch is collapsed by clicking on |browserCollapse|.
The |collapseTree| :sup:`Collapse All` button collapses all top-level
entries.

In :menuselection:`Settings --> Interface Customization` it is possible to disable resources.
If you, for instance, would not like to show Python scripts in the browser,
you can uncheck the :menuselection:`Browser --> py` entry,
and if you want to get rid of your home folder in the browser,
you can uncheck the :menuselection:`Browser --> special:Home` entry.

A filter (|filterMap| :sup:`Filter Browser`) can be used for searching
based on entry names (both leaf entries and node entries in the hierarchy).
Using the |options| :sup:`Options` pull-down menu next to the filter text field,
you can:

* toggle :guilabel:`Case Sensitive` search
* set the :guilabel:`Filter pattern syntax` to one of

  * :guilabel:`Normal`
  * :guilabel:`Wildcard(s)`
  * :guilabel:`Regular Expressions`

The *Properties widget*, showing useful information about some entries / resources,
can be enabled / disabled using the |metadata| :sup:`Enable/disable properties widget` button.
When enabled, it opens at the bottom of the browser panel,
as shown in :numref:`figure_properties_widget`.

.. _figure_properties_widget:

.. figure:: img/browser_p_properties_w.png
   :align: center

   The properties widget

A second browser panel can be opened by activating
the :guilabel:`Browser (2)` panel in :menuselection:`View --> Panels`.
Having two browser panels can be useful when copying layers between
resources that are located deep down in different branches of the browser hierarchy.


Resources that can be opened / run from the Browser
----------------------------------------------------------------------

A lot can be accomplished in the Browser panel

* Add vector, raster and mesh layers to your map by double-clicking,
  dragging onto the map canvas or clicking the |addLayer|
  :sup:`Add Selected Layers` button (after selecting layers)
* Run Python scripts (including Processing algorithms) by
  double-clicking or dragging onto the map canvas
* Run models by double-clicking or dragging onto the map canvas
* :guilabel:`Extract Symbols...` from QGIS Project files using the
  context menu
* Open files with their default applications
  (:guilabel:`Open <file type> Externally...` in the context menu).
  Examples: HTML files, spreadsheets, images, PDFs, text files, ...
* Copy entries
* Rename and delete (multiple) layers (context menu: :menuselection:`Manage -->`)
* Open a file explorer window and directly select the file 
  :guilabel:`Show in Files`

Resource specific actions are listed for the different resource groups
sorted under the top-level entries listed below.


Browser panel top-level entries
----------------------------------------------------------------------

Favorites
......................................................................
Often used file system locations can be tagged as favorites.
The ones you have tagged will appear here.

In addition to the operations described under :ref:`Home <browser_home>`,
the context menu allows you to :guilabel:`Rename Favorite...`
and :guilabel:`Remove Favorite`.


Spatial Bookmarks
......................................................................

This is where you will find your spatial bookmarks, organised
into :guilabel:`Project Bookmarks` and :guilabel:`User Bookmarks`.

From the top level context menu, you can create a bookmark
(:guilabel:`New Spatial Bookmark...`),
:guilabel:`Show the Spatial Bookmark Manager`,
:guilabel:`Import Spatial Bookmarks...` and
:guilabel:`Export Spatial Bookmarks...`.

For bookmark group entries you can :guilabel:`Export Spatial Bookmarks...`,
create a bookmark (:guilabel:`New Spatial Bookmark...`),
:guilabel:`Rename Bookmark Group`,
and :guilabel:`Delete Bookmark Group`.

For bookmark entries you can :guilabel:`Zoom to Bookmark`,
:guilabel:`Edit Spatial Bookmark...` and
:guilabel:`Delete Spatial Bookmark`

.. _browser_home:

Project Home
............

Available once the project file has been saved, the :guilabel:`Project home`
entry is a folder containing data and other contents (scripts, models, text, ...)
that may be used within the current project.
Displayed in the :guilabel:`Browser` panel, it allows you to quickly
access data and other files of the project.

It defaults to the project file folder but can be changed through the
:menuselection:`Project --> Properties... --> General --> Project home` option,
or by right-clicking on the :guilabel:`Project Home` item of the Browser panel
and selecting :guilabel:`Set project home...`.
Customizing that folder is especially useful in contexts where QGIS projects
are not stored in the root folder of an organisational 'project', along with datasets.


Drives and file system
......................

The next items of the :guilabel:`Browser` panel depend on the OS in use
and concern the top level entries of its file system.

They are mainly:

* The :guilabel:`Home` folder, pointing to the current user home folder
* on Unix-based machines, the root :guilabel:`/` folder
* the connected drives, either local or network. Depending on the OS,
  they are directly listed (eg, ``C:\``, ``D:\``) or through the ``/Volumes``
  entry.

From the contextual menu of each of these folders or drives, you can:

* refresh the contents
* create a :menuselection:`New -->` subitem that is a :guilabel:`Directory`,
  :guilabel:`GeoPackage` or ESRI :guilabel:`Shapefile` format dataset
* hide the directory (:guilabel:`Hide from Browser`)
* :guilabel:`Set color`: customize the folder icon color, aiding in rapid
  browser navigation of complex folder structures
* enable :guilabel:`Scanning`:

  * |checkbox| :guilabel:`Monitor for changes`: allows to manually control
    whether a particular directory should be monitored and automatically updated.
    This setting applies to the selected directory and all subdirectories.
    This means that you can manually opt-in to monitoring of network drives
    if you know there's no issue, or manually opt-out of monitoring of large
    directories which you don't want monitored for other reasons.
    By default, remote or network drives are not automatically monitored.
  * |unchecked| :guilabel:`Fast scan this directory`
* open the directory in your file manager (:guilabel:`Open Directory...`)
* open the directory in a terminal window  (:guilabel:`Open in Terminal...`)
* inspect the :guilabel:`Properties...` or the parent :guilabel:`Directory
  Properties...`


Database entries
.................

Depending on your OS and installed drivers, you might have access to different database
types to use in QGIS. Below are listed the different entries of contextual menu at
each level of the dataset tree.

.. You might want to use https://www.tablesgenerator.com/text_tables (Text tab) to update the next table.
    Particularly useful if you need to add, resize or move columns

+---------------+--------------------------------------------+------------------------------------------------------------------------------------+
| Level         | Context menu                               |                                  Type of database                                  |
|               |                                            +--------------+--------------+------------+------------+---------------+------------+
|               |                                            | |geoPackage| | |spatialite| | |postgis|  | |hana|     | |mssql|       | |oracle|   |
|               |                                            | GeoPackage   | SpatiaLite   | PostGIS    | SAP HANA   | MS SQL Server | Oracle     |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Top menu      | Create a :guilabel:`New Connection…`       | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
|               | to an existing database                    |              |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Create Database…`               | |checkbox|   | |checkbox|   |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Save Connections…` details      |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               | to a file                                  |              |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Load Connections…`              |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Connection    | :guilabel:`Refresh` a connection           |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
| / Database    +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Edit Connection…` settings      |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Remove Connection`              | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Delete <database_name>`         | |checkbox|   | |checkbox|   |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Compact Database (VACUUM)`      | |checkbox|   |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | Create a :guilabel:`New Schema…`           |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | Create a :guilabel:`New Table…`            | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Execute SQL…` query             | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Schema        | :guilabel:`Refresh` a schema               |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Schema Operations -->      |              |              |            |            |               |            |
|               | Rename Schema…`                            |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Schema Operations -->      |              |              |            |            |               |            |
|               | Delete Schema…`                            |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | Create a :guilabel:`New Table…`            |              |              | |checkbox| | |checkbox| |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Execute SQL…` query             |              |              | |checkbox| | |checkbox| |               |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Table / Layer | :menuselection:`Table Operations -->       |              |              |            |            |               |            |
|               | Rename Table…`                             |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Table Operations -->       |              |              |            |            |               |            |
|               | Truncate Table…`                           |              |              | |checkbox| |            | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :guilabel:`Execute SQL…` query             | |checkbox|   | |checkbox|   | |checkbox| |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Export Layer --> To file…` | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Manage -->                 |              |              |            |            |               |            |
|               | Rename Layer <layer_name>…`                | |checkbox|   | |checkbox|   |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Manage -->                 |              |              |            |            |               |            |
|               | Delete Layer <layer_name>…`                | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               | Delete Selected Layers`                    |              |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               | Add Layer to Project`                      |              |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               | Add Selected Layers to Project`            |              |              |            |            |               |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | Open :guilabel:`Layer Properties…` dialog  | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
|               +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
|               | Open :guilabel:`File Properties…` dialog   | |checkbox|   |              |            |            |               |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Fields        | :guilabel:`Add New Field…`                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
| Field         | :guilabel:`Delete Field…`                  | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
+---------------+--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+


Tiles and Web Services
......................

+---------------+----------------------------------------------+------------------------------------------------------------------------------------------------------+
| Level         | Context menu                                 |                                               Type of services                                       |
|               |                                              +------------+-------------------+------------+------------+----------------+-------------+------------+
|               |                                              | |wms|      | |vectorTileLayer| | |xyz|      | |wcs|      | |wfs|          | |afs|       | |geonode|  |
|               |                                              | WMS / WMTS | Vector Tiles      | XYZ Tiles  | WCS        | WFS / OGC      | ArcGIS REST | GeoNode    |
|               |                                              |            |                   |            |            | API - Features | Servers     |            |
+===============+==============================================+============+===================+============+============+================+=============+============+
| Top menu      | Create a :guilabel:`New Connection…`         | |checkbox| |                   | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | Create a :guilabel:`New Generic Connection…` |            | |checkbox|        |            |            |                |             |            |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | Create a :guilabel:`New ArcGIS Vector Tile   |            | |checkbox|        |            |            |                |             |            |
|               | Service Connection…`                         |            |                   |            |            |                |             |            |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`Save Connections…` details        | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               | to a file                                    |            |                   |            |            |                |             |            |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`Load Connections…`                | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
+---------------+----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
| Connection    | :guilabel:`Refresh` connection               | |checkbox| |                   | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`Edit…` connection settings        | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`Delete` connection                | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`View Service Info` in Web browser |            |                   |            |            |                | |checkbox|  |            |
+---------------+----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
| Table / Layer | :menuselection:`Export Layer --> To File...` | |checkbox| |                   | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`Add layer to Project`             | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | Open :guilabel:`Layer properties…` dialog    | |checkbox| | |checkbox|        | |checkbox| | |checkbox| | |checkbox|     | |checkbox|  | |checkbox| |
|               +----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+
|               | :guilabel:`View Service Info` in Web browser |            |                   |            |            |                | |checkbox|  |            |
+---------------+----------------------------------------------+------------+-------------------+------------+------------+----------------+-------------+------------+



Resources
----------------------------------------------------------------------

* Project files.
  The context menu for QGIS project files allows you to:

  * open it (:guilabel:`Open Project`)
  * extract symbols (:guilabel:`Extract Symbols...`) - opens the style
    manager that allows you to export symbols to an XML file, add
    symbols to the default style or export as PNG or SVG.
  * inspect properties (:guilabel:`File Properties...`)

  You can expand the project file to see its layers.
  The context menu of a layer offers the same actions as elsewhere
  in the browser.
* QGIS Layer Definition files (QLR).
  The following actions are available from the context menu:

  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`)

* Processing models (.model3).
  The following actions are available from the context menu:

  * :guilabel:`Run Model...`)
  * :guilabel:`Edit Model...`)

* QGIS print composer templates (QPT).
  The following action is available from the context menu:

  * (:guilabel:`New Layout from Template`)

* Python scripts (.py).
  The following actions are available from the context menu:

  * (:guilabel:`Run script...`)
  * (:guilabel:`Open in External Editor`)

* Recognized raster formats.
  The following actions are available from the context menu:

  * delete it (:guilabel:`Delete File <dataset name>`)
  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`,
    :guilabel:`File Properties...`)

  For some formats you can also
  :guilabel:`Open <file type> Externally...`
* Recognized vector formats.
  The following actions are available from the context menu:

  * delete it (:guilabel:`Delete File <dataset name>`)
  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`,
    :guilabel:`File Properties...`)

  For some formats you can also
  :guilabel:`Open <file type> Externally...`


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |afs| image:: /static/common/mIconAfs.png
   :width: 1.5em
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |geonode| image:: /static/common/mIconGeonode.png
   :width: 1.5em
.. |hana| image:: /static/common/mIconHana.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |mssql| image:: /static/common/mIconMssql.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |oracle| image:: /static/common/mIconOracle.png
   :width: 1.5em
.. |postgis| image:: /static/common/mIconPostgis.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |spatialite| image:: /static/common/mIconSpatialite.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
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
