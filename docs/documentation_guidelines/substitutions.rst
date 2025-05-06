.. _substitutions:

*************
Substitutions
*************

.. contents::
   :local:

Usage
=====

To ease the use of icons in QGIS manuals, replacements are defined
for each icon in :file:`/source/substitutions.txt` file at `QGIS-Documentation repository
<https://github.com/qgis/QGIS-Documentation>`_ and some of these substitutions
are listed below.
Thus, when you want to use an icon from QGIS application in the documentation
there is a big chance that there is already a substitution that can/should be used.

If no replacement exists:

#. check the documentation repository whether the icon is available in
   :file:`/static/common` folder. If no image, then you need to find and
   copy the icon image file from `QGIS repository <https://github.com/qgis/QGIS>`_
   (often under :source:`default themes <images/themes/default>` folder)
   and paste (in ``.png`` format) under :file:`/static/common` folder.
   For convenience and update, it's advised to keep filename when possible.
#. create the reference to the substitution in the :file:`/substitutions.txt`
   file following the example below.
   The replacement text should be derived from file name and in camelCase:

   ::

     .. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
        :width: 1.5em
     .. |splitLayer| image:: /static/common/split_layer.png
        :width: 1.5em

#. Update the target section(s) of the docs, using your new substitution.
#. (optional but highly desirable) add the substitution to the list below.
#. Add the new substitution reference in the substitutions list at the end of the file(s)
   it is used in, or run the convenient :file:`scripts/find_set_subst.py` script.

   .. code-block:: py

     # from the repository main folder
     python3 scripts/find_set_subst.py

Common Substitutions
====================

Below are given some icons and their substitution to use when writing documentation.
Can be used/found in many places in manuals.

Platform Icons
..............

==========  ===============  ==========  ===============
Icon        Substitution     Icon        Substitution
==========  ===============  ==========  ===============
|logo|      ``|logo|``
|kde|       ``|kde|``        |nix|       ``|nix|``
|osx|       ``|osx|``        |win|       ``|win|``
==========  ===============  ==========  ===============


Menu Items
..........

=======================  =========================  =====================  =========================
Icon                     Substitution               Icon                   Substitution
=======================  =========================  =====================  =========================
|checkbox|               ``|checkbox|``             |unchecked|            ``|unchecked|``
|radioButtonOn|          ``|radioButtonOn|``        |radioButtonOff|       ``|radioButtonOff|``
|selectNumber|           ``|selectNumber|``         |selectString|         ``|selectString|``
|selectColor|            ``|selectColor|``          |selectColorRamp|      ``|selectColorRamp|``
|tab|                    ``|tab|``                  |degrees|              ``|degrees|``
|inputText|              ``|inputText|``            |slider|               ``|slider|``
|hamburgerMenu|          ``|hamburgerMenu|``
=======================  =========================  =====================  =========================


Toolbar Button Icons
====================

