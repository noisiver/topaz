set(SOURCES
common.h
los_tree.cpp
los_tree.h
los_tree_node.cpp
los_tree_node.h
zone_los.cpp
zone_los.h
)

add_library(los STATIC ${SOURCES}  )

target_link_libraries(los
    PUBLIC
    common
    ai
    entities
    items
    lua
    packets
    project_options
    #project_warnings
)
