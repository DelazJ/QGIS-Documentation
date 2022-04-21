***************
Getting Started
***************

.. only:: html

   .. contents::
      :local:
      :depth: 3

Installation on Debian-based systems
====================================

.. index:: Debian, Ubuntu

We will give a short and simple installation how-to for
a minimal working configuration on Debian based systems (including Ubuntu and derivatives). However, many other
distributions and OSs provide packages for QGIS Server.

.. note:: In Ubuntu you can use your regular user, prepending ``sudo`` to
  commands requiring admin permissions. In Debian you can work as admin (``root``),
  without using ``sudo``.

Requirements and steps to add official QGIS repositories to install QGIS Server on a Debian based system are
provided in `QGIS installers page <https://qgis.org/en/site/forusers/alldownloads.html>`_.
You may want to install at least the latest Long Term Release.

Once the target version repository is configured and QGIS Server installed,
you can test the installation with:

.. code-block:: bash

    /usr/lib/cgi-bin/qgis_mapserv.fcgi

If you get the following output, the server is correctly installed.

.. note:: Depending on the version of QGIS, you might see slightly different output
 reported when you run ``qgis_mapserv.fcgi``.

.. code-block::

    QFSFileEngine::open: No file name specified
    Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
    Content-Length: 206
    Content-Type: text/xml; charset=utf-8

    <ServiceExceptionReport version="1.3.0" xmlns="https://www.opengis.net/ogc">
     <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
    </ServiceExceptionReport>

.. note:: As seen below, QGIS reports a Status 400 code, which correctly
  identifies the request has failed because there is no active http session.
  This is not a bug and indicates the server is functioning properly.

.. code-block::

    Application path not initialized
    Application path not initialized
    Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
    Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
    "Loading native module /usr/lib/qgis/server/libdummy.so"
    "Loading native module /usr/lib/qgis/server/liblandingpage.so"
    "Loading native module /usr/lib/qgis/server/libwcs.so"
    "Loading native module /usr/lib/qgis/server/libwfs.so"
    "Loading native module /usr/lib/qgis/server/libwfs3.so"
    "Loading native module /usr/lib/qgis/server/libwms.so"
    "Loading native module /usr/lib/qgis/server/libwmts.so"
    QFSFileEngine::open: No file name specified
    Content-Length: 102
    Content-Type: application/json
    Server:  QGIS FCGI server - QGIS version 3.22.6-Białowieża
    Status:  400
    [{"code":"Bad request error","description":"Requested URI does not match any registered API handler"}]

Let's add a sample project. You can use your own, or one from
`Training demo data <https://github.com/qgis/QGIS-Training-Data/>`_:

.. code-block:: bash

    mkdir /home/qgis/projects/
    cd /home/qgis/projects/
    wget https://github.com/qgis/QGIS-Training-Data/archive/release_3.22.zip
    unzip release_3.22.zip
    mv QGIS-Training-Data-release_3.22/exercise_data/qgis-server-tutorial-data/world.qgs .
    mv QGIS-Training-Data-release_3.22/exercise_data/qgis-server-tutorial-data/naturalearth.sqlite .

Of course, you can use your favorite GIS software to open this file and
take a look at the configuration and available layers.

To properly deploy QGIS server you need a HTTP server. Recommended choices are
`Apache <https://httpd.apache.org/docs/>`_ or `NGINX <https://nginx.org/en/docs/>`__.
This section will cover basics of Apache; instructions for NGINX are provided
in further sections.

.. index:: Apache, mod_fcgid

.. _`httpserver`:

Apache HTTP Server
------------------

.. note:: In the following, please replace ``qgis.demo`` with the name or IP address of your server.

#. Install Apache and `mod_fcgid <https://httpd.apache.org/mod_fcgid/mod/mod_fcgid.html>`_:

   .. code-block:: bash

    apt install apache2 libapache2-mod-fcgid


