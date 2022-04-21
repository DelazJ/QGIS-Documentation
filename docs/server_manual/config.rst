.. index::
    pair: Environment; QGIS Server

.. _server_env_variables:

**********************
Advanced configuration
**********************

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. index::
    pair: Logging; QGIS Server

.. _qgis-server-logging:

Logging
=======

To log requests sent to the server, you have to set the following environment
variable:

- :ref:`QGIS_SERVER_LOG_STDERR <qgis_server_log_stderr>`

With the following variables the logging can be further customized:

- :ref:`QGIS_SERVER_LOG_LEVEL <qgis_server_log_level>`
- :ref:`QGIS_SERVER_LOG_PROFILE <qgis_server_log_profile>`


.. _`qgis-server-envvar`:

Environment variables
=====================

You can configure some aspects of QGIS Server by setting **environment
variables**.

According to the HTTP server and how you run QGIS Server, there are
several ways to define these variables. This is fully described in
:ref:`httpserver`.


.. list-table::
   :header-rows: 1
   :widths: 30 40 15 15

   * - Name
     - Description
     - Default
     - Services

   * - QGIS_OPTIONS_PATH
     - Specifies the path to the directory with settings. It works the same way as
       QGIS application ``--optionspath`` option. It is looking for settings file in
       ``<QGIS_OPTIONS_PATH>/QGIS/QGIS3.ini``.
     - ''
     - All

   * - QGIS_PLUGINPATH
     - Useful if you are using Python plugins for the server, this sets the folder
       that is searched for Python plugins.
     - ''
     - All

   * - QGIS_PROJECT_FILE
     - The ``.qgs`` or ``.qgz`` project file, normally passed as a parameter in the
       query string (with *MAP*), you can also set it as an environment variable (for
       example by using ``mod_rewrite`` Apache module).

       Note that you may also indicate a project stored in PostgreSQL, e.g.
       ``postgresql://localhost:5432?sslmode=disable&dbname=mydb&schema=myschema&project=myproject``.
     - ''
     - All

   * - QGIS_SERVER_API_RESOURCES_DIRECTORY
     - Base directory for all OGC API (such as OAPIF/WFS3) static resources (HTML
       templates, CSS, JS, ...)
     - depends on packaging
     - WFS

   * - QGIS_SERVER_API_WFS3_MAX_LIMIT
     - Maximum value for ``limit`` in a features request.
     - 10000
     - WFS

   * - QGIS_SERVER_CACHE_DIRECTORY
     - Specifies the network cache directory on the filesystem.
     - ``cache`` in profile directory
     - All

   * - QGIS_SERVER_CACHE_SIZE
     - Sets the network cache size in MB.
     - 50 MB
     - All

   * - QGIS_SERVER_DISABLE_GETPRINT
     - This is an option at the project level to improve project read time by disabling
       loading of layouts.

       Activating this option disables the QGIS WMS GetPrint request.
       Set this QGIS project flag to not load layouts.
     - false
     - WMS

   * - QGIS_SERVER_IGNORE_BAD_LAYERS
     - "Bad" layers are layers that cannot be loaded. The default behavior of QGIS Server
       is to consider the project as not available if it contains a bad layer.

       The default behavior can be overridden by setting this variable to ``1`` or ``true``.
       In this case, "bad" layers will just be ignored, and the project will be considered
       valid and available.
     - false
     - All

   * - .. _qgis_server_landing_page_projects_directories:

       QGIS_SERVER_LANDING_PAGE_PROJECTS_DIRECTORIES
     - Directories used by the landing page service to find .qgs and .qgz projects
     - ""
     - All

   * - .. _qgis_server_landing_page_projects_pg_connections:

       QGIS_SERVER_LANDING_PAGE_PROJECTS_PG_CONNECTIONS
     - PostgreSQL connection strings used by the landing page service to find projects
     - ""
     - All

   * - .. _qgis_server_log_file:

       QGIS_SERVER_LOG_FILE
     - Specify path and filename. Make sure that server has proper permissions for
       writing to file. File should be created automatically, just send some requests
       to server. If it's not there, check permissions.

       .. warning:: QGIS_SERVER_LOG_FILE is deprecated since QGIS 3.4, use QGIS_SERVER_LOG_STDERR instead.
         File logging support will be removed in QGIS 4.0.
     - ''
     - All

   * - .. _qgis_server_log_level:

       QGIS_SERVER_LOG_LEVEL
     - Specify desired log level. Available values are:

       * ``0`` or ``INFO`` (log all requests)
       * ``1`` or ``WARNING``
       * ``2`` or ``CRITICAL`` (log just critical errors, suitable for production purposes)
     - 0
     - All

   * - .. _qgis_server_log_profile:

       QGIS_SERVER_LOG_PROFILE
     - Add detailed profile information to the logs, only effective when QGIS_SERVER_LOG_LEVEL=0
     - false
     - All

   * - .. _qgis_server_log_stderr:

       QGIS_SERVER_LOG_STDERR
     - Activate logging to stderr. This variable  has no effect when ``QGIS_SERVER_LOG_FILE``
       is set.

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - All

   * - QGIS_SERVER_MAX_THREADS
     - Number of threads to use when parallel rendering is activated. If value is ``-1`` it
       uses the number of processor cores.
     - -1
     - All

   * - QGIS_SERVER_OVERRIDE_SYSTEM_LOCALE
     - Sets LOCALE to be used by QGIS server. The default value is empty (no override).

       Example: ``de_CH.utf8``
     - ''
     - All

   * - QGIS_SERVER_PARALLEL_RENDERING
     - Activates parallel rendering for WMS GetMap requests. It's disabled (``false``)
       by default. Available values are:

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - WMS

   * - QGIS_SERVER_SHOW_GROUP_SEPARATOR
     - Defines whether a group separator (e.g. thousand separator) should be used for
       numeric values (e.g. in GetFeatureInfo responses). The default value is ``0``.

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - WMS

   * - QGIS_SERVER_TRUST_LAYER_METADATA
     - This is an option at the project level to improve project read time by using the vector
       layer extents defined in the project metadata and disabling the check for
       PostgreSQL/PostGIS layer primary key uniqueness.

       Trusting layer metadata can be forced by setting this variable to ``1`` or ``true``.
       The vector layer's extent will then be the one defined in the project, and the
       PostgreSQL/PostGIS layer's primary key defined in the data source is
       considered as unique without a check.

       Do not use it if layers' extent is not fixed during the project's use.
     - false
     - All

   * - QGIS_SERVER_WMS_MAX_HEIGHT / QGIS_SERVER_WMS_MAX_WIDTH
     - Maximum height/width for a WMS request. The most conservative between this and the project one is used.
       If the value is ``-1``, it means that there is no maximum set.
     - -1
     - WMS

   * - QUERY_STRING
     - The query string, normally passed by the web server. This variable can be
       useful while testing QGIS server binary from the command line.

       For example for testing a GetCapabilities request on the command line
       to a project that also requires a PostgreSQL connection defined in a
       pg_service.conf file:

       .. code-block:: bash

        PGSERVICEFILE=/etc/pg_service.conf \
	QUERY_STRING="MAP=/home/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities" \
	/usr/lib/cgi-bin/qgis_mapserv.fcgi

       The result should be either the content of the GetCapabilities response or,
       if something is wrong, an error message.
     - ''
     - All