Manage Layers and overview
..........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|dataSourceManager|             ``|dataSourceManager|``             \                               \
|addOgrLayer|                   ``|addOgrLayer|``                   |addSensorThingsLayer|          ``|addSensorThingsLayer|``
|addRasterLayer|                ``|addRasterLayer|``                |addMssqlLayer|                 ``|addMssqlLayer|``
|addDelimitedTextLayer|         ``|addDelimitedTextLayer|``         |addSpatiaLiteLayer|            ``|addSpatiaLiteLayer|``
|addPostgisLayer|               ``|addPostgisLayer|``               |addOracleLayer|                ``|addOracleLayer|``
|addAfsLayer|                   ``|addAfsLayer|``                   |addMeshLayer|                  ``|addMeshLayer|``
|addVectorTileLayer|            ``|addVectorTileLayer|``            |addXyzLayer|                   ``|addXyzLayer|``
|addVirtualLayer|               ``|addVirtualLayer|``               |addWmsLayer|                   ``|addWmsLayer|``
|addWcsLayer|                   ``|addWcsLayer|``                   |addWfsLayer|                   ``|addWfsLayer|``
|addPointCloudLayer|            ``|addPointCloudLayer|``            |addGpsLayer|                   ``|addGpsLayer|``
|addTiledSceneLayer|            ``|addTiledSceneLayer|``            |addHanaLayer|                  ``|addHanaLayer|``
|newVectorLayer|                ``|newVectorLayer|``                |newSpatiaLiteLayer|            ``|newSpatiaLiteLayer|``
|newGeoPackageLayer|            ``|newGeoPackageLayer|``            |createMemory|                  ``|createMemory|``
|newVirtualLayer|               ``|newVirtualLayer|``               |newMeshLayer|                  ``|newMeshLayer|``
|newGpx|                        ``|newGpx|``
|dbManager|                     ``|dbManager|``                     |gdal|                          ``|gdal|``
|geoPackage|                    ``|geoPackage|``                    |spatialite|                    ``|spatialite|``
|virtualLayer|                  ``|virtualLayer|``                  |wms|                           ``|wms|``
|wcs|                           ``|wcs|``                           |wfs|                           ``|wfs|``
|pointCloudLayer|               ``|pointCloudLayer|``               |gps|                           ``|gps|``
|tiledSceneLayer|               ``|tiledSceneLayer|``               |hana|                          ``|hana|``
|dbSchema|                      ``|dbSchema|``
|inOverview|                    ``|inOverview|``                    |addAllToOverview|              ``|addAllToOverview|``
|removeAllFromOverview|         ``|removeAllFromOverview|``         |removeLayer|                   ``|removeLayer|``
|showAllLayers|                 ``|showAllLayers|``                 |hideAllLayers|                 ``|hideAllLayers|``
|showPresets|                   ``|showPresets|``                   |showSelectedLayers|            ``|showSelectedLayers|``
|hideSelectedLayers|            ``|hideSelectedLayers|``            |hideDeselectedLayers|          ``|hideDeselectedLayers|``
|toggleAllLayers|               ``|toggleAllLayers|``               |toggleSelectedLayers|          ``|toggleSelectedLayers|``
|addLayer|                      ``|addLayer|``
|indicatorTemporal|             ``|indicatorTemporal|``             |indicatorNonRemovable|         ``|indicatorNonRemovable|``
|indicatorEmbedded|             ``|indicatorEmbedded|``             |indicatorFilter|               ``|indicatorFilter|``
|indicatorMemory|               ``|indicatorMemory|``               |indicatorNoCRS|                ``|indicatorNoCRS|``
|indicatorBadLayer|             ``|indicatorBadLayer|``             |favourites|                    ``|favourites|``
|indicatorLayerError|           ``|indicatorLayerError|``           |indicatorNotes|                ``|indicatorNotes|``
|indicatorLowAccuracy|          ``|indicatorLowAccuracy|``          |indicatorOffline|              ``|indicatorOffline|``
==============================  ==================================  ==============================  ==================================

Project
.......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|fileNew|                ``|fileNew|``                |fileOpen|               ``|fileOpen|``
|fileSave|               ``|fileSave|``               |fileSaveAs|             ``|fileSaveAs|``
|fileExit|               ``|fileExit|``               |user|                   ``|user|``
=======================  ===========================  =======================  ===========================

Edit
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|undo|                          ``|undo|``                          |redo|                          ``|redo|``
|editCopy|                      ``|editCopy|``                      |editPaste|                     ``|editPaste|``
|editCut|                       ``|editCut|``                       |saveEdits|                     ``|saveEdits|``
|editableEdits|                 ``|editableEdits|``
|circle2Points|                 ``|circle2Points|``                 |circle2TangentsPoint|          ``|circle2TangentsPoint|``
|circle3Points|                 ``|circle3Points|``                 |circle3Tangents|               ``|circle3Tangents|``
|circleCenterPoint|             ``|circleCenterPoint|``             |ellipseCenter2Points|          ``|ellipseCenter2Points|``
|ellipseCenterPoint|            ``|ellipseCenterPoint|``            |ellipseExtent|                 ``|ellipseExtent|``
|ellipseFoci|                   ``|ellipseFoci|``                   |rectangle3PointsDistance|      ``|rectangle3PointsDistance|``
|rectangle3PointsProjected|     ``|rectangle3PointsProjected|``     |rectangleCenter|               ``|rectangleCenter|``
|rectangleExtent|               ``|rectangleExtent|``               |regularPolygon2Points|         ``|regularPolygon2Points|``
|regularPolygonCenterCorner|    ``|regularPolygonCenterCorner|``    |regularPolygonCenterPoint|     ``|regularPolygonCenterPoint|``
==============================  ==================================  ==============================  ==================================

Identify result
...............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|expandTree|                    ``|expandTree|``                    |collapseTree|                  ``|collapseTree|``
|expandNewTree|                 ``|expandNewTree|``                 |formView|                      ``|formView|``
|deselectAll|                   ``|deselectAll|``                   |editCopy|                      ``|editCopy|``
|filePrint|                     ``|filePrint|``
|identifyByRectangle|           ``|identifyByRectangle|``           |identifyByPolygon|             ``|identifyByPolygon|``
|identifyByFreehand|            ``|identifyByFreehand|``            |identifyByRadius|              ``|identifyByRadius|``
==============================  ==================================  ==============================  ==================================