#. You can run QGIS Server on your default website, but let's configure a `virtualhost
   <https://httpd.apache.org/docs/2.4/vhosts>`_ specifically for this, as follows.

   #. In the :file:`/etc/apache2/sites-available` directory, create a file
      called :file:`qgis.demo.conf`, with this content:

      .. code-block:: apacheconf

       <VirtualHost *:80>
         ServerAdmin webmaster@localhost
         ServerName qgis.demo

         DocumentRoot /var/www/html

         # Apache logs (different than QGIS Server log)
         ErrorLog ${APACHE_LOG_DIR}/qgis.demo.error.log
         CustomLog ${APACHE_LOG_DIR}/qgis.demo.access.log combined

         # Longer timeout for WPS... default = 40
         FcgidIOTimeout 120

         FcgidInitialEnv LC_ALL "en_US.UTF-8"
         FcgidInitialEnv PYTHONIOENCODING UTF-8
         FcgidInitialEnv LANG "en_US.UTF-8"

         # QGIS log
         FcgidInitialEnv QGIS_SERVER_LOG_STDERR 1
         FcgidInitialEnv QGIS_SERVER_LOG_LEVEL 0

         # default QGIS project
         SetEnv QGIS_PROJECT_FILE /home/qgis/projects/world.qgs

         # QGIS_AUTH_DB_DIR_PATH must lead to a directory writeable by the Server's FCGI process user
         FcgidInitialEnv QGIS_AUTH_DB_DIR_PATH "/home/qgis/qgisserverdb/"
         FcgidInitialEnv QGIS_AUTH_PASSWORD_FILE "/home/qgis/qgisserverdb/qgis-auth.db"

         # Set pg access via pg_service file
         SetEnv PGSERVICEFILE /home/qgis/.pg_service.conf
         FcgidInitialEnv PGPASSFILE "/home/qgis/.pgpass"

         # if qgis-server is installed from packages in debian based distros this is usually /usr/lib/cgi-bin/
         # run "locate qgis_mapserv.fcgi" if you don't know where qgis_mapserv.fcgi is
         ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
         <Directory "/usr/lib/cgi-bin/">
           AllowOverride None
           Options +ExecCGI -MultiViews -SymLinksIfOwnerMatch
           Require all granted
         </Directory>

         <IfModule mod_fcgid.c>
         FcgidMaxRequestLen 26214400
         FcgidConnectTimeout 60
         </IfModule>

       </VirtualHost>

      .. note:: Some of the above configuration options are explained in the Server
       :ref:`environment variables <server_env_variables>` and
       :ref:`pg_service file <pg-service-file>` sections.

   #. Let's now create the directories that will store the QGIS Server logs and
      the authentication database:

      .. code-block:: bash

       mkdir -p /var/log/qgis/
       chown www-data:www-data /var/log/qgis
       mkdir -p /home/qgis/qgisserverdb
       chown www-data:www-data /home/qgis/qgisserverdb

      .. note::

       ``www-data`` is the Apache user on Debian based systems and we need Apache
       to have access to those locations or files.
       The ``chown www-data...`` commands change the owner of the respective directories
       and files to ``www-data``.

#. We can now enable the virtual host and the ``fcgid`` mod if it's not already done:

   .. code-block:: bash

    a2enmod fcgid
    a2ensite qgis.demo

#. Now restart Apache for the new configuration to be taken into account:

   .. code-block:: bash

    systemctl restart apache2

#. Now that Apache knows that he should answer requests to http://qgis.demo
   we also need to setup the client system so that it knows who ``qgis.demo``
   is. We do that by adding ``127.0.0.1 qgis.demo`` in the
   `hosts <https://en.wikipedia.org/wiki/Hosts_%28file%29>`_ file.

   .. code-block:: bash

     # Replace 127.0.0.1 with the IP of your server.
     sh -c "echo '127.0.0.1 qgis.demo' >> /etc/hosts"``.

.. important::

   Remember that both the :file:`qgis.demo.conf` and :file:`/etc/hosts` files should
   be configured for your setup to work.
   You can also test the access to your QGIS Server from other clients on the
   network (e.g. Windows or macos machines) by going to their :file:`/etc/hosts`
   file and point the ``qgis.demo`` name to whatever IP the server machine has on the
   network (not ``127.0.0.1`` as it is the local IP, only accessible from the
   local machine).  On ``*nix`` machines the
   :file:`hosts` file is located in :file:`/etc`, while on Windows it's under
   the :file:`C:\\Windows\\System32\\drivers\\etc` directory. Under Windows you
   need to start your text editor with administrator privileges before opening
   the hosts file.