Settings summary
================

When QGIS Server is starting, you have a summary of all configurable parameters
thanks to environment variables. Moreover, the value currently used and
the origin is also displayed.

For example with spawn-fcgi:

.. code-block:: bash

 export QGIS_OPTIONS_PATH=/home/user/.local/share/QGIS/QGIS3/profiles/default/
 export QGIS_SERVER_LOG_STDERR=1
 export QGIS_SERVER_LOG_LEVEL=2
 spawn-fcgi -f /usr/lib/cgi-bin/qgis_mapserv.fcgi -s /tmp/qgisserver.sock -U www-data -G www-data -n

  QGIS Server Settings:

    - QGIS_OPTIONS_PATH / '' (Override the default path for user configuration): '/home/user/.local/share/QGIS/QGIS3/profiles/default/' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_PARALLEL_RENDERING / '/qgis/parallel_rendering' (Activate/Deactivate parallel rendering for WMS getMap request): 'true' (read from INI_FILE)

    - QGIS_SERVER_MAX_THREADS / '/qgis/max_threads' (Number of threads to use when parallel rendering is activated): '4' (read from INI_FILE)

    - QGIS_SERVER_LOG_LEVEL / '' (Log level): '2' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_LOG_STDERR / '' (Activate/Deactivate logging to stderr): '1' (read from ENVIRONMENT_VARIABLE)

    - QGIS_PROJECT_FILE / '' (QGIS project file): '' (read from DEFAULT_VALUE)

    - MAX_CACHE_LAYERS / '' (Specify the maximum number of cached layers): '100' (read from DEFAULT_VALUE)

    - QGIS_SERVER_CACHE_DIRECTORY / '/cache/directory' (Specify the cache directory): '/root/.local/share/QGIS/QGIS3/profiles/default/cache' (read from DEFAULT_VALUE)

    - QGIS_SERVER_CACHE_SIZE / '/cache/size' (Specify the cache size): '52428800' (read from INI_FILE)

  Ini file used to initialize settings: /home/user/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini

