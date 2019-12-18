|LS| Creating a Dynamic Print Layout
===============================================================================

Now that you've learned to create a basic map layout we go a step further and
create a map layout that adapts dynamically to our map extent and to the page
properties, e.g. when you change the size of the page. Also, the date of creation
will adapt dynamically.

|moderate| |FA| Creating the dynamic map canvas
-------------------------------------------------------------------------------

#. Load the ESRI Shapefile format datasets :file:`protected_areas.shp`,
   :file:`places.shp`, :file:`rivers.shp` and :file:`water.shp`
   into the map canvas and adapt its properties to suit your own convenience.
#. After everything is rendered and symbolized to your liking,
   click the |newLayout| :sup:`New Print Layout` icon in the toolbar or
   choose :menuselection:`File --> New Print Layout`. You will be prompted to
   choose a title for the new print layout.

We want to create a map layout consisting of a header and a map of the region near
Swellendam, South Africa.
The layout should have a margin of 7.5mm and the header should be 36mm high.

#. Create a map item called ``main map`` on the canvas
#. Go to the :guilabel:`Layout` panel
#. Scroll down to the :guilabel:`Variables` section and find the :guilabel:`Layout` part.
   Here we set some variables you can use all over the dynamic print layout.

   The first variable will define the margin.
   
   #. Press the |signPlus| button and type in the name ``sw_layout_margin``.
   #. Set the value to ``7.5``.

   The next one will define the top header.
   
   #. Press the |signPlus| button again and type in the name ``sw_layout_height_header``.
   #. Set the value to ``36``.

   Now you are ready to create the position and the size of the map canvas
   automatically by means of the variables.
#. Go to the :guilabel:`Item Properties` panel
#. Open the :guilabel:`Position and Size` section.
#. Click the |dataDefined| :sup:`Data defined override` for :guilabel:`X`
#. Choose ``@sw_layout_margin`` from the :guilabel:`Variables` entry
#. Click the |dataDefined| :sup:`Data defined override` for :guilabel:`Y`
#. Choose :guilabel:`Edit...` and type in the formula

   ::

    @sw_layout_margin + @sw_layout_height_header

#. You will create the size of the map item by using the variables for
   :guilabel:`Width` and :guilabel:`Height`.

   #. Click the |dataDefined| :sup:`Data defined override` for :guilabel:`Width`
   #. Choose :guilabel:`Edit ...` again and fill in the formula

      ::

       @layout_pagewidth - @sw_layout_margin * 2

   #. Click the |dataDefined| :sup:`Data defined override` for :guilabel:`Height`
   #. Choose :guilabel:`Edit ...` and fill in the formula

      ::

       @layout_pageheight -  @sw_layout_height_header -  @sw_layout_margin * 2

#. We will also create a grid containing the coordinates of the main map
   canvas extent.

   #. Go to :guilabel:`Item Properties` again
   #. Choose the :guilabel:`Grids` section.
   #. Insert a grid by clicking the |signPlus| button.
   #. Go to :guilabel:`Modify grid...`
   #. Set the :guilabel:`Interval` for X, Y and :guilabel:`Offset` according
      to the map scale you chose in the QGIS main canvas. The :guilabel:`Grid
      type` :guilabel:`Cross` is very well suited for our purposes.

|moderate| |FA| Creating the dynamic header
-------------------------------------------------------------------------------


.. figure:: img/dynamic_layout_structure.png
   :align: center
   :width: 100%
   
Let's create a  a rectangle which will contain the header.

#. With the |addBasicShape| :sup:`Add Shape` button, draw a rectangle. 
#. In the :guilabel:`Items` panel enter the name ``header``.
#. Go to the shape :guilabel:`Item Properties`.
#. Expand the :guilabel:`Position and Size` section.
#. Using |dataDefined| :sup:`Data defined override`, choose the
   ``@sw_layout_margin`` variable for :guilabel:`X` as well as for :guilabel:`Y`.
#. Define the :guilabel:`Width` by the expression

   ::

    @layout_pagewidth - @sw_layout_margin * 2

#. Define the :guilabel:`Height` by the expression 

   ::

    @sw_layout_height_header

We will now insert a horizontal line and two vertical lines to divide the header
into different sections.