QGIS Server is now available at http://qgis.demo. To check, type in a browser, as in the simple case:

::

 http://qgis.demo/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities


Installation on Windows
=======================

.. index:: Windows

QGIS Server can also be installed on Windows systems. While the QGIS Server
package is available in the 64 bit version of the OSGeo4W network installer
(https://qgis.org/en/site/forusers/download.html) there is no Apache (or other
web server) package available, so this must be installed by other means.

A simple procedure is the following:

#. Download the XAMPP installer (https://www.apachefriends.org/download.html)
   for Windows and install Apache

   .. figure:: img/qgis_server_windows1.png
     :align: center

#. Download the OSGeo4W installer, follow the "Advanced Install" and install
   both the QGIS Desktop and QGIS Server packages

   .. figure:: img/qgis_server_windows2.png
     :align: center

#. Edit the httpd.conf file (:file:`C:\\xampp\\apache\\conf\\httpd.conf`
   if the default installation paths have been used) and make the following changes:

   From:

   .. code-block:: apache

    ScriptAlias /cgi-bin/ "C:/xampp/cgi-bin/"


   To:

   .. code-block:: apache

    ScriptAlias /cgi-bin/ "C:/OSGeo4W64/apps/qgis/bin/"


   From:

   .. code-block:: apache

    <Directory "C:/xampp/cgi-bin">
        AllowOverride None
        Options None
        Require all granted
    </Directory>


   To:

   .. code-block:: apache

    <Directory "C:/OSGeo4W64/apps/qgis/bin">
        SetHandler cgi-script
        AllowOverride None
        Options ExecCGI
        Order allow,deny
        Allow from all
        Require all granted
    </Directory>


   From:

   .. code-block:: apache

    AddHandler cgi-script .cgi .pl .asp


   To:

   .. code-block:: apache

    AddHandler cgi-script .cgi .pl .asp .exe


#. Then at the bottom of httpd.conf add:

   .. code-block:: apache

    SetEnv GDAL_DATA "C:\OSGeo4W64\share\gdal"
    SetEnv QGIS_AUTH_DB_DIR_PATH "C:\OSGeo4W64\apps\qgis\resources"
    SetEnv PYTHONHOME "C:\OSGeo4W64\apps\Python37"
    SetEnv PATH "C:\OSGeo4W64\bin;C:\OSGeo4W64\apps\qgis\bin;C:\OSGeo4W64\apps\Qt5\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem"
    SetEnv QGIS_PREFIX_PATH "C:\OSGeo4W64\apps\qgis"
    SetEnv QT_PLUGIN_PATH "C:\OSGeo4W64\apps\qgis\qtplugins;C:\OSGeo4W64\apps\Qt5\plugins"


#. Restart the Apache web server from the XAMPP Control Panel and open browser window to testing
   a GetCapabilities request to QGIS Server

   ::

    http://qgis.demo/cgi-bin/qgis_mapserv.fcgi.exe?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities


Serve a project
===============

Now that QGIS Server is installed and running, we just have to use it.

Obviously, we need a QGIS project to work on. Of course, you can fully
customize your project by defining contact information, precise some
restrictions on CRS or even exclude some layers. Everything you need to know
about that is described later in :ref:`Creatingwmsfromproject`.

But for now, we are going to use a simple project already configured and
previously downloaded in :file:`/home/qgis/projects/world.qgs`, as described above.

By opening the project and taking a quick look on layers, we know that 4
layers are currently available:

- airports
- places
- countries
- countries_shapeburst

You don't have to understand the full request for now but you may retrieve
a map with some of the previous layers thanks to QGIS Server by doing something
like this in your web browser to retrieve the *countries* layer:

.. code-block:: bash

  http://qgis.demo/qgisserver?
    MAP=/home/qgis/projects/world.qgs&
    LAYERS=countries&
    SERVICE=WMS&
    VERSION=1.3.0&
    REQUEST=GetMap&
    CRS=EPSG:4326&
    WIDTH=400&
    HEIGHT=200&
    BBOX=-90,-180,90,180

If you obtain the next image, then QGIS Server is running correctly:

.. figure:: img/server_basic_getmap.png
  :align: center

  Server response to a basic GetMap request