Digitizing and Advanced Digitizing
..................................

===============================  ====================================  ================================  =================================
Icon                             Substitution                          Icon                              Substitution
===============================  ====================================  ================================  =================================
|cad|                            ``|cad|``                             |cadConstruction|                 ``|cadConstruction|``
|cadParallel|                    ``|cadParallel|``                     |cadPerpendicular|                ``|cadPerpendicular|``
|floater|                        ``|floater|``
|toggleEditing|                  ``|toggleEditing|``                   |allEdits|                        ``|allEdits|``
|tracing|                        ``|tracing|``                         |snapping|                        ``|snapping|``
|snappingVertex|                 ``|snappingVertex|``                  |snappingSegment|                 ``|snappingSegment|``
|snappingArea|                   ``|snappingArea|``                    |snappingCentroid|                ``|snappingCentroid|``
|snappingMiddle|                 ``|snappingMiddle|``                  |snappingEndpoint|                ``|snappingEndpoint|``
|capturePoint|                   ``|capturePoint|``                    |capturePolygon|                  ``|capturePolygon|``
|captureLine|                    ``|captureLine|``                     |captureCurveFromFeature|         ``|captureCurveFromFeature|``
|deleteSelectedFeatures|         ``|deleteSelectedFeatures|``
|circularStringCurvePoint|       ``|circularStringCurvePoint|``        |circularStringRadius|            ``|circularStringRadius|``
|vertexTool|                     ``|vertexTool|``                      |vertexToolActiveLayer|           ``|vertexToolActiveLayer|``
|digitizeWithSegment|            ``|digitizeWithSegment|``             |digitizeShape|                   ``|digitizeShape|``
|streamingDigitize|              ``|streamingDigitize|``               |digitizeWithCurve|               ``|digitizeWithCurve|``
|moveFeature|                    ``|moveFeature|``                     |moveFeatureCopy|                 ``|moveFeatureCopy|``
|moveFeatureLine|                ``|moveFeatureLine|``                 |moveFeatureCopyLine|             ``|moveFeatureCopyLine|``
|moveFeaturePoint|               ``|moveFeaturePoint|``                |moveFeatureCopyPoint|            ``|moveFeatureCopyPoint|``
|rotateFeature|                  ``|rotateFeature|``                   |rotatePointSymbols|              ``|rotatePointSymbols|``
|scaleFeature|                   ``|scaleFeature|``
|offsetCurve|                    ``|offsetCurve|``                     |offsetPointSymbols|              ``|offsetPointSymbols|``
|simplify|                       ``|simplify|``                        |reshape|                         ``|reshape|``
|addRing|                        ``|addRing|``                         |addPart|                         ``|addPart|``
|fillRing|                       ``|fillRing|``
|deleteRing|                     ``|deleteRing|``                      |deletePart|                      ``|deletePart|``
|mergeFeatures|                  ``|mergeFeatures|``                   |mergeFeatureAttributes|          ``|mergeFeatureAttributes|``
|splitFeatures|                  ``|splitFeatures|``                   |splitParts|                      ``|splitParts|``
|reverseLine|                    ``|reverseLine|``
|allowIntersections|             ``|allowIntersections|``              |avoidIntersectionsCurrentLayer|  ``|avoidIntersectionsCurrentLayer|``
|avoidIntersectionsLayers|       ``|avoidIntersectionsLayers|``        |snappingSelf|                    ``|snappingSelf|``
===============================  ====================================  ================================  =================================

Mesh
..................................

================================  ====================================  ================================  ====================================
Icon                              Substitution                          Icon                              Substitution
================================  ====================================  ================================  ====================================
|meshDigitizing|                  ``|meshDigitizing|``                  |meshReindex|                     ``|meshReindex|``
|meshSelectExpression|            ``|meshSelectExpression|``            |meshSelectPolygon|               ``|meshSelectPolygon|``
|meshTransformByExpression|       ``|meshTransformByExpression|``       |meshEditForceByVectorLines|      ``|meshEditForceByVectorLines|``
|vertexCoordinates|               ``|vertexCoordinates|``
================================  ====================================  ================================  ====================================