In this particular case, we know that **QGIS_SERVER_MAX_THREADS** and
**QGIS_SERVER_PARALLEL_RENDERING** values are read from the ini file found in
**QGIS_OPTIONS_PATH** directory (which is defined through an environment variable).
The corresponding entries in the ini file are **/qgis/max_threads** and
**/qgis/parallel_rendering** and their values are **true** and **4** threads.


Connection to service file
==========================

In order to make apache aware of the PostgreSQL service file (see the
:ref:`pg-service-file` section) you need to make
your :file:`*.conf` file look like:

.. code-block:: apache

   SetEnv PGSERVICEFILE /home/web/.pg_service.conf

   <Directory "/home/web/apps2/bin/">
     AllowOverride None
   .....


.. _add_fonts:

Add fonts to your linux server
==============================

Keep in mind that you may use QGIS projects that point to fonts that
may not exist by default on other machines. This means that if you share the project,
it may look different on other machines (if the fonts don't exist on the target machine).

In order to ensure this does not happen you just need to install the missing fonts on the target machine.
Doing this on desktop systems is usually trivial (double clicking the fonts).

For linux, if you don't have a desktop environment installed (or you prefer the command line) you need to:

* On Debian based systems:

  .. code-block:: bash

   sudo su
   mkdir -p /usr/local/share/fonts/truetype/myfonts && cd /usr/local/share/fonts/truetype/myfonts

   # copy the fonts from their location
   cp /fonts_location/* .

   chown root *
   cd .. && fc-cache -f -v

* On Fedora based systems:

  .. code-block:: bash

   sudo su
   mkdir /usr/share/fonts/myfonts && cd /usr/share/fonts/myfonts

   # copy the fonts from their location
   cp /fonts_location/* .

   chown root *
   cd .. && fc-cache -f -v



.. index:: nginx, spawn-fcgi, fcgiwrap

NGINX HTTP Server
=================

.. note:: In the following, please replace ``qgis.demo`` with the name or IP address of your server.

You can also use QGIS Server with `NGINX <https://nginx.org/>`_. Unlike Apache,
NGINX does not automatically spawn FastCGI processes. The FastCGI processes are
to be started by something else.

Install NGINX:

.. code-block:: bash

 apt install nginx


* As a first option, you can use **spawn-fcgi** or **fcgiwrap** to start and manage the
  QGIS Server processes.
  Official Debian packages exist for both.
  When you have no X server running and you need, for example,
  printing, you can use :ref:`xvfb <xvfb>`.

* Another option is to rely on **Systemd**, the init system for GNU/Linux that most
  Linux distributions use today.
  One of the advantages of this method is that it requires no other components or
  processes.
  It’s meant to be simple, yet robust and efficient for production deployments.

NGINX Configuration
-------------------

The **include fastcgi_params;** used in the previous configuration is important,
as it adds the parameters from :file:`/etc/nginx/fastcgi_params`:

.. code-block:: nginx

 fastcgi_param  QUERY_STRING       $query_string;
 fastcgi_param  REQUEST_METHOD     $request_method;
 fastcgi_param  CONTENT_TYPE       $content_type;
 fastcgi_param  CONTENT_LENGTH     $content_length;

 fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;
 fastcgi_param  REQUEST_URI        $request_uri;
 fastcgi_param  DOCUMENT_URI       $document_uri;
 fastcgi_param  DOCUMENT_ROOT      $document_root;
 fastcgi_param  SERVER_PROTOCOL    $server_protocol;
 fastcgi_param  REQUEST_SCHEME     $scheme;
 fastcgi_param  HTTPS              $https if_not_empty;

 fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
 fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;

 fastcgi_param  REMOTE_ADDR        $remote_addr;
 fastcgi_param  REMOTE_PORT        $remote_port;
 fastcgi_param  SERVER_ADDR        $server_addr;
 fastcgi_param  SERVER_PORT        $server_port;
 fastcgi_param  SERVER_NAME        $server_name;

 # PHP only, required if PHP was built with --enable-force-cgi-redirect
 fastcgi_param  REDIRECT_STATUS    200;

Moreover, you can use some :ref:`qgis-server-envvar` to configure QGIS Server.
In the NGINX configuration file, :file:`/etc/nginx/nginx.conf`, you have to use
``fastcgi_param`` instruction to define these variables as shown below:

.. code-block:: nginx

    location /qgisserver {
         gzip           off;
         include        fastcgi_params;
         fastcgi_param  QGIS_SERVER_LOG_STDERR  1;
         fastcgi_param  QGIS_SERVER_LOG_LEVEL   0;
         fastcgi_pass   unix:/var/run/qgisserver.socket;
     }

FastCGI wrappers
----------------

.. warning::

  **fcgiwrap** is easier to set up than **spawn-fcgi**, because it's already wrapped
  in a Systemd service. But it also leads to a solution that is much slower
  than using spawn-fcgi. With fcgiwrap, a new QGIS Server process is created
  on each request, meaning that the QGIS Server initialization process, which
  includes reading and parsing the QGIS project file, is done on each request.
  With spawn-fcgi, the QGIS Server process remains alive between requests,
  resulting in much better performance. For that reason, spawn-fcgi
  is recommended for production use.

spawn-fcgi
..........

If you want to use `spawn-fcgi <https://redmine.lighttpd.net/projects/spawn-fcgi/wiki>`_,
the first step is to install the package:

.. code-block:: bash

  apt install spawn-fcgi


Then, introduce the following block in your NGINX server configuration:

.. code-block:: nginx

     location /qgisserver {
         gzip           off;
         include        fastcgi_params;
         fastcgi_pass   unix:/var/run/qgisserver.socket;
     }

And restart NGINX to take into account the new configuration:

.. code-block:: bash

  systemctl restart nginx

Finally, considering that there is no default service file for spawn-fcgi, you
have to manually start QGIS Server in your terminal:

.. code-block:: bash

 spawn-fcgi -s /var/run/qgisserver.socket \
                 -U www-data -G www-data -n \
                 /usr/lib/cgi-bin/qgis_mapserv.fcgi

QGIS Server is now available at http://qgis.demo/qgisserver.

.. note::

    When using spawn-fcgi, you may directly define environment variables
    before running the server. For example:
    ``export QGIS_SERVER_LOG_STDERR=1``

Of course, you can add an init script to start QGIS Server at boot time or whenever you want.
For example with **systemd**, edit the file
:file:`/etc/systemd/system/qgis-server.service` with this content:

.. code-block:: ini

    [Unit]
    Description=QGIS server
    After=network.target

    [Service]
    ;; set env var as needed
    ;Environment="LANG=en_EN.UTF-8"
    ;Environment="QGIS_SERVER_PARALLEL_RENDERING=1"
    ;Environment="QGIS_SERVER_MAX_THREADS=12"
    ;Environment="QGIS_SERVER_LOG_LEVEL=0"
    ;Environment="QGIS_SERVER_LOG_STDERR=1"
    ;; or use a file:
    ;EnvironmentFile=/etc/qgis-server/env

    ExecStart=spawn-fcgi -s /var/run/qgisserver.socket -U www-data -G www-data -n /usr/lib/cgi-bin/qgis_mapserv.fcgi

    [Install]
    WantedBy=multi-user.target

Then enable and start the service:

.. code-block:: bash

 systemctl enable --now qgis-server

.. warning::

  With the above commands spawn-fcgi spawns only one QGIS Server process.

fcgiwrap
........

Using `fcgiwrap <https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/>`_
is much easier to setup than **spawn-fcgi** but it's much slower.
You first have to install the corresponding package:

.. code-block:: bash

 apt install fcgiwrap

Then, introduce the following block in your NGINX server configuration:

.. code-block:: nginx
   :linenos:

     location /qgisserver {
         gzip           off;
         include        fastcgi_params;
         fastcgi_pass   unix:/var/run/fcgiwrap.socket;
         fastcgi_param  SCRIPT_FILENAME /usr/lib/cgi-bin/qgis_mapserv.fcgi;
     }

Finally, restart NGINX and **fcgiwrap** to take into account the new configuration:

.. code-block:: bash

 systemctl restart nginx
 systemctl restart fcgiwrap

QGIS Server is now available at http://qgis.demo/qgisserver.



Systemd
-------

QGIS Server needs a running X Server to be fully usable, in particular for printing. In the case you already have a
running X Server, you can use systemd services.

This method, to deploy QGIS Server, relies on two Systemd units:

* a `Socket unit <https://www.freedesktop.org/software/systemd/man/systemd.socket.html>`_
* and a `Service unit <https://www.freedesktop.org/software/systemd/man/systemd.service.html>`_.

The **QGIS Server Socket unit** defines and creates a file system socket,
used by NGINX to start and communicate with QGIS Server.
The Socket unit has to be configured with ``Accept=false``, meaning that the
calls to the ``accept()`` system call are delegated to the process created by
the Service unit.
It is located in :file:`/etc/systemd/system/qgis-server@.socket`, which is actually
a template:

.. code-block:: ini

 [Unit]
 Description=QGIS Server Listen Socket (instance %i)

 [Socket]
 Accept=false
 ListenStream=/var/run/qgis-server-%i.sock
 SocketUser=www-data
 SocketGroup=www-data
 SocketMode=0600

 [Install]
 WantedBy=sockets.target

Now enable and start sockets:

.. code-block:: bash

 for i in 1 2 3 4; do systemctl enable --now qgis-server@$i.socket; done

The **QGIS Server Service unit** defines and starts the QGIS Server process.
The important part is that the Service process’ standard input is connected to
the socket defined by the Socket unit.
This has to be configured using ``StandardInput=socket`` in the Service unit
configuration located in :file:`/etc/systemd/system/qgis-server@.service`:

.. code-block:: ini

 [Unit]
 Description=QGIS Server Service (instance %i)

 [Service]
 User=www-data
 Group=www-data
 StandardOutput=null
 StandardError=journal
 StandardInput=socket
 ExecStart=/usr/lib/cgi-bin/qgis_mapserv.fcgi
 EnvironmentFile=/etc/qgis-server/env

 [Install]
 WantedBy=multi-user.target

.. note::
 The QGIS Server :ref:`environment variables <qgis-server-envvar>`
 are defined in a separate file, :file:`/etc/qgis-server/env`.
 It could look like this:

 .. code-block:: make

   QGIS_PROJECT_FILE=/etc/qgis/myproject.qgs
   QGIS_SERVER_LOG_STDERR=1
   QGIS_SERVER_LOG_LEVEL=3

Now start socket service:

.. code-block:: bash

 for i in 1 2 3 4; do systemctl enable --now qgis-server@$i.service; done

Finally, for the NGINX HTTP server, lets introduce the configuration for this setup:

.. code-block:: nginx

 upstream qgis-server_backend {
    server unix:/var/run/qgis-server-1.sock;
    server unix:/var/run/qgis-server-2.sock;
    server unix:/var/run/qgis-server-3.sock;
    server unix:/var/run/qgis-server-4.sock;
 }

 server {
    …

    location /qgis-server {
        gzip off;
        include fastcgi_params;
        fastcgi_pass qgis-server_backend;
    }
 }

Now restart NGINX for the new configuration to be taken into account:

.. code-block:: bash

 systemctl restart nginx

Thanks to Oslandia for sharing `their tutorial <https://oslandia.com/en/2018/11/23/deploying-qgis-server-with-systemd/>`_.

.. _xvfb:

Setting a virtual X environment
===============================

QGIS Server needs a running X Server to be fully usable, in particular for printing.
On servers it is usually recommended not to install it, so you may use ``xvfb``
to have a virtual X environment.

If you're running the Server in graphic/X11 environment then there is no need to install xvfb.
More info at https://www.itopen.it/qgis-server-setup-notes/.

To install the package:

.. code-block:: bash

 apt install xvfb

Create the service file, :file:`/etc/systemd/system/xvfb.service`, with this content:

.. code-block:: ini

  [Unit]
  Description=X Virtual Frame Buffer Service
  After=network.target

  [Service]
  ExecStart=/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset

  [Install]
  WantedBy=multi-user.target

Enable, start and check the status of the ``xvfb.service``:

.. code-block:: bash

   systemctl enable --now xvfb.service
   systemctl status xvfb.service

Then, according to your HTTP server, you should configure the **DISPLAY**
parameter or directly use **xvfb-run**.

With Apache
-----------

Then you can configure the **DISPLAY** parameter.

With Apache you just add to your *FastCGI* configuration (see above):

.. code-block:: apache

  FcgidInitialEnv DISPLAY       ":99"


Now restart Apache for the new configuration to be taken into account:

.. code-block:: bash

  systemctl restart apache2

With NGINX
----------

Then you can directly use **xvfb-run** or configure the **DISPLAY** parameter.

* With spawn-fcgi using ``xvfb-run``:

  .. code-block:: bash

   xvfb-run /usr/bin/spawn-fcgi -f /usr/lib/cgi-bin/qgis_mapserv.fcgi \
                                -s /tmp/qgisserver.socket \
                                -G www-data -U www-data -n

* With the **DISPLAY** environment variable in the HTTP server configuration.

  .. code-block:: nginx

   fastcgi_param  DISPLAY       ":99";