Note that you may define **QGIS_PROJECT_FILE** environment variable to use a project
by default instead of giving a **MAP** parameter (see :ref:`qgis-server-envvar`).

For example with spawn-fcgi:

.. code-block:: bash

 export QGIS_PROJECT_FILE=/home/qgis/projects/world.qgs
 spawn-fcgi -f /usr/lib/bin/cgi-bin/qgis_mapserv.fcgi \
            -s /var/run/qgisserver.socket \
            -U www-data -G www-data -n

.. _`Creatingwmsfromproject`:

Configure your project
======================

To provide a new QGIS Server WMS, WFS or WCS, you have to create a QGIS project
file with some data or use one of your current project. Define the colors and
styles of the layers in QGIS and the project CRS, if not already defined.

.. _figure_server_definitions:

.. figure:: img/ows_server_definition.png
   :align: center

   Definitions for a QGIS Server WMS/WFS/WCS project

Then, go to the :guilabel:`QGIS Server` menu of the
:menuselection:`Project --> Properties...` dialog and provide
some information about the OWS in the fields under
:guilabel:`Service Capabilities`.
This will appear in the GetCapabilities response of the WMS, WFS or WCS.
If you don't check |checkbox| :guilabel:`Service capabilities`,
QGIS Server will use the information given in the :file:`wms_metadata.xml` file
located in the :file:`cgi-bin` folder.

WMS capabilities
----------------

In the :guilabel:`WMS capabilities` section, you can define
the extent advertised in the WMS GetCapabilities response by entering
the minimum and maximum X and Y values in the fields under
:guilabel:`Advertised extent`.
Clicking :guilabel:`Use Current Canvas Extent` sets these values to the
extent currently displayed in the QGIS map canvas.
By checking |checkbox| :guilabel:`CRS restrictions`, you can restrict
in which coordinate reference systems (CRS) QGIS Server will offer
to render maps. It is recommended that you restrict the offered CRS as this
reduces the size of the WMS GetCapabilities response.
Use the |symbologyAdd| button below to select those CRSs
from the Coordinate Reference System Selector, or click :guilabel:`Used`
to add the CRSs used in the QGIS project to the list.

If you have print layouts defined in your project, they will be listed in the
``GetProjectSettings`` response, and they can be used by the GetPrint request to
create prints, using one of the print layouts as a template.
This is a QGIS-specific extension to the WMS 1.3.0 specification.
If you want to exclude any print layout from being published by the WMS,
check |checkbox| :guilabel:`Exclude layouts` and click the
|symbologyAdd| button below.
Then, select a print layout from the :guilabel:`Select print layout` dialog
in order to add it to the excluded layouts list.

If you want to exclude any layer or layer group from being published by the
WMS, check |checkbox| :guilabel:`Exclude Layers` and click the
|symbologyAdd| button below.
This opens the :guilabel:`Select restricted layers and groups` dialog, which
allows you to choose the layers and groups that you don't want to be published.
Use the :kbd:`Shift` or :kbd:`Ctrl` key if you want to select multiple entries.
It is recommended that you exclude from publishing the layers that you don't
need as this reduces the size of the WMS GetCapabilities response which leads
to faster loading times on the client side.

If you check |checkbox| :guilabel:`Use layer ids as name`, layer ids will be
used to reference layers in the ``GetCapabilities`` response or ``GetMap LAYERS``
parameter. If not, layer name or short name if defined (see :ref:`vectorservermenu`)
is used.

You can receive requested GetFeatureInfo as plain text, XML and GML. The default is XML.

.. _`addGeometryToFeatureResponse` :

If you wish, you can check |checkbox| :guilabel:`Add geometry to feature response`.
This will include the bounding box for each feature in the GetFeatureInfo response.
See also the :ref:`WITH_GEOMETRY <wms_getfeatureinfo>` parameter.

As many web clients can’t display circular arcs in geometries you have the option
to segmentize the geometry before sending it to the client in a GetFeatureInfo
response. This allows such clients to still display a feature’s geometry
(e.g. for highlighting the feature). You need to check the
|checkbox| :guilabel:`Segmentize feature info geometry` to activate the option.