#. Create the aforementioned lines using the |addNodesShape| :sup:`Add Node Item
   --> Add Polyline`. You may need to hold the :kbd:`Shift` key.
#. Rename each of them.
#. Select the horizontal line and insert the following expression for :guilabel:`X`

   ::

    @sw_layout_margin

#. Insert the next expression for :guilabel:`Y`

   ::

    @sw_layout_margin + 8

#. And for :guilabel:`Width`, insert this

   ::

    @layout_pagewidth -  @sw_layout_margin * 2 - 53.5

#. The first vertical line is defined by

   * for :guilabel:`X`

     ::

      @layout_pagewidth -  @sw_layout_margin * 2 - 53.5

   * for :guilabel:`Y`

     ::

      @sw_layout_margin

   * for the :guilabel:`Height`, same as the header we created, so enter
     the expression

     ::

      @sw_layout_height_header

#. The second vertical line is placed to the left of the first one.
   Enter the expression

   * for :guilabel:`X`

     ::

      @layout_pagewidth - @sw_layout_margin * 2 - 83.5

   * for :guilabel:`Y`
 
     ::

      @sw_layout_margin
 
   * for the :guilabel:`Height`, same as the header we created, so enter
     the expression

     ::

      @sw_layout_height_header

The figure below shows the structure of our dynamic layout.
Next, we will fill the areas created by the lines with some elements
(labels and images).

|moderate| |FA| Creating labels for the dynamic header
---------------------------------------------------------------------------------------

The title of your QGIS project can be included automatically. The title is set
in the main :menuselection:`Project --> Properties...` dialog.

#. Insert a label with the |addLabel| :sup:`Adds a new Label to the layout` button
#. Call the item ``project title (variable)``.
#. In the :guilabel:`Main Properties` of the :guilabel:`Items Properties` Panel
   enter the expression

   ::

    [%@project title%]

#. Set the :guilabel:`X` position of the label with the expression

   ::

    @sw_layout_margin + 3

#. Set the :guilabel:`Y` position of the label with the expression

   ::

    @sw_layout_margin + 0.25

#. Set the :guilabel:`Width` of the label with the expression

   ::

    @layout_pagewidth - @sw_layout_margin *2 - 90

#. And enter ``11.25`` for the :guilabel:`Height`.
#. Under :guilabel:`Appearance`, set the Font size to ``16pt``.

The second label will include a description of the map you created.

#. Again, insert a label and call it ``map description``.
#. In its :guilabel:`Main Properties` also enter the text ``map description``.
   Here we will also include the date using

   ::

     printed on: [%format_date(now(),'dd.MM.yyyy')%]

   We are again using a variable that QGIS creates automatically.
#. For :guilabel:`X` insert the expression 

   ::

    @sw_layout_margin + 3

#. And for :guilabel:`Y` enter the expression 

   ::

    @sw_layout_margin + 11.5

The third label will include information about your organisation.

#. First we will create some variables in the :guilabel:`Variables` menu
   of the :guilabel:`Item Properties`.

   #. Go to the :guilabel:`Layout` menu
   #. Click the |signPlus| button each time and enter the names ``o_department``
   #. In the second column enter the corresponding information about your department.
   #. Add other variables named ``o_name`` , ``o_adress`` and ``o_postcode`` and,
      as above provide the corresponding information.

#. Use these variables in the label's :guilabel:`Main Properties` section as shown
   in the image below.

   .. figure:: img/dynamic_layout_organisation.png
      :align: center

#. Define the :guilabel:`X` position of the label

   :: 

    @layout_pagewidth - @sw_layout_margin - 49.5

#. Define the :guilabel:`Y` position of the label

   ::

    @sw_layout_margin + 15.5

#. Define the :guilabel:`Width` at ``49.00``
#. Define the :guilabel:`Height` by

   ::

     @sw_layout_height_header - 15.5

|moderate| |FA| Adding pictures to the dynamic header
---------------------------------------------------------------------------------------

We will now place a picture above the label ``organisation information``.
   
#. Select the |addNewImage| :sup:`Adds a new Picture to the layout` button.
#. Draw a rectangle above the label item, to stor the image
#. Call it ``organisation logo``
#. Under :menuselection:`Main Properties --> Image Source`, browse and select your logo
   from your directory.
#. Define the :guilabel:`X` position with

   ::

    @layout_pagewidth - @sw_layout_margin - 48.5

#. Define the :guilabel:`Y` position with

   ::

    @sw_layout_margin + 3.5

Our layout still needs a north arrow.
This will be inserted by using |northArrow| :sup:`Adds a new North Arrow to the layout`.

#. Set the name to ``north arrow``
#. Go to :guilabel:`Main Properties` and select the :file:`Arrow_02.svg`.
#. Define the :guilabel:`X` position with

   ::

    @layout_pagewidth - @sw_layout_margin - 68.25

#. Define the :guilabel:`Y` position with

   ::

    @sw_layout_margin + 22.5

#. Use static numbers here to define the :guilabel:`Width` and the
   :guilabel:`Height`: e.g. ``21`` for both.

|moderate| |FA| Creating the scalebar of the dynamic header
----------------------------------------------------------------------------------------

We'll now insert a scalebar that would be placed in the section above the north arrow's.

To insert a scalebar in the header click on |addScalebar| :sup:`Adds a new Scale Bar to the layout` and
   place it in the rectangle above the north arrow.
#. In :guilabel:`Map` under the :guilabel:`Main Properties`, select your ``main map(Map 0)``.
   This means that the scalebar is bound to that map and will change automatically
   according to the map item scale.
#. Choose the :guilabel:`Style` ``Numeric``. This means that we insert a simple scale
   without a scalebar. The scale still needs a position and size.
#. For :guilabel:`X` enter

   ::

    @layout_pagewidth - @sw_layout_margin - 68.25
    
#. For :guilabel:`Y` enter 

   ::

    @sw_layout_margin + 6.5

#. For :guilabel:`Width` enter ``29``  and for :guilabel:`Height` ``13``.
#. Place the :guilabel:`Reference point` in the center.

Congratulations! You've created your first dynamic map layout.
Take a look at the layout and check if everything looks the way you want it!
The dynamic map layout reacts automatically when you change the :guilabel:`page properties`.
For example, if you change the page size from DIN A4 to DIN A3,
click the |draw| :sup:`Refresh view` button and the page design is adapted.

.. figure:: img/dynamic_layout.png
   :align: center
   :width: 100%

|WN|
-------------------------------------------------------------------------------

On the next page, you will be given an assignment to complete. This will allow
you to practice the techniques you have learned so far.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |addBasicShape| image:: /static/common/mActionAddBasicShape.png
   :width: 1.5em
.. |addLabel| image:: /static/common/mActionLabel.png
   :width: 1.5em
.. |addNewImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addNodesShape| image:: /static/common/mActionAddNodesShape.png
   :width: 1.5em
.. |addScalebar| image:: /static/common/mActionScaleBar.png
   :width: 1.5em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |draw| image:: /static/common/mActionDraw.png
   :width: 1.5em
.. |moderate| image:: /static/global/moderate.png
.. |newLayout| image:: /static/common/mActionNewLayout.png
   :width: 1.5em
.. |northArrow| image:: /static/common/north_arrow.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
