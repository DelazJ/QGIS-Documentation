
.. testsetup:: temporal_data

    iface = start_qgis()


.. highlight:: python
   :linenothreshold: 5

The code snippets on this page need the following imports if you're outside the pyqgis console:

.. testcode:: temporal_data

    from qgis.gui import QgsMapCanvas
    from qgis.core import (
         QgsApplication,
         QgsField,
         QgsMapRendererCustomPainterJob,
         QgsProject,
         QgsMapRendererCustomPainterJob,
         QgsMapSettings,
         QgsRectangle,
         QgsTemporalUtils,
         QgsUnitTypes,
         QgsVectorLayer,
         QgsVectorLayerTemporalProperties
    )

    from qgis.PyQt.QtCore import (
        QVariant,
        QSize
    )

    import tempfile
    import os


.. index:: Temporal data

.. _temporal_data:

******************************
Handling Temporal data in QGIS
******************************

.. contents::
   :local:

QGIS has native tools and GUI elements to handle Temporal Data.
Using PyQGIS, you can register a layer in a plugin to be used as Temporal Data.


Registering a Vector layer as Temporal
======================================

.. testcode:: temporal_data

    # load simple world layer from internal QGIS
    # currently failing in Travis because the gpgk/resources not readable by normal user...
    #iface.addVectorLayer(os.path.join(QgsApplication.pkgDataPath(),'resources','data','world_map.gpkg|layername=Countries'), '', 'ogr')

    # load geojson earthquake data of last (or 7) days from https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
    # https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson
    # https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson
    # or from file if better?
    #time_layer = iface.addVectorLayer('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson', 'earthquakes', 'ogr')
    time_layer = QgsVectorLayer('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson', 'earthquakes', 'ogr')
    print( time_layer)
    QgsProject.instance().addMapLayer(time_layer)
    canvas = iface.mapCanvas()
    # set extent to the extent of our layer
    canvas.setExtent(vlayer.extent())

    # set the map canvas layer set
    canvas.setLayers([vlayer])
    print( iface.mapCanvas().extent(), iface.mapCanvas().layers() )

.. testoutput:: temporal_data

    <QgsVectorLayer: 'earthquakes' (ogr)>
    <QgsRectangle: -188.89500000000001023 -101.60823720626630973, 188.89500000000001023 95.34233720626632191> [<QgsVectorLayer: 'earthquakes' (ogr)>]

.. testcode:: temporal_data

    # argh, this data only has datetime as epoch (seconds since 1970)
    # so we create a virtual column
    datetime_field = QgsField('datetime', QVariant.DateTime)
    time_layer.addExpressionField(' datetime_from_epoch(  "time" ) ', datetime_field)
    # now the time_layer has a column 'datetime' of type 'DateTime' needed for temporal manipulation

    # get the temporal properties of the time layer
    temporal_props = time_layer.temporalProperties()
    # set the temporal mode to 'DateTime comes from one attribute field'
    temporal_props.setMode(QgsVectorLayerTemporalProperties.ModeFeatureDateTimeInstantFromField)
    # set the 'start' of the event to be the (virtual) datetime field
    temporal_props.setStartField('datetime')

    # tell the layer props that the 'events' lasted about 1 hour (fictional)
    temporal_props.setDurationUnits(QgsUnitTypes.TemporalUnit.TemporalSeconds)
    temporal_props.setFixedDuration(3600)  # setting the LAYERS event duration

    # NOW enable the layer as 'temporal enabled'
    temporal_props.setIsActive(True) # OK

    # to update the legend (the temporal indicator) if not showing up:
    # node=QgsProject.instance().layerTreeRoot().findLayer(time_layer) # find QgsLayerTreeLayer in QgsLayerTree
    # iface.layerTreeView().model().refreshLayerLegend(node)

    # get a handle to current project and determine start and end range of ALL current temporal enabled layers
    project = QgsProject.instance()
    time_range = QgsTemporalUtils.calculateTemporalRangeForProject(project)

    # get the current responsible for the mapCanvas behaviour and Temporal Controller gui
    print( iface.mapCanvas().extent(), iface.mapCanvas().layers() )
    


.. testoutput:: temporal_data

    <QgsRectangle: -188.89500000000001023 -101.60823720626630973, 188.89500000000001023 95.34233720626632191> [<QgsVectorLayer: 'earthquakes' (ogr)>]