You can also use the :guilabel:`GetFeatureInfo geometry precision` option to
set the precision of the GetFeatureInfo geometry. This enables you to save
bandwidth when you don't need the full precision.

If you want QGIS Server to advertise specific request URLs
in the WMS GetCapabilities response, enter the corresponding URL in the
:guilabel:`Advertised URL` field.

Furthermore, you can restrict the maximum size of the maps returned by the
GetMap request by entering the maximum width and height into the respective
fields under :guilabel:`Maximums for GetMap request`.

You can change the :guilabel:`Quality for JPEG images` factor. The quality factor must be
in the range 0 to 100. Specify 0 for maximum compression, 100 for no compression.

You can change the limit for atlas features to be printed in one request by setting the
:guilabel:`Maximum features for Atlas print requests` field.

When QGIS Server is used in tiled mode (see :ref:`TILED parameter <wms_tiled>`), you can set the
:guilabel:`Tile buffer in pixels`. The recommended value is the size of the largest
symbol or line width in your QGIS project.

If one of your layers uses the :ref:`Map Tip display <maptips>` (i.e. to show text using
expressions) this will be listed inside the GetFeatureInfo output. If the
layer uses a Value Map for one of its attributes, this information will also
be shown in the GetFeatureInfo output.

WFS capabilities
----------------

In the :guilabel:`WFS capabilities` area you can select the layers you
want to publish as WFS, and specify if they will allow update, insert and
delete operations.
If you enter a URL in the :guilabel:`Advertised URL` field of the
:guilabel:`WFS capabilities` section, QGIS Server will advertise this specific
URL in the WFS GetCapabilities response.

WCS capabilities
----------------

In the :guilabel:`WCS capabilities` area, you can select the layers that you
want to publish as WCS. If you enter a URL in the :guilabel:`Advertised URL`
field of the :guilabel:`WCS capabilities` section, QGIS Server will advertise
this specific URL in the WCS GetCapabilities response.

Fine tuning your OWS
----------------------

For vector layers, the :guilabel:`Fields` menu of the :menuselection:`Layer -->
Layer Properties` dialog allows you to define for each
attribute if it will be published or not.
By default, all the attributes are published by your WMS and WFS.
If you don't want a specific attribute to be published, uncheck the corresponding
checkbox in the :guilabel:`WMS` or :guilabel:`WFS` column.

You can overlay watermarks over the maps produced by your WMS by adding text
annotations or SVG annotations to the project file.
See the :ref:`sec_annotations` section for instructions on
creating annotations. For annotations to be displayed as watermarks on the WMS
output, the :guilabel:`Fixed map position` checkbox in the
:guilabel:`Annotation text` dialog must be unchecked.
This can be accessed by double clicking the annotation while one of the
annotation tools is active.
For SVG annotations, you will need either to set the project to save absolute
paths (in the :guilabel:`General` menu of the
:menuselection:`Project --> Properties...` dialog) or to manually modify
the path to the SVG image so that it represents a valid relative path.


Integration with third parties
==============================

QGIS Server provides standard OGC web services like `WMS, WFS, etc. <https://www.ogc.org/docs/is>`_
thus it can be used by a wide variety of end user tools.

Integration with QGIS Desktop
-----------------------------

QGIS Desktop is the map designer where QGIS Server is the map server. The maps or
QGIS projects will be served by the QGIS Server to provide OGC standards. These QGIS
projects can either be files or entries in a database (by using
:menuselection:`Project --> Save to --> PostgreSQL` in QGIS Desktop).

Furthermore, dedicated update workflow must be established to refresh a project used
by a QGIS Server (ie. copy project files into server location and restart QGIS
Server). For now, automated processes (as server reloading over message queue
service) are not implemented yet.


Integration with MapProxy
-------------------------

`MapProxy <https://mapproxy.org/>`_ is a tile cache server and as it can read and
serve any WMS/WMTS map server, it can be directly connected to QGIS server web
services and improve end user experience.


Integration with QWC2
---------------------

`QWC2 <https://github.com/qgis/qwc2>`_ is a responsive web application dedicated to
QGIS Server. It helps you to build a highly customized map viewer with layer
selection, feature info, etc.. Also many plugins are available like authentication or
print service, the full list is available is this `repository
<https://github.com/qwc-services>`_.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