Map Navigation and attributes
.............................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|pan|                           ``|pan|``                           |panToSelected|                 ``|panToSelected|``
|zoomIn|                        ``|zoomIn|``                        |zoomOut|                       ``|zoomOut|``
|zoomActual|                    ``|zoomActual|``                    |zoomFullExtent|                ``|zoomFullExtent|``
|zoomToLayer|                   ``|zoomToLayer|``                   |zoomToSelected|                ``|zoomToSelected|``
|zoomLast|                      ``|zoomLast|``                      |zoomNext|                      ``|zoomNext|``
|zoomInXAxis|                   ``|zoomInXAxis|``                   |refresh|                       ``|refresh|``
|identify|                      ``|identify|``                      |mapTips|                       ``|mapTips|``
|showBookmarks|                 ``|showBookmarks|``                 |newBookmark|                   ``|newBookmark|``
|measure|                       ``|measure|``                       |measureArea|                   ``|measureArea|``
|measureBearing|                ``|measureBearing|``                |measureAngle|                  ``|measureAngle|``
|newMap|                        ``|newMap|``                        |new3DMap|                      ``|new3DMap|``
|tiltUp|                        ``|tiltUp|``                        |tiltDown|                      ``|tiltDown|``
|3dNavigation|                  ``|3dNavigation|``                  |play|                          ``|play|``
|camera|                        ``|camera|``                        |shadow|                        ``|shadow|``
|temporal|                      ``|temporal``                       |temporalNavigationOff|         ``|temporalNavigationOff|``
|temporalNavigationFixedRange|  ``|temporalNavigationFixedRange|``  |temporalNavigationAnimated|    ``|temporalNavigationAnimated|``
|temporalNavigationMovie|       ``|temporalNavigationMovie|``       |newElevationProfile|           ``|newElevationProfile|``
|elevation|                     ``|elevation|``                     
==============================  ==================================  ==============================  ==================================

Selection and Expressions
.........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|selectRectangle|               ``|selectRectangle|``               |selectPolygon|                 ``|selectPolygon|``
|selectFreehand|                ``|selectFreehand|``                |selectRadius|                  ``|selectRadius|``
|selectAll|                     ``|selectAll|``                     |deselectAll|                   ``|deselectAll|``
|invertSelection|               ``|invertSelection|``               |expressionSelect|              ``|expressionSelect|``
|deselectActiveLayer|           ``|deselectActiveLayer|``
|selectDistance|                ``|selectDistance|``                |selectLocation|                ``|selectLocation|``
|selectAllTree|                 ``|selectAllTree|``                 |select|                        ``|select|``
|selectAdd|                     ``|selectAdd|``                     |selectRemove|                  ``|selectRemove|``
|formSelect|                    ``|formSelect|``                    |dataDefine|                    ``|dataDefine|``
|expression|                    ``|expression|``                    |dataDefineOn|                  ``|dataDefineOn|``
|dataDefineExpressionOn|        ``|dataDefineExpressionOn|``        |dataDefineError|               ``|dataDefineError|``
|dataDefineExpressionError|     ``|dataDefineExpressionError|``
|addExpression|                 ``|addExpression|``
|expressionFilter|              ``|expressionFilter|``              |filterMap|                     ``|filterMap|``
==============================  ==================================  ==============================  ==================================


Labels and Diagrams
...................

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|labelingSingle|         ``|labelingSingle|``         |labelingNone|           ``|labelingNone|``
|labelingRuleBased|      ``|labelingRuleBased|``      |labelingObstacle|       ``|labelingObstacle|``
|piechart|               ``|piechart|``               |diagramNone|            ``|diagramNone|``
|text|                   ``|text|``                   |histogram|              ``|histogram|``
|stackedBar|             ``|stackedBar|``             |stackedDiagram|         ``|stackedDiagram|``
|createAnnotationLayer|  ``|createAnnotationLayer|``  |annotationLayer|        ``|annotationLayer|``
|formAnnotation|         ``|formAnnotation|``         |htmlAnnotation|         ``|htmlAnnotation|``
|actionText|             ``|actionText|``             |textAlongLine|          ``|textAlongLine|``
|addImage|               ``|addImage|``               |textInsideRect|         ``|textInsideRect|``
|labelbackground|        ``|labelbackground|``        |labelbuffer|            ``|labelbuffer|``
|labelformatting|        ``|labelformatting|``        |labelplacement|         ``|labelplacement|``
|labelshadow|            ``|labelshadow|``            |render|                 ``|render|``
|labelcallout|           ``|labelcallout|``
|labelAnchorCenter|      ``|labelAnchorCenter|``      |labelAnchorCustom|      ``|labelAnchorCustom|``
|labelAnchorEnd|         ``|labelAnchorEnd|``         |labelAnchorStart|       ``|labelAnchorStart|``
|pinLabels|              ``|pinLabels|``              |showHideLabels|         ``|showHideLabels|``
|moveLabel|              ``|moveLabel|``              |rotateLabel|            ``|rotateLabel|``
|showPinnedLabels|       ``|showPinnedLabels|``       |showUnplacedLabel|      ``|showUnplacedLabel|``
|changeLabelProperties|  ``|changeLabelProperties|``  |autoPlacementSettings|  ``|autoPlacementSettings|``
|labelingRules|          ``|labelingRules|``
=======================  ===========================  =======================  ===========================

