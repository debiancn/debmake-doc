# Generate hello.desktop from hello.desktop.in
configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/hello.desktop.in"
  "${CMAKE_CURRENT_BINARY_DIR}/hello.desktop"
)
