# Useful when have single directory with multiple gentoo backups
# each containing distfiles.
#
# Usage:
#
# distfiles_move_to_single_directory directory_with_multiple_gentoo_backups existing_target_directory_where_we_move_all_distfiles
function distfiles_move_to_single_directory() {
  if [ ! -d $1 ]; then
    echo 'Please give "directory with multiple gentoo backups" as first parameter !!!'
    return 1001
  fi
  if [ ! -d $2 ]; then
    echo 'Please give "existing target directory where we move all distfiles" as second parameter !!!'
    return 1002
  fi

  find $1 -type d -name distfiles | grep '/usr/portage/distfiles' | xargs -I {} sh -c "rsync -av --progress '{}/' '$2/' && rm -rf '{}/'"
}