Decorations
...........

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|copyrightLabel|         ``|copyrightLabel|``         |addGrid|                ``|addGrid|``
|titleLabel|             ``|titleLabel|``             |northArrow|             ``|northArrow|``
|scaleBar|               ``|scaleBar|``               |addMap|                 ``|addMap|``
|addImage|               ``|addImage|``
=======================  ===========================  =======================  ===========================

Help
....

=======================  ===========================  =======================  ==================================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ==================================
|helpContents|           ``|helpContents|``           |qgisHomePage|           ``|qgisHomePage|``
|success|                ``|success|``
|helpSponsors|           ``|helpSponsors|``           |contextHelp|            ``|contextHelp|``
=======================  ===========================  =======================  ==================================

Colors
......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|colorBox|               ``|colorBox|``               |colorPicker|            ``|colorPicker|``
|colorSwatches|          ``|colorSwatches|``          |colorWheel|             ``|colorWheel|``
=======================  ===========================  =======================  ===========================


Other basic icons
=================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|arrowLeft|                     ``|arrowLeft|``                     |arrowRight|                    ``|arrowRight|``
|arrowDown|                     ``|arrowDown|``                     |arrowUp|                       ``|arrowUp|``
|symbologyAdd|                  ``|symbologyAdd|``                  |symbologyRemove|               ``|symbologyRemove|``
|projectProperties|             ``|projectProperties|``             |options|                       ``|options|``
|interfaceCustomization|        ``|interfaceCustomization|``        |keyboardShortcuts|             ``|keyboardShortcuts|``
|copyrightLabel|                ``|copyrightLabel|``                |northArrow|                    ``|northArrow|``
|scaleBar|                      ``|scaleBar|``                      |tracking|                      ``|tracking|``
|gpsTrackBarChart|              ``|gpsTrackBarChart|``
|gpsConnect|                    ``|gpsConnect|``                    |gpsDisconnect|                 ``|gpsDisconnect|``
|gpsDestinationLayer|           ``|gpsDestinationLayer|``           |addTrackPoint|                 ``|addTrackPoint|``
|recenter|                      ``|recenter|``                      |reset|                         ``|reset|``
|folder|                        ``|folder|``                        |extents|                       ``|extents|``
|settings|                      ``|settings|``                      |start|                         ``|start|``
|properties|                    ``|properties|``                    |deleteSelected|                ``|deleteSelected|``
|browserExpand|                 ``|browserExpand|``                 |browserCollapse|               ``|browserCollapse|``
|codeEditor|                    ``|codeEditor|``                    |add|                           ``|add|``
|relations|                     ``|relations|``                     |layoutItem3DMap|               ``|layoutItem3DMap|``
|stopwatch|                     ``|stopwatch|``                     |sensor|                        ``|sensor|``
|clearItem|                     ``|clearItem|``
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

