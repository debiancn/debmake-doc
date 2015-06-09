include(FindGettext)
if(GETTEXT_FOUND)
  set(_potFile ${CMAKE_BINARY_DIR}/po/${PROJECT_NAME}.pot)
  # program source file
  set(_src_list
    ${CMAKE_SOURCE_DIR}/src/hello.c
    ${CMAKE_SOURCE_DIR}/lib/sharedlib.c
  )
  add_custom_command(
    OUTPUT ${_potFile}
    COMMAND touch ${_potFile}
    COMMAND xgettext -o ${_potFile} ${_src_list}
    COMMAND xgettext -L Desktop -j -o ${_potFile} ${CMAKE_SOURCE_DIR}/data/hello.desktop.in
    DEPENDS ${_src_list} ${CMAKE_SOURCE_DIR}/data/hello.desktop.in
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  )
  add_custom_target(pot ALL
    DEPENDS ${_potFile}
  )
  # Create a target "translations" and output mo files.
  gettext_create_translations(${_potFile} ALL ja.po)
  #gettext_process_pot_file(${_potFile} ALL ja)
  set(_desktopinFile ${CMAKE_SOURCE_DIR}/data/hello.desktop.in)
  set(_desktopFile ${CMAKE_BINARY_DIR}/data/hello.desktop)
  add_custom_command(
    OUTPUT ${_desktopFile}
    COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --desktop -o ${_desktopFile} --template=${_desktopinFile} -d .
    DEPENDS ${_desktopFile} ja.po
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )
  add_custom_target(desktop ALL
    DEPENDS ${_desktopFile}
  )
  install(FILES ${_desktopFile}
    DESTINATION share/applications
  )
endif(GETTEXT_FOUND)
