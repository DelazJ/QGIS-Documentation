Mesh
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgismeshcontours:

Export contours
----------------

Creates contours as vector layer from mesh scalar dataset.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - 
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Increment between contour levels**

       Optional
     - ``INCREMENT``
     - [number]

       Default: *Not set*
     - 
   * - **Minimum contour level**

       Optional
     - ``MINIMUM``
     - [number]

       Default: *Not set*
     - 
   * - **Maximum contour level**

       Optional
     - ``MAXIMUM``
     - [number]

       Default: *Not set*
     - 
   * - **List of contours level**

       Optional
     - ``MINIMUM``
     - [number]

       Default: *Not set*
     - 
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Exported contour lines**
     - ``OUTPUT_LINES``
     - [vector: line]
     - 
   * - **Exported contour polygons**
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]
     - 

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported contour lines**
     - ``OUTPUT_LINES``
     - [vector: line]
     - 
   * - **Exported contour polygons**
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]
     - 


Python code
...........

**Algorithm ID**: ``native:meshcontours``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshexportcrosssection:

Export cross section dataset values on lines from mesh
------------------------------------------------------

Extracts mesh's dataset values from line contained in a vector layer.

Each line is discretized with a resolution distance parameter for extraction
of values on its vertices.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     -
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Lines for data export**
     - ``INPUT_LINES``
     - [vector: line]
     -
   * - **Line segmentation resolution**
     - ``RESOLUTION``
     - [number]
     -

       Default: 10.0
   * - **Digits count for dataset value**
     - ``DATASET_DIGITS``
     - [number]
     -

       Default: 2
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]
     - :file:`.CSV` file containing ...

Python code
...........

**Algorithm ID**: ``native:meshexportcrosssection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshedges:

Export mesh edges
-----------------


Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - 
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     -
     -

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: line]
     - Output vector line layer containing the edges of the input mesh
       layer with associated dataset values

Python code
...........

**Algorithm ID**: ``native:exportmeshedges``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshfaces:

Export mesh faces
-----------------

Exports mesh layer's faces to a polygon vector layer,
with the dataset values on faces as attribute values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

    * - Label
     - Name
     - Type
     - Description
   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - 
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     -
     -

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: polygon]
     - Output vector polygon layer containing the faces of the input mesh
       layer with associated dataset values

Python code
...........

**Algorithm ID**: ``native:exportmeshfaces``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshongrid:

Export mesh on grid
-------------------

Exports mesh layer's dataset values to a gridded point vector layer,
with the dataset values on this point as attribute values.

For data on volume (3D stacked dataset values), the exported dataset
values are averaged on faces using the method defined in the mesh layer
properties (default is Multi level averaging method).
1D meshes are not supported.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - 
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Spatial extent on which to process the data
   * - **Grid spacing**

       Optional
     - ``GRID_SPACING``
     - [number]

       Default: 10.0
     - Spacing between the sample points to use
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     -
     -

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]
     - Output vector point layer with dataset values computed
       from the overlaid face.

Python code
...........

**Algorithm ID**: ``native:exportmeshongrid``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshvertices:

Export mesh vertices
--------------------

Exports mesh layer's vertices to a point vector layer,
with the dataset values on vertices as attribute values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

    * - Label
     - Name
     - Type
     - Description
   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     -
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     -
     -

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]
     - Output vector point layer containing the vertices of the input mesh
       layer with associated dataset values


Python code
...........

**Algorithm ID**: ``native:exportmeshvertices``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshexporttimeseries:

Export time series values from points of a mesh dataset
-------------------------------------------------------

Extracts mesh's dataset time series values from points contained in a vector layer.

If the time step is kept to its default value (0 hours), the time step used
is the one of the two first datasets of the first selected dataset group.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to extract data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Starting time**
     - ``STARTING_TIME``
     - 
     - The start of the time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Finishing time**
     - ``FINISHING_TIME``
     - 
     - The end of the time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Time step (hours)**

       Optional
     - ``TIME_STEP``
     - [number]

       Default: 2
     -
   * - **Points for data export**
     - ``INPUT_POINTS``
     - [vector: point]

       Default: 2
     -
   * - **Digits count for coordinates**
     - ``COORDINATES_DIGITS``
     - [number]
     -

       Default: 2
   * - **Digits count for dataset value**
     - ``DATASET_DIGITS``
     - [number]

       Default: 2
     -
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]
     - :file:`.CSV` file containing ...

Python code
...........

**Algorithm ID**: ``native:meshexporttimeseries``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshrasterize:

Rasterize mesh dataset
----------------------

Create a raster layer from a mesh dataset.

For data on volume (3D stacked dataset values), the exported dataset
values are averaged on faces using the method defined in the mesh
layer properties (default is Multi level averaging method).
1D meshes are not supported.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [layer: mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - 
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Spatial extent on which to process the data
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     -
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Output raster layer**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with dataset values computed
       from the mesh layer.


Python code
...........

**Algorithm ID**: ``native:meshrasterize``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistinmeshcreation:

TIN mesh creation
-----------------


Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``SOURCE_DATA``
     - []

       Default:
     - 
   * - **Output format**
     - ``MESH_FORMAT``
     - [enumeration]

       Default: 2DM
     - Output format of the generated layer

       * 0 --- 2DM
       * 1 --- SELAFIN
       * 2 --- PLY
       * 3 --- Ugrid
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Output file**
     - ``OUTPUT``
     - [mesh]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [mesh]
     - Output raster layer with dataset values computed
       from the mesh layer.

Python code
...........

**Algorithm ID**: ``native:tinmeshcreation``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