========================================== ============================================  =========================  =============================
Icon                                       Substitution                                  Icon                       Substitution
========================================== ============================================  =========================  =============================
|openTable|                                ``|openTable|``                               |openTableSelected|        ``|openTableSelected|``
|openTableVisible|                         ``|openTableVisible|``                        |openTableEdited|          ``|openTableEdited|``
|selectedToTop|                            ``|selectedToTop|``
|selectAll|                                ``|selectAll|``                               |invertSelection|          ``|invertSelection|``
|panToSelected|                            ``|panToSelected|``                           |zoomToSelected|           ``|zoomToSelected|``
|copySelected|                             ``|copySelected|``                            |editPaste|                ``|editPaste|``
|expressionSelect|                         ``|expressionSelect|``                        |deleteSelectedFeatures|   ``|deleteSelectedFeatures|``
|newAttribute|                             ``|newAttribute|``                            |deleteAttribute|          ``|deleteAttribute|``
|editTable|                                ``|editTable|``
|newTableRow|                              ``|newTableRow|``                             |calculateField|           ``|calculateField|``
|refresh|                                  ``|refresh|``                                 |formView|                 ``|formView|``
|conditionalFormatting|                    ``|conditionalFormatting|``                   |multiEdit|                ``|multiEdit|``
|dock|                                     ``|dock|``                                    |actionRun|                ``|actionRun|``
|duplicateFeature|                         ``|duplicateFeature|``                        |zoomTo|                   ``|zoomTo|``
|panTo|                                    ``|panTo|``                                   |highlightFeature|         ``|highlightFeature|``
|handleStoreFilterExpressionChecked|       ``|handleStoreFilterExpressionChecked|``
|handleStoreFilterExpressionUnchecked|     ``|handleStoreFilterExpressionUnchecked|``
========================================== ============================================  =========================  =============================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    |crs|                           ``|crs|``
|customProjection|              ``|customProjection|``              |setProjection|                 ``|setProjection|``
|projectionDisabled|            ``|projectionDisabled|``            |projectionEnabled|             ``|projectionEnabled|``
|transformation|                ``|transformation|``                |gdalScript|                    ``|gdalScript|``
|georefRun|                     ``|georefRun|``                     |pencil|                        ``|pencil|``
|linkQGisToGeoref|              ``|linkQGisToGeoref|``              |linkGeorefToQGis|              ``|linkGeorefToQGis|``
|fullHistogramStretch|          ``|fullHistogramStretch|``
==============================  ==================================  ==============================  ==================================


Print Layout
============

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|newLayout|              ``|newLayout|``              |layoutManager|          ``|layoutManager|``
|duplicateLayout|        ``|duplicateLayout|``
|newReport|              ``|newReport|``              |newPage|                ``|newPage|``
|atlasSettings|          ``|atlasSettings|``          |atlas|                  ``|atlas|``
|filePrint|              ``|filePrint|``              |saveMapAsImage|         ``|saveMapAsImage|``
|saveAsSVG|              ``|saveAsSVG|``              |saveAsPDF|              ``|saveAsPDF|``
|addBasicShape|          ``|addBasicShape|``          |addBasicCircle|         ``|addBasicCircle|``
|addBasicTriangle|       ``|addBasicTriangle|``       |addBasicRectangle|      ``|addBasicRectangle|``
|addNodesShape|          ``|addNodesShape|``          |editNodesShape|         ``|editNodesShape|``
|addPolygon|             ``|addPolygon|``             |addPolyline|            ``|addPolyline|``
|addArrow|               ``|addArrow|``               |northArrow|             ``|northArrow|``
|add3DMap|               ``|add3DMap|``               |addMap|                 ``|addMap|``
|elevationProfile|       ``|elevationProfile|``       |copyProfileSettings|    ``|copyProfileSettings|``
|addLegend|              ``|addLegend|``              |addHtml|                ``|addHtml|``
|addManualTable|         ``|addManualTable|``         |addTable|               ``|addTable|``
|addImage|               ``|addImage|``               |addMarker|              ``|addMarker|``
|label|                  ``|label|``                  |scaleBar|               ``|scaleBar|``
|select|                 ``|select|``                 |moveItemContent|        ``|moveItemContent|``
|setToCanvasScale|       ``|setToCanvasScale|``       |setToCanvasExtent|      ``|setToCanvasExtent|``
|viewScaleInCanvas|      ``|viewScaleInCanvas|``      |viewExtentInCanvas|     ``|viewExtentInCanvas|``
|raiseItems|             ``|raiseItems|``             |lowerItems|             ``|lowerItems|``
|moveItemsToTop|         ``|moveItemsToTop|``         |moveItemsToBottom|      ``|moveItemsToBottom|``
|alignLeft|              ``|alignLeft|``              |alignRight|             ``|alignRight|``
|alignHCenter|           ``|alignHCenter|``           |alignVCenter|           ``|alignVCenter|``
|alignTop|               ``|alignTop|``               |alignBottom|            ``|alignBottom|``
|distributeLeft|         ``|distributeLeft|``         |distributeRight|        ``|distributeRight|``
|distributeTop|          ``|distributeTop|``          |distributeBottom|       ``|distributeBottom|``
|distributeHCenter|      ``|distributeHCenter|``      |distributeVCenter|      ``|distributeVCenter|``
|distributeHSpace|       ``|distributeHSpace|``       |distributeVSpace|       ``|distributeVSpace|``
|resizeShortest|         ``|resizeShortest|``         |resizeTallest|          ``|resizeTallest|``
|resizeNarrowest|        ``|resizeNarrowest|``        |resizeWidest|           ``|resizeWidest|``
|resizeSquare|           ``|resizeSquare|``           |groupItems|             ``|groupItems|``
|lockItems|              ``|lockItems|``              |unlockAll|              ``|unlockAll|``
|locked|                 ``|locked|``                 |unlocked|               ``|unlocked|``
|lockRepeating|          ``|lockRepeating|``          |lockedGray|             ``|lockedGray|``
=======================  ===========================  =======================  ===========================

