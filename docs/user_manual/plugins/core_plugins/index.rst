.. index::
   single: Core plugins
   seealso: Core plugins; Plugins

.. _core_plugins:

-----------------------
Using QGIS Core Plugins
-----------------------

.. toctree::
   :maxdepth: 1

   plugins_geometry_checker
   plugins_metasearch
   plugins_offline_editing
   plugins_topology_checker


Below is the list of Core plugins provided with QGIS.
They can be found through the :menuselection:`Plugins -->`
|showPluginManager| :menuselection:`Manage and Install Plugins` menu
and are not necessarily enabled by default.

.. table:: QGIS Core Plugins

  ==================================================  ======================================================  ===============================
   Plugin                                              Description                                             Manual Reference
  ==================================================  ======================================================  ===============================
   |geoprocessing| Additional QGIS Processing Tools    Enable Python-based Processing core algorithms          :ref:`label_processing`
   |geometryChecker|  Geometry Checker                 Check and repair errors in vector geometries            :ref:`geometry_checker`
   |gdal| GDAL Processing provider                     Enable GDAL-based Processing core algorithms            :ref:`gdal_algorithms`
   |grassTools| GRASS 8                                GRASS functionality                                     :ref:`sec_grass`
   |grassLogo| GRASS Processing provider               GRASS Processing core algorithms                        :ref:`sec_grass`
   |metasearch| MetaSearch Catalog Client              Interact with metadata catalog services (CSW)           :ref:`metasearch`
   |offlineEditingCopy| Offline Editing                Offline editing and synchronizing with database         :ref:`offlinedit`
   |geoprocessing| Processing                          Spatial data processing framework                       :ref:`label_processing`
   |topologyChecker| Topology Checker                  Find topological errors in vector layers                :ref:`topology`
  ==================================================  ======================================================  ===============================


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |gdal| image:: /static/common/gdal.png
   :width: 1.5em
.. |geometryChecker| image:: /static/common/geometrychecker.png
   :width: 1.5em
.. |geoprocessing| image:: /static/common/geoprocessing.png
   :width: 1.5em
.. |grassLogo| image:: /static/common/grasslogo.png
   :width: 1.5em
.. |grassTools| image:: /static/common/grass_tools.png
   :width: 1.5em
.. |metasearch| image:: /static/common/MetaSearch.png
   :width: 1.5em
.. |offlineEditingCopy| image:: /static/common/offline_editing_copy.png
   :width: 1.5em
.. |showPluginManager| image:: /static/common/mActionShowPluginManager.png
   :width: 1.5em
.. |topologyChecker| image:: /static/common/mActionTopologyChecker.png
   :width: 1.5em