Layer Properties
================

==================================  ======================================  =============================  ================================
Icon                                Substitution                            Icon                           Substitution
==================================  ======================================  =============================  ================================
|symbology|                         ``|symbology|``                         |labelingSingle|               ``|labelingSingle|``
|sourceFields|                      ``|sourceFields|``                      |general|                      ``|general|``
|metadata|                          ``|metadata|``                          |action|                       ``|action|``
|display|                           ``|display|``                           |rendering|                    ``|rendering|``
|join|                              ``|join|``                              |diagram|                      ``|diagram|``
|labelmask|                         ``|labelmask|``                         |temporal|                     ``|temporal|``
|legend|                            ``|legend|``                            |dependencies|                 ``|dependencies|``
|3d|                                ``|3d|``                                |system|                       ``|system|``
|elevationscale|                    ``|elevationscale|``                    |layerTree|                    ``|layerTree|``
|editMetadata|                      ``|editMetadata|``                      |overlay|                      ``|overlay|``
|digitizing|                        ``|digitizing|``                        |auxiliaryStorage|             ``|auxiliaryStorage|``
|history|                           ``|history|``                           |stylePreset|                  ``|stylePreset|``
|search|                            ``|search|``                            |pyramids|                     ``|pyramids|``
|transparency|                      ``|transparency|``                      |rasterHistogram|              ``|rasterHistogram|``
|singleSymbol|                      ``|singleSymbol|``                      |nullSymbol|                   ``|nullSymbol|``
|graduatedSymbol|                   ``|graduatedSymbol|``                   |categorizedSymbol|            ``|categorizedSymbol|``
|25dSymbol|                         ``|25dSymbol|``                         |ruleBasedSymbol|              ``|ruleBasedSymbol|``
|invertedSymbol|                    ``|invertedSymbol|``                    |heatmapSymbol|                ``|heatmapSymbol|``
|pointDisplacementSymbol|           ``|pointDisplacementSymbol|``           |pointClusterSymbol|           ``|pointClusterSymbol|``
|mergedFeatures|                    ``|mergedFeatures|``
|meshcontours|                      ``|meshcontours|``                      |meshcontoursoff|              ``|meshcontoursoff|``
|meshvectors|                       ``|meshvectors|``                       |meshvectorsoff|               ``|meshvectorsoff|``
|meshframe|                         ``|meshframe|``                         |meshaveraging|                ``|meshaveraging|``
|singleColor|                       ``|singleColor|``                       |paletted|                     ``|paletted|``
|singlebandPseudocolor|             ``|singlebandPseudocolor|``             |multibandColor|               ``|multibandColor|``
|pointCloudExtent|                  ``|pointCloudExtent|``
|sum|                               ``|sum|``                               |sort|                         ``|sort|``
|paintEffects|                      ``|paintEffects|``                      |mapIdentification|            ``|mapIdentification|``
|styleManager|                      ``|styleManager|``                      |iconView|                     ``|iconView|``
|joinNotEditable|                   ``|joinNotEditable|``                   |joinedLayerNotEditable|       ``|joinedLayerNotEditable|``
|joinHasNotUpsertOnEdit|            ``|joinHasNotUpsertOnEdit|``            |filterTableFields|            ``|filterTableFields|``
|symbologyEdit|                     ``|symbologyEdit|``
|sharingImport|                     ``|sharingImport|``                     |sharingExport|                ``|sharingExport|``
==================================  ======================================  =============================  ================================


Plugins
=======

Processing
..........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|processingAlgorithm|           ``|processingAlgorithm|``           |processingModel|               ``|processingModel|``
|processingHistory|             ``|processingHistory|``             |processingResult|              ``|processingResult|``
|menu|                          ``|menu|``                          |runSelected|                   ``|runSelected|``
|processSelected|               ``|processSelected|``               |editHelpContent|               ``|editHelpContent|``  
|saveAsPython|                  ``|saveAsPython|``                  |modelOutput|                   ``|modelOutput|``  
|qgsProjectFile|                ``|qgsProjectFile|``                |addToProject|                  ``|addToProject|``
|fieldInteger|                  ``|fieldInteger|``
|meanCoordinates|               ``|meanCoordinates|``               |extractLayerExtent|            ``|extractLayerExtent|``
|selectRandom|                  ``|selectRandom|``                  |vectorGrid|                    ``|vectorGrid|``
|convexHull|                    ``|convexHull|``                    |buffer|                        ``|buffer|``
|intersect|                     ``|intersect|``                     |union|                         ``|union|``
|symmetricalDifference|         ``|symmetricalDifference|``         |clip|                          ``|clip|``
|difference|                    ``|difference|``                    |dissolve|                      ``|dissolve|``
|checkGeometry|                 ``|checkGeometry|``                 |exportGeometry|                ``|exportGeometry|``
|delaunay|                      ``|delaunay|``                      |centroids|                     ``|centroids|``
|polygonToLine|                 ``|polygonToLine|``                 |extractVertices|               ``|extractVertices|``
|lineToPolygon|                 ``|lineToPolygon|``                 |nearestNeighbour|              ``|nearestNeighbour|``
|splitLayer|                    ``|splitLayer|``                    |heatmap|                       ``|heatmap|``
|showRasterCalculator|          ``|showRasterCalculator|``          |showMeshCalculator|            ``|showMeshCalculator|``
|regularPoints|                 ``|regularPoints|``                 |addGeometryAttributes|         ``|addGeometryAttributes|``
|basicStatistics|               ``|basicStatistics|``               |uniqueValues|                  ``|uniqueValues|``
|collect|                       ``|collect|``                       |simplify_2|                    ``|simplify_2|``
|createGrid|                    ``|createGrid|``                    |distanceMatrix|                ``|distanceMatrix|``
|lineIntersections|             ``|lineIntersections|``             |mergeLayers|                   ``|mergeLayers|``
|sumPoints|                     ``|sumPoints|``                     |sumLengthLines|                ``|sumLengthLines|``
|randomPointsInPolygons|        ``|randomPointsInPolygons|``        |randomPointsWithinPolygon|     ``|randomPointsWithinPolygon|``
|randomPointsOnLines|           ``|randomPointsOnLines|``           |randomPointsWithinExtent|      ``|randomPointsWithinExtent|``
|multiToSingle|                 ``|multiToSingle|``
|grid|                          ``|grid|``                          |tiles|                         ``|tiles|``
|merge|                         ``|merge|``                         |rasterClip|                    ``|rasterClip|``
|contour|                       ``|contour|``                       |proximity|                     ``|proximity|``
|polygonize|                    ``|polygonize|``                    |rasterize|                     ``|rasterize|``
|sieve|                         ``|sieve|``                         |nearblack|                     ``|nearblack|``
|projectionAdd|                 ``|projectionAdd|``                 |projectionExport|              ``|projectionExport``
|8To24Bits|                     ``|8To24Bits|``                     |24To8Bits|                     ``|24To8Bits|``
|rasterInfo|                    ``|rasterInfo|``                    |rasterOverview|                ``|rasterOverview|``
|vrt|                           ``|vrt|``                           |voronoi|                       ``|voronoi|``
|translate|                     ``|translate|``                     |warp|                          ``|warp|``
|iterate|                       ``|iterate|``                       |terminal|                      ``|terminal|``
==============================  ==================================  ==============================  ==================================

Various Core Plugins
....................

Standard provided with basic install, but not loaded with initial install

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|showPluginManager|             ``|showPluginManager|``             |installPluginFromZip|          ``|installPluginFromZip|``
|pythonFile|                    ``|pythonFile|``                    |runConsole|                    ``|runConsole|``
|showEditorConsole|             ``|showEditorConsole|``             |clearConsole|                  ``|clearConsole|``
|offlineEditingCopy|            ``|offlineEditingCopy|``            |offlineEditingSync|            ``|offlineEditingSync|``
|plugin|                        ``|plugin|``                        |metasearch|                    ``|metasearch|``
|geometryChecker|               ``|geometryChecker|``               |topologyChecker|               ``|topologyChecker|``
|fromSelectedFeature|           ``|fromSelectedFeature|``           |sqlQueryBuilder|               ``|sqlQueryBuilder|``
==============================  ==================================  ==============================  ==================================

Grass integration
.................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|grassLogo|                     ``|grassLogo|``                     |grassRegion|                   ``|grassRegion|``
|grassTools|                    ``|grassTools|``                    |grassNewMapset|                ``|grassNewMapset|``
|grassOpenMapset|               ``|grassOpenMapset|``               |grassCloseMapset|              ``|grassCloseMapset|``
==============================  ==================================  ==============================  ==================================
